<?php
!function_exists('html') && exit('ERR');

if($job=="list"&&ck_power('sort_html'))	//��Ŀ��̬�б�
{
	$fid=intval($fid);
	$sortdb=array();
	list_2allsort($fid,"sort");
	get_admin_html('listsort',true);
}
//��Ŀ��̬�б�
elseif($action=="makehtml"&&ck_power('sort_html'))
{
	if($step=='end'){	//���ɾ�̬���

		echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$admin_path&job=list'>";
		exit;

	}elseif($step=='endListStarBencandy'){	//�������б�ҳ,������������ҳ

		unset($fiddb);
		require_once(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php");
		echo "���Ժ�,������������ҳ<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$Murl/bencandy_html.php?fid=$fiddb[0]&cacheid=$cacheid'>";
		exit;
	}

	if(!is_dir(Mpath.'cache')){
		mkdir(Mpath.'cache');
		chmod(Mpath.'cache',0777);
	}
	if(!is_dir(Mpath.'cache/htm_cache')){
		mkdir(Mpath.'cache/htm_cache');
		chmod(Mpath.'cache/htm_cache',0777);
	}
	
	$SQL=" ";
	if($_POST[listdb]&&$posttype=="fromarticle"){	//���������ҳPOST������ָ��ID���
		if(!$listdb){
			showmsg("��ѡ��һ�����");
		}
		$ar='';
		foreach( $listdb AS $key=>$value){
			$ar[]=$key;
		}
		if(!$fiddb[0]){
			unset($fiddb);
			$query = $db->query("SELECT * {$_pre}article WHERE aid IN (".implode(',',$ar).")");
			while($rs = $db->fetch_array($query)){				
				$fid_d[$rs[fid]] || $fiddb[]=$rs[fid];
				$fid_d[$rs[fid]]=1;
			}
		}
		$aids=implode(',',$ar);
		$SQL.=" AND aid IN ($aids) ";
		
	}elseif($posttype=="fromarticle"){

		$SQL.=" AND aid IN ($aids) ";	//$fiddb��ҪPOST����

	}elseif($posttype=="fromsort"){		//��������Ŀ����POST����������,Ҫ������,��Ϊ$key���Ǵ�0��ʼ

		$fiddb2=$fiddb;
		unset($fiddb);
		foreach( $fiddb2 AS $key=>$value){
			$fiddb[]=$key;
		}

	}

	if($iii<1&&$page<2){		//POST���ݹ���ʱ

		if(!$fiddb){
			showmsg("��ѡ��һ����Ŀ");
		}
		$cacheid=time();
		$allfid=implode(",",$fiddb);

		write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","<?php\r\n\$weburl='$WEBURL&step=end';\r\n");

		write_file(Mpath."cache/htm_cache/{$cacheid}_makelist.php","<?php\r\n \$allfid='$allfid';\r\n\$weburl='$WEBURL&step=endListStarBencandy&cacheid=$cacheid';");
	}

	if($onlylist){			//�������б�ҳ

		echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$Murl/list_html.php?fid=$fiddb[0]&cacheid=$cacheid'>";
		exit;			

	}else{	//��������ҳ���б�ҳ

		if($beginTime){
			$beginTime=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$beginTime);
			$SQL.=" AND posttime>$beginTime";
		}
		if($endTime){
			$endTime=preg_replace("/([\d]+)-([\d]+)-([\d]+) ([\d]+):([\d]+):([\d]+)/eis","mk_time('\\4','\\5', '\\6', '\\2', '\\3', '\\1')",$endTime);
			$SQL.=" AND posttime<$endTime";
		}
		if(is_numeric($beginId)){
			$SQL.=" AND aid>$beginId ";
		}
		if(is_numeric($endId)){
			$SQL.=" AND aid<$endId ";
		}

		require(Mpath."cache/htm_cache/{$cacheid}_makelist.php");
		$fiddb=explode(",",$allfid);

		$iii=intval($iii);

		if($fid=$fiddb[$iii]){

			$page || $page=1;
			$rows=2000;
			$min=($page-1)*$rows;
			$ck=$ids='';

			$query = $db->query("SELECT pages,aid AS id FROM {$_pre}article WHERE fid=$fid $SQL LIMIT $min,$rows");
			while($rs = $db->fetch_array($query))
			{
				!$rs[pages] && $rs[pages]=1;
				for($i=1;$i<=$rs[pages];$i++){
					if($i>1){
						$ids.=",$rs[id]-$i";
					}else{
						$ids.=",$rs[id]";
					}
					$ck++;
					if($ck%20==0){
						write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","\$fiddb[]='$fid';\$iddb[]='$ids';\r\n",'a');
						$ids='';
					}
				}			
			}
			if($ids){
				write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","\$fiddb[]='$fid';\$iddb[]='$ids';\r\n",'a');
			}elseif(!$ck&&$page<2){
				//��������ڵ���Ŀ
				write_file(Mpath."cache/htm_cache/{$cacheid}_makeShow1.php","\$fiddb[]='$fid';\$iddb[]='-1';\r\n",'a');
			}

			if($ck){
				$page++;
			}else{
				$iii++;
				$page=0;
			}
			echo "&page=$page&iii=$iii<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$admin_path&action=$action&maketype=$maketype&page=$page&iii=$iii&beginTime=$beginTime&endTime=$endTime&beginId=$beginId&endId=$endId&posttype=$posttype&aids=$aids&cacheid=$cacheid'>";
			exit;
		}
		else
		{
			//��ִ�������б�ҳ,��ȥ��������ҳ
			echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$Murl/list_html.php?fid=$fiddb[0]&cacheid=$cacheid'>";
			exit;			
		}
	}
}
//ר�⾲̬�б�
elseif($job=="listsp"&&ck_power('listsp_html'))	
{
	$sortdb=array();
	list_2allsort($fid,"spsort");

	$list_record=read_file(Mpath."cache/makelist_record.php");
	$show_record=read_file(Mpath."cache/makeShow_record.php");
	$record='';
	if($list_record){
		$record.="<li><A HREF='$Murl/listsp_html.php$list_record' style='color:red;font-size:18px;font-weight:bold;'>ר���б�ҳ���ɾ�̬,���жϹ�,������������</A></li>";
	}
	if($show_record){
		$record.="<li><A HREF='$Murl/showsp_html.php$show_record' style='color:red;font-size:18px;font-weight:bold;'>ר������ҳ���ɾ�̬,���жϹ�,������������</A></li>";
	}

	get_admin_html('sortsp',true);
}

