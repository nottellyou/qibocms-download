<?php
require(dirname(__FILE__)."/global.php");

if($do=='del'){
	$db->query("DELETE FROM {$_pre}collection WHERE id='$id' AND uid='$lfjuid'");
}
if($page<1){
	$page=1;
}
$rows=20;
$min=($page-1)*$rows;


$showpage=getpage("{$_pre}collection B LEFT JOIN {$_pre}article A ON A.aid=B.aid","WHERE B.uid=$lfjuid","?job=$job",$rows);

$query = $db->query("SELECT A.*,B.id,B.aid,B.posttime AS ctime FROM {$_pre}collection B LEFT JOIN {$_pre}article A ON A.aid=B.aid WHERE B.uid=$lfjuid ORDER BY B.id DESC LIMIT $min,$rows");
while($rs = $db->fetch_array($query)){
	if($rs[yz]==2){
		$rs[state]="<A style='color:red;'>����</A>";
	}elseif($rs[yz]==1){
		$rs[state]="����";
	}elseif(!$rs[yz]){
		$rs[state]="<A style='color:blue;'>����</A>";
	}
	if($rs[levels]){
		$rs[levels]="<A style='color:red;'>���Ƽ�</A>";
	}else{
		$rs[levels]="δ�Ƽ�";
	}
	$rs[ctime]=date("Y-m-d",$rs[ctime]);
	$rs[title]=get_word($rs[full_title]=$rs[title],54);
	$listdb[]=$rs;
}

require(ROOT_PATH."member/head.php");
require(dirname(__FILE__)."/template/collection.htm");
require(ROOT_PATH."member/foot.php");
?>