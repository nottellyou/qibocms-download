<?php
function fiddb_article($fiddb,$rows=8,$leng=50,$order='list'){
	global $db,$_pre,$Fid_db,$webdb;
	if(!$webdb[viewNoPassArticle]){
		$SQL_yz=' AND yz=1 ';
	}
	$detail=explode(",",$fiddb);
	foreach($detail AS $key=>$fid){
		if(!$fid){
			continue;
		}
		$SQL="WHERE fid='$fid' $SQL_yz ORDER BY $order DESC LIMIT $rows";
		$which='*';
		$rs=list_article($SQL,$which,$leng);
		//�������Ŀ���ܻ�ȡ�����,����ȡ����������Ŀ�����
		if(!$rs)
		{
			$array_fid=Get_SonFid("{$_pre}sort",$fid);
			if($array_fid)
			{
				$SQL="WHERE fid IN (".implode(',',$array_fid).") $SQL_yz ORDER BY $order DESC LIMIT $rows";
				$rs=list_article($SQL,$which,$leng);
			}
		}

		//Ϊ��ȡ��Ŀ����
		if($Fid_db[name][$fid]){
			$listdb[$fid][name]=$Fid_db[name][$fid];
		}else{
			$rss=$db->get_one("SELECT name FROM {$_pre}sort WHERE fid='$fid' ");
			$listdb[$fid][name]=$rss[name];
		}
		
		$listdb[$fid][fid]=$fid;
		$listdb[$fid][article]=$rs;
	}

	//��������
	foreach( $detail AS $key=>$fid){

		//��Ҫ�Ǵ���ĳЩ��ɾ������Ŀ
		if(!$listdb[$fid][name])
		{
			unset($listdb[$fid]);
			continue;
		}

		$list_db[$fid][fid]=$fid;
		$list_db[$fid][name]=$listdb[$fid][name];
		$list_db[$fid][article]=$listdb[$fid][article];
	}
	unset($listdb);
	return $list_db;
}


function list_article($SQL,$which='*',$leng=40,$erp=''){
	global $db,$_pre;
	$query=$db->query("SELECT $which FROM {$_pre}article $SQL");
	while( $rs=$db->fetch_array($query) ){
		$rs[content]=@preg_replace('/<([^<]*)>/is',"",$rs[content]);	//��HTML������˵�
		$rs[content]=@preg_replace('/ |��|&nbsp;/is',"",$rs[content]);	//�ѿո���˵�
		//�������ж̱���,���Դ���ʾ������б�
		if($rs[smalltitle]){
			$title=$rs[smalltitle];
		}else{
			$title=$rs[title];
		}
		$rs[title]=get_word($rs[full_title]=$title,$leng);
		if($rs[titlecolor]||$rs[fonttype]){
			$titlecolor=$rs[titlecolor]?"color:$rs[titlecolor];":'';
			$font_weight=$rs[fonttype]==1?'font-weight:bold;':'';
			$rs[title]="<font style='$titlecolor$font_weight'>$rs[title]</font>";
		}
		$rs[posttime]=date("Y-m-d",$rs[full_posttime]=$rs[posttime]);
		if($rs[picurl]){
			$rs[picurl]=filtrate($rs[picurl]);
			$rs[picurl]=tempdir($rs[picurl]);
		}
		$listdb[]=$rs;
	}
	return $listdb;
}


function list_special($SQL,$which='*',$leng=40,$cleng=180){
	global $db,$_pre;
	$query=$db->query("SELECT $which FROM {$_pre}special $SQL");
	while( $rs=$db->fetch_array($query) ){
		$rs[content]=@preg_replace('/<([^<]*)>/is',"",$rs[content]);	//��HTML������˵�
		$rs[about]=get_word($rs[content],$cleng);
		//���ר���ж̱���,���Դ���ʾ��ר���б�
		$title=$rs[title];
		$rs[title]=get_word($rs[full_title]=$title,$leng);
		$rs[posttime]=date("Y-m-d",$rs[posttime]);
		if($rs[picurl]){
			$rs[picurl]=tempdir($rs[picurl]);
		}
		$listdb[]=$rs;
	}
	return $listdb;
}


function do_work($id,$job,$check=0){
	global $db,$_pre,$timestamp,$lfjid,$lfjdb,$webdb,$web_admin,$reason,$Fid_db;
	if(!$Fid_db){
		include(Mpath."data/all_fid.php");
	}
	if(!$lfjid){
		showerr("���ȵ�¼");
	}

	$rsdb=$db->get_one("SELECT A.*,B.admin FROM {$_pre}article A LEFT JOIN {$_pre}sort B ON A.fid=B.fid WHERE A.aid='$id' ");
	if($check==1){
		if(!$web_admin&&!in_array($lfjid,explode(",",$rsdb[admin]))){
			showerr("��ûȨ�޲�������:$rsdb[title]");
		}
	}
	if($job=="delete")
	{
		global $forcedel;
		delete_m_article($rsdb[aid],'',$forcedel);
		$array[title]="�㷢��ġ�{$rsdb[title]}����ɾ����";
	}
	elseif($job=="move"&&$rsdb[yz]!=2)
	{
		global $fid;
		if($fid){
			$rs=$db->get_one("SELECT name FROM {$_pre}sort WHERE fid='$fid'");
			$db->query("UPDATE {$_pre}article SET fid='$fid',fname='$rs[name]',lastfid='$rsdb[fid]' WHERE aid='$id' ");
			$db->query("UPDATE {$_pre}reply SET fid='$fid' WHERE aid='$id' ");
			$array[title]="�㷢��ġ�{$rsdb[title]}����ת����Ŀ��";
		}
	}
	elseif($job=="color")
	{
		global $Color;
		$db->query("UPDATE {$_pre}article SET titlecolor='$Color' WHERE aid='$id' ");
		$array[title]="�㷢��ġ�{$rsdb[title]}�������ñ�����ɫ��";
	}
	elseif($job=="yz"&&$rsdb[yz]!=2&&$rsdb[yz]!=1)
	{
		$db->query("UPDATE {$_pre}article SET yz='1',yzer='$lfjdb[username]',yztime='$timestamp' WHERE aid='$id' ");
		//�Ƹ�����
		Give_article_money($rsdb[uid],'yz',$rsdb);
		$array[title]="�㷢��ġ�{$rsdb[title]}��ͨ�������";
	}
	elseif($job=="unyz"&&$rsdb[yz]!=2&&$rsdb[yz]!=0)
	{
		$db->query("UPDATE {$_pre}article SET yz='0',yzer='$lfjdb[username]',yztime='$timestamp' WHERE aid='$id' ");
		//�Ƹ�����
		Give_article_money($rsdb[uid],'unyz',$rsdb);
		$array[title]="�㷢��ġ�{$rsdb[title]}����ȡ�������";
	}
	elseif($job=="com"&&!$rsdb[levels])
	{
		global $levels;
		if($levels<1){
			$levels=1;
		}
		$db->query("UPDATE {$_pre}article SET levels='$levels',levelstime='$timestamp' WHERE aid='$id' ");
		//�Ƹ�����
		Give_article_money($rsdb[uid],'com',$rsdb);
		$array[title]="�㷢��ġ�{$rsdb[title]}�����Ƽ���";
	}
	elseif($job=="uncom"&&$rsdb[levels])
	{
		$db->query("UPDATE {$_pre}article SET levels='0',levelstime='0' WHERE aid='$id' ");
		//�Ƹ�����
		Give_article_money($rsdb[uid],'uncom',$rsdb);
		$array[title]="�㷢��ġ�{$rsdb[title]}����ȡ���Ƽ���";
	}
	elseif($job=="top")
	{
		global $toptime;
		$times=$timestamp+$toptime;
		$db->query("UPDATE {$_pre}article SET list='$times' WHERE aid='$id'");
		$array[title]="�㷢��ġ�{$rsdb[title]}�����ö���";
	}
	elseif($job=="untop")
	{
		$db->query("UPDATE {$_pre}article SET list=posttime WHERE aid='$id' ");
		$array[title]="�㷢��ġ�{$rsdb[title]}����ȡ���ö���";
	}
	elseif($job=="front")
	{
		global $topid;
		if($topid)
		{
			$rs=$db->get_one("SELECT list FROM {$_pre}article WHERE aid='$topid' ");
			$list=$rs["list"]+5;
			$db->query("UPDATE {$_pre}article SET list='$list' WHERE aid='$id' ");
		}
		else
		{
			$db->query("UPDATE {$_pre}article SET list='$timestamp' WHERE aid='$id' ");
		}
		$array[title]="�㷢��ġ�{$rsdb[title]}������ǰ��ʾ��";
	}
	elseif($job=="bottom")
	{
		global $bottomid;
		if($bottomid)
		{
			$rs=$db->get_one("SELECT list FROM {$_pre}article WHERE aid='$bottomid' ");
			$list=$rs["list"]-5;
			$db->query("UPDATE {$_pre}article SET list='$list' WHERE aid='$id' ");
		}
		else
		{
			$db->query("UPDATE {$_pre}article SET list='0' WHERE aid='$id' ");
		}
		$array[title]="�㷢��ġ�{$rsdb[title]}����������";
	}
	elseif($job=='return')
	{
		if($rsdb[yz]==2){
			$db->query("UPDATE {$_pre}article SET yz=1 WHERE aid='$id' ");
			$array[title]="�㷢��ġ�{$rsdb[title]}���ӻ���վ��ԭ��";
		}
	}
	elseif($job=='special')
	{
		global $spid;
		if(!$spid){
			showerr("��ѡ��һ��ר��");
		}
		$rssp=$db->get_one(" SELECT * FROM {$_pre}special WHERE id='$spid' ");
		$detail=explode(",",$rssp[aids]);
		if( !in_array($id,$detail) ){
			if($rssp[aids]){
				$rssp[aids]="$id,$rssp[aids]";
			}else{
				$rssp[aids]="$id";
			}
			$db->query("UPDATE `{$_pre}special` SET `aids`='$rssp[aids]' WHERE id='$spid'");
		}
		$array[title]="�㷢��ġ�{$rsdb[title]}��������ר����";
	}
	elseif($job=='fusort'){
		global $fid;
		if(!$fid){
			showerr("��ѡ��һ������Ŀ");
		}
		if(!$db->get_one("SELECT * FROM {$_pre}fu_article WHERE fid='$fid' AND aid='$id'")){
			$db->query("INSERT INTO {$_pre}fu_article SET fid='$fid',aid='$id'");
		}
		$array[title]="�㷢��ġ�{$rsdb[title]}�������ø���Ŀ��";
	}
	//����Ϣ֪ͨ
	if($reason){
		$array[fromer]=$lfjdb[username];
		$array[fromuid]=$lfjdb[uid];
		$array[touid]=$rsdb[uid];
		$array[content]=$reason;
		pm_msgbox($array);
	}

	//ɾ�������ļ�
	delete_m_cache_file($rsdb[fid],$rsdb[aid]);
}