//ר��ҳ���ɾ�̬
elseif($action=="make_SPhtml"&&ck_power('listsp_html'))
{
	//���ɾ�̬���
	if($step=='end'){
		echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$admin_path&job=listsp'>";
		exit;
	//�������б�ҳ,������������ҳ
	}elseif($step=='endListStarBencandy'){
		unset($fiddb);
		require_once(Mpath."cache/makeShow1.php");
		$id_array=explode("-",$iddb[0]);
		echo "���Ժ�,������������ҳ<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$Murl/showsp_html.php?fid=$id_array[0]&id=$id_array[1]'>";
		exit;
	}

	if(!$fiddb&&!$idDB){
		showmsg("��ѡ��һ����Ŀ��һ��ר��");
	}
	
	if($fiddb){
		$stringFID=implode(",",$fiddb);
		$SQL=" fid IN ($stringFID) ";
	}elseif($idDB){
		$string=implode(",",$idDB);
		$SQL=" id IN ($string) ";
	}
	$str="<?php\r\n\$weburl='$WEBURL&step=end';\r\n";
	$query = $db->query("SELECT id,fid FROM {$_pre}special WHERE $SQL LIMIT 3000");
	while($rs = $db->fetch_array($query))
	{
		$str.="\$iddb[]='$rs[fid]-$rs[id]';\r\n";
		if(!$stringFID){
			$fiddb[$rs[fid]]=$rs[fid];
		}
	}
	write_file(Mpath."cache/makeShow1.php",$str);
	
	if(!$stringFID){
		$stringFID=implode(",",$fiddb);
	}
	write_file(Mpath."cache/makelist.php","<?php\r\n \$allfid='$stringFID';\r\n\$weburl='$WEBURL&step=endListStarBencandy';");
	$fiddb=explode(",",$stringFID);
	echo "<META HTTP-EQUIV=REFRESH CONTENT='0;URL=$Murl/listsp_html.php?fid=$fiddb[0]'>";
	exit;
}
//ɾ����̬
elseif($job=='del')
{
	if(!$fid){
		showmsg("FID������");
	}
	if($type=='sp'){
		ck_power('listsp_html');	//ɾ��ר��
		$fidDB=$db->get_one(" SELECT * FROM {$_pre}spsort WHERE fid='$fid' ");
		if($fidDB[list_html]){
			$filename=$fidDB[list_html];
		}else{
			$filename=$webdb[special_list_html];
		}
	}else{
		ck_power('sort_html');		//ɾ�����
		$fidDB=$db->get_one(" SELECT * FROM {$_pre}sort WHERE fid='$fid' ");
		if($fidDB[list_html]){
			$filename=$fidDB[list_html];
		}else{
			$filename=$webdb[Info_html_list];
		}
	}	
	$page=1;
	eval("\$filename=\"$filename\";");
	$_dirname=(dirname($filename)!='.')?dirname($filename):$filename;
	if($_dirname)
	{
		if($step!=2){
			get_admin_html('del');
		}else{
			del_file(Mpath.$_dirname);
		}
	}
	if($type=='sp'){
		refreshto("$admin_path&job=listsp","ɾ���ɹ�");
	}else{
		refreshto("$admin_path&job=list","ɾ���ɹ�");
	}	
}



