<?php
!function_exists('html') && exit('ERR');
$db->query("UPDATE {$_pre}article SET hits=hits+1,lastview='$timestamp' WHERE aid='$aid'");
$rs=$db->get_one(" SELECT hits,comments FROM {$_pre}article WHERE aid='$aid' ");


echo "<SCRIPT LANGUAGE=\"JavaScript\">";
//������������
if($webdb[cookieDomain]){
	echo "document.domain = \"$webdb[cookieDomain]\";";
}

echo "parent.document.getElementById('hits').innerHTML='$rs[hits]';
if(parent.document.getElementById('commnetsnum')!=null)parent.document.getElementById('commnetsnum').innerHTML='$rs[comments]';
if(parent.document.getElementById('total_hits')!=null)parent.document.getElementById('total_hits').innerHTML='$_rs[total_hits]';
if(parent.document.getElementById('month_hits')!=null)parent.document.getElementById('month_hits').innerHTML='$_rs[month_hits]';
if(parent.document.getElementById('week_hits')!=null)parent.document.getElementById('week_hits').innerHTML='$_rs[week_hits]';
if(parent.document.getElementById('day_hits')!=null)parent.document.getElementById('day_hits').innerHTML='$_rs[day_hits]';
if(parent.document.getElementById('hits_time')!=null)parent.document.getElementById('hits_time').innerHTML='$_rs[hits_time]';
";

if($lfjid){
	echo "if(parent.document.getElementById('comment_username_tr')!=null)parent.document.getElementById('comment_username_tr').style.display='none';
	";
}
if($web_admin || !$groupdb[CommentArticleYzImg]){
	echo "if(parent.document.getElementById('comment_yzimg_tr')!=null)parent.document.getElementById('comment_yzimg_tr').style.display='none';
	";
}

echo "</SCRIPT>";
?>