/*���ݴ���*/

function query_reply($aid,$rid,$type=''){
	global $ExplodePage,$PageNum,$postdb,$fid,$lfjdb,$rsdb,$db,$_pre,$post_db,$i_id,$uid,$web_admin,$groupdb,$lfjuid,$timestamp;
	
	//ר��,�ļ�����
	if($type=='edit'||($type=='postnew'&&$postdb[special])){
		$query = $db->query("SELECT * FROM {$_pre}special LIMIT 1000");
		while($rs = $db->fetch_array($query)){
			$detail=explode(",",$rs[aids]);
			if(in_array($rs[id],$postdb[special])){
				//��ֹ˽���ύ����
				if($rs[allowpost]&&!$web_admin){
					if( !in_array($groupdb['gid'],explode(",",$rs[allowpost])) ){
						if(!$lfjuid||$rs[uid]!=$lfjuid ){
							continue;
						}				
					}
				}
				if(!in_array($aid,$detail)){
					if($detail[0]==''){unset($detail[0]);}
					$detail[]=$aid;
					$string=implode(",",$detail);
					$db->query("UPDATE {$_pre}special SET aids='$string' WHERE id='$rs[id]'");
				}
			}else{
				if(in_array($aid,$detail)){
					foreach( $detail AS $key=>$value){
						if($value==$aid){
							unset($detail[$key]);
						}
					}
					$string=implode(",",$detail);
					$db->query("UPDATE {$_pre}special SET aids='$string' WHERE id='$rs[id]'");
				}
			}
		}
	}

	if($ExplodePage==1&&$PageNum>0)
	{
		$contentDB=explode_content(stripslashes($postdb[content]),$PageNum);
	}
	elseif($ExplodePage!=1&&strstr($postdb[content],'[-page-]'))
	{
		$contentDB=explode("[-page-]",stripslashes($postdb[content]));
		foreach( $contentDB AS $key=>$value)
		{
			$contentDB[$key]=addslashes($value);
		}
	}
	else
	{
		$contentDB[]=$postdb[content];
	}
	
	foreach( $contentDB AS $key=>$content)
	{
		$j++;
		if($j==1&&($type=='postnew'||$type=='edit'))
		{
			if($type=='postnew')
			{
				$db->query("INSERT INTO `{$_pre}reply` ( `aid` ,`fid` ,`uid` , `content` ,`subhead`,`topic`) VALUES ( '$aid', '$fid','$lfjdb[uid]', '$content','$postdb[subhead]','1')");
			}
			elseif($type=='edit')
			{
				$db->query("UPDATE `{$_pre}reply` SET fid='$fid',content='$content',subhead='$postdb[subhead]' WHERE rid='$rid'");
			}
		}
		else
		{
			$db->query("INSERT INTO `{$_pre}reply` ( `aid` ,  `fid` ,`uid` ,  `content` ,`subhead`,`topic`) VALUES ( '$aid','$fid','$uid','$content','$postdb[subhead]','0')");
		}
	}
	@extract($db->get_one("SELECT COUNT(*) AS NUM FROM `{$_pre}reply` WHERE `aid`='$aid'"));
	$db->query("UPDATE `{$_pre}article` SET pages='$NUM' WHERE aid='$aid'");
	
	
	//����жϸ���Ϣ��Ҫ������Щ�ֶε�����
	global $field_db;
	foreach( $field_db AS $key=>$value){
		isset($postdb[$key]) && $sqldb[]="`{$key}`='{$postdb[$key]}'";
	}
	$sql=implode(",",$sqldb);
	$sql && $db->query("UPDATE `{$_pre}article` SET $sql WHERE aid='$aid'");
}


/**
*�����Զ�ȡ����
**/
function explode_content($content,$length){
	$i=0;
	$k=1;
	$j=0;
	$wn=0;
	$s='';
	$e=1;
	$yh=0;
	while($k){
		$d=$content[$i];
		if($d!==''){
			if(ord($d)>127){
				$j++;
				$num=2;
				$i++;
			}else{
				$num=1;
			}
			$j++;
		}else{
			if($s){
				$listdb[]=addslashes($s);
			}
			$k=0;
		}
		$v1=$j-$num;
		$w=substr($content,$v1,$num);
		if($w!==''){
			
			if($w=='<'){
				$e=0;
			}
			if(!$e&&$w=='"'){
				$yh++;
			}
			if($e&&$w!=' '&&$w!='��'){
				$wn++;
			}
			if($w=='>'&&$yh%2==0){
				$e=1;
			}
			$s.=$w;
		}
		if($wn>=$length&&$e){
			$listdb[]=addslashes($s);
			$s='';
			$wn=0;
		}
		$i++;
	}
	return $listdb;
}

//�ɼ��ⲿͼƬ
function get_outpic($str,$fid=0,$getpic=1){
	global $webdb,$lfjuid,$_pre;
	if(!$getpic){
		return $str;
	}
	preg_match_all("/http:\/\/([^ '\"<>]+)\.(gif|jpg|png)/is",$str,$array);
	$filedb=$array[0];
	foreach( $filedb AS $key=>$value){
		if( strstr($value,$webdb[www_url]) ){
			continue;
		}
		$listdb["$value"]=$value;
	}
	unset($filedb);
	foreach( $listdb AS $key=>$value){
		$filedb[]=$value;
		$name=$lfjuid.'_'.rands(5)."__".basename($value);
		if(!is_dir(ROOT_PATH."$webdb[updir]/$_pre/$fid")){
			makepath(ROOT_PATH."$webdb[updir]/$_pre/$fid");
		}
		$ck=0;
		if( @copy($value,ROOT_PATH."$webdb[updir]/$_pre/$fid/$name") ){
			$ck=1;
		}elseif($filestr=file_get_contents($value)){
			$ck=1;
			write_file(ROOT_PATH."$webdb[updir]/$_pre/$fid/$name",$filestr);
		}
	
		/*��ˮӡ*/
		if($ck&&$webdb[is_waterimg]&&$webdb[if_gdimg])
		{
			include_once(ROOT_PATH."inc/waterimage.php");
			$uploadfile=ROOT_PATH."$webdb[updir]/$_pre/$fid/$name";
			imageWaterMark($uploadfile,$webdb[waterpos],ROOT_PATH.$webdb[waterimg]);
		}

		if($ck){
			$str=str_replace("$value","$webdb[www_url]/$webdb[updir]/$_pre/$fid/$name",$str);
		}
	}
	return $str;
}

