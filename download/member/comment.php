<?php
require(dirname(__FILE__)."/global.php");

if(!$lfjid){
	showerr("�㻹û��¼");
}
unset($fiddb);
if(!$web_admin){
	$query = $db->query("SELECT * FROM {$_pre}sort WHERE admin!=''");
	while($rs = $db->fetch_array($query)){
		$detail=explode(",",$rs[admin]);
		if(in_array($lfjid,$detail)){
			$fiddb[]=$rs[fid];
		}
	}
}

/*************
*ɾ������
**************/
if($job=='del'){
	foreach( $cidDB AS $key=>$value){
		$rsdb=$db->get_one("SELECT C.cid,C.uid AS commentuid,C.aid,A.uid,A.fid FROM {$_pre}comment C LEFT JOIN {$_pre}article A ON C.aid=A.aid WHERE C.cid='$value'");
		if($rsdb[uid]==$lfjuid||$rsdb[commentuid]==$lfjuid||$web_admin||in_array($rsdb[fid],$fiddb)){
			$db->query("DELETE FROM {$_pre}comment WHERE cid='$rsdb[cid]'");
		}
		$db->query("UPDATE {$_pre}article SET comments=comments-1 WHERE aid='$rsdb[aid]'");
	}
	refreshto("$FROMURL","ɾ���ɹ�",0);
}

/*************
*���ۼӾ���
**************/
if($job=='ifcom'){
	foreach( $cidDB AS $key=>$value){
		$rs=$db->get_one("SELECT aid FROM {$_pre}comment WHERE cid='$value'");
		$rsdb=$db->get_one("SELECT C.cid,C.aid,A.uid,A.fid FROM {$_pre}comment C LEFT JOIN {$_pre}article A ON C.aid=A.aid WHERE C.cid='$value'");
		if($web_admin||in_array($rsdb[fid],$fiddb)){
			$db->query("UPDATE {$_pre}comment SET ifcom='$ifcom' WHERE cid='$rsdb[cid]'");
		}		
	}
	refreshto("$FROMURL","���óɹ�",0);
}

/*************
*�������
**************/
if($job=='yz'){
	foreach( $cidDB AS $key=>$value){
		$rs=$db->get_one("SELECT aid FROM {$_pre}comment WHERE cid='$value'");
		$rsdb=$db->get_one("SELECT C.cid,C.aid,A.uid,A.fid FROM {$_pre}comment C LEFT JOIN {$_pre}article A ON C.aid=A.aid WHERE C.cid='$value'");
		if($web_admin||in_array($rsdb[fid],$fiddb)){
			$db->query("UPDATE {$_pre}comment SET yz='$yz' WHERE cid='$rsdb[cid]'");
		}		
	}
	refreshto("$FROMURL","���óɹ�",0);
}


if($job=='work'){
	if($web_admin){
		$SQL=" WHERE 1 ";
	}else{
		$fids=implode(",",$fiddb);
		if($fids){
			$SQL=" WHERE C.fid IN ($fids) ";
		}else{
			$SQL=" WHERE 0 ";
		}		
	}
}else{
	$SQL=" WHERE C.authorid='$lfjuid' ";
}

$rows=20;
if(!$page){
	$page=1;
}
$min=($page-1)*$rows;


$showpage=getpage("{$_pre}comment C LEFT JOIN {$_pre}article A ON C.aid=A.aid"," $SQL ","?job=$job",$rows);
$query = $db->query("SELECT C.*,A.title FROM {$_pre}comment C LEFT JOIN {$_pre}article A ON C.aid=A.aid $SQL ORDER BY C.cid DESC LIMIT $min,$rows");
while($rs = $db->fetch_array($query)){
	if($job=='work'){
		if($rs[yz]){
			$rs[state]="&nbsp;&nbsp;<A style='color:red;' href='?job=yz&yz=0&cidDB[]=$rs[cid]' title='�����,���ȡ�����'><img src='images/check_yes.gif' border=0></A>&nbsp;&nbsp;";
		}else{
			$rs[state]="&nbsp;&nbsp;<A style='color:blue;' href='?job=yz&yz=1&cidDB[]=$rs[cid]' title='��û���,���ͨ�����'><img src='images/check_no.gif' border=0></A>&nbsp;&nbsp;";
		}
		if($rs[ifcom]){
			$rs[state].=" <A style='color:red;' href='?job=ifcom&ifcom=0&cidDB[]=$rs[cid]' title='���Ƽ�Ϊ����,���ȡ������'><img src='../images/default/good_ico.gif' border=0></A>";
		}else{
			$rs[state].=" <A style='color:blue;' href='?job=ifcom&ifcom=1&cidDB[]=$rs[cid]' title='�Ǿ���,�������Ϊ����'><img src='images/nogood_ico.gif' border=0></A>";
		}
	}else{
		if($rs[yz]){
			$rs[state]="<A style='color:red;'>�����</A>";
		}else{
			$rs[state]="<A style='color:blue;'>δ���</A>";
		}
	}
	$rs[posttime]=date("Y-m-d H:i",$rs[posttime]);
	$rs[ctitle]=get_word($rs[content],110);
	$listdb[]=$rs;
}

require(ROOT_PATH."member/head.php");
require(dirname(__FILE__)."/template/comment.htm");
require(ROOT_PATH."member/foot.php");

?>