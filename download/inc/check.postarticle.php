<?php
//�ύ��ʱ��������
if($step=='post')
{
	//�Զ����ֶν���У������Ƿ�Ϸ�
	$Module_db->checkpost($field_db,$postdb,'');

	//CK�༭���ķ�ҳ��
	$postdb[content]=str_replace('<div style=\"page-break-after: always\">
	<span style=\"display: none\">&nbsp;</span></div>','[-page-]',$postdb[content]);

	//��֤��У��
	if($groupdb[PostArticleYzImg]&&!$web_admin){	
		if(!check_imgnum($yzimg)){		
			showerr("��֤�벻����");
		}
	}
	
	if($job=='postnew'||$job=='edit'){
		if(!$postdb[title]){
			showerr("���ⲻ��Ϊ��");
		}elseif(strlen($postdb[title])>120){
			showerr("���ⲻ�ܴ���120���ֽ�");
		}
	}
	if(strlen($postdb[keywords])>80){
		showerr("�ؼ��ֲ��ܴ���80���ֽ�");
	}
	if(strlen($postdb[subhead])>120){
		showerr("�����ⲻ�ܴ���120���ֽ�");
	}
	if(strlen($postdb[smalltitle])>80){
		showerr("�̱��ⲻ�ܴ���80���ֽ�");
	}
	if(strlen($postdb[author])>25){
		showerr("���߲��ܴ���25���ֽ�");
	}
	if(strlen($postdb[copyfrom])>80){
		showerr("��Դ��վ���ܴ���80���ֽ�");
	}
	if($postdb[htmlname] && !eregi("(\.htm|\.html)$",$postdb[htmlname]) ){
		showerr("�Զ����ļ���ֻ����htm��html��׺���ļ�");
	}
	if($job=='postnew'&&$webdb[ForbidRepeatTitle]&&$db->get_one("SELECT * FROM {$_pre}article WHERE title='$postdb[title]' AND fid='$fid'")){
		showerr("ϵͳ��������Ŀ���ظ��ı���,���������!");
	}
	//һЩȨ�޹��ܵ�����
	article_more_set_ckecked($job);

	//����һЩ�ú��Ĵ���
	$postdb[title]		=	filtrate($postdb[title]);
	$postdb[subhead]	=	filtrate($postdb[subhead]);
	$postdb[keywords]	=	filtrate($postdb[keywords]);
	$postdb[smalltitle]	=	filtrate($postdb[smalltitle]);
	$postdb[picurl]		=	filtrate($postdb[picurl]);
	//$postdb[description]=	filtrate($postdb[description]);
	$postdb[author]		=	filtrate($postdb[author]);
	$postdb[copyfrom]	=	filtrate($postdb[copyfrom]);
	$postdb[copyfromurl]=	filtrate($postdb[copyfromurl]);

	$postdb[description]	=	preg_replace('/javascript/i','java script',$postdb[description]);
	$postdb[description]	=	preg_replace('/<iframe ([^<>]+)>/i','&lt;iframe \\1>',$postdb[description]);
	
	//��Ի����������Ĵ���
	$postdb[content]=str_replace("=\\\"../$webdb[updir]/","=\\\"$webdb[www_url]/$webdb[updir]/",$postdb[content]);

	if(!$groupdb[PostNoDelCode]){
		$postdb[content]	=	preg_replace('/javascript/i','java script',$postdb[content]);
		$postdb[content]	=	preg_replace('/<iframe ([^<>]+)>/i','&lt;iframe \\1>',$postdb[content]);
	}

	//�ɼ��ⲿͼƬ
	$postdb[content]	=	get_outpic($postdb[content],$fid,$GetOutPic);

	//ȥ����������
	$DelLink && $postdb[content] = preg_replace("/<a([^<>]*) href=\\\\\"([^\"]+)\\\\\"/is","<a",$postdb[content]);

	//����Ŀ¼ת��
	$downloadDIR="$_pre/$fid";
	if($webdb[ArticleDownloadDirTime]){	//�����ڴ�Ÿ���
		$downloadDIR.="/".date($webdb[ArticleDownloadDirTime],$timestamp);
	}

	if($post_db){
		foreach($post_db[softurl][url] AS $key=>$value){
			$value=trim($value);
			if(!$value||eregi("://",$value)){
				continue;
			}
			move_attachment($lfjuid,tempdir($value),"$_pre/$fid");
			if(is_file(ROOT_PATH."$webdb[updir]/$_pre/$fid/".basename($value))){
				$post_db[softurl][url][$key]="$_pre/$fid/".basename($value);
			}			
		}
		unset($_array);
		foreach($post_db[softurl][url] AS $key=>$value){
			if(!$value){
				continue;
			}
			$_array[]="$value@@@{$post_db[softurl][name][$key]}@@@{$post_db[softurl][fen][$key]}";
		}
		$postdb[softurl]=implode("\n",$_array);
	}
	if(!$postdb[softurl]){
		showerr('����뷢��һ���ļ���');
	}

	$postdb[content]=move_attachment($lfjuid,$postdb[content],$downloadDIR,'PostArticle');

	//����̫���ͼƬҪ�������Զ����ű���
	//$postdb[content]=str_replace("<img ","<img onload=\'if(this.width>600)makesmallpic(this,600,1800);\' ",$postdb[content]);

	//��ȡ����
	$file_db=get_content_attachment($postdb[content]);
	
	//�����ڱ���ͼƬʱ,�ͻ�ȡԶ�̵�ͼƬ��Ϊ����ͼ
	if(!$file_db){
		preg_match_all("/http:\/\/([^ '\"<>]+)\.(gif|jpg|png)/is",$postdb[content],$array);
		$file_db=$array[0];
	}

	//������������ͼʱ,��ȡͼƬ,���ϵͳ���������Զ�,��������
	if($webdb[autoGetSmallPic]&&!$postdb[picurl]&&($job=="postnew"||$job=="edit"))
	{
		//����ͼƬ,���û������ͼ,�ͻ�ȡ��һ��
		if($file_db){
			foreach( $file_db AS $key=>$value){
				if((eregi("jpg$",$value)||eregi("gif$",$value)||eregi("png$",$value))&&!eregi("ewebeditor\/",$value)){
					$postdb[picurl]=$value;
					break;
				}
			}
		}
	}

	/*����ͼ����*/
	if( $postdb[picurl] && $postdb[picurl]!=$rsdb[picurl] )
	{
		//ͼƬĿ¼ת��
		move_attachment($lfjuid,tempdir($postdb[picurl]),"$_pre/$fid",'small');
		$post_picurl=$postdb[picurl];
		if(file_exists(ROOT_PATH."$webdb[updir]/$_pre/$fid/".basename($postdb[picurl]))){
			$postdb[picurl]="$_pre/$fid/".basename($postdb[picurl]);
		}

		if(file_exists(ROOT_PATH."$webdb[updir]/$postdb[picurl]")&&$postdb[automakesmall]&&$webdb[if_gdimg])
		{
			//����Ǵ����������ȡ��ͼƬ,��Ҫ����Ϊ��һ��,����Ӱ�쵽ԭ����
			if(strstr($postdb[content],$postdb[picurl])){			
				$smallpic=str_replace(".","_",$postdb[picurl]).".gif";
			}else{			
				$smallpic="$postdb[picurl]";
			}
			$Newpicpath=ROOT_PATH."$webdb[updir]/$smallpic";

			$picWidth>500 && $picWidth=300;
			$picWidth<50 && $picWidth=300;

			$picHeight>500 && $picHeight=225;
			$picHeight<50 && $picHeight=225;
			gdpic(ROOT_PATH."$webdb[updir]/$postdb[picurl]",$Newpicpath,$picWidth?$picWidth:300,$picHeight?$picHeight:225,$webdb[autoCutSmallPic]?array('fix'=>1):'');
			
			//������һ��3:4��ͼƬ,�����ǩ����
			gdpic(ROOT_PATH."$webdb[updir]/$postdb[picurl]","$Newpicpath.jpg",$picHeight?$picHeight:225,$picWidth?$picWidth:300,$webdb[autoCutSmallPic]?array('fix'=>1):'');

			//������һ��1:1��ͼƬ,�����ǩ����
			gdpic(ROOT_PATH."$webdb[updir]/$postdb[picurl]","$Newpicpath.jpg.jpg",$picWidth?$picWidth:300,$picWidth?$picWidth:300,$webdb[autoCutSmallPic]?array('fix'=>1):'');

			if( file_exists($Newpicpath) ){
				
				$postdb[picurl]=$smallpic;

				//FTP�ϴ��ļ���Զ�̷�����
				if($webdb[ArticleDownloadUseFtp]){
					ftp_upfile($Newpicpath,$postdb[picurl]);
				}
			}
		}else{
			if(file_exists(ROOT_PATH."$webdb[updir]/$post_picurl.jpg")){
				move_attachment($lfjuid,tempdir("$post_picurl.jpg"),"article/$fid",'small');
			}
			if(file_exists(ROOT_PATH."$webdb[updir]/$post_picurl.jpg.jpg")){
				move_attachment($lfjuid,tempdir("$post_picurl.jpg.jpg"),"article/$fid",'small');
			}
		}
	}
	
	//FTP�ϴ��ļ���Զ�̷�����
	if($webdb[ArticleDownloadUseFtp]&&$file_db){
		foreach($file_db AS $key=>$value){
			if(is_file(ROOT_PATH."$webdb[updir]/$value")){
				ftp_upfile(ROOT_PATH."$webdb[updir]/$value",$value);
			}			
		}
	}

	//���ϵͳ�����Զ���ȡ�ؼ��ֵĻ�,ֻ�е��û�û���ùؼ���,���Զ���ȡ.
	if($job=='postnew'&&$webdb[autoGetKeyword]&&!$postdb[keywords]){
		$postdb[keywords] = keyword_ck($postdb[keywords],$postdb[title]);
		
	}

	//���������Դ
	if($postdb[copyfrom] && $postdb[addcopyfrom] && $web_admin)
	{
		if(!$db->get_one("SELECT * FROM {$pre}copyfrom WHERE name='$postdb[copyfrom]' ") ){
			$db->query("INSERT INTO `{$pre}copyfrom` (`name` , `list`,uid ) VALUES ('$postdb[copyfrom]', '$timestamp','$lfjdb[uid]')");
		}
	}

	

	//���˲���������
	$postdb[content]	=	replace_bad_word($postdb[content]);
	$postdb[title]		=	replace_bad_word($postdb[title]);
	$postdb[author]		=	replace_bad_word($postdb[author]);
	$postdb[keywords]	=	replace_bad_word($postdb[keywords]);
	$postdb[copyfrom]	=	replace_bad_word($postdb[copyfrom]);
	$postdb[description]=	replace_bad_word($postdb[description]);

	$postdb[picurl]		&&	$postdb[ispic]=1;

	//�Ը�����ַ������,��ֹ����������,�޷�����
	$postdb[content]	=	En_TruePath($postdb[content]);
}
//�޸��뷢��,δ�ύǰ
else
{
	//���ϵͳ����Ŀ�������۵Ļ�,�����ǿ�ƽ�������
	$forbidcomment=" ";
	if($job=='postnew'){
		if(!$webdb[showComment]||($fidDB&&!$fidDB[allowcomment])){
			$forbidcomment=" checked ";
		}
	}elseif($rsdb[forbidcomment]){
		$forbidcomment=" checked ";
	}
	
	$fonttype=$rsdb[fonttype]==1?" checked ":"";
	if($job=='edit'){
		$yz=$rsdb[yz]==1?" checked ":"";
	}else{
		$yz=" checked ";
	}
	
	if($rsdb["list"]>$timestamp)
	{
		$top=" checked ";
	}
	if($rsdb["levels"])
	{
		$levels=" checked ";
	}
	if($rsdb["target"])
	{
		$target=" checked ";
	}

	$style_select=select_style('postdb[style]',$rsdb[style]);
	
	unset($keywords,$copyfroms,$moduledb,$specials,$baseSpecial);

	$query = $db->query("SELECT * FROM {$_pre}special ORDER BY list DESC LIMIT 500");
	while($rs = $db->fetch_array($query)){
		if($rs[yz]!=1&&$rs[uid]!=$lfjuid){
			continue;
		}
		if($rs[allowpost]&&!$web_admin){
			if( !in_array($groupdb['gid'],explode(",",$rs[allowpost])) ){
				if(!$lfjuid||$rs[uid]!=$lfjuid ){
					continue;
				}				
			}
		}
		$checked='';
		if($aid&&in_array($aid,explode(",",$rs[aids])))
		{
			$checked=' checked ';
		}
		if($rs[ifbase]){
			$baseSpecial.="<input type='checkbox' name='postdb[special][]' value='$rs[id]' $checked>$rs[title] ";
		}else{
			$specials.="<input type='checkbox' name='postdb[special][]' value='$rs[id]' $checked>$rs[title]<br>";
		}		
	}

	$query=$db->query("SELECT * FROM {$_pre}keyword ORDER BY num DESC LIMIT 30");
	while($rs=$db->fetch_array($query)){
		$keywords.="<option value='$rs[keywords]' >$rs[keywords]</option>";
	}
	$query=$db->query("SELECT * FROM {$pre}copyfrom ORDER BY list DESC");
	while($rs=$db->fetch_array($query)){
		$copyfroms.="<option value='$rs[name]'>$rs[name]</option>";
	}

	$group_allowdown=group_box("postdb[allowdown]",explode(",",$rsdb[allowdown]));
	$group_allowview=group_box("postdb[allowview]",explode(",",$rsdb[allowview]));

	$tpl_list=@unserialize($fidDB[template]);
	$tpl_show=@unserialize($rsdb[template]);

	if($rsdb[softurl]){
		$detail=explode("\n",$rsdb[softurl]);
		unset($rsdb[softurl]);
		foreach( $detail AS $_key=>$value){
			list($url,$name,$fen,$_type)=explode("@@@",$value);
			$rsdb[softurl][name][]=$name;
			$rsdb[softurl][url][]=$url;
			$rsdb[softurl][fen][]=$fen;
			$rsdb[softurl][type][]=$_type;
		}
	}

	$value_tpl_head=$tpl_show[head]?$tpl_show[head]:$tpl_list[head];
	$value_tpl_foot=$tpl_show[foot]?$tpl_show[foot]:$tpl_list[foot];
	$value_tpl_show=$tpl_show[bencandy]?$tpl_show[bencandy]:$tpl_list[bencandy];
	$tpl_head=select_template("",7,$value_tpl_head);
	$tpl_head=str_replace("<select","<select onChange='get_obj(\"head_tpl\").value=this.options[this.selectedIndex].value;'",$tpl_head);
	$tpl_foot=select_template("",8,$value_tpl_foot);
	$tpl_foot=str_replace("<select","<select onChange='get_obj(\"foot_tpl\").value=this.options[this.selectedIndex].value;'",$tpl_foot);
	$tpl_show=select_template("",3,$value_tpl_show);
	$tpl_show=str_replace("<select","<select onChange='get_obj(\"main_tpl\").value=this.options[this.selectedIndex].value;'",$tpl_show);

	$rsdb[posttime]		&&	$rsdb[posttime]=date("Y-m-d H:i:s",$rsdb[posttime]);
	$rsdb[begintime]	&&	$rsdb[begintime]=date("Y-m-d H:i:s",$rsdb[begintime]);
	$rsdb[endtime]		&&	$rsdb[endtime]=date("Y-m-d H:i:s",$rsdb[endtime]);

	//��ַ��ԭ
	$rsdb[content]=En_TruePath($rsdb[content],0);
	$rsdb[content]=editor_replace($rsdb[content]);
	

	//ҳ����ʾ����
	if(!$web_admin&&!$groupdb[SetArticleTpl])
	{
		$readonly=' readonly ';
	}

	if($aid){
		//����Ŀ���ݼ�鴦��
		$query = $db->query("SELECT * FROM {$_pre}fu_article WHERE aid='$aid'");
		while($rs = $db->fetch_array($query)){
			$fu_fiddb[]=$rs[fid];
		}
	}
	$fu_sort=$Guidedb->Checkbox("{$_pre}fu_sort",'fu_fiddb[]',$fu_fiddb);
	
	if(!$aid){	//�·���,��Щ�ֶ���Ĭ��ֵ
		foreach( $field_db AS $key=>$rs){	
			if($rs[form_value]){		
				$rsdb[$key]=$rs[form_value];
			}
		}
		$rsdb[update_time] = date('Y-m-d H:i:s',$timestamp);
	}else{
		$rsdb[update_time] = date('Y-m-d H:i:s',$rsdb[update_time]);
	}
	$Module_db->formGetVale($field_db,$rsdb);	//��Ĭ�ϱ���������
}
?>