function article_more_set_ckecked($type='postnew'){
	global $postdb,$rsdb,$timestamp,$web_admin,$groupdb;

	foreach( $postdb[tpl] AS $key=>$value){
		if($value&&!eregi("(.htm|.html)$",$value)){
			showerr("ģ���׺��ֻ����htm��html��β�ſ���,��ģ��������:$value");
		}
	}
	$postdb[template]	=	@serialize($postdb[tpl]);
	$postdb[allowview]	=	@implode(",",$postdb[allowview]);
	$postdb[allowdown]	=	@implode(",",$postdb[allowdown]);

	$postdb[posttime]	&&	$postdb[posttime]=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$postdb[posttime]);
	$postdb[begintime]	&&	$postdb[begintime]=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$postdb[begintime]);
	$postdb[endtime]	&&	$postdb[endtime]=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$postdb[endtime]);

	$postdb[update_time]	&&	$postdb[update_time]=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$postdb[update_time]);


	if(!$web_admin&&!$groupdb[SetTileColor]){
		if($type=='postnew'){
			$postdb[titlecolor]=$postdb[fonttype]='';
		}else{
			$postdb[titlecolor]=$rsdb[titlecolor];
			$postdb[fonttype]=$rsdb[fonttype];
		}
	}
	if(!$web_admin&&!$groupdb[SetHtmlName]){
		$postdb[htmlname]='';
	}

	if(!$web_admin){
		$postdb[addcopyfrom]='';
	}

	if(!$web_admin&&!$groupdb[AddArticleKeywordNum]){
		$postdb[addkeyword]='';
	}
	if(!$web_admin&&!$groupdb[SetArticleTpl]&&!$groupdb[SelectArticleTpl]){
		if($type=='postnew'){
			$postdb[template]='';
		}else{
			$postdb[template]=$rsdb[template];
		}
	}
	if(!$web_admin&&!$groupdb[SelectArticleStyle]){
		if($type=='postnew'){
			$postdb[style]='';
		}else{
			$postdb[style]=$rsdb[style];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticlePosttime]){
		if($type=='postnew'){
			$postdb[posttime]=$timestamp;
		}else{
			$postdb[posttime]=$rsdb[posttime];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleViewtime]){
		if($type=='postnew'){
			$postdb[begintime]=$postdb[endtime]='';
		}else{
			$postdb[begintime]=$rsdb[begintime];
			$postdb[endtime]=$rsdb[endtime];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleHitNum]){
		if($type=='postnew'){
			$postdb[hits]='';
		}else{
			$postdb[hits]=$rsdb[hits];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticlePassword]){
		if($type=='postnew'){
			$postdb[passwd]='';
		}else{
			$postdb[passwd]=$rsdb[passwd];
		}
	}
	if(!$web_admin&&!$groupdb[SetSellArticle]){
		if($type=='postnew'){
			$postdb[money]='';
		}else{
			$postdb[money]=$rsdb[money];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleDownGroup]){
		if($type=='postnew'){
			$postdb[allowdown]='';
		}else{
			$postdb[allowdown]=$rsdb[allowdown];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleViewGroup]){
		if($type=='postnew'){
			$postdb[allowview]='';
		}else{
			$postdb[allowview]=$rsdb[allowview];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleJumpurl]){
		if($type=='postnew'){
			$postdb[jumpurl]='';
		}else{
			$postdb[jumpurl]=$rsdb[jumpurl];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleIframeurl]){
		if($type=='postnew'){
			$postdb[iframeurl]='';
		}else{
			$postdb[iframeurl]=$rsdb[iframeurl];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleDescription]){
		if($type=='postnew'){
			$postdb[description]='';
		}else{
			$postdb[description]=$rsdb[description];
		}
	}
	if(!$web_admin&&!$groupdb[PassContribute]){
		if($type=='postnew'){
			$postdb[yz]='';
		}else{
			$postdb[yz]=$rsdb[yz];
		}
	}
	if(!$web_admin&&!$groupdb[SetArticleTopCom]){
		if($type=='postnew'){
			$postdb[top]=$postdb[levels]='';
		}else{
			$postdb[top]=$rsdb[top];
			$postdb[levels]=$rsdb[levels];
		}
	}
}

//��ƪ�����̬��ҳ����
function make_article_html($comebackurl='/',$type='',$articleDB=''){
	global $db,$postdb,$_pre,$aid,$rid,$fidDB,$webdb,$fid,$webdb,$showHtml_Type;
	$id=$aid;
	if($webdb[Html_Type]!=1)
	{
		return ;
	}
	
	if($articleDB){
		$id=$aid=$articleDB[aid];
		$postdb=$articleDB;
		$fid=$articleDB[fid];
		$fidDB=$db->get_one("SELECT * FROM `{$_pre}sort` WHERE fid='$fid' ");
	}
	if($type=='del')
	{
		if($fidDB[bencandy_html])
		{
			$filename_b=$fidDB[bencandy_html];
		}
		else
		{
			$filename_b=$webdb[Info_html_show];
		}
		$dirid=floor($aid/1000);
		if(strstr($filename_b,'$time_')){
			$time_Y=date("Y",$postdb[posttime]);
			$time_y=date("y",$postdb[posttime]);
			$time_m=date("m",$postdb[posttime]);
			$time_d=date("d",$postdb[posttime]);
			$time_W=date("W",$postdb[posttime]);
			$time_H=date("H",$postdb[posttime]);
			$time_i=date("i",$postdb[posttime]);
			$time_s=date("s",$postdb[posttime]);
		}
		if($type=='del'){
			$page=1;
			while($page){
				eval("\$showurl=\"$filename_b\";");
				if( is_file(Mpath."$showurl") ){
					unlink(Mpath."$showurl");
					$page++;
				}else{
					$page=0;
				}
			}
		}
	}
	echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$comebackurl'>";
	exit;
	/*
	else
	{
		extract($db->get_one("SELECT COUNT(*) AS PageNum FROM `{$_pre}reply` WHERE aid='$aid' "));
		for($page=1;$page<=$PageNum;$page++)
		{
			$ids.="$aid-$page,";
		}
	}

	$cacheid=time();

	//�޸��뷢���ҳ���ʱ,�б�ҳ�����봦��
	if($type=='reply'){
		$showJumpurl=$comebackurl;
	}else{
		$showJumpurl="$webdb[www_url]/do/list_html.php?fid=$fid&cacheid=$cacheid";
	}

	if(!is_dir('../cache/htm_cache')){
		mkdir('../cache/htm_cache');
		chmod('../cache/htm_cache',0777);
	}
	write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","<?php\r\n\$JumpUrl='$showJumpurl';\$fiddb[]='$fidDB[fid]';\$iddb[]='$ids';");

	if($type!='reply'){
		//ֻ���������㸸����Ŀ
		$fupid = '';
		if($fidDB[fup]){
			$fupid=",$fidDB[fup]";
			extract($db->get_one("SELECT fup AS FUP FROM {$_pre}sort WHERE fid='$fidDB[fup]'"));
			$FUP && $fupid.=",$FUP";
		}		
		write_file(Mpath."cache/htm_cache/{$cacheid}_makelist.php","<?php\r\n\$allfid='$fidDB[fid]$fupid';\$JumpUrl='$comebackurl';");
	}
	header("location:$webdb[www_url]/do/bencandy_html.php?fid=$fid&cacheid=$cacheid");
	exit;
	*/
}

//��ƪ�����̬��ҳ����
function make_more_article_html($comebackurl='/',$type='',$aidDB=''){
	global $db,$_pre,$webdb,$webdb,$showHtml_Type,$Murl;
	if($webdb[Html_Type]!=1||$aidDB=='')
	{
		return ;
	}
	$string=implode(",",$aidDB);
	$query = $db->query("SELECT A.*,B.bencandy_html,B.list_html FROM {$_pre}article A LEFT JOIN {$_pre}sort B ON A.fid=B.fid WHERE A.aid IN ($string)");
	while($rs = $db->fetch_array($query)){

		$PageNum=$rs[pages]?$rs[pages]:1;
		$aid=$id=$rs[aid];
		$fid=$rs[fid];

		//ɾ�����ǰҪ�Ѿ�̬ҳ��ɾ��
		if($type=='del_0')
		{
			if($rs[bencandy_html])
			{
				$filename_b=$rs[bencandy_html];
			}
			else
			{
				$filename_b=$webdb[Info_html_show];
			}
			$dirid=floor($aid/1000);
			if(strstr($filename_b,'$time_')){
				$time_Y=date("Y",$rs[posttime]);
				$time_y=date("y",$rs[posttime]);
				$time_m=date("m",$rs[posttime]);
				$time_d=date("d",$rs[posttime]);
				$time_W=date("W",$rs[posttime]);
				$time_H=date("H",$rs[posttime]);
				$time_i=date("i",$rs[posttime]);
				$time_s=date("s",$rs[posttime]);
			}
			if($type=='del_0'){
				$page=1;
				while($page){
					eval("\$showurl=\"$filename_b\";");
					if( is_file(Mpath."$showurl") ){
						unlink(Mpath."$showurl");
						$page++;
					}else{
						$page=0;
					}
				}
			}
		}
		else
		{
			$ids='';
			for($page=1;$page<=$PageNum;$page++)
			{
				$ids.="$aid-$page,";
			}
			$showcode.="\$fiddb[]='$rs[fid]';\$iddb[]='$ids';\r\n";
		}
			
		$f_db[$fid]=$fid;
		$star_fid || $star_fid=$fid;
	}
	
	//ɾ�������Ĳ���
	if($type=='del_1')
	{
		header("location:$comebackurl");
		//global $Jump_url;
		//header("location:$Jump_url");
		exit;
	}
	else
	{
		if(!is_dir(Mpath.'cache/htm_cache')){
			mkdir(Mpath.'cache/htm_cache');
			chmod(Mpath.'cache/htm_cache',0777);
		}
		$cacheid=time();

		//�޸��뷢���ҳ���ʱ,�б�ҳ�����봦��
		if($type=='reply'){
			$showJumpurl=$comebackurl;
		}else{
			$showJumpurl="$Murl/list_html.php?fid=$star_fid&cacheid=$cacheid";
			$allfid=implode(",",$f_db);
			write_file(Mpath."cache/htm_cache/{$cacheid}_makelist.php","<?php\r\n\$allfid='$allfid';\$JumpUrl='$comebackurl';");
		}
		write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","<?php\r\n\$JumpUrl='$showJumpurl';$showcode");

		//ɾ�����ǰ������ת
		if($type=='del_0')
		{
			global $Jump_url;
			$Jump_url="$Murl/bencandy_html.php?fid=$star_fid&cacheid=$cacheid";
		}
		else
		{
			header("location:$Murl/bencandy_html.php?fid=$star_fid&cacheid=$cacheid");
			exit;
		}
	}
}

