<?php
require(dirname(__FILE__).'/global.php');

/**
*Ϊ��ȡ��ǩ����
**/
$chdb[main_tpl]=getTpl("digg");

/**
*��ǩ
**/
$ch_fid	= intval($fidDB[config][label_list]);		//�Ƿ�������Ŀר�ñ�ǩ
$ch_pagetype = 7;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = 0;										//���ģ��,Ĭ��Ϊ0
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");


//�б�ҳ����ƪ���
$rows=20;	

$fidDB[listorder]=8;
$listdb=ListThisSort($rows,50);		//����Ŀ����б�
$showpage=getpage("{$_pre}article","WHERE yz=1","?",$rows);	//����б��ҳ

require(ROOT_PATH."inc/head.php");
require($chdb[main_tpl]);
require(ROOT_PATH."inc/foot.php");


?>