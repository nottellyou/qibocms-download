<?php
require(dirname(__FILE__).'/global.php');

if(!$id){
	$id=$aid;
}elseif(!$aid){
	$aid=$id;
}

$rsdb=$db->get_one("SELECT A.*,S.* FROM {$_pre}article A LEFT JOIN {$_pre}sort S ON A.fid=S.fid WHERE A.aid='$id'");

$fid=$rsdb[fid];
if(!$rsdb){
	die("��ַ����,����֮");
}
get_guide($fid);	//��Ŀ����


/**
*Ϊ��ȡ��ǩ����
**/
$chdb[main_tpl]=getTpl("comment");

/**
*��ǩ
**/
$ch_fid	= intval($fidDB[config][label_list]);		//�Ƿ�������Ŀר�ñ�ǩ
$ch_pagetype = 5;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = 0;										//���ģ��,Ĭ��Ϊ0
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");

require(ROOT_PATH."inc/head.php");
require($chdb[main_tpl]);
require(ROOT_PATH."inc/foot.php");

?>