/*���û�ѡ�񷢱��������Ŀ�б�*/
function list_post_allsort($fid=0){
	global $db,$_pre,$sortdb,$lfjid,$groupdb,$web_admin,$lfjuid,$allowpost,$Fid_db;
	$query=$db->query("SELECT * FROM {$_pre}sort WHERE fup='$fid' ORDER BY list DESC");
	while( $rs=$db->fetch_array($query) ){
		$icon="";
		for($i=1;$i<$rs['class'];$i++){
			$icon.="&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if($icon){
			$icon=substr($icon,0,-24);
			$icon.="--";
		}
		$rs[icon]=$icon;
	
		$rs[post]=$rs[NUM]=$rs[do_art]='';
		$detail_admin=@explode(",",$rs[admin]);
		$detail_allowpost=@explode(",",$rs[allowpost]);
		if(!$rs[type]&&( $web_admin||($lfjid&&@in_array($lfjid,$detail_admin))||@in_array($groupdb['gid'],$detail_allowpost) ))
		{
			$_rs=$db->get_one("SELECT COUNT(*) AS NUM FROM {$_pre}article WHERE fid='$rs[fid]' AND uid='$lfjuid'");
			if($_rs[NUM]&&$lfjid){
				$rs[NUM]="( <b>{$_rs[NUM]}</b> )";
				$rs[do_art]="<A HREF='myarticle.php?job=myarticle&fid=$rs[fid]' class='manage_article'>����</A>";
			}
			$rs[post]="<A HREF='?job=postnew&fid=$rs[fid]' class='post_article'>����</A>";
			$allowpost++;
		}

		$sortdb[]=$rs;
		list_post_allsort($rs[fid]);
	}
}




