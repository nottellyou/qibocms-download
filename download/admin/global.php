<?php
function_exists('html') OR exit('ERR');

define('Mdirname', preg_replace("/(.*)\/([^\/]+)\/([^\/]+)/is","\\2",str_replace("\\","/",dirname(__FILE__))) );
define('Mpath', preg_replace("/(.*)\/([^\/]+)\/([^\/]+)/is","\\1/\\2/",str_replace("\\","/",dirname(__FILE__))) );

define('Madmindir', preg_replace("/(.*)\/([^\/]+)/is","\\2",str_replace("\\","/",dirname(__FILE__))) );

$Mpath = Mpath;
define('Adminpath',dirname(__FILE__).'/');

require(Mpath."data/config.php");
require(Mpath."data/all_fid.php");
require(Mpath."inc/artic_function.php");	//�漰���������ĺ���
require(Mpath."inc/module.class.php");
require(Mpath."data/module_db.php");		//�Զ���ģ��

$Murl=$webdb[www_url].'/'.Mdirname;
$Mdomain=$ModuleDB[$webdb[module_pre]][domain]?$ModuleDB[$webdb[module_pre]][domain]:$Murl;

$_pre="{$pre}{$webdb[module_pre]}";					//���ݱ�ǰ׺

$groupdb=array_merge($groupdb,$groupdb["power_{$_pre}"]);	//Ȩ���ر���

$Module_db=new Module_Field(Mpath);						//�Զ���ģ�����
$field_db = $module_DB[1][field];
?>