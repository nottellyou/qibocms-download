<?php
!function_exists('html') && exit('ERR');

//���ļ������������ʱ�����ɾ�̬����

$bid=$fid;
if($bid&&$aid){
	require_once(Mpath."inc/bencandy_html_crontab.php");
	require_once(Mpath."inc/list_html_crontab.php");
}

//����̨����
if($web_admin){
	@ignore_user_abort(TRUE);
	@set_time_limit(0);
	if($type=='show'){
		require_once(Mpath."inc/bencandy_html_crontab.php");
	}elseif($type=='list'){
		require_once(Mpath."inc/list_html_crontab.php");		
	}else{
		require_once(Mpath."inc/bencandy_html_crontab.php");
		require_once(Mpath."inc/list_html_crontab.php");
	}
}

?>