/*�·������*/
function post_new(){
	global $db,$_pre,$Fid_db,$postdb,$fid,$fidDB,$lfjuid,$lfjdb,$webdb,$timestamp,$FROMURL,$aid,$votesdb,$vote_db,$groupdb,$web_admin,$fu_fiddb;

	$postdb['list']=$postdb[top]?$timestamp*1.3:$timestamp;

	if(!$postdb[posttime])
	{
		$postdb[posttime]=$timestamp;
	}
	$db->query("
	INSERT INTO `{$_pre}article` 
	( `title`, `smalltitle`,  `fid`,`fname`, `hits`, `pages`, `posttime`, `list`, `uid`, `username`, `author`, `copyfrom`, `copyfromurl`, `titlecolor`, `fonttype`, `picurl`, `ispic`, `yz`, `yzer`, `yztime`, `keywords`, `jumpurl`, `iframeurl`, `style`, `template`, `target`,`ip`, `lastfid`, `money`, `passwd`, `editer`, `edittime`, `begintime`, `endtime`, `description`, `levels`,allowdown,allowview,htmlname,forbidcomment,softurl,update_time)
	VALUES	('$postdb[title]','$postdb[smalltitle]','$fid','$fidDB[name]','$postdb[hits]','1','$postdb[posttime]','$postdb[list]','$lfjdb[uid]','$lfjdb[username]','$postdb[author]','$postdb[copyfrom]','$postdb[copyfromurl]','$postdb[titlecolor]','$postdb[fonttype]','$postdb[picurl]','$postdb[ispic]','$postdb[yz]','$postdb[yzer]','$postdb[yztime]','$postdb[keywords]','$postdb[jumpurl]','$postdb[iframeurl]','$postdb[style]','$postdb[template]','$postdb[target]','$onlineip','0','$postdb[money]','$postdb[passwd]','$postdb[editer]','$postdb[edittime]','$postdb[begintime]','$postdb[endtime]','$postdb[description]','$postdb[levels]','$postdb[allowdown]','$postdb[allowview]','$postdb[htmlname]','$postdb[forbidcomment]','$postdb[softurl]','$postdb[update_time]')
	");
	
	if($postdb[htmlname]){
		//�Զ�������ҳ�ļ���
		Make_htmltype();
	}

	$II=1;
	$aid=$db->insert_id();
	
	//����Ŀ����
	query_fu_sort($fu_fiddb,$aid);

	//�������
	query_reply($aid,'','postnew');

	//�Ƹ�����
	$array = array('title'=>$postdb[title],'fid'=>$fid,'aid'=>$aid);
	if($postdb[yz]){
		Give_article_money($lfjuid,'yz',$array);
	}
	if($postdb[com]){
		Give_article_money($lfjuid,'com',$array);
	}

	//��ӹؼ���
	keyword_add($aid,$postdb[keywords],$lfjdb[uid]);

	//ɾ�������ļ�
	delete_m_cache_file($fid,$aid);
	
	//��ʱ����
	corntab_post('DE');
	corntab_post('EN',$aid);	
}


/*�޸����*/

function post_edit(){
	global $db,$_pre,$postdb,$fid,$fidDB,$Fid_db,$lfjuid,$rsdb,$lfjdb,$webdb,$timestamp,$aid,$FROMURL,$groupdb,$web_admin,$fu_fiddb;

	if( $rsdb[levels]&&$postdb[levels] )
	{
		$postdb[levels]=$rsdb[levels];	//������������2,3,4...�Է�����
	}
	if($postdb[top])
	{
		$postdb['list']=($rsdb['list']>$timestamp)?$rsdb['list']:$timestamp*1.3;
	}
	else
	{
		$postdb['list']=($rsdb['list']>$timestamp)?$timestamp:$rsdb['list'];
	}

	if(!$web_admin&&$groupdb[EditPassPower]==1){
		$postdb[yz]='';
	}
	$db->query("UPDATE `{$_pre}article` SET title='$postdb[title]',smalltitle='$postdb[smalltitle]',fid='$fid',fname='$fidDB[name]',hits='$postdb[hits]',posttime='$postdb[posttime]',list='$postdb[list]',author='$postdb[author]',copyfrom='$postdb[copyfrom]',copyfromurl='$postdb[copyfromurl]',titlecolor='$postdb[titlecolor]',fonttype='$postdb[fonttype]',picurl='$postdb[picurl]',ispic='$postdb[ispic]',yz='$postdb[yz]',levels='$postdb[levels]',keywords='$postdb[keywords]',jumpurl='$postdb[jumpurl]',iframeurl='$postdb[iframeurl]',style='$postdb[style]',template='$postdb[template]',target='$postdb[target]',money='$postdb[money]',passwd='$postdb[passwd]',editer='$userdb[username]',edittime='$timestamp',begintime='$postdb[begintime]',endtime='$postdb[endtime]',description='$postdb[description]',allowview='$postdb[allowview]',allowdown='$postdb[allowdown]',htmlname='$postdb[htmlname]',forbidcomment='$postdb[forbidcomment]',softurl='$postdb[softurl]',update_time='$postdb[update_time]' WHERE aid='$aid' ");
	
	if($postdb[htmlname]!=$rsdb[htmlname]){
		//�Զ�������ҳ�ļ���
		Make_htmltype();
	}
	
	//����Ŀ����
	query_fu_sort($fu_fiddb,$aid);

	//�޸�����
	query_reply($aid,$rsdb[rid],'edit');

	//�Ƹ�����
	if(!$postdb[yz]&&$rsdb[yz]){
		Give_article_money($lfjuid,'unyz',$rsdb);
	}
	if(!$postdb[levels]&&$rsdb[levels]){
		Give_article_money($lfjuid,'uncom',$rsdb);
	}

	//��ӹؼ���
	if($rsdb[keywords]!=$postdb[keywords]){
		keyword_del($aid,$rsdb[keywords]);
		keyword_add($aid,$postdb[keywords],$lfjdb[uid]);
	}



	//ɾ�������ļ�
	delete_m_cache_file($fid,$aid);
	
	corntab_post('DE');
	corntab_post('EN',$aid);  //��ʱ����
}

//���û�����������Ƽ�����Ľ���yz,unyz,com,uncom,del

function Give_article_money($uid,$type='',$rsdb){
	global $db,$_pre,$webdb,$Mdomain;
	if($type=='yz'){
		$money	=	$webdb[postArticleMoney];
		$msg = '�������ͨ����˽���';
	}elseif($type=='unyz'){
		$money	=	-$webdb[postArticleMoney];
		$msg = '�������ȡ����˿۷�';
	}elseif($type=='com'){
		$money	=	$webdb[comArticleMoney];
		$msg = '������Ƽ�����';
	}elseif($type=='uncom'){
		$money	=	-$webdb[comArticleMoney];
		$msg = '�����ȡ���Ƽ��۷�';
	}
	
	if($type=='del'){
		$money	=	$webdb[deleteArticleMoney];
		$msg = '�����ɾ���۷�:'.$rsdb[title];
	}else{
		$msg .= "<A HREF='$Mdomain/bencandy.php?fid=$rsdb[fid]&aid=$rsdb[aid]' target=_blank>".get_word($rsdb[title],30)."</A>";
	}
	if(!$money||!$uid){
		return ;
	}
	add_user($uid,$money,$msg);
}

//��ӹؼ���
function keyword_add($aid,$keyword,$uid=0){
	global $db,$_pre;
	$detail=explode(" ",$keyword);
	foreach( $detail AS $key=>$value){
		if($value){
			$_rs=$db->get_one("SELECT * FROM `{$_pre}keyword` WHERE keywords='$value'");
			$id=$_rs[id];
			if(!$id){
				$db->query("INSERT INTO `{$_pre}keyword` ( `keywords`,`num`,`ifhide`,`uid` ) VALUES ('$value',1,1,'$uid' )");
				$id=$db->insert_id();
			}else{
				$db->query("UPDATE `{$_pre}keyword` SET num=num+1 WHERE `keywords`='$value'");
			}
			$db->query("INSERT INTO `{$_pre}keywordid` ( `id`,`aid` ) VALUES ('$id','$aid')");
		}
	}
}

//ɾ���ؼ���
function keyword_del($aid,$keyword){
	global $db,$_pre;
	if(!$keyword){
		return ;
	}
	$detail2=explode(" ",$keyword);
	foreach( $detail2 AS $key=>$value){
		if($value){
			$db->query("UPDATE `{$_pre}keyword` SET num=num-1 WHERE `keywords`='$value'");
			$_rs=$db->get_one("SELECT * FROM `{$_pre}keyword` WHERE `keywords`='$value'");
			$id=$_rs[id];
			$db->query("DELETE FROM `{$_pre}keywordid` WHERE `id`='$id' AND aid='$aid'");		
		}
	}
}

//�ؼ��ָ�ʽ��
function keyword_ck($keyword,$title){
	global $SPword;
	if($title){
		require_once(ROOT_PATH."inc/splitword.php");
		$de=splitword($title);
		$detail=explode(" ",$de);
		foreach( $detail AS $key=>$value){
			//С��3���ַ���.����Ϊ�ؼ���
			if(strlen($value)<3){
				continue;
			}
			$keyword.=" $value";
		}
	}
	if($keyword){
		$keyword=str_replace("��"," ",$keyword);
		$keyword=str_replace(","," ",$keyword);
		$keyword=str_replace("��"," ",$keyword);
		$keyword=str_replace("��"," ",$keyword);
		$detail=explode(" ",$keyword);
		foreach( $detail AS $key=>$value){
			//����3���ֽڵ�,����Ϊ�ؼ���,һ�������൱�������ֽ�
			if(strlen($value)>2){
				 $array[$value]=$value;
			}
		}
		$keyword=implode(" ",$array);
		return $keyword;
	}
}

//����Ŀ����
function query_fu_sort($fu_fiddb,$aid){
	global $db,$_pre,$lfjid,$web_admin,$groupdb;
	if($fu_fiddb){
		$db->query("DELETE FROM `{$_pre}fu_article` WHERE aid='$aid'");
		foreach($fu_fiddb AS $key=>$value){
			$rs=$db->get_one("SELECT * FROM `{$_pre}fu_sort` WHERE fid='$value'");
			if(!$web_admin&&$rs[allowpost]){
				if( !in_array($groupdb[gid],explode(",",$rs[allowpost])) ){
					if(!$lfjid||!in_array($lfjid,explode(",",$rs[admin]))){
						continue;
					}
				}
			}
			$db->query("INSERT INTO `{$_pre}fu_article` (`fid`,`aid`) VALUES ('$value','$aid')");
		}
	}
}


//�б������,����,�Ƽ�,�����
function listpage_title($fid,$type,$rows,$leng,$id,$keyword){
	global $_pre,$webdb,$db,$Fid_db,$Mdomain;
	if( !ereg("^(hot|com|new|lastview|like|pic)$",$type) ){
		return ;
	}

	$rows>0 || $rows=7;
	$leng>0 || $leng=60;
	$fid=intval($fid);

	if($fid)
	{		
		$F[]=" fid=$fid ";
		foreach((array)$Fid_db[$fid] AS $key=>$value){
			$F[]=" fid=$key ";
		}
		$SQL=" (".implode("OR",$F).") ";
	}
	else
	{
		$SQL=" 1 ";
	}

	if($type=='com')
	{
		$SQL.=" AND levels=1 ";
		$ORDER=' list ';
	}
	elseif($type=='pic')
	{
		$SQL.=" AND ispic=1 ";
		$ORDER=' list ';
	}
	elseif($type=='hot')
	{
		$ORDER=' hits ';
	}
	elseif($type=='new')
	{
		$ORDER=' list ';
	}
	elseif($type=='lastview')
	{
		$ORDER=' lastview ';
	}
	elseif($type=='like')
	{
		
		$SQL.=" AND aid!='$id' ";

		if(!$keyword)
		{
			extract($db->get_one("SELECT keywords AS keyword FROM {$_pre}article WHERE aid='$id'"));
		}

		if($keyword){
			$detail=explode(" ",$keyword);
			unset($detail2,$ids);
			foreach( $detail AS $key=>$value){
				$value && $detail2[]=" B.keywords='$value' ";
			}
			$str=implode(" OR ",$detail2);
			if($str){
				unset($ids);
				$query = $db->query("SELECT A.aid FROM {$_pre}keywordid A LEFT JOIN {$_pre}keyword B ON A.id=B.id WHERE $str");
				while($rs = $db->fetch_array($query)){
					$ids[]=$rs[aid];
				}
				if($ids){
					$SQL.=" AND aid IN (".implode(",",$ids).") ";
				}else{
					$SQL.=" AND 0 ";
				}				
			}
		}else{
			$SQL.=" AND 0 ";
		}
		
		$ORDER=' list ';
	}

	if(!$webdb[viewNoPassArticle]){
		$SQL.=' AND yz=1 ';
	}
	
	$SQL=" WHERE $SQL ORDER BY $ORDER DESC LIMIT $rows";
	$which='*';
	$listdb=list_article($SQL,$which,$leng);

	if(is_file(ROOT_PATH."template/default/$webdb[SideTitleStyle].htm")){
		$tplcode=read_file(ROOT_PATH."template/default/$webdb[SideTitleStyle].htm");
	}else{
		$tplcode=read_file(ROOT_PATH."template/default/side_tpl/0.htm");
	}
	//����CMS��ģ��,���Ծ��滻һ�´���
	$tplcode=str_replace('$webdb[www_url]$webdb[path]/','',$tplcode);

	$tplcode=addslashes($tplcode);
	foreach($listdb AS $key=>$rs){	
		if( $webdb[path] && ($webdb[Html_Type]==1||$gethtmlurl) ){
			$webdb[path]='';
		}
		$target=$rs[target]?'_blank':'_self';
		if($type=='pic'){
			$show.="<div class='p' style='float:left;width:130px;padding-left:5px;padding-top:5px;'>  <a href='$Mdomain/bencandy.php?fid=$rs[fid]&id=$rs[aid]' style='display:block;width:120px;height:90px;border:1px solid #ccc;' target='$target'><img style='border:2px solid #fff;' width='120' height='90' src='$rs[picurl]' border='0'></a>  <A HREF='$Mdomain/bencandy.php?fid=$rs[fid]&id=$rs[aid]' title='$rs[full_title]' target='$target'>$rs[title]</A>  </div>";
		}else{

			eval("\$show.=\"$tplcode\";");
		}		
	}
	if(!$show){
		$show="����...";
	}
	$show=stripslashes($show);
	return $show;
}


//��ʱ�����������
function corntab_post($type='EN',$id=''){
	global $db,$_pre,$timestamp;
	if($type=='EN'){
		$SQL="WHERE begintime>$timestamp";
		if($id){
			$SQL.=" AND aid='$id' ";
		}
		$query = $db->query("SELECT * FROM {$_pre}article $SQL");
		while($rs = $db->fetch_array($query)){
			$db->query("UPDATE {$_pre}article SET yz=3 WHERE aid='$rs[aid]'");
		}
	}elseif($type=='DE'){
		$SQL="WHERE yz=3 AND begintime<$timestamp";
		if($id){
			$SQL.=" AND aid='$id' ";
		}
		$query = $db->query("SELECT * FROM {$_pre}article $SQL");
		while($rs = $db->fetch_array($query)){
			$db->query("UPDATE {$_pre}article SET yz=1,posttime=list WHERE aid='$rs[aid]'");
		}
	}
}



//��Ŀ����,���һЩ��Ŀ��������
function get_guide($fid){
	global $GuideFid,$webdb;
	@include_once(Mpath."data/guide_fid.php");
}

/**
*����Ŀ����б��ܺ���
**/
function ListThisSort($rows,$leng=50){
	global $page,$fid,$fidDB,$webdb,$_pre,$Fid_db;
	if($page<1){
		$page=1;
	}
	$min=($page-1)*$rows;
	if($fidDB[listorder]==1){
		$DESC='DESC';
		$ORDER='A.posttime';
	}elseif($fidDB[listorder]==2){
		$DESC='ASC';
		$ORDER='A.posttime';
	}elseif($fidDB[listorder]==3){
		$DESC='DESC';
		$ORDER='A.hits';
	}elseif($fidDB[listorder]==4){
		$DESC='ASC';
		$ORDER='A.hits';
	}elseif($fidDB[listorder]==5){
		$DESC='DESC';
		$ORDER='A.lastview';
	}elseif($fidDB[listorder]==7){
		$DESC='DESC';
		$ORDER='A.digg_num';
	}elseif($fidDB[listorder]==8){
		$DESC='DESC';
		$ORDER='A.digg_time';
	}elseif($fidDB[listorder]==6){
		$DESC='DESC';
		$ORDER='rand()';
	}else{
		$DESC='DESC';
		$ORDER='A.list';
	}
	if(!$webdb[viewNoPassArticle]){
		$SQL_yz=' AND A.yz=1 ';
	}
	if($fid){
		$_fid_sql=" AND A.fid=$fid ";
	}else{
		$_fid_sql=" AND 1 ";
	}

	$SQL="A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE R.topic=1 $_fid_sql $SQL_yz ORDER BY $ORDER $DESC LIMIT $min,$rows";
	$which='SQL_CALC_FOUND_ROWS A.*,R.content';
	$listdb=list_article($SQL,$which,$leng);
	return $listdb;
}

/**
*����,���������ȵ���
**/
function Get_article($rows=10,$leng=30,$order='list'){
	global $fid,$webdb;
	if(!$webdb[viewNoPassArticle]){
		$SQL_yz=' AND yz=1 ';
	}
	if($fid){
		$SQL="WHERE fid=$fid $SQL_yz ORDER BY $order DESC LIMIT $rows";
	}else{
		$SQL="WHERE 1 $SQL_yz ORDER BY $order DESC LIMIT $rows";
	}
	
	$which='*';
	require_once(Mpath."inc/artic_function.php");
	$listdb=list_article($SQL,$which,$leng);
	return $listdb;
}

/**
*����ĿͼƬ�б�
**/
function ListPic($rows,$leng,$page=1,$order='list'){
	global $fid,$webdb;
	if($page<1){
		$page=1;
	}
	$min=($page-1)*$rows;
	if(!$webdb[viewNoPassArticle]){
		$SQL_yz=' AND yz=1 ';
	}
	$SQL="WHERE fid=$fid AND ispic=1 $SQL_yz ORDER BY $order DESC LIMIT $min,$rows";
	$which='*';
	$listdb=list_article($SQL,$which,$leng);
	return $listdb;
}

/**
*����������Ŀ
**/
function ListMoreSort(){
	global $db,$_pre,$fid,$webdb,$fidDB,$Fid_db;
	//����
	if($fidDB[config][sonListorder]==1){
		$order='A.list';
	}elseif($fidDB[config][sonListorder]==2){
		$order='A.hits';
	}elseif($fidDB[config][sonListorder]==3){
		$order='A.lastview';
	}elseif($fidDB[config][sonListorder]==4){
		$order='rand()';
	}else{
		$order='A.list';
	}
	$_order=" ORDER BY $order DESC ";

	//��ʾ����
	if($fidDB[config][sonTitleRow]>0){
		$rows=$fidDB[config][sonTitleRow];
	}elseif($webdb[ListSonRows]>0){
		$rows=$webdb[ListSonRows];
	}else{
		$rows=10;
	}

	//ÿ��������ʾ������
	if($fidDB[config][sonTitleLeng]>0){
		$leng=$fidDB[config][sonTitleLeng];
	}elseif($webdb[ListSonLeng]>0){
		$leng=$webdb[ListSonLeng];
	}else{
		$leng=30;
	}

	if(!$webdb[viewNoPassArticle]){
		$SQL_yz=' AND A.yz=1 ';
	}
	$query=$db->query("SELECT * FROM {$_pre}sort WHERE fup=$fid AND forbidshow!=1 ORDER BY list DESC LIMIT 50");
	while($rs=$db->fetch_array($query)){
		$SQL="A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE R.topic=1 AND A.fid=$rs[fid] $SQL_yz $_order LIMIT $rows";
		$which='A.*,R.content';
		$rs[article]=list_article($SQL,$which,$leng);

		//�������Ŀ���ܻ�ȡ�����,����ȡ����������Ŀ�����
		if(!$rs[article])
		{
			$array_fid=Get_SonFid("{$_pre}sort",$rs[fid]);
			if($array_fid&&count($array_fid)<50)
			{
				//�ֱ��,�������Ŀ����ͬһģ�͵Ļ�.�����ܻ�ȡ����
				$SQL="A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE R.topic=1 AND A.fid IN (".implode(',',$array_fid).") $SQL_yz $_order LIMIT $rows";
				$rs[article]=list_article($SQL,$which,$leng);
			}
		}
		$rs[logo] && $rs[logo]=tempdir($rs[logo]);
		$listdb[]=$rs;
	}
	return $listdb;
}


/**
*�澲̬ר��ҳ���ܺ���
**/
function make_sphtml_Function($fid,$id,$page=1,$P='',$linkcode=''){
	global $webdb,$Html_Type,$showHtml_Type,$WEBURL,$db,$_pre,$Mdomain;
	$P=preg_replace("/(.*)(do\/)$/is","\\1",$P);
	$linkcode=stripslashes($linkcode);
	if($id){
		if($Html_Type[special_bencandy][$id]){				//ĳ��ר��ĸ���URL
			$filename=$Html_Type[special_bencandy][$id];
		}elseif($Html_Type['SPbencandy'][$fid]){			//ĳ�������ר�����URL
			$filename=$Html_Type['SPbencandy'][$fid];
		}else{
			$filename=$webdb[special_show_html];			//ϵͳͳһ��URL
		}
		$dirid=floor($id/1000);
		if(strstr($filename,'$time_')){
			$rs=$db->get_one("SELECT posttime FROM {$_pre}special WHERE id='$id'");
			$time_Y=date("Y",$rs[posttime]);
			$time_y=date("y",$rs[posttime]);
			$time_m=date("m",$rs[posttime]);
			$time_d=date("d",$rs[posttime]);
			$time_W=date("W",$rs[posttime]);
			$time_H=date("H",$rs[posttime]);
			$time_i=date("i",$rs[posttime]);
			$time_s=date("s",$rs[posttime]);
		}
	}else{
		if($Html_Type['SPlist'][$fid]){
			$filename=$Html_Type['SPlist'][$fid];
		}else{
			$filename=$webdb[special_list_html];
		}
		//if($page==1){
		//	$filename=preg_replace("/(.*)\/([^\/]+)/is","\\1/",$filename);
		//}
	}

	$dirid=floor($id/1000);
	eval("\$filename=\"$filename\";");

	//ʹ�þ��Ե�ַ,�����ڶ���Ŀ¼����URL����
	if(!$P||$P=='./'){	
		$P="$Mdomain/";
	}
	return "$linkcode$P$filename";
}

/**
*�澲̬���ܺ���
**/
function make_html_Function($fid,$id,$page=1,$P='',$linkcode=''){
	global $webdb,$Html_Type,$showHtml_Type,$WEBURL,$db,$_pre,$Mdomain,$Murl;
	$linkcode=stripslashes($linkcode);
	if($id){
		if($P){
			
		}
		if($Html_Type[bencandy_id][$id]){				//ĳƪ����ĸ���URL
			$filename=$Html_Type[bencandy_id][$id];
		}elseif($Html_Type[bencandy][$fid]){			//ĳ����Ŀ���������URL
			$filename=$Html_Type[bencandy][$fid];
		}else{											//ϵͳͳһ��URL
			$filename=$webdb[Info_html_show];
		}
		//��������ҳ����ҳ��$pageȥ��
		if($page==1){
			$filename=preg_replace("/(.*)(-{\\\$page}|_{\\\$page})(.*)/is","\\1\\3",$filename);
		}
		$dirid=floor($id/1000);
		//��������ҳ����ĿС��1000ƪ���ʱ,��DIR��Ŀ¼ȥ��
		if($dirid==0){
			$filename=preg_replace("/(.*)(-{\\\$dirid}|_{\\\$dirid})(.*)/is","\\1\\3",$filename);
		}
		if(strstr($filename,'$time_')){
			$rs=$db->get_one("SELECT posttime FROM {$_pre}article WHERE aid='$id'");
			$time_Y=date("Y",$rs[posttime]);
			$time_y=date("y",$rs[posttime]);
			$time_m=date("m",$rs[posttime]);
			$time_d=date("d",$rs[posttime]);
			$time_W=date("W",$rs[posttime]);
			$time_H=date("H",$rs[posttime]);
			$time_i=date("i",$rs[posttime]);
			$time_s=date("s",$rs[posttime]);
		}
	}else{

		if($Html_Type['list'][$fid]){
			$filename=$Html_Type['list'][$fid];
		}else{
			$filename=$webdb[Info_html_list];
		}
		if($page==1)
		{
			$filename=preg_replace("/(.*)\/([^\/]+)/is","\\1/",$filename);
		}
	}

	if($P&&$P!="$Mdomain/"&&$P!="$Murl/"){	//�Ǳ�Ƶ����URL�Ͳ�Ҫ����̬����
		
		if($id){
			return "{$linkcode}{$P}bencandy.php?fid=$fid&id=$id";
		}else{
			return "{$linkcode}{$P}list.php?fid=$fid";
		}
	}
	/*
	if($P&&$P!='/'&&$P!="$webdb[www_url]/"){
		if($id){
			return "{$P}bencandy.php?fid=$fid&id=$id";
		}else{
			return "{$P}list.php?fid=$fid";
		}
	}
	*/
	//$dirid=floor($id/1000);
	eval("\$filename=\"$filename\";");
	

	//ʹ�þ��Ե�ַ,�����ڶ���Ŀ¼����URL����
	if(!$P||$P=='./'){
		$P="$Mdomain/";		
	}
	return "$linkcode$P$filename";
}

/**
*�澲̬���ܺ���
**/
function make_html($content,$pagetype='N'){
	
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)bencandy\.php\?fid=([\d]+)&(aid|id)=([\d]+)&page=([\d]+)/eis","make_html_Function('\\3','\\5','\\6','\\2',' href=\\1')",$content);	//�з�ҳ������ҳ
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)bencandy\.php\?fid=([\d]+)&(id|aid)=([\d]+)/eis","make_html_Function('\\3','\\5','1','\\2',' href=\\1')",$content);	//�޷�ҳ������ҳ
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)list\.php\?fid=([\d]+)&page=([\d]+)/eis","make_html_Function('\\3','','\\4','\\2',' href=\\1')",$content);	//�з�ҳ���б�ҳ
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)list\.php\?fid=([\d]+)/eis","make_html_Function('\\3','','1','\\2',' href=\\1')",$content);	//�޷�ҳ���б�ҳ
	
	//ר�⾲̬
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)showsp\.php\?fid=([\d]+)&(id|aid)=([\d]+)/eis","make_sphtml_Function('\\3','\\5','1','\\2',' href=\\1')",$content);	//�޷�ҳ������ҳ
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)listsp\.php\?fid=([\d]+)&page=([\d]+)/eis","make_sphtml_Function('\\3','','\\4','\\2',' href=\\1')",$content);	//�з�ҳ���б�ҳ
	$content=preg_replace("/ href=('|\"|)([-_a-z0-9\.:\/]{0,}\/|)listsp\.php\?fid=([\d]+)/eis","make_sphtml_Function('\\3','','1','\\2',' href=\\1')",$content);	//�޷�ҳ���б�ҳ

	if($pagetype=='N'){
		return $content;
	}
	
	global $fid,$id,$fidDB,$webdb,$page,$rsdb,$Html_Type,$Mdomain;
	
	$content=str_replace("jsspecial.php?","jsspecial.php?gethtmlurl=1&",$content);
	$content=str_replace("jsarticle.php?","jsarticle.php?gethtmlurl=1&",$content);

	if($pagetype=='bencandy')
	{
		if($Html_Type[bencandy_id][$id]){			//ĳƪ����ĸ���URL
			$filename=$Html_Type[bencandy_id][$id];
		}elseif($fidDB[bencandy_html]){				//ĳ����Ŀ���������URL
			$filename=$fidDB[bencandy_html];
		}else{										//ϵͳͳһ��URL
			$filename=$webdb[Info_html_show];
		}
		//��������ҳ����ҳ��$pageȥ��
		if($page==1){
			$filename=preg_replace("/(.*)(-{\\\$page}|_{\\\$page})(.*)/is","\\1\\3",$filename);
		}
		$dirid=floor($id/1000);
		//��������ҳ����ĿС��1000ƪ���ʱ,��DIR��Ŀ¼ȥ��
		if($dirid==0){
			$filename=preg_replace("/(.*)(-{\\\$dirid}|_{\\\$dirid})(.*)/is","\\1\\3",$filename);
		}
		if(strstr($filename,'$time_')){
			$time_Y=date("Y",$rsdb[full_posttime]);
			$time_y=date("y",$rsdb[full_posttime]);
			$time_m=date("m",$rsdb[full_posttime]);
			$time_d=date("d",$rsdb[full_posttime]);
			$time_W=date("W",$rsdb[full_posttime]);
			$time_H=date("H",$rsdb[full_posttime]);
			$time_i=date("i",$rsdb[full_posttime]);
			$time_s=date("s",$rsdb[full_posttime]);
		}
		$content.="<div style='display:none;'><iframe width=0 height=0 src='$Mdomain/job.php?job=updatehits&aid=$id'></iframe></div>";
	}
	elseif($pagetype=='list')
	{
		if($fidDB[list_html]){
			$filename=$fidDB[list_html];
		}else{
			$filename=$webdb[Info_html_list];
		}
		if($page==1){
			if($webdb[DefaultIndexHtml]==2){
				$filename=preg_replace("/(.*)\/([^\/]+)/is","\\1/index.shtml",$filename);
			}elseif($webdb[DefaultIndexHtml]==1){
				$filename=preg_replace("/(.*)\/([^\/]+)/is","\\1/index.html",$filename);
			}else{
				$filename=preg_replace("/(.*)\/([^\/]+)/is","\\1/index.htm",$filename);
			}
		}
	}
	elseif($pagetype=='listsp')
	{
		if($fidDB[list_html]){
			$filename=$fidDB[list_html];
		}else{
			$filename=$webdb[special_list_html];
		}
	}
	elseif($pagetype=='showsp')
	{
		if($Html_Type[special_bencandy][$id]){
			$filename=$Html_Type[special_bencandy][$id];
		}elseif($fidDB[bencandy_html]){
			$filename=$fidDB[bencandy_html];
		}else{
			$filename=$webdb[special_show_html];
		}
		if(strstr($filename,'$time_')){
			$time_Y=date("Y",$rsdb[full_posttime]);
			$time_y=date("y",$rsdb[full_posttime]);
			$time_m=date("m",$rsdb[full_posttime]);
			$time_d=date("d",$rsdb[full_posttime]);
			$time_W=date("W",$rsdb[full_posttime]);
			$time_H=date("H",$rsdb[full_posttime]);
			$time_i=date("i",$rsdb[full_posttime]);
			$time_s=date("s",$rsdb[full_posttime]);
		}		
		$content.="<SCRIPT LANGUAGE='JavaScript' src='$Mdomain/job.php?job=update_special_hits&id=$id'></SCRIPT>";
	}
	eval("\$filename=\"$filename\";");
	$HtmlDir=dirname($filename);
	if(!is_dir(Mpath.$HtmlDir)){
		makepath(Mpath.$HtmlDir);
	}
	write_file(Mpath.$filename,$content);
	return $content;
}

