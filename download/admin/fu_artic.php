<?php
!function_exists('html') && exit('ERR');

ck_power('fu_artic');

if($action=="delete")
{
	foreach( $listdb AS $key=>$value){
		list($aid,$fid)=explode("-",$value);
		$db->query("DELETE FROM {$_pre}fu_article WHERE fid='$fid' AND aid='$aid'");
	}
	
	jump('ɾ���ɹ�',$FROMURL,0);
}
/**
*�г��������
**/
elseif($job=="listartic")
{
	$SQL=" 1 ";
	if(is_numeric($fid)){
		$SQL.=" AND A.fid=$fid ";
	}
	$rows=50;
	if($page<1){
		$page=1;
	}
	$min=($page-1)*$rows;
	$order="A.aid";
	$desc="DESC";
	$showpage=getpage("{$_pre}fu_article A","WHERE $SQL","$admin_path&job=listartic&fid=$fid&type=$type&keyword=$keyword&only=$only&mid=$mid",$rows,"");
	$sort_fid=$Guidedb->Select("{$_pre}fu_sort","fid",$fid,"$admin_path&job=listartic");
	$query=$db->query("SELECT A.*,S.name AS fname FROM {$_pre}fu_article A LEFT JOIN {$_pre}fu_sort S ON A.fid=S.fid WHERE $SQL ORDER BY A.aid DESC LIMIT $min,$rows");
	while($rs=$db->fetch_array($query))
	{
		$rss=$db->get_one("SELECT posttime,title,hits,comments,username,uid,yz,levels,pages,fid AS fid2,fname AS fname2 FROM {$_pre}article WHERE aid='$rs[aid]' ");
		$rss && $rs=$rs+$rss;
		$rs[ischeck]=$rs[yz]?"<A HREF='$admin_path&action=work&jobs=unyz&aid=$rs[aid]&only=$only&mid=$mid' title='�Ѿ�ͨ�����,�����ȡ�����'><img src='../member/images/check_yes.gif' border=0></A>":"<A HREF='$admin_path&action=work&jobs=yz&aid=$rs[aid]&only=$only&mid=$mid' style='color:blue;' title='��û��ͨ�����,�����ͨ�����'><img src='../member/images/check_no.gif' border=0></A>";
		$rs[iscom]=$rs[levels]?"<A HREF='$admin_path&action=work&jobs=uncom&aid=$rs[aid]&levels=0&only=$only&mid=$mid' style='color:red;' title='���Ƽ�,�����ȡ���Ƽ�'><img src='../images/default/good_ico.gif' border=0></A>":"<A HREF='$admin_path&action=work&jobs=com&aid=$rs[aid]&levels=1&only=$only&mid=$mid' title='δ�Ƽ�,���������Ϊ�Ƽ�'><img src='../member/images/nogood_ico.gif' border=0></A>";
		$rs[title2]=urlencode($rs[title]);
		$rs[posttime]=date("Y-m-d",$rs[posttime]);
		$rs[pages]<1 && $rs[pages]=1;
		$rs[yz]==2 && $rs[fname]="<A HREF='$admin_path&action=work&jobs=return&listdb[]=$rs[aid]&only=$only&mid=$mid' style='color:blue;' onclick=\"return confirm('��ȷ��Ҫ�ӻ���վȡ������?')\">����վ</A>";
		$listdb[]=$rs;
	}
	get_admin_html('listartic',true);
}

?>