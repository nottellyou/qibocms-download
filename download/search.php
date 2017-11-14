<?php
require(dirname(__FILE__).'/global.php');
require_once(ROOT_PATH."inc/class.inc.php");
$Guidedb=new Guide_DB;

$keyword=str_replace("%","\%",$keyword);
$keyword=trim($keyword);
$rows=20;


if( ($_GET[type]||$_POST[type]) && !$keyword ){
	showerr("�ؼ��ֲ���Ϊ��");
}


if( $_GET[keyword] || $_POST[keyword] ){

	$search_module=0;
	if(!$type)
	{
		$type='title';
	}
	if(!$web_admin)
	{
		if(!$groupdb[SearchArticleType]){
			showerr("�������û���,��Ȩʹ������!");
		}
		elseif($type=='content'&&$groupdb[SearchArticleType]!=2){
			showerr("�������û���,��Ȩ�����������!");
		}
	}

	if($_POST[keyword]&&($timestamp-$_COOKIE[searchTime]<3))
	{
		showerr("3������,�벻Ҫ�ظ��ύ��ѯ");
	}
	setcookie("searchTime",$timestamp,$timestamp+3);

	$SQL=" A.yz=1 ";

	if($type=='keyword')
	{
		unset($array);
		$query = $db->query("SELECT B.aid FROM {$_pre}keywordid B LEFT JOIN {$_pre}keyword A ON A.id=B.id WHERE A.keywords='$keyword'");
		while($rs = $db->fetch_array($query)){
			$array[]=$rs[aid];
		}
		if($array){
			$SQL.=" AND A.aid IN (".implode(',',$array).") ";
		}else{
			$SQL.=" AND 0 ";
		}
	}
	elseif($type=='title')
	{
		$SQL.=" AND BINARY A.title LIKE '%$keyword%' ";
	}
	elseif($type=='id')
	{
		$SQL.=" AND A.aid = '$keyword' ";
	}
	elseif($type=='username')
	{
		$SQL.=" AND BINARY A.username = '$keyword' ";
	}
	elseif($type=='content')
	{
		$SQL.=" AND BINARY B.content LIKE '%$keyword%' ";
	}

	//��������ʱ��������-��ʼ
	if($starttijd&&$eindtijd){
		$starttijd=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$starttijd);
		$eindtijd=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$eindtijd);
		if($starttijd<$eindtijd){
			$SQL.=" AND A.posttime>$starttijd AND A.posttime<$eindtijd";
		}else{
			showerr("ʱ���ʽ����");
		}
	}
	if($starttijd){
		$starttijd=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$starttijd);
		$SQL.=" AND A.posttime>$starttijd";
	}
	if($eindtijd){
		$eindtijd=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$eindtijd);
		$SQL.=" AND A.posttime<$eindtijd";
	}//��������ʱ��������-����


	if($page<1)
	{
		$page=1;
	}
	$min=($page-1)*$rows;

	$_SQL=" AND B.topic=1 ";
	if($fid){
		$_SQL=" AND A.fid='$fid' ";
	}	
	
	

	unset($listdb);
	$query = $db->query("SELECT SQL_CALC_FOUND_ROWS B.*,A.* FROM {$_pre}article A LEFT JOIN {$_pre}reply B ON A.aid=B.aid  WHERE $SQL $_SQL ORDER BY A.aid DESC LIMIT $min,$rows");
	$RS=$db->get_one("SELECT FOUND_ROWS()");
	$totalNum=$RS['FOUND_ROWS()'];	$showpage=getpage('','',"search.php?fid=$fid&type=$type&$search_url&keyword=".urlencode($_POST[keyword]).urlencode($_GET[keyword])."",$rows,$totalNum);

	while($rs = $db->fetch_array($query))
	{
		$rs[posttime] = date("Y-m-d",$rs[posttime]);
		if( $webdb[path] && ($webdb[Html_Type]==1) ){
			$webdb[path]='';
		}
		$rs[url]="bencandy.php?fid=$rs[fid]&id=$rs[aid]";
		$listdb[] = $rs;
	}
	
	if(!$listdb)
	{
		showerr("�ܱ�Ǹ,û���ҵ���Ҫ��ѯ������");
	}
	
	$typedb[$type]=' selected ';
}



$fid_select="<select name='fid' onChange=\"if(this.options[this.selectedIndex].value=='-1'){alert('�㲻��ѡ������');}\"><option value='0' style='color:#aaa;'>������Ŀ</option>";
$fid_select.=list_allsort(0,1,$fid,$mid);
$fid_select.="</select>";	


/**
*Ϊ��ȡ��ǩ����
**/
$chdb[main_tpl]=getTpl("digg");

/**
*��ǩ
**/
$ch_fid	= intval($fidDB[config][label_list]);		//�Ƿ�������Ŀר�ñ�ǩ
$ch_pagetype = 6;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = 0;										//���ģ��,Ĭ��Ϊ0
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");


$type||$type='title';
$typedb[$type]=" checked ";

require(ROOT_PATH."inc/head.php");
require(getTpl("search"));
require(ROOT_PATH."inc/foot.php");



//�澲̬
if($webdb[Html_Type]==1)
{
	$content=ob_get_contents();
	ob_end_clean();
	ob_start();			//����
	$content=make_html($content,'N');
	echo "$content";
}


/*��Ŀ�б� ȡ��ģ�������Ŀ*/
function list_allsort($fid,$Class,$ckfid,$fmid="0"){
	global $db,$_pre,$listdb;
	$Class++;
	if(!$fmid){
		$query=$db->query("SELECT * FROM {$_pre}sort WHERE fup='$fid' ORDER BY list DESC");
	}else{
		$query=$db->query("SELECT * FROM {$_pre}sort WHERE fup='$fid' AND fmid ='$fmid'ORDER BY list DESC");
	}
	while( $rs=$db->fetch_array($query) ){
		$icon="";
		for($i=1;$i<$Class;$i++){
			$icon.="&nbsp;|&nbsp;&nbsp;";
		}
 		if($icon){
			$icon=substr($icon,0,-12);
			$icon.="--";
		}
 		if($rs[type]){
			$fid_select.="<option value='-1' style='color:red;'>$icon$rs[name]</option>";
 		}else{
 			$ckk=$ckfid==$rs[fid]?' selected ':' ';
			$fid_select.="<option value='$rs[fid]' $ckk>$icon$rs[name]</option>";
 		}
		$fid_select.=list_allsort($rs[fid],$Class,$ckfid);
	}
	return $fid_select;
}

?>