function show_keyword($content){
	global $Key_word,$webdb,$Mdomain;
	if(!$webdb[ifShowKeyword]){
		return $content;
	}
	require_once(ROOT_PATH."data/keyword.php");
	//��ͼƬ����ȥ��
	//$content=preg_replace("/ alt=([^ >]+)/is","",$content);
	foreach( $Key_word AS $key=>$value){
		if(!$value){
			$value="$Mdomain/search.php?type=title&keyword=".urlencode($key);
		}
		$content=keyword_replace_limit($key,"<a href=$value style=text-decoration:underline;font-size:14px;color:{$webdb[ShowKeywordColor]}; target=_blank>$key</a>",$content,1);	//β�������滻���ٴ�
	}
	return $content;
}


function keyword_replace_limit($search, $replace, $subject, $limit=-1){
     if (is_array($search)){
         foreach ($search as $k=>$v) {
             $search[$k] = '`' . preg_quote($search[$k],'`') . '`';
        }
    }else{
         $search = '`' . preg_quote($search,'`') . '`';
    }
    return preg_replace($search, $replace, $subject, $limit);
}

//Ϊ��ҳ������Զ����ҳ��
function Set_Title_PageNum($title,$page){
	$page<1 && $page=1;
	if($page<100){
		if($page==10){
			$page='0';
		}elseif($page>10&&$page%10!=0){
			if($page>20){
				$page=floor($page/10).'0'.($page%10);
			}else{
				$page='0'.($page%10);
			}
			
		}
		$array_ch=array("ʮ","һ","��","��","��","��","��","��","��","��");
		$array_ali=array("/0/","/1/","/2/","/3/","/4/","/5/","/6/","/7/","/8/","/9/");
		$page=preg_replace($array_ali,$array_ch,$page);
	}
	return "{$title}({$page})";
}


