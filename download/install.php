<?php
require_once(dirname(__FILE__)."/"."../inc/common.inc.php");	//�����ļ�


if(!$job){
	if(is_file(dirname(__FILE__).'/data/install.lock')){
		showerr('����ļ�/data/install.lockɾ����,��ִ�а�װ����!');
	}elseif(!$web_admin){
		showerr('�㲻�ǹ���Ա,���ܰ�װ!');
	}
	$rand = rand(1,100);
	$atc_pre = 'download'.$rand.'_';
	$atc_name = '�������ϵͳ'.$rand;
	print <<<EOT
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" cellspacing="0" cellpadding="0"> <form name="form1" method="post" action="?job=sql">
  <tr> 
    <td height="50" align="right" width="42%">���ݱ����ַ�:</td>
    <td height="0" align="left" width="58%">
     
        <input type="text" name="atc_pre" value="$atc_pre">
      
    </td>
  </tr>
  <tr> 
    <td height="50" align="right" width="42%">ϵͳ����:</td>
    <td height="0" align="left" width="58%">
        <input type="text" name="atc_name" value="$atc_name">
      </td>
  </tr>
  <tr> 
    <td height="50" align="right" width="42%">&nbsp;</td>
    <td width="58%" align="left">
        <input type="submit" name="Submit" value="������װ">
      </td>
  </tr></form>
</table>
</body>
</html>

EOT;
}
elseif($job=='sql'){
	if(!ereg("^([a-z0-9]+)_$",$atc_pre)){
		showerr('���ݱ����ַ�ֻ�������ֻ���ĸ���»��߽�β!');
	}elseif(!$atc_name){
		showerr('ϵͳ���Ʋ���Ϊ��');
	}elseif($db->get_one("SELECT * FROM {$pre}module WHERE pre='$atc_pre'")){
		showerr('��ǰ���ݱ�ǰ׺�Ѿ�������,�����һ��!');
	}
	$atc_dir = basename(dirname(__FILE__));
	$rs = $db->get_one("SELECT * FROM {$pre}module ORDER BY id DESC LIMIT 1");
	$atc_id = $rs[id]+1;

	$data = read_file(dirname(__FILE__).'/install/data.sql');
	$detail = explode("\n",$data);
	foreach($detail AS $key=>$value){
		if(strstr($value,'qb_module')){
			unset($detail[$key]);
		}
	}
	$data = implode("\n",$detail);

	//ĸģ������ַ���news_,����ϵͳ�Ļ�,����Ҫ��Ӧ���޸�
	$data = str_replace(array('qb_','download_'),array($pre,$atc_pre),$data);

	$rs = $db->get_one("SELECT lid FROM {$pre}label ORDER BY lid DESC LIMIT 1");
	$max = $rs[lid];

	$db->insert_file('',$data);

	$db->query("UPDATE {$pre}label SET module='$atc_id' WHERE lid>$max");
	$db->query("UPDATE {$pre}{$atc_pre}config SET c_value='$atc_id' WHERE c_key='module_id'");
	$db->query("UPDATE {$pre}{$atc_pre}config SET c_value='$atc_pre' WHERE c_key='module_pre'");
	$db->query("UPDATE {$pre}{$atc_pre}config SET c_value='$atc_name' WHERE c_key='Info_webname'");
	$db->query("INSERT INTO {$pre}module SET id='$atc_id',type='2',name='$atc_name',pre='$atc_pre',dirname='$atc_dir'");

	make_module_cache();

	write_file(dirname(__FILE__).'/data/install.lock','1');

	write_file(dirname(__FILE__).'/data/config.php',"
\$webdb['module_pre']='$atc_pre';
\$webdb['Info_webname']='$atc_name';
\$webdb['module_id']='$atc_id';
	",'a');
	
	//ĸģ�͵����ַ�������5,�������5�Ļ�, ����Ҫ��Ӧ�����޸�
	if(strlen($atc_pre)!=9){
		$query=$db->query("SELECT * FROM {$pre}label WHERE typesystem=1 AND lid>$max ");
		while($rs=$db->fetch_array($query)){
			$rs[code]=preg_replace("/s:([\d]+):\"(.*?)\";/eis","strlen_lable('\\1','\\2')",$rs[code]);
			$rs[code]=addslashes($rs[code]);
			$db->query("UPDATE {$pre}label SET code='$rs[code]' WHERE lid='$rs[lid]' ");
		}
	}

	echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=?job=end'>";
	exit;

}elseif($job=='end'){
	if(is_file(dirname(__FILE__).'/data/install.lock')){
		echo '<A HREF="'.$webdb[admin_url].'/index.php?lfj=group&job=admin_gr&gid=3">��װ���,��������̨����һ��Ȩ��!</A>';
		exit;
	}else{
		echo '<A HREF="'.$webdb[admin_url].'/index.php?lfj=group&job=admin_gr&gid=3">��װ���,���ֹ�ɾ���˰�װ�ļ�,����Ҫ����̨����һ��Ȩ��!</A>';
		exit;
	}
}


function strlen_lable($num,$sring){
	$sring=stripslashes($sring);
	$num=strlen($sring);
	return "s:$num:\"$sring\";";
}
?>