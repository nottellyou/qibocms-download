<?php
error_reporting(0);
if(ereg("^([-_0-9a-zA-Z]+)$",$_GET[jobs])){
	//�������ݿ�
	@include(dirname(__FILE__)."/inc/job/$_GET[jobs].php");

}elseif(ereg("^([-_0-9a-zA-Z]+)$",$_GET[job])||ereg("^([-_0-9a-zA-Z]+)$",$_POST[job])){
	//�����ݿ�
	require(dirname(__FILE__).'/global.php');
	if(ereg("^([-_0-9a-zA-Z]+)$",$job)){
		@include(Mpath."inc/job/$job.php");
	}
}
?>