function delete_m_cache_file($fid,$id){
	del_file(Mpath."cache/jsarticle_cache");
	del_file(Mpath."cache/label_cache");
	del_file(Mpath."cache/list_cache");
	del_file(Mpath."cache/bencandy_cache");
	del_file(Mpath."cache/showsp_cache");
}





//��Ҫ�Ǹ�����������޸����ʱ����
function m_html_url(){
	global $rsdb,$aid,$fidDB,$webdb,$fid,$page,$showHtml_Type,$Html_Type,$Mdomain;
	$id=$aid;
	if($page<1){
		$page=1;
	}
	$postdb[posttime]=$rsdb[posttime];

	if($Html_Type[bencandy_id][$id]){				//ĳƪ����ĸ���URL
		$filename_b=$Html_Type[bencandy_id][$id];
	}elseif($fidDB[bencandy_html]){					//ĳ����Ŀ���������URL
		$filename_b=$fidDB[bencandy_html];
	}else{											//ϵͳͳһ��URL
		$filename_b=$webdb[Info_html_show];
	}
	//��������ҳ����ҳ��$pageȥ��
	if($page==1){
		$filename_b=preg_replace("/(.*)(-{\\\$page}|_{\\\$page})(.*)/is","\\1\\3",$filename_b);
	}
	$dirid=floor($aid/1000);
	//��������ҳ����ĿС��1000ƪ���ʱ,��DIR��Ŀ¼ȥ��
	if($dirid==0){
		$filename_b=preg_replace("/(.*)(-{\\\$dirid}|_{\\\$dirid})(.*)/is","\\1\\3",$filename_b);
	}
	if(strstr($filename_b,'$time_')){
		$time_Y=date("Y",$postdb[posttime]);
		$time_y=date("y",$postdb[posttime]);
		$time_m=date("m",$postdb[posttime]);
		$time_d=date("d",$postdb[posttime]);
		$time_W=date("W",$postdb[posttime]);
		$time_H=date("H",$postdb[posttime]);
		$time_i=date("i",$postdb[posttime]);
		$time_s=date("s",$postdb[posttime]);
	}
	if($fidDB[list_html]){
		$filename_l=$fidDB[list_html];
	}else{
		$filename_l=$webdb[Info_html_list];
	}	
	if($page==1){
		if($webdb[DefaultIndexHtml]==1){
			$filename_l=preg_replace("/(.*)\/([^\/]+)/is","\\1/index.html",$filename_l);
		}else{
			$filename_l=preg_replace("/(.*)\/([^\/]+)/is","\\1/index.htm",$filename_l);
		}
	}
	eval("\$array[_showurl]=\"$filename_b\";");
	eval("\$array[_listurl]=\"$filename_l\";");

	$filename_b="$Mdomain/$filename_b";
	$filename_l="$Mdomain/$filename_l";

	eval("\$array[showurl]=\"$filename_b\";");
	eval("\$array[listurl]=\"$filename_l\";");
	return $array;
}

