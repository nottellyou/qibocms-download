<?php
!function_exists('html') && exit('ERR');

ck_power('listartic');

require_once(Mpath."inc/artic_function.php");

if($action=="delete")
{
	if(!$aid&&$id){
		$aid=$id;
	}
	$id=$aid;
	
	$rs=$db->get_one("SELECT A.*,B.admin FROM {$_pre}article A LEFT JOIN {$_pre}sort B ON A.fid=B.fid WHERE A.aid='$id'");

	delete_article($id,$rid);
	//��̬ҳ����
	make_article_html("$FROMURL",'del',$rs);
	
	jump("ɾ���ɹ�","$FROMURL",1);
}
/**
*�г��������
**/
elseif($job=="listartic")
{
	$_sql_c="";
	$SQL=" 1 ";
	if(is_numeric($fid)&&$fid>0){
		$SQL.=" AND A.fid=$fid ";
	}

	if($type=="yz"){
		$SQL.=" AND A.yz=1 ";
	}
	elseif($type=="unyz"){
		$SQL.=" AND A.yz=0 ";
	}
	elseif($type=="rubbish"){
		$SQL.=" AND A.yz=2 ";
	}
	elseif($type=="levels"){
		$SQL.=" AND A.levels!=0 ";
	}
	elseif($type=="unlevels"){
		$SQL.=" AND A.levels=0 ";
	}
	elseif($type=="my"){
		$SQL.=" AND A.uid='$userdb[uid]' ";
	}
	elseif($type=="picurl"){
		$SQL.=" AND A.ispic=1 ";
	}
	elseif($type=="title"){
		$SQL.=" AND binary A.title LIKE '%$keyword%' ";
	}
	elseif($type=="aid"){
		$SQL.=" AND A.aid='$keyword' ";
	}
	elseif($type=="content"){
		//δ���ƺ�
		$SQL.=" AND binary B.content LIKE '%$keyword%' ";
		$_sql_c=" LEFT JOIN {$_pre}reply B ON A.aid=B.aid ";
	}
	elseif($type=="username"){
		$SQL.=" AND binary A.username LIKE '%$keyword%' ";
	}

	$rows=50;
	if($page<1){
		$page=1;
	}
	$min=($page-1)*$rows;
	$order="A.list";
	$desc="DESC";
	$showpage=getpage("{$_pre}article A","WHERE $SQL","$admin_path&job=listartic&fid=$fid&type=$type&keyword=$keyword",$rows,"");
	$sort_fid=$Guidedb->Select("{$_pre}sort","fid",$fid,"$admin_path&job=listartic");
	$query=$db->query("SELECT * FROM {$_pre}article A WHERE $SQL ORDER BY $order $desc LIMIT $min,$rows");
	while($rs=$db->fetch_array($query))
	{
		$rs[ischeck]=$rs[yz]?"<A HREF='$admin_path&action=work&jobs=unyz&aid=$rs[aid]' title='�Ѿ�ͨ�����,�����ȡ�����'><img src='../member/images/check_yes.gif' border=0></A>":"<A HREF='$admin_path&action=work&jobs=yz&aid=$rs[aid]' style='color:blue;' title='��û��ͨ�����,�����ͨ�����'><img src='../member/images/check_no.gif' border=0></A>";
		$rs[iscom]=$rs[levels]?"<A HREF='$admin_path&action=work&jobs=uncom&aid=$rs[aid]&levels=0' style='color:red;' title='���Ƽ�,�����ȡ���Ƽ�'><img src='../images/default/good_ico.gif' border=0></A>":"<A HREF='$admin_path&action=work&jobs=com&aid=$rs[aid]&levels=1' title='δ�Ƽ�,���������Ϊ�Ƽ�'><img src='../member/images/nogood_ico.gif' border=0></A>";
		$rs[title2]=urlencode($rs[title]);
		$rs[posttime]=date("Y-m-d",$rs[posttime]);
		$rs[pages]<1 && $rs[pages]=1;
		$rs[yz]==2 && $rs[fname]="<A HREF='$admin_path&&action=work&jobs=return&listdb[]=$rs[aid]' style='color:blue;' onclick=\"return confirm('��ȷ��Ҫ�ӻ���վȡ������?')\">����վ</A>";
		$listdb[$rs[aid]]=$rs;
	}
	get_admin_html('listartic',true);
}
elseif($job=="work")
{
	if(!$listdb){
		showmsg("��ѡ��һƪ���");
	}
	if($jobs=="move"){
		$sort_fid=$Guidedb->Select("{$_pre}sort","fid");
	}elseif($jobs=="special"){
		$special_select=special_m_select($name='spid');
	}elseif($jobs=="fusort"){
		$fusort_select=$Guidedb->Select("{$_pre}fu_sort","fid");
	}
	get_admin_html('work',true);
}
elseif($action=="work")
{
	if(!$listdb&&!$aid){
		showmsg("��ѡ��һƪ���");
	}
	
	$url=$fromurl?$fromurl:$FROMURL;

	if(!is_array($listdb)&&$aid)
	{
		$listdb[$aid]=$aid;
	}
	
	if($jobs=='delete'){
		//make_more_article_html("$admin_path&job=listartic","del_0",$listdb);
	}

	foreach($listdb AS $key=>$value){
		do_work($value,$jobs,0);
	}
	
	if($jobs=='delete'){
		make_more_article_html("$webdb[admin_url]/$admin_path&job=listartic","del_1",$listdb);
	}elseif($jobs!='fusort'){
		make_more_article_html("$webdb[admin_url]/$admin_path&job=listartic",$jobs,$listdb);
	}
	jump("�����ɹ�",$url,0);
}

elseif($action=="art_list")
{
	foreach( $list_db AS $key=>$value){
		$db->query("UPDATE {$_pre}article SET list='$value' WHERE aid='$key'");
	}
	jump("����ɹ�,��Ҫ��ǰ���б�Ĭ������Ż���ʾЧ��",$FROMURL,10);
}


function special_m_select($name='spid',$id=0){
	global $db,$_pre;
	$show="<select name='$name'><option value=''>��ѡ��</option>";
	$query=$db->query("SELECT * FROM {$_pre}special ORDER BY list DESC LIMIT 100");
	while( $rs=$db->fetch_array($query) ){
		$ckk=$id==$rs[id]?' selected ':'';
		$show.="<option value='$rs[id]' $ckk>$rs[title]</option>";
	}
	$show.=" </select>";
	return $show;
}
?>