<?php
define('Mpath',dirname(__FILE__).'/');
define( 'Mdirname' , preg_replace("/(.*)\/([^\/]+)/is","\\2",str_replace("\\","/",dirname(__FILE__))) );

require(Mpath."../inc/common.inc.php");
require(Mpath."data/config.php");			//ϵͳȫ�ֱ���
require(Mpath."data/all_fid.php");			//��Ŀ������
require(Mpath."inc/artic_function.php");	//�漰���������ĺ���
require(Mpath."inc/module.class.php");		//�Զ���ģ��
require(Mpath."data/module_db.php");		//�Զ���ģ��
$Html_Type=@include(Mpath."data/htmltype.php");		//��Ŀ��URL������ʽ


@include_once(ROOT_PATH."data/ad_cache.php");	//ȫվ�����������ļ�
@include_once(ROOT_PATH."data/label_hf.php");	//��ǩ��ͷ��׵ı���ֵ
@include_once(ROOT_PATH."data/module.php");		//ģ��ϵͳ�Ĳ�������ֵ




$_pre="{$pre}{$webdb[module_pre]}";					//���ݱ�ǰ׺

$groupdb=array_merge($groupdb,$groupdb["power_{$_pre}"]);	//Ȩ���ر���


$Murl=$webdb[www_url].'/'.Mdirname;					//��ģ��ķ��ʵ�ַ
$Mdomain=$ModuleDB[$webdb[module_pre]][domain]?$ModuleDB[$webdb[module_pre]][domain]:$Murl;

$Module_db=new Module_Field(Mpath);						//�Զ���ģ�����
$field_db = $module_DB[1][field];
/**
*ǰ̨�Ƿ񿪷�
**/
if($webdb[module_close])
{
	$webdb[Info_closeWhy]=str_replace("\r\n","<br>",$webdb[Info_closeWhy]);
	showerr("��ϵͳ��ʱ�ر�:$webdb[Info_closeWhy]");
}


unset($foot_tpl,$head_tpl,$index_tpl,$list_tpl,$bencandy_tpl);
$ch=intval($ch);
$fid=intval($fid);
$id=intval($id);
$page=intval($page);

unset($listdb,$rs);
//����JSʱ����ʾ��,����Ի���ͼƬ,'��Ҫ��\
$Load_Msg="<img alt=\"���ݼ�����,���Ժ�...\" src=\"$webdb[www_url]/images/default/ico_loading3.gif\">";


/**
*��ȡģ��ĺ���
**/
function getTpl($html,$tplpath=''){
	global $STYLE;
	if($tplpath&&file_exists($tplpath)){
		return $tplpath;
	}elseif($tplpath&&file_exists(Mpath.$tplpath)){
		return Mpath.$tplpath;
	}elseif(file_exists(Mpath."template/$STYLE/$html.htm")){
		return Mpath."template/$STYLE/$html.htm";
	}else{
		return Mpath."template/default/$html.htm";
	}
}



?>