//���ɸ���URL

function Make_htmltype(){
	global $db,$_pre,$webdb;
	$Html_Type[IF_HTML]=$webdb[Html_Type];	//��Ҫ��Ϊ�˱�ǩ���������Ƶ�����жϵ�
	$Html_Type['list'][0]=$webdb[Info_html_list];
	$Html_Type[bencandy][0]=$webdb[Info_html_show];
	$Html_Type[SPlist][0]=$webdb[special_list_html];
	$Html_Type[SPbencandy][0]=$webdb[special_show_html];
	$query = $db->query("SELECT * FROM {$_pre}sort");
	while($rs = $db->fetch_array($query)){
		if($rs[list_html])
		{
			$Html_Type['list'][$rs[fid]]=$rs[list_html];
		}
		if($rs[bencandy_html])
		{
			$Html_Type[bencandy][$rs[fid]]=$rs[bencandy_html];
		}
	}

	$query = $db->query("SELECT aid,htmlname FROM {$_pre}article WHERE htmlname!=''");
	while($rs = $db->fetch_array($query)){
		$Html_Type[bencandy_id][$rs[aid]]=$rs[htmlname];
	}

	$query = $db->query("SELECT * FROM {$_pre}spsort");
	while($rs = $db->fetch_array($query)){
		if($rs[list_html]){
			$Html_Type[SPlist][$rs[fid]]=$rs[list_html];
		}
		if($rs[bencandy_html]){
			$Html_Type[SPbencandy][$rs[fid]]=$rs[bencandy_html];
		}
	}
	$query = $db->query("SELECT id,htmlname FROM {$_pre}special WHERE htmlname!=''");
	while($rs = $db->fetch_array($query)){
		$Html_Type[special_bencandy][$rs[id]]=$rs[htmlname];
	}
	write_file(Mpath."data/htmltype.php","<?php\r\n return ".var_export($Html_Type,true).';?>');
}



//ɾ������ĺ���
function delete_m_article($aid,$rid,$forcedel=0){
	global $db,$_pre,$webdb;
	if(!$aid){
		showerr("id������");
	}

	if($rid){
		$rsdb=$db->get_one("SELECT R.*,A.* FROM {$_pre}article A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE R.rid='$rid'");
	}elseif($aid){
		$rsdb=$db->get_one("SELECT R.*,A.* FROM {$_pre}article A LEFT JOIN {$_pre}reply R ON A.aid=R.aid WHERE A.aid='$aid' ORDER BY R.rid ASC LIMIT 1");
		if(!$rsdb[rid]){
			$db->query("DELETE FROM {$_pre}article WHERE aid='$aid'");
			$db->query("DELETE FROM {$_pre}fu_article WHERE aid='$aid'");
		}
	}
	if(!$rsdb){
		return ;
	}
	if($rsdb[topic]){
		if($forcedel||$webdb[ForceDel]){
			if($rsdb[picurl]){
				delete_attachment( $rsdb[uid],tempdir($rsdb[picurl]) );
				delete_attachment( $rsdb[uid],tempdir("$rsdb[picurl].jpg") );
				delete_attachment( $rsdb[uid],tempdir("$rsdb[picurl].jpg.jpg") );
			}
			$query = $db->query("SELECT * FROM {$_pre}reply WHERE aid='$rsdb[aid]'");
			while($rs = $db->fetch_array($query)){
				delete_attachment($rs[uid],$rs[content]);
			}
			
			$db->query("DELETE FROM `{$_pre}collection` WHERE aid='$rsdb[aid]' ");
			$db->query("DELETE FROM `{$_pre}article` WHERE aid='$rsdb[aid]' ");
			$db->query("DELETE FROM `{$_pre}reply` WHERE aid='$rsdb[aid]' ");
			$db->query("DELETE FROM `{$_pre}comment` WHERE aid='$rsdb[aid]' ");
			$db->query("DELETE FROM `{$_pre}report` WHERE aid='$rsdb[aid]' ");
			$db->query("DELETE FROM `{$_pre}fu_article` WHERE aid='$rsdb[aid]'");
			//�Ƹ�����
			Give_article_money($rsdb[uid],'del');
			if($rsdb[levels]){
				Give_article_money($rsdb[uid],'uncom');
			}
			//ɾ���ؼ���
			keyword_del($rsdb[aid],$rsdb[keywords]);
		}else{
			$db->query("UPDATE {$_pre}article SET yz=2 WHERE aid='$rsdb[aid]'");
		}
	}else{
		$db->query("DELETE FROM {$_pre}reply WHERE rid='$rsdb[rid]'");
		delete_attachment($rsdb[uid],$rsdb[content]);

		$db->query("UPDATE {$_pre}article SET pages=pages-1 WHERE aid='$rsdb[aid]'");
	}
	//ɾ�������ļ�
	delete_m_cache_file($rsdb[fid],$rsdb[aid]);
}



//��ȡר��ҳ�ľ�̬URL��ַ
function get_m_SPhtml_url($fidDB,$id='',$posttime=''){
	global $webdb,$showHtml_Type,$Html_Type,$Mdomain;
	$page=1;
	$fid=$fidDB[fid];
	$postdb[posttime]=$posttime;

	if($Html_Type[special_bencandy][$id]){
		$filename_b=$Html_Type[special_bencandy][$id];
	}elseif($fidDB[bencandy_html]){
		$filename_b=$fidDB[bencandy_html];
	}else{
		$filename_b=$webdb[special_show_html];
	}
	if(strstr($filename_b,'$time_')){
		$time_Y=date("Y",$postdb[posttime]);
		$time_y=date("y",$postdb[posttime]);
		$time_m=date("m",$postdb[posttime]);
		$time_d=date("d",$postdb[posttime]);
		$time_W=date("W",$postdb[posttime]);
		$time_H=date("H",$postdb[posttime]);
		$time_i=date("i",$postdb[posttime]);
		$time_s=date("s",$postdb[posttime]);
	}
	if($fidDB[list_html]){
		$filename_l=$fidDB[list_html];
	}else{
		$filename_l=$webdb[special_list_html];
	}

	eval("\$array[_showurl]=\"$filename_b\";");
	eval("\$array[_listurl]=\"$filename_l\";");

	$filename_b="$Mdomain/$filename_b";
	$filename_l="$Mdomain/$filename_l";

	eval("\$array[showurl]=\"$filename_b\";");
	eval("\$array[listurl]=\"$filename_l\";");
	return $array;
}


//���������ݵĴ���
function show_download(&$rsdb){
	global $webdb,$web_admin,$Mrsdb,$Mdomain;
	$detail=explode("\n",$rsdb[softurl]);
	unset($rsdb[softurl]);
	foreach( $detail AS $_key=>$value){
		list($_url,$_name,$_fen)=explode("@@@",$value);
		$_fen=intval($_fen);
		$Mrsdb[$key][name][]=$_name=$_name?$_name:"�����������";
		$Mrsdb[$key][url][]=$_url=tempdir($_url);
		$Mrsdb[$key][fen][]=$_fen;
		$_fen || $_fen=$rsdb[money];
		$_fen=$_fen?$_fen="(�շ�:{$_fen} {$webdb[MoneyName]})":"";
		$ohterdownurl='';
		if($web_admin||!$_fen){			
			
			if($webdb[Use_XunLei]){
				$thunderUrl = Thunder_Encode($_url);
				$ohterdownurl.="&nbsp;&nbsp; <img src='$webdb[www_url]/images/default/down_ico.gif'> <a href=\"#\" thunderHref=\"$thunderUrl\" thunderPid=\"$webdb[XunLei_ID]\" thunderType=\"\" thunderResTitle=\"$filename\" onClick=\"return OnDownloadClick_Simple(this,2)\" oncontextmenu=\"ThunderNetwork_SetHref(this)\"  style='color:red;'>Ѹ�׸�������</a>";
			}
			
			if($webdb[Use_FlashGet]){
				$flashgetUrl = Flashget_Encode($_url,$webdb[FlashGet_ID]);
				$ohterdownurl.="&nbsp;&nbsp; <img src='$webdb[www_url]/images/default/down_ico.gif'> <a href=\"#\" onClick=\"ConvertURL2FG('$flashgetUrl','',$webdb[FlashGet_ID])\" oncontextmenu=\"Flashget_SetHref(this)\" fg=\"$flashgetUrl\" style='color:red;'>�쳵�������� $filename</a>";
			}
			
		}
		$rsdb[softurl][show][]="<img src='$webdb[www_url]/images/default/down_ico.gif'> <A HREF='$Mdomain/job.php?job=down_encode&id=$rsdb[aid]&file_id=$_key' target=_blank>$_name</A> $_fen <span id='xunlei_flashget' style='display:;'>$ohterdownurl</span>";
	}
	$rsdb[softurl]=implode("<br>",$rsdb[softurl][show]);
}

?>