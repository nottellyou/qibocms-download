<?php
require(dirname(__FILE__).'/global.php');
@include(Mpath."data/special_guide_fid.php");		//ר����Ŀ�����ļ�


$GuideFid[$fid]=str_replace("list.php?fid=","listsp.php?fid=",$GuideFid[$fid]);

//��Ŀ�����ļ�
$fidDB=$db->get_one("SELECT * FROM {$_pre}spsort WHERE fid='$fid'");
if(!$fidDB){
	showerr("��Ŀ����");
}
$fidDB[config]=unserialize($fidDB[config]);

//ǿ����ת����̬ҳ
if($webdb[ForbidShowPhpPage]&&!$NeedCheck&&!$jobs){
	$detail=get_m_SPhtml_url($fidDB);
	if(is_file(Mpath.$detail[_listurl])){
		header("location:$detail[_listurl]");
		exit;
	}
}

//SEO
$titleDB[title]			= filtrate("$fidDB[name] - $webdb[webname]");
$titleDB[keywords]		= filtrate("$fidDB[metakeywords]  $webdb[metakeywords]");
$titleDB[description]	= filtrate("$fidDB[descrip]");

//����Ŀ���Ϊ��׼
$fidDB[style] && $STYLE=$fidDB[style];

/*ģ��*/
$FidTpl=unserialize($fidDB[template]);
$head_tpl=$FidTpl['head'];
$foot_tpl=$FidTpl['foot'];


$chdb[main_tpl]=getTpl("listsp",$FidTpl['list']);	//��ȡ��ǩ����

$ch_fid	= intval($id);								//ÿ��ר��ı�ǩ��һ��
$ch_pagetype = 10;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = $webdb[module_id]?$webdb[module_id]:99;//ϵͳ�ض�ID����,ÿ��ϵͳ������ͬ
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");


//��ʾ�ӷ���
$listdb_moresort=ListMoreSp();

//�б�ҳ����ƪר��
$rows=10;	

$listdb=ListThisSp($rows,$leng=50);		//����Ŀר���б�
$showpage=getpage("{$_pre}special","WHERE fid=$fid AND yz=1","listsp.php?fid=$fid",$rows);	//ר���б��ҳ

require(ROOT_PATH."inc/head.php");
require($chdb[main_tpl]);
require(ROOT_PATH."inc/foot.php");



/**
*����Ŀ
**/
function ListMoreSp(){
	global $db,$_pre,$fid,$webdb,$fidDB;
	$order='list';
	$order && $_order=" ORDER BY $order DESC ";
	$rows=4;
	$leng=30;
	$query=$db->query("SELECT * FROM {$_pre}spsort WHERE fup=$fid ORDER BY list DESC");
	while($rs=$db->fetch_array($query)){
		$SQL="WHERE fid=$rs[fid] $_order LIMIT $rows";
		$which='*';
		$rs[article]=list_special($SQL,$which,$leng);
		//�������Ŀ���ܻ�ȡ��ר��,����ȡ����������Ŀ��ר��
		if(!$rs[article])
		{
			$array_fid=Get_SonFid("{$_pre}spsort",$rs[fid]);
			if($array_fid)
			{
				$SQL="WHERE fid IN (".implode(',',$array_fid).") $_order LIMIT $rows";
				$rs[article]=list_special($SQL,$which,$leng);
			}
		}
		$rs[logo] && $rs[logo]=tempdir($rs[logo]);
		$listdb[]=$rs;
	}
	return $listdb;
}



function ListThisSp($rows,$leng=50){
	global $page,$fid,$fidDB,$webdb;
	if($page<1){
		$page=1;
	}
	$min=($page-1)*$rows;
	$DESC='DESC';
	$ORDER='list';
	$SQL="WHERE fid=$fid AND yz=1 ORDER BY $ORDER $DESC LIMIT $min,$rows";
	$which='*';
	$listdb=list_special($SQL,$which,$leng);
	return $listdb;
}
?>