<?php
require(dirname(__FILE__).'/global.php');
$listsorthtml = showsorts(0,0);

/**
*Ϊ��ȡ��ǩ����
**/
$chdb[main_tpl]=getTpl("comment");

/**
*��ǩ
**/
$ch_fid	= intval($fidDB[config][label_list]);		//�Ƿ�������Ŀר�ñ�ǩ
$ch_pagetype = 4;									//2,Ϊlistҳ,3,Ϊbencandyҳ
$ch_module = 0;										//���ģ��,Ĭ��Ϊ0
$ch = 0;											//�������κ�ר��
require(ROOT_PATH."inc/label_module.php");

require(ROOT_PATH."inc/head.php");
require(getTpl("post"));
require(ROOT_PATH."inc/foot.php");

function showsorts($fup,$step){
	global $db,$_pre,$lfjuid,$webdb,$Murl;
	$step++;
	if($step>1){
		for($i=0;$i<$step ;$i++ ){
			$icon.="--";
		}
	}
	$query = $db->query("SELECT * FROM `{$_pre}sort` WHERE fup='$fup' ORDER BY list");
	while($rs = $db->fetch_array($query)){		
		if($rs['type']==1){
			$show .= "<tr class=\"tr1\">
            <td class=\"fid\">".$rs[fid]."</td>
            <td class=\"name\">".$icon.$rs['name']."</td>
            <td class=\"type\">�����</td>
            <td class=\"num\"><br/></td>
            <td class=\"post\"><br/></td>
          </tr>";
			//$show .= "<tr class=tr1>\n<td class=fid>".$rs[fid]."<td>\n<td class=name>".$rs['name']."</td>\n<td class=type>�����</td>\n<td class=num><br/></td>\n<td class=post><br/></td></tr>\n";
			$show .=showsorts($rs[fid],$step);
		}else{
			$_rs=$db->get_one("SELECT COUNT(*) AS NUM FROM {$_pre}article WHERE fid='$rs[fid]' AND uid='$lfjuid'");
			$rs[NUM]=$_rs[NUM];
			$show .= "<tr class=\"tr2\">
            <td class=\"fid\">".$rs[fid]."</td>
            <td class=\"name\">".$icon.$rs['name']."</td>
            <td class=\"type\">��Ŀ</td>
            <td class=\"num\">".$rs[NUM]."</td>
            <td class=\"post\"><A target='_blank' HREF='$Murl/member/post.php?job=postnew&fid=$rs[fid]'>����</A></td>
          </tr>";
		}		
	}	
	return $show;
}


?>