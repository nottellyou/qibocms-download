<?php
require(dirname(__FILE__).'/global.php');
$page<1 && $page=1;


$Cache_FileName=Mpath."cache/list_cache/{$fid}_{$page}.php";
if(!$jobs&&$webdb[list_cache_time]&&(time()-filemtime($Cache_FileName))<($webdb[list_cache_time]*60)){
	echo read_file($Cache_FileName);
	exit;
}

get_guide($fid);	//��Ŀ����


if(!$fid){
	showerr("��ĿFID������");
}

//��Ŀ�����ļ�
$fidDB=$db->get_one("SELECT * FROM {$_pre}sort WHERE fid='$fid'");
if(!$fidDB){
	showerr("��ĿID����");
}
$fidDB[M_alias]='���';
$fidDB[config]=unserialize($fidDB[config]);
$fidDB[descrip]=En_TruePath($fidDB[descrip],0);
//if($fidDB[type]==2){
//	$rsdb[content]=$fidDB[descrip];
//}

$fupId=intval($fidDB[type]?$fid:$fidDB[fup]);

//��ֹ���ʶ�̬ҳ
if($webdb[Html_Type]==1&&$webdb[ForbidShowPhpPage]&&!$NeedCheck&&!$jobs){
	$detail=m_html_url();
	if(is_file(Mpath.$detail[_listurl])){
		header("location:$detail[listurl]");
		exit;
	}
}

/**
*��Ŀ�����ļ����
**/
check_fid($fidDB);

//SEO
$titleDB[title]			= filtrate("$fidDB[name] - $webdb[webname]");
$titleDB[keywords]		= filtrate("$fidDB[metakeywords]  $webdb[metakeywords]");
$titleDB[description]	= filtrate("$fidDB[descrip]");

//����Ŀ���Ϊ��׼
$fidDB[style] && $STYLE=$fidDB[style];





//��ʾ�ӷ���
$listdb_moresort=ListMoreSort();

//�б�ҳ����ƪ���,��Ŀ���õĻ�.����ĿΪ��׼,������ϵͳΪ��׼,ϵͳ�����ھ�Ĭ��20
$rows=$fidDB[maxperpage]?$fidDB[maxperpage]:($webdb[list_row]?$webdb[list_row]:20);	

$listdb=ListThisSort($rows,$webdb[ListLeng]?$webdb[ListLeng]:50);		//����Ŀ����б�

//����б��ҳ
//$page_sql=$webdb[viewNoPassArticle]?'':' AND yz=1 ';
$RS=$db->get_one("SELECT FOUND_ROWS()");
$showpage=getpage('','',"list.php?fid=$fid",$rows,$RS['FOUND_ROWS()']);


//�����Ŀ����ģ��
if(is_file(html("$webdb[SideSortStyle]"))){
	$sortnameTPL=html("$webdb[SideSortStyle]");
}else{
	$sortnameTPL=html("side_sort/0");
}

//��Ŀ����ģ��
$aboutsortTPL=html("aboutsort_tpl/0");


//�������ʾ��ʽ
$fidDB[config][ListShowBigType] || $fidDB[config][ListShowBigType]=0;
unset($bigsortTPL);

if(!$bigsortTPL){
	$bigsortTPL=html("bigsort_tpl/0",ROOT_PATH."template/default/{$fidDB[config][ListShowBigType]}.htm");
}


//�����б���ʾ��ʽ.
$fidDB[config][ListShowType] || $fidDB[config][ListShowType]=0;
$listTPL=html("list_tpl/0",ROOT_PATH."template/default/{$fidDB[config][ListShowType]}.htm");


//����ͷ����β��
$head_tpl=html('head');
$foot_tpl=html('foot');
if($webdb[IF_Private_tpl]==2&&$webdb[IF_Private_tpl]==3){
	if(is_file(Mpath.$webdb[Private_tpl_head])){
		$head_tpl=Mpath.$webdb[Private_tpl_head];
	}
	if(is_file(Mpath.$webdb[Private_tpl_foot])){
		$foot_tpl=Mpath.$webdb[Private_tpl_foot];
	}
}

/*ģ��*/
$FidTpl=unserialize($fidDB[template]);
$FidTpl['head'] && $head_tpl=$FidTpl['head'];
$FidTpl['foot'] && $foot_tpl=$FidTpl['foot'];

//��ģ����չ�ӿ�
//@include(ROOT_PATH."inc/list_{$fidDB[fmid]}.php");

/**
*Ϊ��ȡ��ǩ����
**/
$chdb[main_tpl]=getTpl("list",$FidTpl['list']);

/**
*��ǩ
**/
$ch_fid	= intval($fidDB[config][label_list]);		//�Ƿ�������Ŀר�ñ�ǩ
$ch_pagetype = 2;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = $webdb[module_id]?$webdb[module_id]:99;//ϵͳ�ض�ID����,ÿ��ϵͳ������ͬ
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");

require(ROOT_PATH."inc/head.php");
require($chdb[main_tpl]);
require(ROOT_PATH."inc/foot.php");




if(!$jobs&&$webdb[list_cache_time]&&(time()-filemtime($Cache_FileName))>($webdb[list_cache_time]*60)){
	
	if(!is_dir(dirname($Cache_FileName))){
		makepath(dirname($Cache_FileName));
	}
	write_file($Cache_FileName,$content);
}elseif($jobs=='show'){
	@unlink($Cache_FileName);
}


/**
*��Ŀ�����ļ����
**/
function check_fid($fidDB){
	global $web_admin,$groupdb,$fid;
	if(!$fidDB)
	{
		showerr("��Ŀ������");
	}

	//��ת���ⲿ��ַ
	if( $fidDB[jumpurl] )
	{
		header("location:$fidDB[jumpurl]");
		exit;
	}

	//��Ŀ����
	if( $fidDB[passwd] )
	{
		if( $_POST[password] )
		{
			if( $_POST[password] != $fidDB[passwd] )
			{
				echo "<A HREF=\"?fid=$fid\">���벻��ȷ,�������</A>";
				exit;
			}
			else
			{
				setcookie("sort_passwd_$fid",$fidDB[passwd]);
				$_COOKIE["sort_passwd_$fid"]=$fidDB[passwd];
			}
		}
		if( $_COOKIE["sort_passwd_$fidDB[fid]"] != $fidDB[passwd] )
		{
			echo "<CENTER><form name=\"form1\" method=\"post\" action=\"\">��������Ŀ����:<input type=\"password\" 	name=\"password\"><input type=\"submit\" name=\"Submit\" value=\"�ύ\"></form></CENTER>";
			exit;
		}
	}

	if( $fidDB[allowviewtitle] || $fidDB[allowviewcontent] )
	{
		if(!$web_admin&&!in_array($groupdb[gid],explode(",","$fidDB[allowviewtitle],$fidDB[allowviewcontent]")))
		{
			showerr("�������û��鲻�����������");
		}
	}
}

?>