/*��Ŀ�б�*/
function list_2allsort($fid,$table='sort'){
	global $db,$_pre,$sortdb,$webdb;
	$query=$db->query("SELECT * FROM {$_pre}$table WHERE fup='$fid' ORDER BY list DESC");
	while( $rs=$db->fetch_array($query) ){
		$icon="";
		for($i=1;$i<$rs['class'];$i++){
			$icon.="&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if($icon){
			$icon=substr($icon,0,-24);
			$icon.="--";
		}
		if($table=='spsort'){
			if($rs[list_html]){
				$rs[filename]=$rs[list_html];
			}else{
				$rs[filename]=$webdb[special_list_html];
			}
		}else{
			if($rs[list_html]){
				$rs[filename]=$rs[list_html];
			}else{
				$rs[filename]=$webdb[Info_html_list];
			}
			$rs[filename]=preg_replace("/(.*)\/([^\/]+)/is","\\1/",$rs[filename]);			
		}
		$fid=$rs[fid];
		$page=1;
		eval("\$rs[filename]=\"$rs[filename]\";");
		if(is_dir(Mpath.$rs[filename])||is_file(Mpath.$rs[filename])){
			$rs[havemade]=1;
		}else{
			$rs[havemade]=0;
		}
		$rs[config]=unserialize($rs[config]);
		$rs[icon]=$icon;
		$sortdb[]=$rs;

		list_2allsort($rs[fid],$table);
	}
}

function list_sort_guide($fup){
	global $db,$_pre,$mid,$only,$admin_path,$job;
	$rs=$db->get_one("SELECT fup,name FROM {$_pre}sort WHERE fid='$fup'");
	if($rs){
		$show=" -> <A HREF='$admin_path&job=$job&fid=$fup'>$rs[name]</A> ";
		$show=list_sort_guide($rs[fup]).$show;
	}
	return $show;
}
?>