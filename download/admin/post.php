<?php
!function_exists('html') && exit('ERR');

ck_power('postArticle');

$Guidedb->ifpost=1;
$Guidedb->forbidpost=1;

if(!$aid&&!$rid&&$id){
	$aid=$id;
}
if($rid)
{
	if(!$aid){
		showmsg("aid������!");
	}
	//�޸�������޸Ķ�ҳ����
	$rsdb=$db->get_one("SELECT R.*,A.* FROM {$_pre}article A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE R.rid='$rid'");
	$aid=$rsdb[aid];
	$fid=$rsdb[fid];
}
elseif($aid)
{
	//ֻ�����޸�����/�������
	$rsdb=$db->get_one("SELECT R.*,A.* FROM {$_pre}article A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE A.aid='$aid' ORDER BY R.rid ASC LIMIT 1");
	isset($_POST[fid]) || $fid=$rsdb[fid];
}

if($fid||$step){
	$fidDB=$db->get_one("SELECT * FROM {$_pre}sort WHERE fid='$fid'");
	!$fidDB && showmsg("��Ŀ����");
	$fidDB[type]!=0 && showmsg("��ֻ��ѡ������Ŀ��������!");
}


$uid=isset($rsdb[uid])?$rsdb[uid]:$lfjuid;

if($job=='endHTML')
{
	$htmlurldb=m_html_url();
	//��ҳ���ɾ�̬
	@unlink(Mpath."index.htm.bak");
	rename(Mpath."index.htm",Mpath."index.htm.bak");
	refreshto("$admin_path&file=artic&file=artic&job=listartic","<CENTER>[<A HREF='$admin_path&job=postnew&fid=$fid'>����������</A>] [<A HREF='$admin_path&job=post_more&aid=$aid'>����������</A>] [<A HREF='$admin_path&file=artic&job=listartic&fid=$fid'>��������б�</A>] [<A HREF='{$htmlurldb[showurl]}' target=_blank>�鿴���</A>] [<A HREF='$admin_path&job=manage&aid=$aid'>�޸����</A>]</CENTER><div style='display:none;'><iframe src='$Murl/job.php?job=article_html&fid=$fid&aid=$aid' width=0 height=0></iframe></div>",60);
}
elseif($job=='manage')
{
	if($rsdb[pages]<2){
		header("location:$admin_path&job=edit&aid=$aid");exit;
	}
	if($step==2){
		asort($orderDB);
		$i=0;
		foreach( $orderDB AS $key=>$value){
			$i++;
			$db->query("UPDATE {$_pre}reply SET orderid=$i WHERE aid='$aid' AND rid='$key'");
		}
		refreshto($FROMURL,"����ɹ�",1);
	}
	if($rsdb[pages]>1){
		$MSG="�޸����";
		$i=0;
		$query = $db->query("SELECT * FROM {$_pre}reply WHERE aid='$aid' ORDER BY topic DESC,orderid ASC");
		while($rs = $db->fetch_array($query)){
			if(!$rs[subhead]){
				$rs[subhead]=$rsdb[title];
			}
			$rs[postdate]='';
			if($rs[postdate]){
				$rs[postdate]=date("Y-m-d H:i:s",$rs[postdate]);
			}
			$rs[i]=++$i;
			$listdb[]=$rs;
		}
		get_admin_html('post_set');
		exit;
	}
}
elseif($action=="delelte")
{
	//ɾ������ĺ���
	delete_article($rsdb[aid],$rsdb[rid]);
	refreshto($FROMURL,"ɾ���ɹ�",1);
}



//�Է���ǰ�뷢��ǰ������
require_once(Mpath."inc/check.postarticle.php");

if($job=='postnew')
{

	if($step=='post')
	{
		post_new();

		//���ɾ�̬
		make_article_html("$webdb[admin_url]/$admin_path&job=endHTML&aid=$aid");

		refreshto("$admin_path&job=postnew&fid=$fid","<CENTER>[<A HREF='$admin_path&job=postnew&fid=$fid'>��������������</A>] <span style='display:;'>[<A HREF='$admin_path&job=post_more&fid=$fid&mid=$mid&aid=$aid&only=$only'>����������</A>]</span> [<A HREF='$admin_path&file=artic&job=listartic&fid=$fid'>���������б�</A>] [<A HREF='$Murl/bencandy.php?fid=$fid&aid=$aid' target=_blank>�鿴����</A>] [<A HREF='$admin_path&job=edit&aid=$aid'>����޸�</A>]</CENTER>",60);
	}
	$MSG='�·�������';

	$select_fid=$Guidedb->SelectIn("{$_pre}sort",0,$fid);

	get_admin_html('post');
}
elseif($job=='edit')
{
	if($step=='post')
	{
		post_edit();

		//���ɾ�̬
		make_article_html("$webdb[admin_url]/$admin_path&job=endHTML&aid=$aid");

		refreshto("$FROMURL","<CENTER>[<A HREF='$admin_path&job=postnew&fid=$fid'>����������</A>] <span style='display:;'>[<A HREF='$admin_path&job=post_more&aid=$aid'>����������</A>]</span> [<A HREF='$admin_path&file=artic&job=listartic&fid=$fid'>���������б�</A>] [<A HREF='$Murl/bencandy.php?fid=$fid&aid=$aid' target=_blank>�鿴����</A>] [<A HREF='$admin_path&job=edit&aid=$aid'>�����޸�</A>]</CENTER>",60);
	}
	$MSG='�޸�����';
	$select_fid=$Guidedb->SelectIn("{$_pre}sort",0,$fid);

	get_admin_html('post');
}
elseif($job=='post_more')
{
	if($step=='post')
	{
		//�������
		query_reply($aid,'','');

		//���ɾ�̬
		make_article_html("$webdb[admin_url]/$admin_path&job=endHTML&aid=$aid");

		refreshto($FROMURL,"<CENTER>[<A HREF='$admin_path&job=postnew&fid=$fid'>����������</A>] [<A HREF='$admin_path&job=post_more&aid=$aid'>����������</A>] [<A HREF='$admin_path&file=artic&job=listartic&fid=$fid'>��������б�</A>] [<A HREF='$Murl/bencandy.php?fid=$fid&aid=$aid' target='_blank'>�鿴���</A>] [<A HREF='$admin_path&job=manage&aid=$aid'>�޸����</A>]</CENTER>",60);
	}
	$MSG='�������';
	unset($rsdb[content],$rsdb[subhead]);
	get_admin_html('post');
}
elseif($job=='edit_more')
{
	if($step=='post')
	{
		//�޸�����
		query_reply($aid,$rid,'edit');

		//���ɾ�̬
		make_article_html("$webdb[admin_url]/$admin_path&job=endHTML&aid=$aid");

		refreshto("$FROMURL","<CENTER>[<A HREF='$admin_path&job=postnew&fid=$fid'>����������</A>] [<A HREF='$admin_path&job=post_more&aid=$aid'>����������</A>] [<A HREF='$admin_path&file=artic&job=listartic&fid=$fid'>��������б�</A>] [<A HREF='$Murl/bencandy.php?fid=$fid&aid=$aid' target=_blank>�鿴���</A>] [<A HREF='$admin_path&job=edit_more&aid=$aid&rid=$rid'>�޸����</A>]</CENTER>",60);
	}
	$MSG='�޸����';
	get_admin_html('post');
}

?>