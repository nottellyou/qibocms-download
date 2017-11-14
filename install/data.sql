DROP TABLE IF EXISTS qb_members;
CREATE TABLE `qb_members` (
  `uid` mediumint(7) unsigned NOT NULL auto_increment,
  `username` varchar(30) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`uid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_memberdata;
CREATE TABLE `qb_memberdata` (
  `uid` mediumint(7) unsigned NOT NULL default '0',
  `username` varchar(50) NOT NULL default '',
  `question` varchar(32) NOT NULL default '',
  `groupid` smallint(4) NOT NULL default '0',
  `grouptype` tinyint(1) NOT NULL default '0',
  `groups` varchar(255) NOT NULL default '',
  `yz` tinyint(1) NOT NULL default '0',
  `newpm` tinyint(1) NOT NULL default '0',
  `medals` varchar(255) NOT NULL default '',
  `money` mediumint(7) unsigned NOT NULL default '0',
  `totalspace` bigint(13) NOT NULL default '0',
  `usespace` bigint(13) NOT NULL default '0',
  `oltime` int(10) NOT NULL default '0',
  `lastvist` int(10) NOT NULL default '0',
  `lastip` varchar(15) NOT NULL default '',
  `regdate` int(10) NOT NULL default '0',
  `regip` varchar(15) NOT NULL default '',
  `sex` tinyint(1) NOT NULL default '0',
  `bday` date NOT NULL default '0000-00-00',
  `icon` varchar(150) NOT NULL default '',
  `introduce` text NOT NULL,
  `hits` int(7) NOT NULL default '0',
  `lastview` int(10) NOT NULL default '0',
  `oicq` varchar(11) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `homepage` varchar(150) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `provinceid` mediumint(6) NOT NULL default '0',
  `cityid` mediumint(7) NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  `postalcode` varchar(6) NOT NULL default '',
  `mobphone` varchar(12) NOT NULL default '',
  `telephone` varchar(25) NOT NULL default '',
  `idcard` varchar(20) NOT NULL default '',
  `truename` varchar(20) NOT NULL default '',
  `config` text NOT NULL,
  `moneycard` mediumint(7) unsigned NOT NULL default '0',
  `email_yz` tinyint(1) NOT NULL default '0',
  `mob_yz` tinyint(1) NOT NULL default '0',
  `idcard_yz` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`uid`),
  KEY `groups` (`groups`),
  KEY `sex` (`sex`,`bday`,`cityid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_group;
CREATE TABLE `qb_group` (
  `gid` smallint(4) NOT NULL auto_increment,
  `gptype` tinyint(1) NOT NULL default '0',
  `grouptitle` varchar(50) NOT NULL default '',
  `levelnum` mediumint(7) NOT NULL default '0',
  `totalspace` int(10) NOT NULL default '0',
  `allowsearch` tinyint(1) NOT NULL default '0',
  `powerdb` text NOT NULL,
  `allowadmin` tinyint(1) NOT NULL default '0',
  `allowadmindb` text,
  PRIMARY KEY  (`gid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_menu;
CREATE TABLE `qb_menu` (
  `id` mediumint(5) NOT NULL auto_increment,
  `fid` mediumint(5) NOT NULL default '0',
  `name` varchar(80) NOT NULL default '',
  `linkurl` varchar(150) NOT NULL default '',
  `color` varchar(15) NOT NULL default '',
  `target` tinyint(1) NOT NULL default '0',
  `moduleid` tinyint(2) NOT NULL default '0',
  `type` tinyint(2) NOT NULL default '0',
  `hide` tinyint(1) NOT NULL default '0',
  `list` smallint(4) NOT NULL default '0',
  `extend` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_admin_menu;
CREATE TABLE `qb_admin_menu` (
  `id` mediumint(5) NOT NULL auto_increment,
  `fid` mediumint(5) NOT NULL default '0',
  `name` text NOT NULL,
  `linkurl` varchar(150) NOT NULL default '',
  `color` varchar(15) NOT NULL default '',
  `target` tinyint(1) NOT NULL default '0',
  `list` smallint(4) NOT NULL default '0',
  `groupid` mediumint(5) NOT NULL default '0',
  `iftier` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_module;
CREATE TABLE `qb_module` (
  `id` mediumint(5) NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `pre` varchar(20) NOT NULL default '',
  `dirname` varchar(30) NOT NULL default '',
  `domain` varchar(100) NOT NULL default '',
  `admindir` varchar(20) NOT NULL default '',
  `config` text NOT NULL,
  `list` mediumint(5) NOT NULL default '0',
  `admingroup` varchar(150) NOT NULL default '',
  `adminmember` text NOT NULL,
  `ifclose` tinyint(1) NOT NULL default '0',
  `ifsys` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_alonepage;
CREATE TABLE `qb_alonepage` (
  `id` mediumint(5) NOT NULL auto_increment,
  `fid` mediumint(5) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `style` varchar(15) NOT NULL default '',
  `tpl_head` varchar(50) NOT NULL default '',
  `tpl_main` varchar(50) NOT NULL default '',
  `tpl_foot` varchar(50) NOT NULL default '',
  `filename` varchar(100) default NULL,
  `filepath` varchar(30) NOT NULL default '',
  `descrip` text NOT NULL,
  `keywords` varchar(255) NOT NULL default '',
  `content` text NOT NULL,
  `hits` int(7) NOT NULL default '0',
  `ishtml` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_config;
CREATE TABLE `qb_config` (
  `c_key` varchar(50) NOT NULL default '',
  `c_value` text NOT NULL,
  `c_descrip` text NOT NULL,
  PRIMARY KEY  (`c_key`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_copyfrom;
CREATE TABLE `qb_copyfrom` (
  `id` mediumint(5) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `keywords` (`name`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_hack;
CREATE TABLE `qb_hack` (
  `keywords` varchar(30) NOT NULL default '',
  `name` varchar(30) NOT NULL default '',
  `isclose` tinyint(1) NOT NULL default '0',
  `author` varchar(30) NOT NULL default '',
  `config` text NOT NULL,
  `htmlcode` text NOT NULL,
  `hackfile` text NOT NULL,
  `hacksqltable` text NOT NULL,
  `adminurl` varchar(150) NOT NULL default '',
  `about` text NOT NULL,
  `class1` varchar(30) NOT NULL default '',
  `class2` varchar(30) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `linkname` text NOT NULL,
  `isbiz` tinyint(1) NOT NULL default '0',
  UNIQUE KEY `keywords` (`keywords`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_label;
CREATE TABLE `qb_label` (
  `lid` int(10) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `ch` smallint(4) NOT NULL default '0',
  `chtype` tinyint(2) NOT NULL default '0',
  `tag` varchar(50) NOT NULL default '',
  `type` varchar(30) NOT NULL default '',
  `typesystem` tinyint(1) NOT NULL default '0',
  `code` text NOT NULL,
  `divcode` text,
  `hide` tinyint(1) NOT NULL default '0',
  `js_time` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  `pagetype` tinyint(3) NOT NULL default '0',
  `module` mediumint(6) NOT NULL default '0',
  `fid` mediumint(7) NOT NULL default '0',
  `if_js` tinyint(1) NOT NULL default '0',
  `style` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `ch` (`ch`,`pagetype`,`module`,`fid`,`chtype`),
  KEY `tag` (`tag`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_friendlink;
CREATE TABLE `qb_friendlink` (
  `id` mediumint(5) NOT NULL auto_increment,
  `fid` int(7) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `url` varchar(150) NOT NULL default '',
  `logo` varchar(150) NOT NULL default '',
  `descrip` varchar(255) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `ifhide` tinyint(1) NOT NULL default '0',
  `iswordlink` tinyint(1) default NULL,
  `hits` tinyint(7) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `uid` int(7) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `yz` tinyint(1) NOT NULL default '1',
  `endtime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `yz` (`yz`,`endtime`,`ifhide`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_friendlink_sort;
CREATE TABLE `qb_friendlink_sort` (
  `fid` mediumint(7) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  PRIMARY KEY  (`fid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_pm;
CREATE TABLE `qb_pm` (
  `mid` int(10) unsigned NOT NULL auto_increment,
  `touid` mediumint(8) unsigned NOT NULL default '0',
  `togroups` varchar(80) NOT NULL default '',
  `fromuid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(15) NOT NULL default '',
  `type` enum('rebox','sebox','public') NOT NULL default 'rebox',
  `ifnew` tinyint(1) NOT NULL default '0',
  `title` varchar(130) NOT NULL default '',
  `mdate` int(10) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  PRIMARY KEY  (`mid`),
  KEY `touid` (`touid`),
  KEY `fromuid` (`fromuid`),
  KEY `type` (`type`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_limitword;
CREATE TABLE `qb_limitword` (
  `id` int(5) NOT NULL auto_increment,
  `oldword` varchar(50) NOT NULL default '',
  `newword` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_ad_norm_place;
CREATE TABLE `qb_ad_norm_place` (
  `id` mediumint(7) NOT NULL auto_increment,
  `keywords` varchar(50) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `type` varchar(30) NOT NULL default '0',
  `isclose` tinyint(1) NOT NULL default '0',
  `begintime` int(10) NOT NULL default '0',
  `endtime` int(10) NOT NULL default '0',
  `adcode` text NOT NULL,
  `posttime` int(10) NOT NULL default '0',
  `list` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `hits` mediumint(7) NOT NULL default '0',
  `money` mediumint(6) NOT NULL default '0',
  `moneycard` mediumint(6) NOT NULL default '0',
  `ifsale` tinyint(1) NOT NULL default '0',
  `autoyz` tinyint(1) NOT NULL default '0',
  `demourl` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_ad_norm_user;
CREATE TABLE `qb_ad_norm_user` (
  `u_id` mediumint(7) NOT NULL auto_increment,
  `id` mediumint(7) NOT NULL default '0',
  `u_uid` mediumint(7) NOT NULL default '0',
  `u_username` varchar(30) NOT NULL default '',
  `u_day` smallint(4) NOT NULL default '0',
  `u_begintime` int(10) NOT NULL default '0',
  `u_endtime` int(10) NOT NULL default '0',
  `u_hits` mediumint(7) NOT NULL default '0',
  `u_yz` tinyint(1) NOT NULL default '0',
  `u_code` text NOT NULL,
  `u_money` mediumint(7) NOT NULL default '0',
  `u_moneycard` mediumint(7) NOT NULL default '0',
  `u_posttime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`u_id`),
  KEY `u_endtime` (`u_endtime`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_ad_config;
CREATE TABLE `qb_ad_config` (
  `c_key` varchar(50) NOT NULL default '',
  `c_value` text NOT NULL,
  `c_descrip` text NOT NULL,
  PRIMARY KEY  (`c_key`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_ad_compete_place;
CREATE TABLE `qb_ad_compete_place` (
  `id` mediumint(7) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `isclose` tinyint(1) NOT NULL default '0',
  `list` int(10) NOT NULL default '0',
  `price` mediumint(5) NOT NULL default '0',
  `day` mediumint(4) NOT NULL default '0',
  `adnum` smallint(3) NOT NULL default '0',
  `wordnum` smallint(3) NOT NULL default '0',
  `autoyz` tinyint(1) NOT NULL default '1',
  `demourl` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_ad_compete_user;
CREATE TABLE `qb_ad_compete_user` (
  `ad_id` mediumint(7) NOT NULL auto_increment,
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `begintime` int(10) NOT NULL default '0',
  `endtime` int(10) NOT NULL default '0',
  `money` mediumint(6) NOT NULL default '0',
  `id` mediumint(7) NOT NULL default '0',
  `yz` tinyint(1) NOT NULL default '1',
  `adlink` varchar(200) NOT NULL default '',
  `adword` varchar(255) NOT NULL default '',
  `hits` mediumint(7) NOT NULL default '0',
  `color` varchar(20) NOT NULL default '',
  `fonttype` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ad_id`),
  KEY `id` (`id`,`endtime`,`money`,`yz`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_upfile;
CREATE TABLE `qb_upfile` (
  `up_id` mediumint(7) NOT NULL auto_increment,
  `module_id` smallint(4) NOT NULL default '0',
  `ids` varchar(255) NOT NULL default '0',
  `fid` mediumint(7) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `url` varchar(150) NOT NULL default '',
  `filename` varchar(100) NOT NULL default '',
  `num` smallint(5) NOT NULL default '0',
  `if_tmp` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`up_id`),
  KEY `filename` (`filename`),
  KEY `if_tmp` (`if_tmp`),
  KEY `posttime` (`posttime`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_area;
CREATE TABLE `qb_area` (
  `fid` mediumint(7) unsigned NOT NULL auto_increment,
  `fup` mediumint(7) unsigned NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `class` smallint(4) NOT NULL default '0',
  `sons` smallint(4) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `admin` varchar(100) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `listorder` tinyint(2) NOT NULL default '0',
  `passwd` varchar(32) NOT NULL default '',
  `logo` varchar(150) NOT NULL default '',
  `descrip` text NOT NULL,
  `style` varchar(50) NOT NULL default '',
  `template` text NOT NULL,
  `jumpurl` varchar(150) NOT NULL default '',
  `maxperpage` tinyint(3) NOT NULL default '0',
  `metakeywords` varchar(255) NOT NULL default '',
  `metadescription` varchar(255) NOT NULL default '',
  `allowcomment` tinyint(1) NOT NULL default '0',
  `allowpost` varchar(150) NOT NULL default '',
  `allowviewtitle` varchar(150) NOT NULL default '',
  `allowviewcontent` varchar(150) NOT NULL default '',
  `allowdownload` varchar(150) NOT NULL default '',
  `forbidshow` tinyint(1) NOT NULL default '0',
  `config` text NOT NULL,
  PRIMARY KEY  (`fid`),
  KEY `fup` (`fup`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_jfabout;
CREATE TABLE `qb_jfabout` (
  `id` mediumint(7) NOT NULL auto_increment,
  `fid` mediumint(5) NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `content` text NOT NULL,
  `list` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_jfsort;
CREATE TABLE `qb_jfsort` (
  `fid` mediumint(5) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  PRIMARY KEY  (`fid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_moneycard;
CREATE TABLE `qb_moneycard` (
  `id` mediumint(7) NOT NULL auto_increment,
  `passwd` varchar(32) NOT NULL default '',
  `moneyrmb` int(7) NOT NULL default '0',
  `moneycard` int(7) NOT NULL default '0',
  `ifsell` tinyint(1) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(32) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_olpay;
CREATE TABLE `qb_olpay` (
  `id` mediumint(7) NOT NULL auto_increment,
  `orderid` int(10) NOT NULL default '0',
  `numcode` varchar(32) NOT NULL default '',
  `money` varchar(15) NOT NULL default '0',
  `ifpay` tinyint(1) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(32) NOT NULL default '',
  `paytype` tinyint(3) NOT NULL default '0',
  `moduleid` mediumint(5) NOT NULL default '0',
  `formid` mediumint(5) NOT NULL default '0',
  `banktype` varchar(15) NOT NULL default '',
  `articleid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `numcode` (`numcode`),
  KEY `paytype` (`paytype`),
  KEY `formid` (`formid`),
  KEY `articleid` (`articleid`),
  KEY `moduleid` (`moduleid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_propagandize;
CREATE TABLE `qb_propagandize` (
  `id` int(10) NOT NULL auto_increment,
  `uid` mediumint(7) NOT NULL default '0',
  `ip` bigint(11) NOT NULL default '0',
  `day` smallint(3) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `fromurl` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `day` (`day`,`uid`,`ip`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_template;
CREATE TABLE `qb_template` (
  `id` mediumint(5) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `type` smallint(4) NOT NULL default '0',
  `filepath` varchar(100) NOT NULL default '',
  `descrip` text NOT NULL,
  `list` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_template_bak;
CREATE TABLE `qb_template_bak` (
  `bid` int(7) NOT NULL auto_increment,
  `id` int(7) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `code` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `id` (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_crontab;
CREATE TABLE `qb_crontab` (
  `id` mediumint(7) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `minutetime` mediumint(4) NOT NULL default '0',
  `daytime` varchar(4) NOT NULL default '0',
  `whiletime` int(10) NOT NULL default '0',
  `lasttime` int(10) NOT NULL default '0',
  `filepath` varchar(50) NOT NULL default '',
  `about` text NOT NULL,
  `ifstop` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `ifstop` (`ifstop`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_moneylog;
CREATE TABLE `qb_moneylog` (
  `id` mediumint(7) NOT NULL auto_increment,
  `uid` mediumint(7) NOT NULL default '0',
  `money` mediumint(7) NOT NULL default '0',
  `about` varchar(255) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `uid` (`uid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_yzimg;
CREATE TABLE `qb_yzimg` (
  `sid` varchar(8) NOT NULL default '',
  `imgnum` varchar(6) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `posttime` (`imgnum`,`posttime`)
) TYPE=HEAP;


DROP TABLE IF EXISTS qb_download_article;
CREATE TABLE `qb_download_article` (
  `aid` mediumint(7) unsigned NOT NULL auto_increment,
  `title` varchar(150) NOT NULL default '',
  `smalltitle` varchar(100) NOT NULL default '',
  `fid` mediumint(7) unsigned NOT NULL default '0',
  `mid` mediumint(5) NOT NULL default '0',
  `fname` varchar(50) NOT NULL default '',
  `hits` mediumint(7) NOT NULL default '0',
  `pages` smallint(4) NOT NULL default '0',
  `comments` mediumint(7) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `list` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `author` varchar(30) NOT NULL default '',
  `copyfrom` varchar(100) NOT NULL default '',
  `copyfromurl` varchar(150) NOT NULL default '',
  `titlecolor` varchar(15) NOT NULL default '',
  `fonttype` tinyint(1) NOT NULL default '0',
  `picurl` varchar(150) NOT NULL default '0',
  `ispic` tinyint(1) NOT NULL default '0',
  `yz` tinyint(1) NOT NULL default '0',
  `yzer` varchar(30) NOT NULL default '',
  `yztime` int(10) NOT NULL default '0',
  `levels` tinyint(2) NOT NULL default '0',
  `levelstime` int(10) NOT NULL default '0',
  `keywords` varchar(100) NOT NULL default '',
  `jumpurl` varchar(150) NOT NULL default '',
  `iframeurl` varchar(150) NOT NULL default '',
  `style` varchar(15) NOT NULL default '',
  `template` varchar(255) NOT NULL default '',
  `target` tinyint(1) NOT NULL default '0',
  `ip` varchar(15) NOT NULL default '',
  `lastfid` mediumint(7) NOT NULL default '0',
  `money` mediumint(7) NOT NULL default '0',
  `buyuser` text NOT NULL,
  `passwd` varchar(32) NOT NULL default '',
  `allowdown` varchar(150) NOT NULL default '',
  `allowview` varchar(150) NOT NULL default '',
  `editer` varchar(30) NOT NULL default '',
  `edittime` int(10) NOT NULL default '0',
  `begintime` int(10) NOT NULL default '0',
  `endtime` int(10) NOT NULL default '0',
  `description` text NOT NULL,
  `lastview` int(10) NOT NULL default '0',
  `digg_num` mediumint(7) NOT NULL default '0',
  `digg_time` int(10) NOT NULL default '0',
  `forbidcomment` tinyint(1) NOT NULL default '0',
  `ifvote` tinyint(1) NOT NULL default '0',
  `heart` varchar(255) NOT NULL default '',
  `htmlname` varchar(100) NOT NULL default '',
  `softurl` text NOT NULL,
  `day_down` varchar(7) NOT NULL default '',
  `week_down` mediumint(7) NOT NULL default '0',
  `month_down` mediumint(7) NOT NULL default '0',
  `total_down` mediumint(7) NOT NULL default '0',
  `down_time` int(10) NOT NULL default '0',
  `down_user` text NOT NULL,
  `update_time` int(10) NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `fid` (`fid`),
  KEY `hits` (`hits`,`yz`,`fid`,`ispic`),
  KEY `lastview` (`yz`,`lastview`,`fid`,`ispic`),
  KEY `list` (`list`,`yz`,`fid`,`ispic`),
  KEY `ispic` (`ispic`),
  KEY `uid` (`uid`),
  KEY `levels` (`levels`),
  KEY `digg_num` (`digg_num`),
  KEY `digg_time` (`digg_time`),
  KEY `mid` (`mid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_collection;
CREATE TABLE `qb_download_collection` (
  `id` mediumint(7) NOT NULL auto_increment,
  `aid` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_comment;
CREATE TABLE `qb_download_comment` (
  `cid` mediumint(7) unsigned NOT NULL auto_increment,
  `aid` int(10) unsigned NOT NULL default '0',
  `fid` mediumint(7) unsigned NOT NULL default '0',
  `authorid` mediumint(7) NOT NULL default '0',
  `uid` mediumint(7) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  `content` text NOT NULL,
  `ip` varchar(15) NOT NULL default '',
  `icon` tinyint(3) NOT NULL default '0',
  `yz` tinyint(1) NOT NULL default '0',
  `ifcom` tinyint(1) NOT NULL default '0',
  `agree` mediumint(5) NOT NULL default '0',
  `disagree` mediumint(5) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `aid` (`aid`),
  KEY `fid` (`fid`),
  KEY `uid` (`uid`),
  KEY `ifcom` (`ifcom`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_config;
CREATE TABLE `qb_download_config` (
  `c_key` varchar(50) NOT NULL default '',
  `c_value` text NOT NULL,
  `c_descrip` text NOT NULL,
  PRIMARY KEY  (`c_key`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_field;
CREATE TABLE `qb_download_field` (
  `id` mediumint(7) NOT NULL auto_increment,
  `mid` mediumint(5) NOT NULL default '0',
  `title` varchar(50) NOT NULL default '',
  `field_name` varchar(30) NOT NULL default '',
  `field_type` varchar(15) NOT NULL default '',
  `field_leng` smallint(3) NOT NULL default '0',
  `orderlist` int(10) NOT NULL default '0',
  `form_type` varchar(15) NOT NULL default '',
  `field_inputwidth` smallint(3) default NULL,
  `field_inputheight` smallint(3) NOT NULL default '0',
  `form_set` text NOT NULL,
  `form_value` text NOT NULL,
  `form_units` varchar(30) NOT NULL default '',
  `form_title` text NOT NULL,
  `mustfill` tinyint(1) NOT NULL default '0',
  `listshow` tinyint(1) NOT NULL default '0',
  `listfilter` tinyint(1) default NULL,
  `search` tinyint(1) NOT NULL default '0',
  `allowview` varchar(255) NOT NULL default '',
  `allowpost` varchar(255) NOT NULL default '',
  `js_check` text NOT NULL,
  `js_checkmsg` varchar(255) NOT NULL default '',
  `classid` mediumint(7) NOT NULL default '0',
  `form_js` text NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_fu_article;
CREATE TABLE `qb_download_fu_article` (
  `fid` int(7) NOT NULL default '0',
  `aid` int(10) NOT NULL default '0',
  KEY `fid` (`fid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_fu_sort;
CREATE TABLE `qb_download_fu_sort` (
  `fid` mediumint(7) unsigned NOT NULL auto_increment,
  `fup` mediumint(7) unsigned NOT NULL default '0',
  `fmid` mediumint(5) NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `class` smallint(4) NOT NULL default '0',
  `sons` smallint(4) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `admin` varchar(100) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `listorder` tinyint(2) NOT NULL default '0',
  `passwd` varchar(32) NOT NULL default '',
  `logo` varchar(150) NOT NULL default '',
  `descrip` text NOT NULL,
  `style` varchar(50) NOT NULL default '',
  `template` text NOT NULL,
  `jumpurl` varchar(150) NOT NULL default '',
  `maxperpage` tinyint(3) NOT NULL default '0',
  `metakeywords` varchar(255) NOT NULL default '',
  `metadescription` varchar(255) NOT NULL default '',
  `allowcomment` tinyint(1) NOT NULL default '0',
  `allowpost` varchar(150) NOT NULL default '',
  `allowviewtitle` varchar(150) NOT NULL default '',
  `allowviewcontent` varchar(150) NOT NULL default '',
  `allowdownload` varchar(150) NOT NULL default '',
  `forbidshow` tinyint(1) NOT NULL default '0',
  `config` text NOT NULL,
  `list_html` varchar(255) NOT NULL default '',
  `bencandy_html` varchar(255) NOT NULL default '',
  `domain` varchar(150) NOT NULL default '',
  `domain_dir` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`fid`),
  KEY `fup` (`fup`),
  KEY `fmid` (`fmid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_gather_rule;
CREATE TABLE `qb_download_gather_rule` (
  `id` mediumint(7) NOT NULL auto_increment,
  `fid` mediumint(7) NOT NULL default '0',
  `type` varchar(15) NOT NULL default '0',
  `fixsystem` varchar(30) NOT NULL default '',
  `filetype` varchar(50) NOT NULL default '',
  `webname` varchar(150) NOT NULL default '',
  `listurl` varchar(150) NOT NULL default '',
  `firstpage` varchar(150) NOT NULL default '',
  `page_begin` int(10) NOT NULL default '0',
  `page_end` int(10) NOT NULL default '0',
  `page_step` int(10) NOT NULL default '0',
  `title_minleng` smallint(5) NOT NULL default '0',
  `listmoreurl` text NOT NULL,
  `link_include_word` text NOT NULL,
  `link_noinclude_word` text NOT NULL,
  `link_replace_word` text NOT NULL,
  `title_replace_word` text NOT NULL,
  `list_begin_code` text NOT NULL,
  `list_end_code` text NOT NULL,
  `list_begin_preg` text NOT NULL,
  `list_end_preg` text NOT NULL,
  `gatherthesame` tinyint(1) NOT NULL default '0',
  `show_begin_preg` text NOT NULL,
  `show_end_preg` text NOT NULL,
  `show_endfile_preg` text NOT NULL,
  `show_begin_code` text NOT NULL,
  `show_end_code` text NOT NULL,
  `show_replace_word` text NOT NULL,
  `show_morepage` varchar(100) NOT NULL default '',
  `show_firstpage` varchar(100) NOT NULL default '',
  `show_spe2page` tinyint(1) NOT NULL default '0',
  `posttime` int(10) NOT NULL default '0',
  `list` int(10) NOT NULL default '0',
  `copypic` tinyint(1) NOT NULL default '0',
  `sort` smallint(4) NOT NULL default '0',
  `file_type` varchar(50) NOT NULL default '',
  `file_minleng` mediumint(6) NOT NULL default '0',
  `file_minsize` int(9) NOT NULL default '0',
  `file_includeword` text NOT NULL,
  `file_noincludeword` text NOT NULL,
  `file_explode` text NOT NULL,
  `file_picwidth` int(8) NOT NULL default '0',
  `file_star_string` varchar(150) NOT NULL default '',
  `title_rule` text NOT NULL,
  `content_rule` text NOT NULL,
  `title_morepage_rull` text NOT NULL,
  `content_morepage_rull` text NOT NULL,
  `charset_type` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_keyword;
CREATE TABLE `qb_download_keyword` (
  `id` mediumint(5) NOT NULL auto_increment,
  `keywords` varchar(30) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `ifhide` tinyint(1) NOT NULL default '0',
  `url` varchar(150) NOT NULL default '',
  `num` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `keywords` (`keywords`),
  KEY `num` (`num`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_keywordid;
CREATE TABLE `qb_download_keywordid` (
  `id` mediumint(7) NOT NULL default '0',
  `aid` mediumint(7) NOT NULL default '0',
  KEY `id` (`id`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_module;
CREATE TABLE `qb_download_module` (
  `id` smallint(4) NOT NULL auto_increment,
  `sort_id` mediumint(5) NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `list` smallint(4) NOT NULL default '0',
  `style` varchar(50) NOT NULL default '',
  `config` text NOT NULL,
  `config2` text NOT NULL,
  `comment_type` tinyint(1) NOT NULL default '0',
  `ifdp` tinyint(1) NOT NULL default '0',
  `template` text NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_reply;
CREATE TABLE `qb_download_reply` (
  `rid` mediumint(7) NOT NULL auto_increment,
  `subhead` varchar(150) NOT NULL default '',
  `postdate` int(10) NOT NULL default '0',
  `aid` mediumint(7) NOT NULL default '0',
  `fid` mediumint(7) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `topic` tinyint(1) NOT NULL default '0',
  `content` mediumtext NOT NULL,
  `orderid` mediumint(7) NOT NULL default '0',
  PRIMARY KEY  (`rid`),
  KEY `aid` (`aid`,`topic`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_report;
CREATE TABLE `qb_download_report` (
  `id` mediumint(7) NOT NULL auto_increment,
  `aid` int(10) NOT NULL default '0',
  `type` varchar(50) NOT NULL default '',
  `uid` mediumint(7) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `content` text NOT NULL,
  `posttime` int(10) NOT NULL default '0',
  `ip` varchar(15) NOT NULL default '',
  `yz` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_sort;
CREATE TABLE `qb_download_sort` (
  `fid` mediumint(7) unsigned NOT NULL auto_increment,
  `fup` mediumint(7) unsigned NOT NULL default '0',
  `mid` mediumint(7) NOT NULL default '0',
  `fmid` mediumint(5) NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `class` smallint(4) NOT NULL default '0',
  `sons` smallint(4) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `admin` varchar(100) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `listorder` tinyint(2) NOT NULL default '0',
  `passwd` varchar(32) NOT NULL default '',
  `logo` varchar(150) NOT NULL default '',
  `descrip` text NOT NULL,
  `style` varchar(50) NOT NULL default '',
  `template` text NOT NULL,
  `jumpurl` varchar(150) NOT NULL default '',
  `maxperpage` tinyint(3) NOT NULL default '0',
  `metakeywords` varchar(255) NOT NULL default '',
  `metadescription` varchar(255) NOT NULL default '',
  `allowcomment` tinyint(1) NOT NULL default '0',
  `allowpost` varchar(150) NOT NULL default '',
  `allowviewtitle` varchar(150) NOT NULL default '',
  `allowviewcontent` varchar(150) NOT NULL default '',
  `allowdownload` varchar(150) NOT NULL default '',
  `forbidshow` tinyint(1) NOT NULL default '0',
  `config` text NOT NULL,
  `list_html` varchar(255) NOT NULL default '',
  `bencandy_html` varchar(255) NOT NULL default '',
  `domain` varchar(150) NOT NULL default '',
  `domain_dir` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`fid`),
  KEY `fup` (`fup`),
  KEY `mid` (`mid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_special;
CREATE TABLE `qb_download_special` (
  `id` mediumint(7) NOT NULL auto_increment,
  `fid` mediumint(7) NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `titlecolor` varchar(15) NOT NULL default '',
  `keywords` varchar(100) NOT NULL default '',
  `style` varchar(25) NOT NULL default '',
  `template` varchar(255) NOT NULL default '',
  `picurl` varchar(150) NOT NULL default '',
  `content` mediumtext NOT NULL,
  `aids` text NOT NULL,
  `tids` text NOT NULL,
  `jumpurl` varchar(150) NOT NULL default '',
  `target` tinyint(1) NOT NULL default '0',
  `uid` mediumint(7) NOT NULL default '0',
  `username` varchar(50) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  `list` int(10) NOT NULL default '0',
  `hits` mediumint(7) NOT NULL default '0',
  `lastview` int(10) NOT NULL default '0',
  `levels` tinyint(1) NOT NULL default '0',
  `levelstime` int(10) NOT NULL default '0',
  `htmlfile` varchar(50) NOT NULL default '',
  `banner` varchar(150) NOT NULL default '',
  `allowpost` varchar(255) NOT NULL default '',
  `ifbase` tinyint(1) NOT NULL default '0',
  `htmlname` varchar(80) NOT NULL default '',
  `yz` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fid` (`fid`),
  KEY `ifbase` (`ifbase`),
  KEY `yz` (`yz`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_special_comment;
CREATE TABLE `qb_download_special_comment` (
  `id` mediumint(7) unsigned NOT NULL auto_increment,
  `cid` mediumint(7) unsigned NOT NULL default '0',
  `vid` mediumint(7) NOT NULL default '0',
  `uid` mediumint(7) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  `content` text NOT NULL,
  `ip` varchar(15) NOT NULL default '',
  `icon` tinyint(3) NOT NULL default '0',
  `yz` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `aid` (`cid`),
  KEY `uid` (`uid`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_download_spsort;
CREATE TABLE `qb_download_spsort` (
  `fid` mediumint(7) unsigned NOT NULL auto_increment,
  `fup` mediumint(7) unsigned NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `class` smallint(4) NOT NULL default '0',
  `sons` smallint(4) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `admin` varchar(100) NOT NULL default '',
  `list` int(10) NOT NULL default '0',
  `listorder` tinyint(2) NOT NULL default '0',
  `passwd` varchar(32) NOT NULL default '',
  `logo` varchar(150) NOT NULL default '',
  `descrip` text NOT NULL,
  `style` varchar(50) NOT NULL default '',
  `template` text NOT NULL,
  `jumpurl` varchar(150) NOT NULL default '',
  `maxperpage` tinyint(3) NOT NULL default '0',
  `metakeywords` varchar(255) NOT NULL default '',
  `metadescription` varchar(255) NOT NULL default '',
  `allowcomment` tinyint(1) NOT NULL default '0',
  `allowpost` varchar(150) NOT NULL default '',
  `allowviewtitle` varchar(150) NOT NULL default '',
  `allowviewcontent` varchar(150) NOT NULL default '',
  `allowdownload` varchar(150) NOT NULL default '',
  `forbidshow` tinyint(1) NOT NULL default '0',
  `config` text NOT NULL,
  `list_html` varchar(255) NOT NULL default '',
  `bencandy_html` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`fid`),
  KEY `fup` (`fup`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS qb_regnum;
CREATE TABLE `qb_regnum` (
  `sid` varchar(8) NOT NULL default '',
  `num` varchar(6) NOT NULL default '',
  `posttime` int(10) NOT NULL default '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `posttime` (`num`,`posttime`)
) TYPE=HEAP;


INSERT INTO `qb_members` VALUES ('1','admin','21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `qb_memberdata` VALUES ('1','admin','','3','1','','1','0','','1261','0','79703492','4310331','1307419516','127.0.0.1','1253678332','127.0.0.1','1','1890-00-00','http://news.net/upload_files/icon/1.jpg','','117','1307000683','888888','','','222@qq.com','20','345','cvbnmmm','','13399999999','','','��ѧ��','a:1:{s:7:\"endtime\";s:0:\"\";}','5','0','0','0');
INSERT INTO `qb_group` VALUES ('2','1','�ο���','0','0','0','a:56:{s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:14:\"PassContribute\";s:1:\"1\";s:17:\"SearchArticleType\";s:1:\"1\";s:16:\"PostArticleYzImg\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:12:\"SetTileColor\";s:1:\"0\";s:14:\"SetSellArticle\";s:1:\"0\";s:17:\"SetSpecialArticle\";s:1:\"0\";s:17:\"SetArticleKeyword\";s:1:\"0\";s:20:\"AddArticleKeywordNum\";s:0:\"\";s:21:\"AddArticleCopyfromNum\";s:0:\"\";s:18:\"SelectArticleStyle\";s:1:\"0\";s:16:\"SelectArticleTpl\";s:1:\"0\";s:13:\"SetArticleTpl\";s:1:\"0\";s:18:\"SetArticlePosttime\";s:1:\"0\";s:18:\"SetArticleViewtime\";s:1:\"0\";s:16:\"SetArticleHitNum\";s:1:\"0\";s:18:\"SetArticlePassword\";s:1:\"0\";s:19:\"SetArticleDownGroup\";s:1:\"0\";s:19:\"SetArticleViewGroup\";s:1:\"0\";s:17:\"SetArticleJumpurl\";s:1:\"0\";s:19:\"SetArticleIframeurl\";s:1:\"0\";s:21:\"SetArticleDescription\";s:1:\"0\";s:16:\"SetArticleTopCom\";s:1:\"0\";s:13:\"SetSmallTitle\";s:1:\"0\";s:19:\"CommentArticleYzImg\";s:1:\"1\";s:17:\"CollectArticleNum\";s:0:\"\";s:15:\"CreatSpecialNum\";s:0:\"\";s:13:\"PostNoDelCode\";s:1:\"0\";s:7:\"SetVote\";s:1:\"0\";s:11:\"SetHtmlName\";s:1:\"0\";s:16:\"PassContributeSP\";s:1:\"0\";s:14:\"AllowUploadMax\";s:1:\"0\";s:11:\"comment_num\";s:2:\"10\";s:10:\"comment_yz\";s:1:\"1\";s:11:\"comment_img\";s:1:\"0\";s:16:\"sell_postauto_yz\";s:1:\"0\";s:15:\"buy_postauto_yz\";s:1:\"0\";s:15:\"post_pingpai_yz\";s:1:\"0\";s:10:\"use2domain\";s:1:\"0\";s:16:\"useHomepageStyle\";s:1:\"0\";s:21:\"view_buy_view_contact\";s:1:\"0\";s:13:\"post_sell_num\";s:0:\"\";s:12:\"post_buy_num\";s:0:\"\";s:13:\"post_news_num\";s:0:\"\";s:14:\"post_photo_num\";s:0:\"\";s:11:\"post_hr_num\";s:0:\"\";s:17:\"post_zhanghui_num\";s:0:\"\";s:12:\"post_ZLG_num\";s:0:\"\";s:16:\"post_pingpai_num\";s:0:\"\";s:19:\"post_baojiadian_num\";s:0:\"\";s:19:\"post_xunjiadian_num\";s:0:\"\";s:24:\"post_info_collection_num\";s:0:\"\";s:18:\"allow_get_homepage\";s:1:\"0\";s:15:\"power_qb_video_\";a:27:{s:17:\"SearchArticleType\";s:1:\"1\";s:19:\"CommentArticleYzImg\";s:1:\"1\";s:11:\"comment_num\";s:2:\"10\";s:17:\"CollectArticleNum\";s:0:\"\";s:15:\"CreatSpecialNum\";s:0:\"\";s:16:\"PassContributeSP\";s:1:\"0\";s:16:\"PostArticleYzImg\";s:1:\"1\";s:14:\"PassContribute\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:13:\"PostNoDelCode\";s:1:\"0\";s:7:\"SetVote\";s:1:\"0\";s:12:\"SetTileColor\";s:1:\"0\";s:14:\"SetSellArticle\";s:1:\"0\";s:18:\"SelectArticleStyle\";s:1:\"0\";s:16:\"SelectArticleTpl\";s:1:\"0\";s:13:\"SetArticleTpl\";s:1:\"0\";s:18:\"SetArticlePosttime\";s:1:\"0\";s:18:\"SetArticleViewtime\";s:1:\"0\";s:16:\"SetArticleHitNum\";s:1:\"0\";s:18:\"SetArticlePassword\";s:1:\"0\";s:19:\"SetArticleDownGroup\";s:1:\"0\";s:19:\"SetArticleViewGroup\";s:1:\"0\";s:17:\"SetArticleJumpurl\";s:1:\"0\";s:19:\"SetArticleIframeurl\";s:1:\"0\";s:21:\"SetArticleDescription\";s:1:\"0\";s:16:\"SetArticleTopCom\";s:1:\"0\";s:11:\"SetHtmlName\";s:1:\"0\";}}','0','');
INSERT INTO `qb_group` VALUES ('3','1','��������Ա','0','0','0','a:26:{s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:14:\"PassContribute\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:14:\"AllowUploadMax\";s:1:\"1\";s:11:\"comment_num\";s:0:\"\";s:10:\"comment_yz\";s:1:\"1\";s:11:\"comment_img\";s:1:\"0\";s:16:\"sell_postauto_yz\";s:1:\"0\";s:15:\"buy_postauto_yz\";s:1:\"0\";s:15:\"post_pingpai_yz\";s:1:\"0\";s:10:\"use2domain\";s:1:\"0\";s:16:\"useHomepageStyle\";s:1:\"0\";s:21:\"view_buy_view_contact\";s:1:\"0\";s:13:\"post_sell_num\";s:0:\"\";s:12:\"post_buy_num\";s:0:\"\";s:13:\"post_news_num\";s:0:\"\";s:14:\"post_photo_num\";s:0:\"\";s:11:\"post_hr_num\";s:0:\"\";s:17:\"post_zhanghui_num\";s:0:\"\";s:12:\"post_ZLG_num\";s:0:\"\";s:16:\"post_pingpai_num\";s:0:\"\";s:19:\"post_baojiadian_num\";s:0:\"\";s:19:\"post_xunjiadian_num\";s:0:\"\";s:24:\"post_info_collection_num\";s:0:\"\";s:18:\"allow_get_homepage\";s:1:\"1\";}','1','a:57:{s:13:\"center_config\";s:1:\"1\";s:8:\"user_reg\";s:1:\"1\";s:11:\"module_list\";s:1:\"1\";s:9:\"hack_list\";s:1:\"1\";s:9:\"blend_set\";s:1:\"1\";s:14:\"friendlink_mod\";s:1:\"1\";s:14:\"alonepage_list\";s:1:\"1\";s:9:\"mysql_out\";s:1:\"1\";s:10:\"mysql_into\";s:1:\"1\";s:9:\"mysql_del\";s:1:\"1\";s:9:\"mysql_sql\";s:1:\"1\";s:9:\"menu_list\";s:1:\"1\";s:14:\"adminmenu_list\";s:1:\"1\";s:15:\"membermenu_list\";s:1:\"1\";s:11:\"member_list\";s:1:\"1\";s:8:\"regfield\";s:1:\"1\";s:16:\"member_addmember\";s:1:\"1\";s:10:\"group_list\";s:1:\"1\";s:16:\"group_list_admin\";s:1:\"1\";s:9:\"group_add\";s:1:\"1\";s:10:\"alipay_set\";s:1:\"1\";s:12:\"propagandize\";s:1:\"1\";s:11:\"jfadmin_mod\";s:1:\"1\";s:15:\"attachment_list\";s:1:\"1\";s:9:\"area_list\";s:1:\"1\";s:10:\"upgrade_ol\";s:1:\"1\";s:8:\"cnzz_set\";s:1:\"1\";s:12:\"message_send\";s:1:\"1\";s:9:\"mail_send\";s:1:\"1\";s:8:\"sms_send\";s:1:\"1\";s:15:\"logs_login_logs\";s:1:\"1\";s:18:\"logs_admin_do_logs\";s:1:\"1\";s:15:\"style_editstyle\";s:1:\"1\";s:13:\"template_list\";s:1:\"1\";s:7:\"crontab\";s:1:\"1\";s:5:\"login\";s:1:\"1\";s:8:\"moneylog\";s:1:\"1\";s:16:\"Module_ad_center\";s:1:\"1\";s:21:\"Module_ad_norm_listad\";s:1:\"1\";s:25:\"Module_ad_norm_listuserad\";s:1:\"1\";s:24:\"Module_ad_compete_listad\";s:1:\"1\";s:26:\"Module_ad_compete_listuser\";s:1:\"1\";s:28:\"Module_download_center_label\";s:1:\"1\";s:29:\"Module_download_center_config\";s:1:\"1\";s:25:\"Module_download_listartic\";s:1:\"1\";s:29:\"Module_download_sort_listsort\";s:1:\"1\";s:27:\"Module_download_postArticle\";s:1:\"1\";s:23:\"Module_download_comment\";s:1:\"1\";s:25:\"Module_download_sort_html\";s:1:\"1\";s:27:\"Module_download_listsp_html\";s:1:\"1\";s:23:\"Module_download_special\";s:1:\"1\";s:22:\"Module_download_spsort\";s:1:\"1\";s:24:\"Module_download_fu_artic\";s:1:\"1\";s:23:\"Module_download_fu_sort\";s:1:\"1\";s:27:\"Module_download_group_power\";s:1:\"1\";s:26:\"Module_download_getkeyword\";s:1:\"1\";s:6:\"mymenu\";N;}');
INSERT INTO `qb_group` VALUES ('4','1','ǰ̨����Ա','0','0','0','a:6:{s:14:\"AllowUploadMax\";s:1:\"0\";s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:11:\"comment_num\";s:0:\"\";s:10:\"comment_yz\";s:1:\"1\";s:11:\"comment_img\";s:1:\"1\";}','0','a:1:{s:6:\"mymenu\";N;}');
INSERT INTO `qb_group` VALUES ('8','0','��ͨ��Ա','0','50','0','a:55:{s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:14:\"PassContribute\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:17:\"SearchArticleType\";s:1:\"1\";s:12:\"SetTileColor\";s:1:\"0\";s:14:\"SetSellArticle\";s:1:\"0\";s:13:\"SetSmallTitle\";s:1:\"0\";s:17:\"SetSpecialArticle\";s:1:\"1\";s:17:\"SetArticleKeyword\";s:1:\"1\";s:20:\"AddArticleKeywordNum\";s:1:\"0\";s:16:\"PostArticleYzImg\";s:1:\"0\";s:21:\"AddArticleCopyfromNum\";s:1:\"0\";s:16:\"SelectArticleTpl\";s:1:\"0\";s:13:\"SetArticleTpl\";s:1:\"0\";s:18:\"SelectArticleStyle\";s:1:\"0\";s:18:\"SetArticlePosttime\";s:1:\"0\";s:18:\"SetArticleViewtime\";s:1:\"0\";s:16:\"SetArticleHitNum\";s:1:\"0\";s:18:\"SetArticlePassword\";s:1:\"0\";s:19:\"SetArticleDownGroup\";s:1:\"0\";s:19:\"SetArticleViewGroup\";s:1:\"0\";s:17:\"SetArticleJumpurl\";s:1:\"0\";s:19:\"SetArticleIframeurl\";s:1:\"0\";s:21:\"SetArticleDescription\";s:1:\"0\";s:16:\"SetArticleTopCom\";s:1:\"0\";s:17:\"CollectArticleNum\";s:2:\"30\";s:15:\"CreatSpecialNum\";s:1:\"7\";s:19:\"CommentArticleYzImg\";s:1:\"1\";s:11:\"SetHtmlName\";s:1:\"0\";s:7:\"SetVote\";s:1:\"1\";s:16:\"PassContributeSP\";s:1:\"0\";s:13:\"PostNoDelCode\";s:1:\"0\";s:14:\"AllowUploadMax\";s:1:\"0\";s:11:\"comment_num\";s:0:\"\";s:10:\"comment_yz\";s:1:\"0\";s:11:\"comment_img\";s:1:\"0\";s:16:\"sell_postauto_yz\";s:1:\"1\";s:15:\"buy_postauto_yz\";s:1:\"1\";s:15:\"post_pingpai_yz\";s:1:\"1\";s:10:\"use2domain\";s:1:\"0\";s:16:\"useHomepageStyle\";s:1:\"0\";s:21:\"view_buy_view_contact\";s:1:\"0\";s:13:\"post_sell_num\";s:1:\"5\";s:12:\"post_buy_num\";s:1:\"5\";s:13:\"post_news_num\";s:1:\"5\";s:14:\"post_photo_num\";s:2:\"10\";s:11:\"post_hr_num\";s:1:\"5\";s:17:\"post_zhanghui_num\";s:1:\"5\";s:12:\"post_ZLG_num\";s:1:\"0\";s:16:\"post_pingpai_num\";s:1:\"5\";s:19:\"post_baojiadian_num\";s:1:\"5\";s:19:\"post_xunjiadian_num\";s:1:\"5\";s:24:\"post_info_collection_num\";s:2:\"30\";s:18:\"allow_get_homepage\";s:1:\"1\";}','0','');
INSERT INTO `qb_group` VALUES ('9','0','VIP��Ա','10000','0','0','a:54:{s:17:\"SearchArticleType\";s:1:\"0\";s:16:\"PostArticleYzImg\";s:1:\"0\";s:14:\"PassContribute\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:12:\"SetTileColor\";s:1:\"0\";s:14:\"SetSellArticle\";s:1:\"0\";s:17:\"SetSpecialArticle\";s:1:\"0\";s:17:\"SetArticleKeyword\";s:1:\"0\";s:20:\"AddArticleKeywordNum\";s:0:\"\";s:21:\"AddArticleCopyfromNum\";s:0:\"\";s:18:\"SelectArticleStyle\";s:1:\"0\";s:16:\"SelectArticleTpl\";s:1:\"0\";s:13:\"SetArticleTpl\";s:1:\"0\";s:18:\"SetArticlePosttime\";s:1:\"0\";s:18:\"SetArticleViewtime\";s:1:\"0\";s:16:\"SetArticleHitNum\";s:1:\"0\";s:18:\"SetArticlePassword\";s:1:\"0\";s:19:\"SetArticleDownGroup\";s:1:\"0\";s:19:\"SetArticleViewGroup\";s:1:\"0\";s:17:\"SetArticleJumpurl\";s:1:\"0\";s:19:\"SetArticleIframeurl\";s:1:\"0\";s:21:\"SetArticleDescription\";s:1:\"0\";s:16:\"SetArticleTopCom\";s:1:\"0\";s:13:\"SetSmallTitle\";s:1:\"0\";s:19:\"CommentArticleYzImg\";s:1:\"0\";s:17:\"CollectArticleNum\";s:0:\"\";s:15:\"CreatSpecialNum\";s:0:\"\";s:14:\"AllowUploadMax\";s:1:\"0\";s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:11:\"comment_num\";s:2:\"30\";s:10:\"comment_yz\";s:1:\"0\";s:11:\"comment_img\";s:1:\"0\";s:16:\"sell_postauto_yz\";s:1:\"1\";s:15:\"buy_postauto_yz\";s:1:\"1\";s:15:\"post_pingpai_yz\";s:1:\"1\";s:10:\"use2domain\";s:1:\"1\";s:16:\"useHomepageStyle\";s:1:\"1\";s:21:\"view_buy_view_contact\";s:1:\"1\";s:9:\"topmyinfo\";s:0:\"\";s:12:\"topmyinfoday\";s:0:\"\";s:13:\"topcompanyday\";s:0:\"\";s:13:\"post_sell_num\";s:2:\"50\";s:12:\"post_buy_num\";s:2:\"50\";s:13:\"post_news_num\";s:2:\"50\";s:14:\"post_photo_num\";s:3:\"100\";s:11:\"post_hr_num\";s:2:\"20\";s:17:\"post_zhanghui_num\";s:2:\"20\";s:12:\"post_ZLG_num\";s:1:\"5\";s:19:\"post_baojiadian_num\";s:2:\"50\";s:19:\"post_xunjiadian_num\";s:2:\"50\";s:16:\"post_pingpai_num\";s:2:\"10\";s:24:\"post_info_collection_num\";s:3:\"100\";s:18:\"allow_get_homepage\";s:1:\"1\";}','0','');
INSERT INTO `qb_group` VALUES ('10','0','��ʯ��Ա','30000','0','0','a:50:{s:17:\"SearchArticleType\";s:1:\"0\";s:19:\"CommentArticleYzImg\";s:1:\"0\";s:17:\"CollectArticleNum\";s:0:\"\";s:15:\"CreatSpecialNum\";s:0:\"\";s:16:\"PassContributeSP\";s:1:\"0\";s:16:\"PostArticleYzImg\";s:1:\"0\";s:14:\"PassContribute\";s:1:\"1\";s:13:\"EditPassPower\";s:1:\"0\";s:13:\"PostNoDelCode\";s:1:\"0\";s:7:\"SetVote\";s:1:\"0\";s:12:\"SetTileColor\";s:1:\"0\";s:14:\"SetSellArticle\";s:1:\"0\";s:18:\"SelectArticleStyle\";s:1:\"0\";s:16:\"SelectArticleTpl\";s:1:\"0\";s:13:\"SetArticleTpl\";s:1:\"0\";s:18:\"SetArticlePosttime\";s:1:\"0\";s:18:\"SetArticleViewtime\";s:1:\"0\";s:16:\"SetArticleHitNum\";s:1:\"0\";s:18:\"SetArticlePassword\";s:1:\"0\";s:19:\"SetArticleDownGroup\";s:1:\"0\";s:19:\"SetArticleViewGroup\";s:1:\"0\";s:17:\"SetArticleJumpurl\";s:1:\"0\";s:19:\"SetArticleIframeurl\";s:1:\"0\";s:21:\"SetArticleDescription\";s:1:\"0\";s:16:\"SetArticleTopCom\";s:1:\"0\";s:11:\"SetHtmlName\";s:1:\"0\";s:14:\"AllowUploadMax\";s:1:\"0\";s:10:\"upfileType\";s:0:\"\";s:13:\"upfileMaxSize\";s:0:\"\";s:11:\"comment_num\";s:0:\"\";s:10:\"comment_yz\";s:1:\"1\";s:11:\"comment_img\";s:1:\"1\";s:16:\"sell_postauto_yz\";s:1:\"1\";s:15:\"buy_postauto_yz\";s:1:\"1\";s:15:\"post_pingpai_yz\";s:1:\"1\";s:10:\"use2domain\";s:1:\"1\";s:16:\"useHomepageStyle\";s:1:\"1\";s:21:\"view_buy_view_contact\";s:1:\"1\";s:13:\"post_sell_num\";s:3:\"100\";s:12:\"post_buy_num\";s:3:\"100\";s:13:\"post_news_num\";s:3:\"100\";s:14:\"post_photo_num\";s:3:\"100\";s:11:\"post_hr_num\";s:3:\"100\";s:17:\"post_zhanghui_num\";s:3:\"100\";s:12:\"post_ZLG_num\";s:2:\"10\";s:16:\"post_pingpai_num\";s:2:\"10\";s:19:\"post_baojiadian_num\";s:3:\"100\";s:19:\"post_xunjiadian_num\";s:3:\"100\";s:24:\"post_info_collection_num\";s:3:\"300\";s:18:\"allow_get_homepage\";s:1:\"1\";}','0','');
INSERT INTO `qb_menu` VALUES ('55','0','װ�����','/download/list.php?fid=26','','0','0','0','0','0','');
INSERT INTO `qb_menu` VALUES ('10','0','��վ���','/download/list.php?fid=12','','0','0','0','0','16','');
INSERT INTO `qb_menu` VALUES ('51','0','��վ��ҳ','/','','0','0','0','0','20','');
INSERT INTO `qb_menu` VALUES ('56','0','�칫���','/download/list.php?fid=27','','0','0','0','0','0','');
INSERT INTO `qb_admin_menu` VALUES ('83','0','��ǩ/���ģ��/��̬ҳ','','','0','9','3','0');
INSERT INTO `qb_admin_menu` VALUES ('84','83','</a>\r\n<font color=\"#FF0000\">��ҳ</font><img src=../images/default/article_elite.gif> <a href=\"../index.php?&ch=1&chtype=0&jobs=show\" target=\"main\">��ǩ</a> <A HREF=\'../index.php?&ch=1&MakeIndex=1\' target=\'_blank\' onclick=\"return confirm(\'��ȷʵҪ����ҳ���ɾ�̬��?���ɾ�̬��,���и��������������,��Ҫ���µ������һ�ξ�̬.�ſ��Կ���Ч��.\');\">��̬</a> <a> ','#','','0','4','3','0');
INSERT INTO `qb_admin_menu` VALUES ('87','0','��Ա��ع���','','','0','7','3','0');
INSERT INTO `qb_admin_menu` VALUES ('88','87','��Ա���Ϲ���','index.php?lfj=member&job=list','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('90','87','����Ȩ��','index.php?lfj=group&job=list','','0','0','3','1');
INSERT INTO `qb_admin_menu` VALUES ('91','87','����Ա��̨Ȩ������','index.php?lfj=group&job=list_admin','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('92','0','ϵͳ��������','','','0','6','3','0');
INSERT INTO `qb_admin_menu` VALUES ('93','92','����ȫ�ֲ�������','index.php?lfj=center&job=config','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('94','92','��վ�����˵�����','index.php?lfj=guidemenu&job=list','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('96','92','�������ӹ���','index.php?lfj=friendlink&job=list','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('97','92','����ҳ�����','index.php?lfj=alonepage&job=list','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('98','92','������վ���ݿ�','index.php?lfj=mysql&job=out','','0','0','3','0');
INSERT INTO `qb_admin_menu` VALUES ('102','0','��˵�','','','0','0','-3','0');
INSERT INTO `qb_module` VALUES ('24','2','���ϵͳ','ad_','a_d','','','','0','','','0','0');
INSERT INTO `qb_module` VALUES ('30','2','����ϵͳ','download_','download','','','a:7:{s:12:\"list_PhpName\";s:18:\"list.php?&fid=$fid\";s:12:\"show_PhpName\";s:29:\"bencandy.php?&fid=$fid&id=$id\";s:8:\"MakeHtml\";N;s:14:\"list_HtmlName1\";N;s:14:\"show_HtmlName1\";N;s:14:\"list_HtmlName2\";N;s:14:\"show_HtmlName2\";N;}','0','','','0','1');
INSERT INTO `qb_alonepage` VALUES ('1','0','��������','��������','1229507597','0','','','','','','friendlink.htm','','','','<table cellSpacing=4 cellPadding=4 width=\"100%\" border=0>\r\n<tbody>\r\n<tr>\r\n<td width=\"20%\"><a href=\"http://www.mmcbbs.com/\" target=_blank>ݼݼ��̳</a></td>\r\n<td width=\"20%\"><a href=\"http://www.liuv.net/\" target=_blank>��ˮ���</a></td>\r\n<td width=\"20%\"><a href=\"http://pic.goodod.com/\" target=_blank>ŷ���ֻ�ͼƬ</a></td>\r\n<td width=\"20%\"><a href=\"http://www.tianyakezhan.com/\" target=_blank>���Ŀ�ջ</a></td>\r\n<td width=\"20%\"><a href=\"http://www.czin.cn/\" target=_blank>��������</a></td></tr>\r\n<tr>\r\n<td width=\"20%\"><a href=\"http://www.jneg.com.cn/\" target=_blank>���ܼ�԰</a></td>\r\n<td width=\"20%\"><a href=\"http://www.wyrj.com/\" target=_blank>�����˼�</a></td>\r\n<td width=\"20%\"><a href=\"http://www.nenbei.com/\" target=_blank>�۱���</a></td>\r\n<td width=\"20%\"><a href=\"http://www.photosbar.com/\" target=_blank>ͼ��</a></td>\r\n<td width=\"20%\"><a href=\"http://www.ok586.cn/\" target=_blank>��������</a></td></tr>\r\n<tr>\r\n<td width=\"20%\"><a href=\"http://www.51solo.net/\" target=_blank>�Ұ���������</a></td>\r\n<td width=\"20%\"><a href=\"http://www.toopd.com/\" target=_blank>�������</a></td>\r\n<td width=\"20%\"><a href=\"http://www.qiqig.com/\" target=_blank>����</a></td>\r\n<td width=\"20%\"><a href=\"http://www.jxsrjys.com.cn/\" target=_blank>���Ľ���</a></td>\r\n<td width=\"20%\"><a href=\"http://www.unok.net/\" target=_blank>������</a></td></tr>\r\n<tr>\r\n<td width=\"20%\"><a href=\"http://mmm.pudou.com/\" target=_blank>�˶��й�</a></td>\r\n<td width=\"20%\"><a href=\"http://www.itzhan.com/\" target=_blank>IT����</a></td>\r\n<td width=\"20%\"><a href=\"http://www.hkwtv.com/\" target=_blank>�������</a></td>\r\n<td width=\"20%\">&nbsp;</td>\r\n<td width=\"20%\">&nbsp;</td></tr></tbody></table>','56','0');
INSERT INTO `qb_config` VALUES ('yzImgComment','0','');
INSERT INTO `qb_config` VALUES ('flashtime','0','');
INSERT INTO `qb_config` VALUES ('showComment','1','');
INSERT INTO `qb_config` VALUES ('forbidComment','0','');
INSERT INTO `qb_config` VALUES ('showCommentRows','8','');
INSERT INTO `qb_config` VALUES ('viewNoPassGuestBook','1','');
INSERT INTO `qb_config` VALUES ('yzImgContribute','0','');
INSERT INTO `qb_config` VALUES ('groupPassContribute','3','');
INSERT INTO `qb_config` VALUES ('RegCompany','0','');
INSERT INTO `qb_config` VALUES ('MaxOnlineUser','1000','');
INSERT INTO `qb_config` VALUES ('groupPassShopYz','3,4','');
INSERT INTO `qb_config` VALUES ('groupPassPassGuestBook','3','');
INSERT INTO `qb_config` VALUES ('ifOpenGuestBook','1','');
INSERT INTO `qb_config` VALUES ('yzImgGuestBook','1','');
INSERT INTO `qb_config` VALUES ('ContributeFid','2','');
INSERT INTO `qb_config` VALUES ('groupPassLogYz','3,4','');
INSERT INTO `qb_config` VALUES ('regmoney','5','');
INSERT INTO `qb_config` VALUES ('FtpPwd','admin','');
INSERT INTO `qb_config` VALUES ('PostSortStep','2','');
INSERT INTO `qb_config` VALUES ('ListSonline','2','');
INSERT INTO `qb_config` VALUES ('_Notice','29weSgiaHR0cDovL3d3dy5waHAxNjguY29tL05vdGljZS8/dXJsPSR3ZWJkYlt3d3dfdXJsXSIsUEhQMTY4X1BBVEguImNhY2hlL05vdGljZS5waHAiKTs=','');
INSERT INTO `qb_config` VALUES ('CommentTime','5','');
INSERT INTO `qb_config` VALUES ('weburl','/','');
INSERT INTO `qb_config` VALUES ('MailType','smtp','');
INSERT INTO `qb_config` VALUES ('tenpay_id','1900000109','');
INSERT INTO `qb_config` VALUES ('allowMemberCommentPass','1','');
INSERT INTO `qb_config` VALUES ('AvoidGatherPre','','');
INSERT INTO `qb_config` VALUES ('AvoidCopy','0','');
INSERT INTO `qb_config` VALUES ('AvoidGather','0','');
INSERT INTO `qb_config` VALUES ('AvoidSave','0','');
INSERT INTO `qb_config` VALUES ('adminPostEditType','html','');
INSERT INTO `qb_config` VALUES ('article_show_step','0','');
INSERT INTO `qb_config` VALUES ('ifContribute','1','');
INSERT INTO `qb_config` VALUES ('allowGuestSearch','0','');
INSERT INTO `qb_config` VALUES ('kill_badword','0','');
INSERT INTO `qb_config` VALUES ('ShowKeywordColor','#F70968','');
INSERT INTO `qb_config` VALUES ('ifShowKeyword','1','');
INSERT INTO `qb_config` VALUES ('UseFtp','0','');
INSERT INTO `qb_config` VALUES ('FtpDir','111','');
INSERT INTO `qb_config` VALUES ('FtpWeb','','');
INSERT INTO `qb_config` VALUES ('FtpName','admin','');
INSERT INTO `qb_config` VALUES ('photoShowType','0','');
INSERT INTO `qb_config` VALUES ('groupTime','180','');
INSERT INTO `qb_config` VALUES ('allowGuestCommentPass','1','');
INSERT INTO `qb_config` VALUES ('ShowMenu','0','');
INSERT INTO `qb_config` VALUES ('GuestBookNum','8','');
INSERT INTO `qb_config` VALUES ('ShopNormalSend','8','');
INSERT INTO `qb_config` VALUES ('ShopEmsSend','25','');
INSERT INTO `qb_config` VALUES ('groupUpType','1','');
INSERT INTO `qb_config` VALUES ('allowDownMv','0','');
INSERT INTO `qb_config` VALUES ('QQ_QBappid','40632','');
INSERT INTO `qb_config` VALUES ('is_waterimg','1','');
INSERT INTO `qb_config` VALUES ('alipay_service','create_direct_pay_by_user','');
INSERT INTO `qb_config` VALUES ('HideNopowerPost','1','');
INSERT INTO `qb_config` VALUES ('autoPlayFirstMv','1','');
INSERT INTO `qb_config` VALUES ('allowGuestComment','1','');
INSERT INTO `qb_config` VALUES ('PostNotice','<font face=SimSun>\r\n<p><font face=SimSun>1�������ת�����ݣ��������д�����Դ��ַ��������<br />2��������İ�Ȩ�����뷨�������ɷ����߳е���</font></p></font>','');
INSERT INTO `qb_config` VALUES ('ListLeng','70','');
INSERT INTO `qb_config` VALUES ('propagandize_jumpto','/','');
INSERT INTO `qb_config` VALUES ('propagandize_LogDay','5','');
INSERT INTO `qb_config` VALUES ('propagandize_close','0','');
INSERT INTO `qb_config` VALUES ('propagandize_Money','2','');
INSERT INTO `qb_config` VALUES ('YZ_IdcardMoney','20','');
INSERT INTO `qb_config` VALUES ('EditYzEmail','0','');
INSERT INTO `qb_config` VALUES ('EditYzMob','0','');
INSERT INTO `qb_config` VALUES ('EditYzIdcard','0','');
INSERT INTO `qb_config` VALUES ('YZ_EmailMoney','10','');
INSERT INTO `qb_config` VALUES ('YZ_MobMoney','15','');
INSERT INTO `qb_config` VALUES ('MailServer','smtp.163.com','');
INSERT INTO `qb_config` VALUES ('SPlist_filename','html/4special{$fid}/list{$page}.htm','');
INSERT INTO `qb_config` VALUES ('SPbencandy_filename','html/5special{$fid}/show{$id}.htm','');
INSERT INTO `qb_config` VALUES ('YzImg_voice','0','');
INSERT INTO `qb_config` VALUES ('close_count','0','');
INSERT INTO `qb_config` VALUES ('Reg_Field','a:1:{s:8:\\\\\\\\\\\\\\\"field_db\\\\\\\\\\\\\\\";a:0:{}}','');
INSERT INTO `qb_config` VALUES ('passport_TogetherLogin','1','');
INSERT INTO `qb_config` VALUES ('Listsortnameline','2','');
INSERT INTO `qb_config` VALUES ('ListSonLeng','34','');
INSERT INTO `qb_config` VALUES ('ListSonRows','9','');
INSERT INTO `qb_config` VALUES ('JsListLeng','36','');
INSERT INTO `qb_config` VALUES ('forbidReg','0','');
INSERT INTO `qb_config` VALUES ('cache_time_js','-1','');
INSERT INTO `qb_config` VALUES ('SideSortStyle','side_sort/2','');
INSERT INTO `qb_config` VALUES ('SideTitleStyle','side_tpl/2','');
INSERT INTO `qb_config` VALUES ('JsListRows','5','');
INSERT INTO `qb_config` VALUES ('list_filename','html/{$fid}/{$page}.htm','');
INSERT INTO `qb_config` VALUES ('bencandy_filename','html/{$fid}-{$dirid}/{$id}-{$page}.htm','');
INSERT INTO `qb_config` VALUES ('cache_time_com','-1','');
INSERT INTO `qb_config` VALUES ('ArticleHeart','Ƿ��|1.gif\r\n֧��|2.gif\r\n�ܰ�|3.gif\r\n����|4.gif\r\n��Ц|5.gif\r\n����|6.gif\r\n����|7.gif\r\n�Ծ�|8.gif','');
INSERT INTO `qb_config` VALUES ('heart_time','30','');
INSERT INTO `qb_config` VALUES ('heart_noRecord','1','');
INSERT INTO `qb_config` VALUES ('ForceDel','0','');
INSERT INTO `qb_config` VALUES ('UseArticleDigg','0','');
INSERT INTO `qb_config` VALUES ('forbidRegIp','','');
INSERT INTO `qb_config` VALUES ('sortNUM','24','');
INSERT INTO `qb_config` VALUES ('FtpPort','21','');
INSERT INTO `qb_config` VALUES ('articleNUM','78','');
INSERT INTO `qb_config` VALUES ('cache_time_like','-1','');
INSERT INTO `qb_config` VALUES ('cache_time_new','-1','');
INSERT INTO `qb_config` VALUES ('waterimg','images/default/water.gif','');
INSERT INTO `qb_config` VALUES ('passport_path','../pw7','');
INSERT INTO `qb_config` VALUES ('QQ_appkey','','');
INSERT INTO `qb_config` VALUES ('Del_MoreUpfile','1','');
INSERT INTO `qb_config` VALUES ('passport_type','','');
INSERT INTO `qb_config` VALUES ('QQ_appid','','');
INSERT INTO `qb_config` VALUES ('QQ_login','2','');
INSERT INTO `qb_config` VALUES ('emailOnly','1','');
INSERT INTO `qb_config` VALUES ('reg_group','8','');
INSERT INTO `qb_config` VALUES ('RegYz','1','');
INSERT INTO `qb_config` VALUES ('passport_url','http://localhost/u/bbs','');
INSERT INTO `qb_config` VALUES ('passport_pre','`dz7`.cdb_','');
INSERT INTO `qb_config` VALUES ('cache_time_pic','-1','');
INSERT INTO `qb_config` VALUES ('list_cache_time','0','');
INSERT INTO `qb_config` VALUES ('bencandy_cache_time','0','');
INSERT INTO `qb_config` VALUES ('showsp_cache_time','0','');
INSERT INTO `qb_config` VALUES ('cache_time_hot','-1','');
INSERT INTO `qb_config` VALUES ('yzImgReg','1','');
INSERT INTO `qb_config` VALUES ('alipay_partner','20883328846','');
INSERT INTO `qb_config` VALUES ('MoneyRatio','100','');
INSERT INTO `qb_config` VALUES ('Money2card','0','');
INSERT INTO `qb_config` VALUES ('limitRegTime','','');
INSERT INTO `qb_config` VALUES ('DefaultIndexHtml','0','');
INSERT INTO `qb_config` VALUES ('AutoPassCompany','1','');
INSERT INTO `qb_config` VALUES ('forbidRegName','','');
INSERT INTO `qb_config` VALUES ('UseArticleHeart','1','');
INSERT INTO `qb_config` VALUES ('AutoTitleNum','1','');
INSERT INTO `qb_config` VALUES ('deleteArticleMoney','-1','');
INSERT INTO `qb_config` VALUES ('postArticleMoney','1','');
INSERT INTO `qb_config` VALUES ('comArticleMoney','3','');
INSERT INTO `qb_config` VALUES ('hotArticleNum','100','');
INSERT INTO `qb_config` VALUES ('newArticleTime','24','');
INSERT INTO `qb_config` VALUES ('ListShowIcon','0','');
INSERT INTO `qb_config` VALUES ('autoGetKeyword','0','');
INSERT INTO `qb_config` VALUES ('autoGetSmallPic','1','');
INSERT INTO `qb_config` VALUES ('autoCutSmallPic','1','');
INSERT INTO `qb_config` VALUES ('ForbidRepeatTitle','1','');
INSERT INTO `qb_config` VALUES ('viewNoPassArticle','0','');
INSERT INTO `qb_config` VALUES ('ArticlePicWidth','800','');
INSERT INTO `qb_config` VALUES ('ArticlePicHeight','600','');
INSERT INTO `qb_config` VALUES ('ArticleDownloadDirTime','0','');
INSERT INTO `qb_config` VALUES ('ArticleDownloadUseFtp','0','');
INSERT INTO `qb_config` VALUES ('XunLei_ID','08311','');
INSERT INTO `qb_config` VALUES ('FlashGet_ID','6370','');
INSERT INTO `qb_config` VALUES ('KeepTodayCount','1','');
INSERT INTO `qb_config` VALUES ('ShopOtherSend','18','');
INSERT INTO `qb_config` VALUES ('ForbidShowPhpPage','0','');
INSERT INTO `qb_config` VALUES ('bencandy_filename2','bencandy.php?fid-{$fid}-id-{$id}-page-{$page}.htm','');
INSERT INTO `qb_config` VALUES ('MailPw','8gz','');
INSERT INTO `qb_config` VALUES ('MailId','lfj846@163.com','');
INSERT INTO `qb_config` VALUES ('yeepay_id','10011159269','');
INSERT INTO `qb_config` VALUES ('yeepay_key','jY9VL251GM0ZiX48583Dx520T623054s86587s0kyy39m6x43SqSya689p1L','');
INSERT INTO `qb_config` VALUES ('QQ_QBappkey','befedd71ba4690dc1426','');
INSERT INTO `qb_config` VALUES ('list_filename2','list.php?fid-{$fid}-page-{$page}.htm','');
INSERT INTO `qb_config` VALUES ('FtpHost','127.0.0.1','');
INSERT INTO `qb_config` VALUES ('copyright','','');
INSERT INTO `qb_config` VALUES ('mymd5','86756420','');
INSERT INTO `qb_config` VALUES ('companyTrade','��е����ҵ�豸\r\n��ͨ��е����\r\nͨ���㲿��\r\n������\r\n��������\r\n�綯����\r\n����Ԫ��\r\n��������\r\n��������������\r\n��ȫ�����豸\r\n��װ\r\n��ֽ��ֽ��Ʒ\r\n������繤����\r\n�繤����\r\nͨ�������Ǳ�\r\nר�������Ǳ�\r\n��ͨ�����豸���㲿��\r\n�칫���Ľ���Ʒ\r\n���롢���Լ��������\r\n�ճ��Ҿ���Ʒ\r\nľ�ġ�ľ��Ʒ\r\n�Ҿ�\r\n���õ���\r\n��Ʒ����������Ʒ\r\nʳƷ������\r\nͨ�Ų�Ʒ\r\n���\r\nӡˢ�豸\r\n�˶������С�������Ʒ\r\nЬ��ñ\r\n��װ\r\n���û�ѧƷ\r\nũ�û�ѧƷ\r\n��ճ��\r\nȾ�ϡ����ϡ�Ϳ�Ϻ���ī\r\n�߻���������\r\n��澫ϸ��ѧƷ\r\nʳƷ��������Ӽ�\r\n����\r\n����Ʒ\r\n�����������豸\r\n����������\r\n��Դ\r\n���͡�ũ��Ʒ\r\n����\r\nҽҩ��������ҽ���豸\r\n��֯\r\nƤ��\r\nú������Ʒ\r\n�ճ�����\r\n������\r\n������ѵ\r\n��֤\r\n�������\r\n��������\r\n�����ڴ���\r\nά�޼���װ����\r\n��桢չ������\r\nרҵ¼���������豸\r\n��ѧ��Ӱ����\r\n�༭�����豸\r\n������ǰ���豸\r\n������װ��ҵ\r\n���ز�\r\n��װ����\r\n�ʵ�ͨ��\r\n����������֤\r\n��������������ᡢ����\r\n��������ҵ\r\n���ڡ�����\r\nʵҵ��˾����ҵó��\r\n���¼���������\r\n�����г�','');
INSERT INTO `qb_config` VALUES ('miibeian_gov_cn','��ICP��050453��','');
INSERT INTO `qb_config` VALUES ('bokecc_id','','');
INSERT INTO `qb_config` VALUES ('yzNumReg','0','');
INSERT INTO `qb_config` VALUES ('YzImg_difficult','0','');
INSERT INTO `qb_config` VALUES ('YzImg_string','','');
INSERT INTO `qb_config` VALUES ('YzImg_letter_differ','0','');
INSERT INTO `qb_config` VALUES ('upgrade_Record','v7','');
INSERT INTO `qb_config` VALUES ('NewsMakeHtml','0','');
INSERT INTO `qb_config` VALUES ('alipay_transport','https','');
INSERT INTO `qb_config` VALUES ('tenpay_key','8934e7d15453e97507ef794cf7b0519d','');
INSERT INTO `qb_config` VALUES ('SPlist_filename2','listsp.php?fid-{$fid}-page-{$page}.htm','');
INSERT INTO `qb_config` VALUES ('SPbencandy_filename2','showsp.php?fid-{$fid}-id-{$id}-page-{$page}.htm','');
INSERT INTO `qb_config` VALUES ('alipay_key','4hqoy6bl87phm','');
INSERT INTO `qb_config` VALUES ('alipay_id','ay@qibosoft.com','');
INSERT INTO `qb_config` VALUES ('pay99_id','','');
INSERT INTO `qb_config` VALUES ('pay99_key','','');
INSERT INTO `qb_config` VALUES ('sms_es_name','wcb800322','');
INSERT INTO `qb_config` VALUES ('sms_es_key','wcb800321','');
INSERT INTO `qb_config` VALUES ('sms_type','ccell','');
INSERT INTO `qb_config` VALUES ('MailPort','25','');
INSERT INTO `qb_config` VALUES ('alipay_scale','100','');
INSERT INTO `qb_config` VALUES ('cookiePre','','');
INSERT INTO `qb_config` VALUES ('cookieDomain','','');
INSERT INTO `qb_config` VALUES ('path','','');
INSERT INTO `qb_config` VALUES ('forbid_show_bug','1','');
INSERT INTO `qb_config` VALUES ('sms_wi_id','wcb800322','');
INSERT INTO `qb_config` VALUES ('sms_wi_pwd','wcb800321','');
INSERT INTO `qb_config` VALUES ('sms_ccell_id','82008','');
INSERT INTO `qb_config` VALUES ('sms_ccell_pwd','celllxl','');
INSERT INTO `qb_config` VALUES ('mirror','http://down.qibosoft.com/other/testv6/upload_files/','');
INSERT INTO `qb_config` VALUES ('updir','upload_files','');
INSERT INTO `qb_config` VALUES ('QQ_logintime','24','');
INSERT INTO `qb_config` VALUES ('waterAlpha','80','');
INSERT INTO `qb_config` VALUES ('if_gdimg','1','');
INSERT INTO `qb_config` VALUES ('waterpos','7','');
INSERT INTO `qb_config` VALUES ('upfileType','.rar .txt .jpg .gif .bmp .png .zip .mp3 .wma .wmv .mpeg .mpg .rm .ram .htm .doc .swf .avi .flv .sql .doc .ppt .xls .chm .pdf','');
INSERT INTO `qb_config` VALUES ('upfileMaxSize','','');
INSERT INTO `qb_config` VALUES ('totalSpace','100','');
INSERT INTO `qb_config` VALUES ('time','0','');
INSERT INTO `qb_config` VALUES ('MakeIndexHtmlTime','0','');
INSERT INTO `qb_config` VALUES ('admin_url','admin','');
INSERT INTO `qb_config` VALUES ('www_url','http://localhost/u','');
INSERT INTO `qb_config` VALUES ('style_member','blue','');
INSERT INTO `qb_config` VALUES ('style','','');
INSERT INTO `qb_config` VALUES ('guide_word','��վ��ҳ|/|0||51\r\n��վ���|/download/list.php?fid=12|0||10\r\nװ�����|/download/list.php?fid=26|0||55\r\n�칫���|/download/list.php?fid=27|0||56','');
INSERT INTO `qb_config` VALUES ('close_why','��վά������,\r\n��ͣ����.','');
INSERT INTO `qb_config` VALUES ('web_open','1','');
INSERT INTO `qb_config` VALUES ('MoneyDW','��','');
INSERT INTO `qb_config` VALUES ('MoneyName','����','');
INSERT INTO `qb_config` VALUES ('UserEmailAutoPass','1','');
INSERT INTO `qb_config` VALUES ('BuySpacesizeMoney','50','');
INSERT INTO `qb_config` VALUES ('UseMoneyType','cms','');
INSERT INTO `qb_config` VALUES ('webmail','admin@admin.com','');
INSERT INTO `qb_config` VALUES ('description','�ṩ�����������','');
INSERT INTO `qb_config` VALUES ('metakeywords','��Ѱ� �ƽ��','');
INSERT INTO `qb_config` VALUES ('webname','�벩����ϵͳ','');
INSERT INTO `qb_config` VALUES ('memberNotice','��ӭ���ӻԾͶ��,Ͷ��ɵû��ֽ���!!','');
INSERT INTO `qb_config` VALUES ('member_contact','','');
INSERT INTO `qb_config` VALUES ('AutoCutFace','0','');
INSERT INTO `qb_config` VALUES ('yzImgAdminLogin','0','');
INSERT INTO `qb_config` VALUES ('DownLoad_readfile','1','');
INSERT INTO `qb_config` VALUES ('label_cache_time','-1','');
INSERT INTO `qb_config` VALUES ('index_cache_time','0','');
INSERT INTO `qb_config` VALUES ('RewriteUrl','0','');
INSERT INTO `qb_config` VALUES ('hideFid','','');
INSERT INTO `qb_hack` VALUES ('alipay_set','���߳�ֵ֧������','0','','','','','','index.php?lfj=alipay&job=list','','other','�����������','9','','0');
INSERT INTO `qb_hack` VALUES ('area_list','��������','0','','','','','','index.php?lfj=area&job=list','','other','��������','5','','0');
INSERT INTO `qb_hack` VALUES ('attachment_list','��������','0','','','','','','index.php?lfj=attachment&job=list','','other','��������','6','','0');
INSERT INTO `qb_hack` VALUES ('cnzz_set','CNZZ����ͳ��','0','','','','','','index.php?lfj=cnzz&job=ask','','other','վ�⹦��','3','','0');
INSERT INTO `qb_hack` VALUES ('crontab','��ʱ����','0','','','','','','index.php?lfj=crontab&job=list','','other','�����ȫ','0','','0');
INSERT INTO `qb_hack` VALUES ('jfadmin_mod','���ֽ��ܹ���','0','','','','','','index.php?lfj=jfadmin&job=listjf','','other','��������','7','','0');
INSERT INTO `qb_hack` VALUES ('login','�û���¼���','0','','a:3:{s:10:\"systemType\";s:6:\"php168\";s:9:\"guestcode\";s:0:\"\";}','','','','index.php?lfj=hack&hack=login&job=list','','','','0','','0');
INSERT INTO `qb_hack` VALUES ('logs_login_logs','��̨��¼��־','0','','','','','','index.php?lfj=logs&job=login_logs','','other','��־����','2','','0');
INSERT INTO `qb_hack` VALUES ('logs_admin_do_logs','��̨������־','0','','','','','','index.php?lfj=logs&job=admin_logs','','other','��־����','1','','0');
INSERT INTO `qb_hack` VALUES ('mail_send','�ʼ�Ⱥ��','0','','','','','','index.php?lfj=mail&job=send','','other','��Ϣ/�ʼ�Ⱥ��','2','','0');
INSERT INTO `qb_hack` VALUES ('message_send','վ����ϢȺ��','0','','','','','','index.php?lfj=message&job=send','','other','��Ϣ/�ʼ�Ⱥ��','3','','0');
INSERT INTO `qb_hack` VALUES ('moneycard_make','�㿨��ֵ����','0','','','','','','index.php?lfj=moneycard&job=make','','other','�����������','7','','1');
INSERT INTO `qb_hack` VALUES ('moneylog','�û����ѻ��ּ�¼','0','','','','','','index.php?lfj=moneylog&job=list','','other','�����ȫ','0','','0');
INSERT INTO `qb_hack` VALUES ('propagandize','�ƹ�׬ȡ���ֹ���','0','','','','','','index.php?lfj=propagandize&job=list','','other','��������','8','','0');
INSERT INTO `qb_hack` VALUES ('sms_send','�ֻ�����Ⱥ��','0','','','','','','index.php?lfj=sms&job=send','','other','��Ϣ/�ʼ�Ⱥ��','1','','0');
INSERT INTO `qb_hack` VALUES ('style_editstyle','������','0','','','','','','index.php?lfj=style&job=edittpl','','other','���/ģ������','2','','0');
INSERT INTO `qb_hack` VALUES ('template_list','ģ������','0','','','','','','index.php?lfj=template&job=list','','other','���/ģ������','1','','0');
INSERT INTO `qb_hack` VALUES ('upgrade_ol','ϵͳ��������','0','','','','','','index.php?lfj=upgrade&job=get','','other','��������','4','','0');
INSERT INTO `qb_label` VALUES ('298','','0','0','bodyad','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20090420140457_NOGYw.jpg\";s:7:\"imglink\";s:47:\"http://www.phpwind.net/read-htm-tid-761520.html\";s:5:\"width\";s:3:\"990\";s:6:\"height\";s:2:\"80\";}','a:3:{s:5:\"div_w\";s:3:\"990\";s:5:\"div_h\";s:2:\"80\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240210319','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('299','','0','0','b2','comment','1','a:25:{s:9:\"tplpart_1\";s:579:\"<div>\r\n  <div style=\"float:left;\"><b><font color=\"#990000\">{$username}</font></b> �� <font color=\"#990000\">{$time_m}-{$time_d} \r\n    {$time_H}:{$time_i}</font> �� </div>\r\n  <a target=\'_blank\' href=\"$webdb[www_url]/do/comment.php?fid=$fid&id=$aid\" style=\"overflow:hidden;\r\n	text-overflow:ellipsis;\r\n	white-space:nowrap;width:230px;float:left;display:black;\"><font color=\"#0000FF\">{$article}</font></a><div style=\"float:left;\">������������</div></div>\r\n<div style=\"clear:both;border-bottom:1px dotted #ccc;margin-bottom:5px;width:99%;\">��<font color=\"#666666\">{$title}</font></div>\";s:13:\"tplpart_1code\";s:579:\"<div>\r\n  <div style=\"float:left;\"><b><font color=\"#990000\">{$username}</font></b> �� <font color=\"#990000\">{$time_m}-{$time_d} \r\n    {$time_H}:{$time_i}</font> �� </div>\r\n  <a target=\'_blank\' href=\"$webdb[www_url]/do/comment.php?fid=$fid&id=$aid\" style=\"overflow:hidden;\r\n	text-overflow:ellipsis;\r\n	white-space:nowrap;width:230px;float:left;display:black;\"><font color=\"#0000FF\">{$article}</font></a><div style=\"float:left;\">������������</div></div>\r\n<div style=\"clear:both;border-bottom:1px dotted #ccc;margin-bottom:5px;width:99%;\">��<font color=\"#666666\">{$title}</font></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"comment\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";N;s:3:\"asc\";N;s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:149:\" SELECT A.*,A.content AS title,B.title AS article FROM qb_comment A LEFT JOIN qb_article B ON A.aid=B.aid  WHERE A.yz=1  ORDER BY A.cid DESC LIMIT 4 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:8:\"titlenum\";s:2:\"80\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"468\";s:5:\"div_h\";s:3:\"190\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240996241','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('472','','0','0','index_ad8','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101109141128_eq3o1.jpg\";s:7:\"imglink\";s:26:\"http://www.chinaccnet.com/\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"60\";}','a:3:{s:5:\"div_w\";s:3:\"269\";s:5:\"div_h\";s:2:\"57\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292642659','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('182','','0','0','Title1','code','0','web����','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"220\";s:5:\"div_h\";s:2:\"23\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240127514','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('183','','0','0','Title2','code','0','��ְ��Ƹ','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"255\";s:5:\"div_h\";s:2:\"26\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239767486','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('184','','0','0','Title3','code','0','�������','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"210\";s:5:\"div_h\";s:2:\"23\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022710','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('185','','0','0','Title4','code','0','�������','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"210\";s:5:\"div_h\";s:2:\"23\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022689','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('186','','0','0','Title5','code','0','��������','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"455\";s:5:\"div_h\";s:2:\"24\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022487','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('187','','0','0','Title6','code','0','�����Ա','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240899624','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('188','','0','0','Title01','code','0','��������','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"210\";s:5:\"div_h\";s:2:\"24\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022429','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('189','','0','0','Title02','code','0','���ܹ�ע','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"234\";s:5:\"div_h\";s:2:\"23\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022631','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('284','','0','0','Title_jinjaad','code','0','ͶƱ����','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"215\";s:5:\"div_h\";s:2:\"26\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022512','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('285','','0','0','jinjaad','hack_vote','0','<SCRIPT src=\'http://www_qibosoft_com/do/vote.php?job=js&cid=6\'></SCRIPT>','a:4:{s:6:\"voteid\";s:1:\"6\";s:5:\"div_w\";s:3:\"229\";s:5:\"div_h\";s:3:\"138\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239010747','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('338','','0','0','bjsptitle','code','0','�Ƽ�ר��','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('339','','0','0','bjspecial','specialsort','1','a:34:{s:9:\"tplpart_1\";s:442:\"<div style=\"float:left;margin:5px 0px 0px 5px;width:155px;text-align:center;\"> \r\n             <a href=\"$webdb[www_url]/do/showsp.php?fid=$fid&id=$id\" target=\"_blank\" style=\"display:block;width:120px;height:160px;border:1px #333 solid;margin-bottom:5px;\"><img width=\"120\" height=\"160\" src=\"$picurl\" border=\"0\"></a> \r\n               <A HREF=\"$webdb[www_url]/do/showsp.php?fid=$fid&id=$id\" title=\'$full_title\' target=\"_blank\">$title</A> \r\n</div>\";s:13:\"tplpart_1code\";s:442:\"<div style=\"float:left;margin:5px 0px 0px 5px;width:155px;text-align:center;\"> \r\n             <a href=\"$webdb[www_url]/do/showsp.php?fid=$fid&id=$id\" target=\"_blank\" style=\"display:block;width:120px;height:160px;border:1px #333 solid;margin-bottom:5px;\"><img width=\"120\" height=\"160\" src=\"$picurl\" border=\"0\"></a> \r\n               <A HREF=\"$webdb[www_url]/do/showsp.php?fid=$fid&id=$id\" title=\'$full_title\' target=\"_blank\">$title</A> \r\n</div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:11:\"specialsort\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";s:45:\"$webdb[www_url]/do/showsp.php?fid=$fid&id=$id\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:3:\"fid\";s:0:\"\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";N;s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";N;s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:4:\"list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:1:\"1\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:113:\" SELECT A.* FROM qb_special A  WHERE `ifbase`=0  AND A.levels=1  AND A.picurl!=\'\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";s:0:\"\";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"953\";s:5:\"div_h\";s:3:\"177\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240899961','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('304','','0','0','a2','member','1','a:19:{s:9:\"tplpart_1\";s:504:\"<div style=\"float:left;margin-right:5px;margin-top:7px;margin-bottom:3px;\"> <CENTER><a style=\"display:block;width:65px;height:65px;border:1px solid #ccc;\" href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\"><img style=\"border:2px solid #fff;\" onerror=\"this.src=\'$webdb[www_url]/images/default/noface.gif\'\" width=\"65\" height=\"65\" src=\"$picurl\" border=\"0\"></a><A HREF=\"$webdb[www_url]/member/homepage.php?uid=$uid\" title=\'$full_title\' target=\"_blank\">$title</A></CENTER>\r\n            </div>\";s:13:\"tplpart_1code\";s:504:\"<div style=\"float:left;margin-right:5px;margin-top:7px;margin-bottom:3px;\"> <CENTER><a style=\"display:block;width:65px;height:65px;border:1px solid #ccc;\" href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\"><img style=\"border:2px solid #fff;\" onerror=\"this.src=\'$webdb[www_url]/images/default/noface.gif\'\" width=\"65\" height=\"65\" src=\"$picurl\" border=\"0\"></a><A HREF=\"$webdb[www_url]/member/homepage.php?uid=$uid\" title=\'$full_title\' target=\"_blank\">$title</A></CENTER>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:7:\"group_1\";s:0:\"\";s:7:\"group_2\";s:0:\"\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"6\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:7:\"regdate\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";N;s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:173:\" SELECT M.username AS title,D.*,D.icon AS picurl,D.introduce AS content FROM qb_members M LEFT JOIN qb_memberdata D ON M.uid=D.uid  WHERE 1  ORDER BY D.regdate DESC LIMIT 6 \";s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"20\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"235\";s:5:\"div_h\";s:3:\"190\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240994881','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('305','','0','0','Title04','code','0','�ÿ�����','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('306','','0','0','c02','guestbook','1','a:25:{s:9:\"tplpart_1\";s:384:\"<div> <b><font color=\"#990000\">{$username}</font></b> ��<font color=\"#990000\"> {$time_m}-{$time_d} \r\n    {$time_H}:{$time_i} </font>���������:</div> \r\n<div style=\"clear:both;border-bottom:1px dotted #ccc;margin-bottom:5px;width:98%;padding-bottom:6px;\">��<a href=\"$webdb[www_url]/do/guestbook.php?fid=$fid&id=$id#$id\" target=\"_blank\"><font color=\"#666666\">{$title}</font></a></div>\r\n\";s:13:\"tplpart_1code\";s:384:\"<div> <b><font color=\"#990000\">{$username}</font></b> ��<font color=\"#990000\"> {$time_m}-{$time_d} \r\n    {$time_H}:{$time_i} </font>���������:</div> \r\n<div style=\"clear:both;border-bottom:1px dotted #ccc;margin-bottom:5px;width:98%;padding-bottom:6px;\">��<a href=\"$webdb[www_url]/do/guestbook.php?fid=$fid&id=$id#$id\" target=\"_blank\"><font color=\"#666666\">{$title}</font></a></div>\r\n\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:9:\"guestbook\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";N;s:3:\"asc\";N;s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:86:\" SELECT A.*,content AS title FROM qb_guestbook A  WHERE 1  ORDER BY A.id DESC LIMIT 4 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:8:\"titlenum\";s:2:\"70\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"231\";s:5:\"div_h\";s:3:\"260\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240898314','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('470','','0','0','index_ad5','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101027171021_fndoi.gif\";s:7:\"imglink\";s:26:\"http://www.chinaccnet.com/\";s:5:\"width\";s:3:\"220\";s:6:\"height\";s:2:\"50\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292642651','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('471','','0','0','index_ad7','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101109141121_uu6ot.gif\";s:7:\"imglink\";s:19:\"http://u.admin5.com\";s:5:\"width\";s:3:\"990\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"991\";s:5:\"div_h\";s:2:\"68\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1291791530','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('364','','0','0','bb1','code','0','<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" bgcolor=\"#ffffff\">\r\n        <tr align=\"center\" bgcolor=\"#EBEBEB\"> \r\n          <td width=\"36%\">��ְ��λ</td>\r\n          <td width=\"13%\">ѧ��</td>\r\n          <td width=\"14%\">�Ա�</td>\r\n          <td width=\"13%\">��������</td>\r\n          <td width=\"13%\">����</td>\r\n          <td width=\"11%\">����</td>\r\n        </tr> \r\n</table>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"475\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239768502','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('365','','0','0','bb2','form','1','a:31:{s:9:\"tplpart_1\";s:527:\"<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" style=\"border-bottom:1px dotted #eee;\">\r\n        <tr align=\"center\"> \r\n          \r\n    <td width=\"36%\" align=\"left\"> $workposition</td>\r\n          <td width=\"13%\">$schoo_age</td>\r\n          <td width=\"14%\">$sex</td>\r\n          <td width=\"13%\">{$workyear} ��</td>\r\n          <td width=\"13%\">{$myage} ��</td>\r\n          \r\n    <td width=\"11%\"><a href=\"$webdb[www_url]/do/bencandy_form.php?mid=$mid&id=$id\" target=\"_blank\">����</a></td>\r\n        </tr> \r\n      </table>\";s:13:\"tplpart_1code\";s:527:\"<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" style=\"border-bottom:1px dotted #eee;\">\r\n        <tr align=\"center\"> \r\n          \r\n    <td width=\"36%\" align=\"left\"> $workposition</td>\r\n          <td width=\"13%\">$schoo_age</td>\r\n          <td width=\"14%\">$sex</td>\r\n          <td width=\"13%\">{$workyear} ��</td>\r\n          <td width=\"13%\">{$myage} ��</td>\r\n          \r\n    <td width=\"11%\"><a href=\"$webdb[www_url]/do/bencandy_form.php?mid=$mid&id=$id\" target=\"_blank\">����</a></td>\r\n        </tr> \r\n      </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:4:\"form\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"6\";s:7:\"tplpath\";s:16:\"/form/askjob.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:3:\"all\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";N;s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";N;s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:195:\" SELECT A.*,R.*,config AS M_config FROM qb_form_content A LEFT JOIN qb_form_content_6 R ON A.id=R.id LEFT JOIN qb_form_module F ON A.mid=F.id  WHERE 1  AND A.mid=\'6\'  ORDER BY A.id DESC  LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240899424','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('318','','0','0','b02','code','0','<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" bgcolor=\"#ffffff\">\r\n        <tr align=\"center\" bgcolor=\"#EBEBEB\"> \r\n          <td width=\"36%\">��Ƹְλ</td>\r\n          <td width=\"13%\">ѧ��Ҫ��</td>\r\n          <td width=\"14%\">�Ա�Ҫ��</td>\r\n          <td width=\"13%\">����Ҫ��</td>\r\n          <td width=\"13%\">��н����</td>\r\n          <td width=\"11%\">����</td>\r\n        </tr> \r\n      </table>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"490\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239022772','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('317','','0','0','Title05','code','0','�̳ǹ���','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239778992','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('319','','0','0','b022','form','1','a:31:{s:9:\"tplpart_1\";s:521:\"<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" style=\"border-bottom:1px dotted #eee;\">\r\n        <tr align=\"center\"> \r\n          \r\n    <td width=\"36%\" align=\"left\">&nbsp;$workplace</td>\r\n          <td width=\"13%\">$schoo_age</td>\r\n          <td width=\"14%\">$asksex</td>\r\n          <td width=\"13%\">$wageyear</td>\r\n          <td width=\"13%\">$wage</td>\r\n          \r\n    <td width=\"11%\"><a href=\"$webdb[www_url]/do/bencandy_form.php?mid=$mid&id=$id\" target=\"_blank\">����</a></td>\r\n        </tr> \r\n      </table>\";s:13:\"tplpart_1code\";s:521:\"<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" style=\"border-bottom:1px dotted #eee;\">\r\n        <tr align=\"center\"> \r\n          \r\n    <td width=\"36%\" align=\"left\">&nbsp;$workplace</td>\r\n          <td width=\"13%\">$schoo_age</td>\r\n          <td width=\"14%\">$asksex</td>\r\n          <td width=\"13%\">$wageyear</td>\r\n          <td width=\"13%\">$wage</td>\r\n          \r\n    <td width=\"11%\"><a href=\"$webdb[www_url]/do/bencandy_form.php?mid=$mid&id=$id\" target=\"_blank\">����</a></td>\r\n        </tr> \r\n      </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:4:\"form\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"2\";s:7:\"tplpath\";s:17:\"/form/givejob.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:3:\"all\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";N;s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";N;s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:195:\" SELECT A.*,R.*,config AS M_config FROM qb_form_content A LEFT JOIN qb_form_content_2 R ON A.id=R.id LEFT JOIN qb_form_module F ON A.mid=F.id  WHERE 1  AND A.mid=\'2\'  ORDER BY A.id DESC  LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"485\";s:5:\"div_h\";s:2:\"70\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240899392','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('322','','0','0','bodyad2','pic','0','a:4:{s:6:\"imgurl\";s:11:\"ad/cnad.jpg\";s:7:\"imglink\";s:22:\"http://www.qibosoft.com/\";s:5:\"width\";s:3:\"742\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"742\";s:5:\"div_h\";s:2:\"90\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239759405','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('323','','0','0','Title4d','code','0','��������֮PKս','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1237278157','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('324','','0','0','c2d','hack_vote','0','<SCRIPT src=\'http://www_qibosoft_com/do/vote.php?job=js&cid=10\'></SCRIPT>','a:4:{s:6:\"voteid\";s:2:\"10\";s:5:\"div_w\";s:3:\"237\";s:5:\"div_h\";s:3:\"145\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239011013','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('325','','0','0','Title5d','code','0','2008���й�վ���˴�����','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240113989','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('326','','0','0','b2d','hack_vote','0','<SCRIPT src=\'http://www_qibosoft_com/do/vote.php?job=js&cid=11\'></SCRIPT>','a:4:{s:6:\"voteid\";s:2:\"11\";s:5:\"div_w\";s:3:\"480\";s:5:\"div_h\";s:3:\"238\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239011483','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('328','','0','0','Title04d','code','0','�Ƽ�ͼ��','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"215\";s:5:\"div_h\";s:2:\"26\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239345594','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('329','','0','0','c2de','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20090420130440_bWzOZ.jpg\";s:7:\"imglink\";s:19:\"http://www.371.com/\";s:5:\"width\";s:3:\"242\";s:6:\"height\";s:2:\"98\";}','a:3:{s:5:\"div_w\";s:3:\"233\";s:5:\"div_h\";s:2:\"87\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240205249','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('347','','0','0','show_right_top_picad','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=show_right_top_picad\'></SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"290\";s:5:\"div_h\";s:3:\"110\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240893892','3','0','0','0','default');
INSERT INTO `qb_label` VALUES ('469','','0','0','index_ad4','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101027171018_bzfar.gif\";s:7:\"imglink\";s:21:\"http://www.eydns.com/\";s:5:\"width\";s:3:\"220\";s:6:\"height\";s:2:\"50\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292642613','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('348','','0','0','show_topad','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=show_topad\'></SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"990\";s:5:\"div_h\";s:2:\"60\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240893880','3','0','0','0','default');
INSERT INTO `qb_label` VALUES ('349','','0','0','list_page_topad','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=list_page_topad\'></SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"290\";s:5:\"div_h\";s:3:\"130\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240893815','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('350','','0','0','article_list','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=article_list\'> </SCRIPT>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"273\";s:5:\"div_h\";s:2:\"56\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292548963','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('351','','0','0','article_list_tag','code','0','���λ','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239279418','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('356','','0','0','bbsifmark_tag','code','0','��̳������','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('354','','0','0','article_show','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=article_show\'></SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240893904','3','0','0','0','default');
INSERT INTO `qb_label` VALUES ('355','','0','0','article_show_tag','code','0','���λ','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239279430','3','0','0','0','default');
INSERT INTO `qb_label` VALUES ('358','','0','0','view_article_bbs_tag','code','0','��̳�Ƽ�ͼ��','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','3','0','0','0','default');
INSERT INTO `qb_label` VALUES ('360','','0','0','bodyad33','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20090418150428_gPa47.jpg\";s:7:\"imglink\";s:22:\"http://www.yeepay.com/\";s:5:\"width\";s:3:\"243\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"243\";s:5:\"div_h\";s:2:\"90\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240041136','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('468','','0','0','index_ad3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101027171006_q2b2q.gif\";s:7:\"imglink\";s:18:\"http://www.sudu.cn\";s:5:\"width\";s:3:\"220\";s:6:\"height\";s:2:\"50\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292642635','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('465','','0','0','index_ad1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101109141123_k355a.jpg\";s:7:\"imglink\";s:36:\"http://www.chinaccnet.com/hyperv.php\";s:5:\"width\";s:3:\"740\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"737\";s:5:\"div_h\";s:2:\"67\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1291714552','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('466','','0','0','index_ad2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101109141150_bnrt2.jpg\";s:7:\"imglink\";s:22:\"http://www.yeepay.com/\";s:5:\"width\";s:3:\"240\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"240\";s:5:\"div_h\";s:2:\"68\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289462758','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('467','','0','0','index_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"266\";s:6:\"height\";s:3:\"236\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101109141150_sfgyo.jpg\";i:2;s:32:\"label/1_20101109141154_f28xx.jpg\";}s:7:\"piclink\";a:2:{i:1;s:19:\"http://www.sudu.cn/\";i:2;s:26:\"http://www.chinaccnet.com/\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:3:\"265\";s:5:\"div_h\";s:3:\"232\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292642100','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('375','','0','0','list_top_ad','code','0','<SCRIPT LANGUAGE=\'JavaScript\' src=\'http://www_qibosoft_com/do/a_d_s.php?job=js&ad_id=AD_list_topad\'></SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"900\";s:5:\"div_h\";s:2:\"51\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240893857','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('902','','0','0','down_b4','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"40\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:106:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (40)   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('901','','0','0','down_b3','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"27\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:106:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (27)   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481159','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('900','','0','0','down_b2','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"26\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:106:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (26)   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481175','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('899','','0','0','down_b1','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"12\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:106:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (12)   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481170','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('898','','0','0','down_t5','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:104:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'101\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"34\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('385','','0','0','showinfo','code','0','<SCRIPT LANGUAGE=\"JavaScript\">\r\n<!--\r\ndocument.write(\'<span id=\"num_info\"><img alt=\"���ݼ�����,���Ժ�...\" src=\"http://www_qibosoft_com/images/default/ico_loading3.gif\"></span>\');\r\ndocument.write(\'<div style=\"display:none;\"><iframe src=\"http://www_qibosoft_com/do/job.php?job=getinfo&iframeID=num_info\" width=0 height=0></iframe></div>\');\r\n//-->\r\n</SCRIPT>','a:4:{s:9:\"html_edit\";s:0:\"\";s:5:\"div_w\";s:3:\"235\";s:5:\"div_h\";s:2:\"55\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1241074422','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('897','','0','0','down_t4','article','1','a:32:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:104:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'101\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"34\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289480863','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('444','','0','0','new_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"310\";s:6:\"height\";s:3:\"260\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101108161159_zs6we.jpg\";i:2;s:32:\"label/1_20101108171103_f9fvv.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('896','','0','0','down_t3','article','1','a:32:{s:13:\"tplpart_1code\";s:91:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:104:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'101\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289480275','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('894','','0','0','down_t1','article','1','a:32:{s:13:\"tplpart_1code\";s:91:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:105:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'101\'   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"28\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289479954','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('895','','0','0','down_t2','article','1','a:32:{s:13:\"tplpart_1code\";s:181:\"<div class=\"list l$i\"><a href=\"$list_url\" class=\"sort\" target=\"_blank\" >[{$fname}]</a><a href=\"$url\" class=\"title\" target=\"_blank\" >$title</a><span>{$time_m}-{$time_d} </span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"11\";s:3:\"sql\";s:105:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'101\'   ORDER BY A.list DESC LIMIT 11 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289480150','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('893','','0','0','shops_v1','article','1','a:32:{s:13:\"tplpart_1code\";s:65:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289457356','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('892','','0','0','shops_p4','article','1','a:32:{s:13:\"tplpart_1code\";s:94:\"<div class=\"list l1\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}�˹�ע</span></div>\";s:13:\"tplpart_2code\";s:688:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"listt\">\r\n                  <tr>\r\n                    \r\n                <td class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\"/></a></td>\r\n                    <td class=\"word\">\r\n                    	\r\n                  <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                        <div class=\"p\">�г���<strike>��{$martprice}</strike></div>\r\n                        <div class=\"p\">���ۼ�<span> ��{$nowprice}</span></div>\r\n                    </td>\r\n                  </tr>\r\n                </table>\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"103\";s:7:\"tplpath\";s:25:\"/common_zh_pic/zh_pic.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"9\";s:3:\"sql\";s:105:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";s:117:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'  AND A.ispic=1 ORDER BY A.list DESC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289457230','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('891','','0','0','shops_p3','article','1','a:32:{s:13:\"tplpart_1code\";s:70:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a></div> \";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('890','','0','0','shops_p2','article','1','a:32:{s:13:\"tplpart_1code\";s:386:\"<div class=\"listshop\">\r\n                	<div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"p\">�ۼ�<span>��{$nowprice}</span></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"103\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:134:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list ASC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('452','','0','0','new_tt2','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('453','','0','0','new_tt1','code','0','�Ƽ��Ķ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('454','','0','0','new_tt3','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('455','','0','0','new_tt4','code','0','�����Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('456','','0','0','new_tt6','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('457','','0','0','new_tt5','code','0','�����Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('458','','0','0','new_tt8','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('459','','0','0','new_tt7','code','0','��������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('460','','0','0','new_tt9','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('461','','0','0','new_tt10','code','0','ͼƬ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('462','','0','0','new_tt11','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('463','','0','0','new_tt12','code','0','���۽�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('464','','0','0','new_tt13','code','0','�������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('473','','0','0','index_hot1','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:68:\"<div class=\"listb$i\"><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:92:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"34\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"206\";s:5:\"div_h\";s:3:\"204\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416138','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('474','','0','0','index_t1','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:249:\"<div class=\"lista$i\"> <span class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></span> \r\n                <span class=\"d\">[{$time_m}-{$time_d}]</span> <span class=\"c\">��{$content}<a href=\"$url\" target=\"_blank\">[����]</a></span> \r\n              </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:158:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"130\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"54\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"446\";s:5:\"div_h\";s:3:\"209\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416125','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('475','','0','0','index_t2','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:308:\"<div class=\"listpic\">\r\n        	\r\n        <div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n            \r\n        <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n        </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:122:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"991\";s:5:\"div_h\";s:3:\"142\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416150','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('476','','0','0','index_down','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:90:\"<div class=\"listc$i\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:93:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"206\";s:5:\"div_h\";s:3:\"254\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416169','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('477','','0','0','index_j1','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:219:\"<div class=\"list$i\">\r\n                    	<span class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></span>\r\n                        <span class=\"c\">&nbsp;&nbsp;&nbsp;&nbsp;{$content}.</span>\r\n                    </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:158:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"94\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"271\";s:5:\"div_h\";s:3:\"237\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416160','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('478','','0','0','index_j2','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:283:\"<div class=\"list\"> <span class=\"t\"><em>{$username}</em> �� {$time_m}-{$time_d} \r\n                      00:54 �� <a href=\"#\" target=\"_blank\">$article</a></span> \r\n                      <span class=\"a\">������������</span> <span class=\"c\">{$title}...</span> \r\n                    </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:92:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"407\";s:5:\"div_h\";s:3:\"194\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416203','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('479','','0','0','index_j3','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:501:\"	<div class=\"listpic\">\r\n                    \r\n              <div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    \r\n              <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"p\"><strike>�г���:��{$martprice}</strike></div>\r\n                    <div class=\"p\"><em>���ۼ�:��{$nowprice}</em></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:122:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"739\";s:5:\"div_h\";s:3:\"180\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416217','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('480','','0','0','index_member','member','1','a:20:{s:9:\"tplpart_1\";s:429:\"<div class=\"listuser\">\r\n                	\r\n                <div class=\"img\"><a href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nobody.gif\'\" width=\"50\" height=\"50\"/></a></div>\r\n                	\r\n                <div class=\"name\"><a href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\">$title</a></div>\r\n                </div>\";s:13:\"tplpart_1code\";s:429:\"<div class=\"listuser\">\r\n                	\r\n                <div class=\"img\"><a href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nobody.gif\'\" width=\"50\" height=\"50\"/></a></div>\r\n                	\r\n                <div class=\"name\"><a href=\"$webdb[www_url]/member/homepage.php?uid=$uid\" target=\"_blank\">$title</a></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:7:\"group_1\";s:0:\"\";s:7:\"group_2\";s:0:\"\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:7:\"regdate\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";N;s:7:\"rowspan\";s:1:\"9\";s:3:\"sql\";s:134:\" SELECT D.*,D.username AS title,D.icon AS picurl,D.introduce AS content FROM qb_memberdata D  WHERE 1  ORDER BY D.regdate ASC LIMIT 9 \";s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"20\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"223\";s:5:\"div_h\";s:3:\"252\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289463337','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('481','','0','0','index_c1','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:101:\"  <div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>[{$time_m}/{$time_d}]</span></div>\";s:13:\"tplpart_2code\";s:741:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                          <tr>\r\n                            \r\n                    <td class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\"/></a></td>\r\n                            <td>\r\n                                \r\n                      <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                                \r\n                      <div class=\"m\">����{$content}<a href=\"$url\" target=\"_blank\">[��ϸ]</a></div>\r\n                            </td>\r\n                          </tr>\r\n                        </table>\r\n                        \r\n               \";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:33:\"/common_zh_content/zh_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:158:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";s:170:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid  WHERE A.yz=1  AND A.ispic=1 AND R.topic=1 ORDER BY A.list DESC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"70\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"341\";s:5:\"div_h\";s:3:\"220\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416231','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('482','','0','0','index_c2','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:101:\"  <div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>[{$time_m}/{$time_d}]</span></div>\";s:13:\"tplpart_2code\";s:738:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                          <tr>                            \r\n                    <td class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\"/></a></td>\r\n                            <td>\r\n                                \r\n                      <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                                \r\n                      <div class=\"m\">����{$content}<a href=\"$url\" target=\"_blank\">[��ϸ]</a></div>\r\n                            </td>\r\n                          </tr>\r\n                        </table>\r\n                        \r\n              \";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:33:\"/common_zh_content/zh_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:157:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list ASC LIMIT 6 \";s:4:\"sql2\";s:169:\" SELECT A.*,A.aid AS id,R.content FROM qb_news_article A LEFT JOIN qb_news_reply R ON A.aid=R.aid  WHERE A.yz=1  AND A.ispic=1 AND R.topic=1 ORDER BY A.list ASC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"70\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"346\";s:5:\"div_h\";s:3:\"229\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300416241','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('483','','0','0','index_cc1','code','0','<span>ITҵ��</span><a href=\"#\">����&gt;&gt;</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('484','','0','0','index_cc2','code','0','<span>�������</span><a href=\"#\">����&gt;&gt;</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('485','','0','0','index_digg','Info_news_','1','a:35:{s:13:\"tplpart_1code\";s:589:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"listConcern\">\r\n                  <tr>\r\n                    <td class=\"L\"><div class=\"n\" id=\"DiggNum_$id\">$digg_num</div><div class=\"d\"><a href=\"$webdb[www_url]/news/job.php?job=digg&type=vote&id=$id\" target=\"DiggIframe_$id\">��һ��</a></div></td>\r\n                    <td class=\"R\"><a href=\"$url\" class=\"a$i\" target=\"_blank\">$title</a></td>\r\n                  </tr>\r\n                </table>\r\n<div style=\"display:none;\"><iframe src=\"about:blank\" width=0 height=0 name=\"DiggIframe_$id\" id=\"DiggIframe_$id\"></iframe></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:22:\"/article/title_dig.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:92:\" SELECT A.*,A.aid AS id FROM qb_news_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"223\";s:5:\"div_h\";s:3:\"232\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300425211','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('487','','0','0','index_pk','hack_vote','0','<SCRIPT src=\'http://www_qibosoft_com/vote/vote.php?job=js&cid=10\'></SCRIPT>','a:4:{s:6:\"voteid\";s:2:\"10\";s:5:\"div_w\";s:3:\"253\";s:5:\"div_h\";s:3:\"163\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289463349','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('486','','0','0','index_tr1','Info_news_','1','a:37:{s:9:\"tplpart_1\";s:288:\"<div class=\"listzt\">\r\n        	<div class=\"img\"><a target=\"_blank\" href=\"$url\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"160\"/></a></div>\r\n            <div class=\"t\"><a target=\"_blank\" href=\"$url\">$title</a></div>\r\n        </div>\";s:13:\"tplpart_1code\";s:288:\"<div class=\"listzt\">\r\n        	<div class=\"img\"><a target=\"_blank\" href=\"$url\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"160\"/></a></div>\r\n            <div class=\"t\"><a target=\"_blank\" href=\"$url\">$title</a></div>\r\n        </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:5:\"news_\";s:5:\"ctype\";s:11:\"specialsort\";s:13:\"RollStyleType\";s:0:\"\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:3:\"fid\";s:0:\"\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";N;s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:4:\"list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:111:\" SELECT A.* FROM qb_news_special A  WHERE `ifbase`=0 AND yz=1  AND A.picurl!=\'\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";s:0:\"\";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"28\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"985\";s:5:\"div_h\";s:3:\"208\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300424270','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('839','','0','0','listpic2','article','1','a:29:{s:13:\"tplpart_1code\";s:322:\"<div  class=\"listpic\" style=\"padding:5px 9px 3px 17px;\"> \r\n              <p class=img><a href=\"$url\" target=\"_blank\"><img width=\"120\" height=\"90\" src=\"$picurl\" border=\"0\"></a></p>\r\n              <p class=title style=\'text-align:center;\'><A HREF=\"$url\" title=\'$full_title\' target=\"_blank\">$title</A></p>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"100\";s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"10\";s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:152:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (10)  AND A.mid=\'100\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.aid DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239006574','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('488','','0','0','index_tr01','code','0','<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n          <tr>\r\n            <td class=\"choose\"><a href=\"#\" class=\"nbor\">����</a></td>\r\n            <td><a href=\"#\" class=\"nbor\">ͼƬ</a></td>\r\n            <td><a href=\"#\">Ӱ��</a></td>\r\n            <td><a href=\"#\">�̳�</a></td>\r\n            <td><a href=\"#\">flash</a></td>\r\n          </tr>\r\n        </table> ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"670\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289292242','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('489','','0','0','index_vote2','hack_vote','0','<SCRIPT src=\'http://www_qibosoft_com/vote/vote.php?job=js&cid=12\'></SCRIPT>','a:4:{s:6:\"voteid\";s:2:\"12\";s:5:\"div_w\";s:3:\"444\";s:5:\"div_h\";s:3:\"227\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289463384','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('490','','0','0','wn_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"280\";s:6:\"height\";s:3:\"190\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101109181105_gzaok.jpg\";i:2;s:32:\"label/1_20101109181113_fwdej.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('491','','0','0','wn_topic1','Info_wn_','1','a:29:{s:13:\"tplpart_1code\";s:128:\"<div class=\"list\"><a href=\"$list_url\" class=\"sort\" target=\"_blank\">[{$fname}]</a><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:0:\"\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:73:\" SELECT A.* FROM qb_wn_content A   WHERE 1  ORDER BY A.list DESC LIMIT 8 \";s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289303057','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('492','','0','0','wn_tg1','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:262:\"<div class=\"list$i\"> <span class=\"d\">{$time_y}/{$time_m}/{$time_d}</span> <span class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></span> \r\n                <span class=\"c\">����{$content}<a href=\"$url\" target=\"_blank\">[�鿴ȫ��]</a></span> \r\n              </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:3:\"190\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289305481','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('493','','0','0','wn_tg2','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:83:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>09-14</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"36\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('494','','0','0','wn_tg3','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:65:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"12\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list ASC LIMIT 12 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289305655','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('495','','0','0','wn_tg4','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:328:\"<div class=\"listpic\">\r\n                	\r\n              <div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:141:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE A.ispic=1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('496','','0','0','wn_tg01','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:235:\"<div class=\"list$i\">\r\n                	\r\n              <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"m\">���:<span>$hits</span> ����:<span>$comments</span></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('497','','0','0','wn_tgh1','Info_wn_','1','a:30:{s:13:\"tplpart_1code\";s:196:\"<div class=\"listtc\">\r\n                	\r\n              <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"c\">����$content</div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"66\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289306541','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('498','','0','0','wn_tgh2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101109201135_eoslv.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"240\";s:6:\"height\";s:2:\"50\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('499','','0','0','wn_ptg4','Info_wn_','1','a:32:{s:13:\"tplpart_1code\";s:156:\" <div class=\"list\"><a href=\"$url\" class=\"sort\" target=\"_blank\">[{$fname}]</a><a href=\"$url\" target=\"_blank\">$title</a><span>{$time_m}-{$time_d}</span></div>\";s:13:\"tplpart_2code\";s:682:\"	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"pic_word\">\r\n                      <tr>\r\n                        \r\n                  <td class=\"pic\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\"/></a></td>\r\n                        <td class=\"word\">\r\n                        	\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    		\r\n                    <div class=\"c\">��$content<a href=\"$url\" target=\"_blank\">[�鿴ȫ��]</a></div>\r\n                        </td>\r\n                      </tr>\r\n                    </table>\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"70\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:25:\"/common_zh_pic/zh_pic.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:133:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";s:147:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  AND A.ispic=1 ORDER BY A.list DESC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289308003','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('500','','0','0','wn_ptg5','Info_wn_','1','a:32:{s:13:\"tplpart_1code\";s:156:\" <div class=\"list\"><a href=\"$url\" class=\"sort\" target=\"_blank\">[{$fname}]</a><a href=\"$url\" target=\"_blank\">$title</a><span>{$time_m}-{$time_d}</span></div>\";s:13:\"tplpart_2code\";s:682:\"	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"pic_word\">\r\n                      <tr>\r\n                        \r\n                  <td class=\"pic\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\"/></a></td>\r\n                        <td class=\"word\">\r\n                        	\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    		\r\n                    <div class=\"c\">��$content<a href=\"$url\" target=\"_blank\">[�鿴ȫ��]</a></div>\r\n                        </td>\r\n                      </tr>\r\n                    </table>\";s:3:\"SYS\";s:2:\"wn\";s:13:\"RollStyleType\";s:0:\"\";s:6:\"wninfo\";s:3:\"wn_\";s:7:\"typefid\";s:3:\"fid\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"70\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"tplpath\";s:25:\"/common_zh_pic/zh_pic.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:8:\"moduleid\";s:1:\"1\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:3:\"all\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:132:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  ORDER BY A.list ASC LIMIT 7 \";s:4:\"sql2\";s:146:\"SELECT B.*,A.* FROM qb_wn_content A  LEFT JOIN qb_wn_content_1 B ON A.id=B.id   WHERE 1  AND A.mid=\'1\'  AND A.ispic=1 ORDER BY A.list ASC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('501','','0','0','wn_tsf','code','0','<a href=\"#\">��������</a> | <a href=\"#\">�˸�����</a> | <a href=\"#\">�������</a> &nbsp;&nbsp; <a href=\"#\">>>����</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"250\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289308157','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('502','','0','0','wn_tp5','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('503','','0','0','wn_tp3','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('504','','0','0','wn_tp4','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('505','','0','0','wn_tp2','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('506','','0','0','wn_tp1','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('507','','0','0','wn_g1','code','0','���Ż���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('508','','0','0','wn_g3','code','0','�������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('509','','0','0','wn_g2','code','0','��ό��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('510','','0','0','wn_g4','code','0','���չ�ע','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('511','','0','0','wn_g6','code','0','��������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('512','','0','0','wn_g5','code','0','ͼƬ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','26','0','0','default');
INSERT INTO `qb_label` VALUES ('513','','0','0','photo_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"298\";s:6:\"height\";s:3:\"238\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101110141134_yuvgy.jpg\";i:2;s:32:\"label/1_20101110141112_eb6bm.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('889','','0','0','shops_p1','article','1','a:32:{s:13:\"tplpart_1code\";s:504:\"<div class=\"listshop\">\r\n                	\r\n              		<div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    \r\n             		 <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"p\">�г���<strike>��{$martprice}</strike></div>\r\n                    <div class=\"p\">���ۼ�<span>��{$nowprice}</span></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"103\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:134:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('888','','0','0','video_h2','article','1','a:32:{s:13:\"tplpart_1code\";s:415:\"	<div class=\"listvideo\">\r\n                	\r\n              <div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    \r\n              <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"m\">����:<span>$hits</span>��</div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"15\";s:3:\"sql\";s:135:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 15 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289449096','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('887','','0','0','video_h1','article','1','a:32:{s:13:\"tplpart_1code\";s:673:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"listtable\">\r\n                  <tr>\r\n                    \r\n                <td class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"100\" height=\"75\"/></a></td>\r\n                    <td class=\"word\">\r\n                       \r\n                  <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                       <div class=\"m\">����:<span>$hits</span></div>\r\n                       <div class=\"m\">����:<span>$comments</span></div>\r\n                    </td>\r\n                  </tr>\r\n                </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:134:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('518','','0','0','photo_t6','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('519','','0','0','photo_t5','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('520','','0','0','photo_t7','code','0','����ͼƬ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('521','','0','0','photo_t9','code','0','�Ƽ�ͼƬ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('522','','0','0','photo_t8','code','0','�������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('523','','0','0','photo_t10','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('524','','0','0','photo_t11','code','0','<a href=\"#\" class=\"sort choose\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>Ů��</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����ʱ��</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>���</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>�Ļ�</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>��Ȥ</span></a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('525','','0','0','video_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"318\";s:6:\"height\";s:3:\"248\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101111111131_dupyp.jpg\";i:2;s:32:\"label/1_20101111111135_0n6tg.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('886','','0','0','video_t3','article','1','a:32:{s:13:\"tplpart_1code\";s:94:\"<div class=\"lista$i\"><a href=\"$url\" target=\"_blank\">$title</a>\r\n\r\n<span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:105:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289448993','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('885','','0','0','video_t2','article','1','a:32:{s:13:\"tplpart_1code\";s:148:\"<div class=\"list\"><a href=\"$list_url\" class=\"sort\">[{$fname}]</a><a href=\"$url\" class=\"title\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:104:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289449013','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('884','','0','0','video_t1','article','1','a:32:{s:13:\"tplpart_1code\";s:443:\"<div class=\"listvideo\">\r\n                	\r\n              <div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"150\" height=\"100\"/></a></div>\r\n                    \r\n              <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                    <div class=\"m\">����:<span>$comments</span> ����:<span>$hits</span>��</div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:134:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289446391','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('882','','0','0','photo_t3','article','1','a:32:{s:13:\"tplpart_1code\";s:68:\"<div class=\"lista$i\"><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"100\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:105:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'100\'   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289374054','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('883','','0','0','photo_t4','article','1','a:32:{s:13:\"tplpart_1code\";s:68:\"<div class=\"listb$i\"><a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"100\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"11\";s:3:\"sql\";s:104:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'100\'   ORDER BY A.list ASC LIMIT 11 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('881','','0','0','photo_t2','article','1','a:32:{s:13:\"tplpart_1code\";s:312:\"<div class=\"listpic\">\r\n                	<div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\"/></a></div>\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"100\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"15\";s:3:\"sql\";s:135:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'100\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 15 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('531','','0','0','video_c1','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('532','','0','0','video_c2','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('533','','0','0','video_c3','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('534','','0','0','video_c5','code','0','Ӱ���Ȳ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('535','','0','0','video_c7','code','0','��ѡ��Ƶ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('536','','0','0','video_c9','code','0',' <a href=\"#\" class=\"sort choose\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>Ů��</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����ʱ��</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>���</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>�Ļ�</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>��Ȥ</span></a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('537','','0','0','video_c10','code','0','��Ƶ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('538','','0','0','video_ad1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111121107_nd3ch.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"720\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('539','','0','0','video_ad2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111121116_80r2g.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"260\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('540','','0','0','shops_rollpic','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"530\";s:6:\"height\";s:3:\"210\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101111141159_txw13.jpg\";i:2;s:32:\"label/1_20101111141105_k2yzk.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('541','','0','0','shops_sort','code','0','	<dl>\r\n                	<dt><a href=\"list.php?fid=16\" target=\"_blank\">�����Ʒ</a></dt>\r\n                    <dd>\r\n                    	<div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                    </dd>\r\n                </dl>\r\n                <dl>\r\n                	<dt><a href=\"list.php?fid=16\" target=\"_blank\">�����Ʒ</a></dt>\r\n                    <dd>\r\n                    	<div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                    </dd>\r\n                </dl>\r\n                <dl>\r\n                	<dt><a href=\"list.php?fid=16\" target=\"_blank\">�����Ʒ</a></dt>\r\n                    <dd>\r\n                    	<div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n                        <div><a href=\"list.php?fid=16\" target=\"_blank\">��ʾ����</a></div>\r\n						\r\n                    </dd>\r\n                </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('880','','0','0','photo_t1','article','1','a:32:{s:13:\"tplpart_1code\";s:313:\"	<div class=\"listpic\">\r\n                	<div class=\"img\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"125\" height=\"90\"/></a></div>\r\n                    <div class=\"t\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"100\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:134:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'100\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('547','','0','0','shops_f1','code','0','<dl>\r\n                <dt><a href=\"#\">��Ա����</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">��������</a></div>\r\n                    <div><a href=\"#\">��Ҫ��</a></div>\r\n                    <div><a href=\"#\">�鿴�ѹ�����Ʒ</a></div>\r\n                    <div><a href=\"#\">�������</a></div>\r\n                    <div><a href=\"#\">���ע���Ϊ...</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('548','','0','0','shops_f2','code','0','<dl>\r\n                <dt><a href=\"#\">����֮��</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">������뿪��</a></div>\r\n                    <div><a href=\"#\">��ι������</a></div>\r\n                    <div><a href=\"#\">�鿴�۳���Ʒ</a></div>\r\n                    <div><a href=\"#\">��η���</a></div>\r\n                    <div><a href=\"#\">�̳���Ʒ�Ƽ�</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('549','','0','0','shops_f3','code','0','<dl>\r\n                <dt><a href=\"#\">֧����ʽ</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">����֧��</a></div>\r\n                    <div><a href=\"#\">���ע��Ƹ�ͨ</a></div>\r\n                    <div><a href=\"#\">���ע�ᱴ��</a></div>\r\n                    <div><a href=\"#\">ʹ��Ԥ�����</a></div>\r\n                    <div><a href=\"#\">���ע��֧����</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('550','','0','0','shops_f4','code','0','<dl>\r\n                <dt><a href=\"#\">������</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">��ι�������</a></div>\r\n                    <div><a href=\"#\">�ٱ��������̼�</a></div>\r\n                    <div><a href=\"#\">Ͷ�ߵ���</a></div>\r\n                    <div><a href=\"#\">�����ϵ����</a></div>\r\n                    <div><a href=\"#\">�ٱ�����</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('551','','0','0','shops_f5','code','0','<dl>\r\n                <dt><a href=\"#\">�ͷ�����</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">��Ա�޸�����</a></div>\r\n                    <div><a href=\"#\">�޸��ջ���ַ</a></div>\r\n                    <div><a href=\"#\">��Ʒ��������</a></div>\r\n                    <div><a href=\"#\">��Ա�޸ĸ�����Ϣ</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('552','','0','0','shops_f6','code','0','<dl>\r\n                <dt><a href=\"#\">��������</a></dt>\r\n                <dd>\r\n                    <div><a href=\"#\">��������</a></div>\r\n                    <div><a href=\"#\">����������ͬ������������ͬ������������ͬ��</a></div>\r\n                </dd>\r\n            </dl>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('553','','0','0','shops_ad1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141108_fefgd.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"230\";s:6:\"height\";s:2:\"80\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('554','','0','0','shops_ad2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141125_iaj1l.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"230\";s:6:\"height\";s:2:\"80\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('555','','0','0','shops_ad3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141143_r4drz.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"230\";s:6:\"height\";s:2:\"80\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('556','','0','0','shops_ad4','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141103_rpuaq.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"230\";s:6:\"height\";s:2:\"80\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('557','','0','0','shops_ad5','code','0','	<div class=\"list\"><a href=\"#\">�ñ����׶�԰��ʼ������</a><span>�����Ż�</span></div>\r\n                <div class=\"list\"><a href=\"#\">�����Ҹ��üҽ���:</a><em>010:88888888</em></div>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('558','','0','0','shops_ad6','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141126_b9tqw.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:2:\"55\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('559','','0','0','shops_a_d1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141115_ci14j.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289458738','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('560','','0','0','shops_a_d2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141129_5prhy.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('561','','0','0','shops_a_d3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141110_oqdpu.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('562','','0','0','shops_a_d4','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141131_k3xih.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('563','','0','0','shops_a_d5','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111141151_9lauy.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('564','','0','0','shops_a_d6','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111151112_vin0e.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('565','','0','0','shops_a_d7','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111151133_53hvd.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('566','','0','0','shops_a_d8','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111151150_avkih.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('567','','0','0','shops_a_d9','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111151107_s9khw.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('568','','0','0','shops_a_d10','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111151123_lxocu.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:2:\"90\";s:6:\"height\";s:2:\"35\";}','a:3:{s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('569','','0','0','shops_pp2','code','0','<a href=\"#\">����...</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('570','','0','0','shops_pp1','code','0','<a href=\"#\" class=\"sort choose\"><span>�Ҿ�����</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>������Ʒ</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>��װЬñ</span></a>\r\n                <a href=\"#\" class=\"sort\"><span>�������</span></a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('571','','0','0','shops_pp0','code','0','�̳ǲ�Ʒ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('572','','0','0','shops_pv3','code','0','�̳ǹ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('573','','0','0','shops_pv4','code','0','������Ʒ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('574','','0','0','shops_pcv2','code','0','����֮��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('575','','0','0','shops_pcv3','code','0','�Ƽ���Ʒ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('576','','0','0','down_ad1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191127_zgile.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"710\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"707\";s:5:\"div_h\";s:2:\"69\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475404','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('577','','0','0','down_ad2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191154_ykdyp.jpg\";s:7:\"imglink\";s:21:\"http://www.1gftp.com/\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"267\";s:5:\"div_h\";s:2:\"68\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292643191','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('578','','0','0','down_ad3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191142_bnynf.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"710\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"708\";s:5:\"div_h\";s:2:\"88\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475569','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('579','','0','0','down_ad4','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191109_shrig.gif\";s:7:\"imglink\";s:21:\"http://www.zwidc.com/\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"268\";s:5:\"div_h\";s:2:\"89\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292643722','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('580','','0','0','down_ad5','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191153_sdera.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"85\";}','a:3:{s:5:\"div_w\";s:3:\"270\";s:5:\"div_h\";s:2:\"84\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475675','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('870','','0','0','new_p3','article','1','a:32:{s:13:\"tplpart_1code\";s:108:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span><a>{$time_m}-{$time_d}</a></span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('590','','0','0','down_c4','code','0','<a href=\"list.php?fid=40\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('591','','0','0','down_c3','code','0','<a href=\"list.php?fid=27\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('592','','0','0','down_c2','code','0','<a href=\"list.php?fid=26\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('593','','0','0','down_c1','code','0','<a href=\"list.php?fid=12\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('594','','0','0','down_bv1','code','0','��վ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('595','','0','0','down_bv2','code','0','װ�����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('596','','0','0','down_bv3','code','0','�칫���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('597','','0','0','down_bv4','code','0','ɱ�����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('598','','0','0','down_a4','code','0','���¸���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('599','','0','0','down_a3','code','0','���հ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481643','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('600','','0','0','down_a2','code','0','�����Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('601','','0','0','down_a1','code','0','װ���Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('602','','0','0','down_d2','code','0','�����Ƽ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('603','','0','0','down_dp2','code','0','<a href=\"#\">����Դ��</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('604','','0','0','down_t3v','code','0','<div>���ո������:<span>5</span>�� ��������:<span>1</span>��</div>\r\n                <div>�����������:<em>651</em>�� ����������:<em>103</em>��</div>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481879','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('869','','0','0','new_p2','article','1','a:32:{s:13:\"tplpart_1code\";s:108:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span><a>{$time_m}-{$time_d}</a></span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:101:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list ASC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289207948','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('868','','0','0','new_u1','article','1','a:32:{s:13:\"tplpart_1code\";s:108:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span><a>{$time_m}-{$time_d}</a></span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289207819','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('867','','0','0','new_p1','article','1','a:32:{s:13:\"tplpart_1code\";s:110:\"<div class=\"list_t_c\"> <a href=\"$url\" class=\"title\" target=\"_blank\">$title</a> \r\n              $content </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:163:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.mid=\'0\'   AND R.topic=1 ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"120\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289207618','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('866','','0','0','new_ps','article','1','a:32:{s:13:\"tplpart_1code\";s:536:\"	<table width=\"100%\" border=\"0\" cellspacing=\"0\" align=\"center\" cellpadding=\"0\" class=\"listtable\">\r\n                  <tr>\r\n                    \r\n                <td class=\"pic\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"70\" height=\"70\" /></a></td>\r\n                    <td class=\"word\">\r\n                    	<a href=\"$url\" class=\"title\">$title</a>\r\n                        $content\r\n                    </td>\r\n                  </tr>\r\n                </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:33:\"/common_pic/title_pic_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:2:\"cp\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:192:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.mid=\'0\'  AND A.ispic=1   AND A.ispic=1  AND R.topic=1 ORDER BY A.list ASC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"56\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289207490','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('865','','0','0','new_photo','article','1','a:32:{s:13:\"tplpart_1code\";s:274:\"<div class=\"listpic\">\r\n			 <a href=\"$url\" class=\"pic\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"120\" height=\"90\" /></a> \r\n              <a href=\"$url\" class=\"title\" target=\"_blank\">$title</a> \r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:132:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('864','','0','0','new_2','article','1','a:32:{s:13:\"tplpart_1code\";s:105:\"<div class=\"list\"><em>$i</em><a href=\"$url\" target=\"_blank\">$title</a><span><a>{$hits}��</a></span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"32\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289206999','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('863','','0','0','new_1','article','1','a:32:{s:13:\"tplpart_1code\";s:257:\"<div class=\"list$i\">\r\n            	\r\n          <div class=\"title\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n                \r\n          <div class=\"content\">{$content}...<a href=\"$url\" target=\"_blank\">[��ϸ]</a> \r\n          </div>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:163:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.mid=\'0\'   AND R.topic=1 ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"110\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"390\";s:5:\"div_h\";s:3:\"250\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289208353','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('862','','0','0','list_page_mv','article','1','a:31:{s:13:\"tplpart_1code\";s:195:\"(mv,290,210,false)$mvurl(/mv)\r\n<div style=\"line-height:170%;text-align:center;padding-top:8px;\"><A HREF=\"$url\" target=\'_blank\'  style=\"$fontcolor;$fontweight\" title=\'$full_title\'>$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240292096','2','0','0','0','default');
INSERT INTO `qb_label` VALUES ('855','','0','0','list_page_mv','article','1','a:31:{s:13:\"tplpart_1code\";s:195:\"(mv,290,210,false)$mvurl(/mv)\r\n<div style=\"line-height:170%;text-align:center;padding-top:8px;\"><A HREF=\"$url\" target=\'_blank\'  style=\"$fontcolor;$fontweight\" title=\'$full_title\'>$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','0','1','0','default');
INSERT INTO `qb_label` VALUES ('854','','0','0','c02d','article','1','a:31:{s:13:\"tplpart_1code\";s:476:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:3px 0px 12px 0px;\">\r\n  <tr> \r\n    <td rowspan=\"2\" width=\"4%\" style=\"padding-right:3px;\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" width=\"100\" height=\"75\" border=\"0\"></a></td>\r\n    <td width=\"96%\"> <a href=\"$url\" target=\"_blank\" style=\"color:#666;font-weight:bold;\">$title</a></td>\r\n  </tr>\r\n  <tr> \r\n    <td width=\"96%\" style=\"color:#929292;text-indent:1em;\">$content</td>\r\n  </tr>\r\n</table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:33:\"/common_pic/title_pic_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"34\";s:5:\"stype\";s:2:\"cp\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:211:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.fid IN (34)  AND A.mid=\'0\'  AND A.ispic=1   AND A.ispic=1  AND R.topic=1 ORDER BY A.aid DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"58\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"18\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"230\";s:5:\"div_h\";s:3:\"238\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240060985','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('852','','0','0','1236087504','article','1','a:28:{s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:2:\"-1\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";s:1:\"0\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:7:\"default\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:54:\" SELECT A.* FROM qb_article A  WHERE A.yz=1   LIMIT 5 \";s:4:\"sql2\";s:0:\"\";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','1','');
INSERT INTO `qb_label` VALUES ('853','tretre','0','0','1236087539','article','1','a:28:{s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:3:\"url\";N;s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:2:\"-1\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";s:1:\"0\";s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:7:\"default\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:54:\" SELECT A.* FROM qb_article A  WHERE A.yz=1   LIMIT 5 \";s:4:\"sql2\";s:0:\"\";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:0:\"\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:0:\"\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','1','');
INSERT INTO `qb_label` VALUES ('851','','0','0','mainnews2','article','1','a:31:{s:13:\"tplpart_1code\";s:397:\"<div style=\"clear:both;padding-top:2px;margin-bottom:4px;\"><span style=\"float:left;font-size:13px;color:#ccc;\">��<A HREF=\"$list_url\" style=\"font-size:13px;\">{$fname}</A>| <A HREF=\"$url\" target=\'_blank\' style=\"$fontcolor;font-size:13px;\">$title</a>$new$hot</span>                     \r\n    <span style=\"float:right;color:#993300;padding-right:3px;font-size:13px;\">[{$time_m}-{$time_d}]</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:28:\"/common_fname/time_fname.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"32\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:10:\"A.posttime\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:1:\"1\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:141:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.levels=1  AND A.fid IN (32)  AND A.mid=\'0\'   ORDER BY A.posttime DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"48\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"467\";s:5:\"div_h\";s:3:\"126\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240280500','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('850','','0','0','mainnews','article','1','a:31:{s:13:\"tplpart_1code\";s:630:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-bottom:8px;\">\r\n  <tr>\r\n    <td align=\"center\" style=\"padding-bottom:5px;\"><a href=\"$url\" target=\"_blank\"><b><font color=\"#D50000\" style=\"font-size:16px;\">$title</font></b></a></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" height=\"18\" valign=\"middle\" style=\"border-bottom:1px dotted #ccc;line-height:150%;text-indent:2em;color:#929292;padding-bottom:3px;\">{$content} ��<font color=\"#D50000\">{$hits}</font>�˹�ע  ����<font color=\"#D50000\">{$comments}</font>�� \r\n      [<a href=\"$url\" style=\"color:#D50000;\" target=\"_blank\">����</a>]</td>\r\n  </tr>\r\n</table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:2:\"-1\";s:7:\"tplpath\";s:24:\"/common_title/0title.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"31\";s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.fid IN (31)   AND R.topic=1 ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"120\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"60\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"461\";s:5:\"div_h\";s:2:\"71\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240195933','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('849','','0','0','c1','article','1','a:31:{s:13:\"tplpart_1code\";s:254:\"<div style=\"line-height:130%;font-size:13px;color:#ccc;clear:both;\"><span style=\"float:left;\">��<A HREF=\"$url\" target=\'_blank\' style=\"$fontcolor;$fontweight\">$title </a></span><span style=\"float:right;padding-right:3px;color:#666;\">({$hits})</span></div>\";s:13:\"tplpart_2code\";s:302:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-bottom:4px;\">\r\n  <tr>\r\n    <td style=\"font-size:13px;font-weight:bold;\">[�Ƽ�]<A HREF=\"$url\" target=\"_blank\" style=\"font-size:15px;font-weight:bold;color:#990000;text-decoration: underline;\">$title</A></td>\r\n  </tr>\r\n</table>\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:3:\"101\";s:7:\"tplpath\";s:32:\"/common_zh_title/zh_bigtitle.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:8:\"12,26,27\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:10:\"A.posttime\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:133:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.fid IN (12,26,27)  AND A.mid=\'101\'   ORDER BY A.posttime DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"30\";s:10:\"titleflood\";s:1:\"1\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"226\";s:5:\"div_h\";s:3:\"140\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240192810','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('848','','0','0','show_34','article','1','a:31:{s:13:\"tplpart_1code\";s:809:\"<table  border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"float:left;width:160px;margin-top:15px;\">\r\n  <tr>\r\n    <td align=\"center\"><a href=\"$url\" target=\"_blank\" style=\"border:1px solid #ccc;display:block;width:120px;height:90px;\"><img style=\"border:1px solid #fff;\" src=\'$picurl\' border=0 width=\"120\" height=\"90\"></a></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"center\" style=\"padding-top:5px;\"><a href=\"$url\" target=\"_blank\">$title</a></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"center\" style=\"padding-top:3px;\"><strike><b>��$martprice</b></strike> <b><font color=\"#FF0000\">��$nowprice</font></b></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"center\" style=\"padding-bottom:18px;padding-top:3px;\"><a href=\"$url\" target=\"_blank\"><img src=\"$webdb[www_url]/images/default/order_button.gif\" border=\"0\"></a></td>\r\n  </tr>\r\n</table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"180\";s:7:\"amodule\";s:3:\"103\";s:7:\"tplpath\";s:17:\"/article/shop.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:132:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.aid ASC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"450\";s:5:\"div_h\";s:3:\"200\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1241074246','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('847','','0','0','a1','article','1','a:31:{s:13:\"tplpart_1code\";s:147:\"<div style=\"padding-top:6px;color:#ccc;\">��<A HREF=\"$url\" target=\'_blank\' style=\"$fontcolor;$fontweight;font-size:13px;\">$title</a> $new $hot</div>\";s:13:\"tplpart_2code\";s:558:\"<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin:3px 0px 5px 0px;\">\r\n  <tr> \r\n    <td rowspan=\"2\" width=\"4%\" style=\"padding-right:3px;padding-bottom:7px;border-bottom:1px dotted #ccc;\"><a href=\"$url\"><img src=\"$picurl\" width=\"100\" height=\"70\" border=\"0\"></a></td>\r\n    <td width=\"96%\"> <a href=\"$url\" target=\"_blank\" style=\"color:#666;font-weight:bold;\">$title</a></td>\r\n  </tr>\r\n  <tr> \r\n    <td width=\"96%\" style=\"padding-bottom:7px;text-indent:1em;border-bottom:1px dotted #ccc;color:#929292;\">$content</td>\r\n  </tr>\r\n</table>\r\n\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:2:\"-1\";s:7:\"tplpath\";s:24:\"/common_zh_pic/zh_pc.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:2:\"39\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:10:\"A.posttime\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:171:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.fid IN (39)   AND R.topic=1 ORDER BY A.posttime DESC LIMIT 6 \";s:4:\"sql2\";s:183:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid  WHERE A.yz=1  AND A.fid IN (39)  AND A.ispic=1 AND R.topic=1 ORDER BY A.posttime DESC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"60\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"20\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"221\";s:5:\"div_h\";s:3:\"186\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240192058','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('846','','0','0','comarticle','article','1','a:31:{s:13:\"tplpart_1code\";s:1110:\"<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-bottom:6px;\">\r\n  <tr> \r\n    <td align=\"left\" style=\"border-bottom:1px dotted #eee;padding-bottom:5px;\"> \r\n      <div style=\"background:url($webdb[www_url]/images/default/sdigg.gif) no-repeat;width:44px;height:36px;float:left;\">\r\n        <div style=\"font-size:13px;text-align:center;padding:0px;font-weight:bold;background:#eee;\" id=\"DiggNum_$id\">$digg_num</div>\r\n        <div style=\"text-align:center;font-size:12px;color:#FFF;width:44px;height:20px;overflow:hidden;background:#ccc;\" id=\"DiggDo_$id\"><a href=\"$webdb[www_url]/do/job.php?job=digg&type=vote&id=$id\" target=\"DiggIframe_$id\" style=\"font-size:12px;color:#FFF;\">��һ��</a></div>\r\n      </div>\r\n      <div style=\"margin-left:4px;float:left;width:195px;\"> \r\n        <a href=\"$url\" target=\"_blank\" style=\"$fontcolor;$fontweight;font-size:13px;\">$title</a>\r\n      </div>\r\n      <div style=\"display:none;\"><iframe src=\"$webdb[www_url]/do/job.php?job=digg&type=getnum&id=$id\" width=0 height=0 name=\"DiggIframe_$id\" id=\"DiggIframe_$id\"></iframe></div>\r\n    </td>\r\n  </tr>\r\n</table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:22:\"/article/title_dig.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:10:\"A.digg_num\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:106:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.digg_num DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"60\";s:12:\"content_num2\";s:2:\"55\";s:8:\"titlenum\";s:2:\"60\";s:9:\"titlenum2\";s:2:\"26\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"246\";s:5:\"div_h\";s:3:\"243\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239193510','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('845','','0','0','c2','article','1','a:31:{s:13:\"tplpart_1code\";s:147:\"<div style=\"padding-top:5px;color:#ccc;\">��<A HREF=\"$url\" target=\'_blank\' style=\"$fontcolor;$fontweight;font-size:13px;\">$title</a> $new $hot</div>\";s:13:\"tplpart_2code\";s:411:\"<table width=\"98%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-bottom:5px;\">\r\n  <tr>\r\n    <td align=\"left\"><a href=\"$url\" target=\"_blank\" style=\"font-weight:bold;color:#666;\" title=\"$full_title\">$title</a></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"left\" height=\"18\" valign=\"middle\" style=\"border-bottom:1px dotted #ccc;text-indent:2em;padding-bottom:5px;color:#929292;\">$content</td>\r\n  </tr>\r\n</table>\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:33:\"/common_zh_content/zh_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";s:5:\"35,38\";s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:10:\"A.posttime\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:189:\" SELECT A.*,A.aid AS id,R.content FROM qb_article A LEFT JOIN qb_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.fid IN (35,38)  AND A.mid=\'0\'   AND R.topic=1 ORDER BY A.posttime DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"68\";s:8:\"titlenum\";s:2:\"28\";s:9:\"titlenum2\";s:2:\"34\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"222\";s:5:\"div_h\";s:3:\"159\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240192238','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('844','','0','0','listpic5','article','1','a:29:{s:13:\"tplpart_1code\";s:322:\"<div  class=\"listpic\" style=\"padding:5px 9px 3px 17px;\"> \r\n              <p class=img><a href=\"$url\" target=\"_blank\"><img width=\"120\" height=\"90\" src=\"$picurl\" border=\"0\"></a></p>\r\n              <p class=title style=\'text-align:center;\'><A HREF=\"$url\" title=\'$full_title\' target=\"_blank\">$title</A></p>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"104\";s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:133:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'104\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.aid DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239006692','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('843','','0','0','listpic4','article','1','a:29:{s:13:\"tplpart_1code\";s:322:\"<div  class=\"listpic\" style=\"padding:5px 9px 3px 17px;\"> \r\n              <p class=img><a href=\"$url\" target=\"_blank\"><img width=\"120\" height=\"90\" src=\"$picurl\" border=\"0\"></a></p>\r\n              <p class=title style=\'text-align:center;\'><A HREF=\"$url\" title=\'$full_title\' target=\"_blank\">$title</A></p>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"103\";s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:133:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'103\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.aid DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239006655','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('842','','0','0','listpic','article','1','a:31:{s:13:\"tplpart_1code\";s:322:\"<div  class=\"listpic\" style=\"padding:7px 9px 3px 17px;\"> \r\n              <p class=img><a href=\"$url\" target=\"_blank\"><img width=\"120\" height=\"90\" src=\"$picurl\" border=\"0\"></a></p>\r\n              <p class=title style=\'text-align:center;\'><A HREF=\"$url\" title=\'$full_title\' target=\"_blank\">$title</A></p>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:0;s:5:\"fiddb\";s:2:\"33\";s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:1:\"1\";s:7:\"rowspan\";s:1:\"2\";s:3:\"sql\";s:167:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.levels=1  AND A.fid IN (33)  AND A.mid=\'0\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"3\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"459\";s:5:\"div_h\";s:3:\"254\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1241074794','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('841','','0','0','hotarticle','article','1','a:31:{s:13:\"tplpart_1code\";s:212:\"<div style=\"background:url($webdb[www_url]/images/default/i/$i.gif) no-repeat 0px 2px;height:23px;text-indent:1.3em;\"><A HREF=\"$url\" target=\'_blank\' style=\"$fontcolor;$fontweight;font-size:13px;\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:2:\"30\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:27:\"/common_title/2title_i2.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:3:\"all\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.hits\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"9\";s:3:\"sql\";s:97:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE 1  AND A.mid=\'0\'   ORDER BY A.hits DESC LIMIT 9 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"228\";s:5:\"div_h\";s:3:\"204\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239609179','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('840','','0','0','listpic3','article','1','a:29:{s:13:\"tplpart_1code\";s:322:\"<div  class=\"listpic\" style=\"padding:5px 9px 3px 17px;\"> \r\n              <p class=img><a href=\"$url\" target=\"_blank\"><img width=\"120\" height=\"90\" src=\"$picurl\" border=\"0\"></a></p>\r\n              <p class=title style=\'text-align:center;\'><A HREF=\"$url\" title=\'$full_title\' target=\"_blank\">$title</A></p>\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:24:\"/common_pic/img_div1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:133:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.aid DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1239006730','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('917','','0','0','down_c3','code','0','<a href=\"/download/list.php?fid=27\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1307419269','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('918','','0','0','down_c4','code','0','<a href=\"/download/list.php?fid=40\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1307419288','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('912','','0','0','down_bv2','code','0','װ�����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('913','','0','0','down_bv3','code','0','�칫���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('914','','0','0','down_bv4','code','0','ɱ�����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('915','','0','0','down_c1','code','0','<a href=\"/download/list.php?fid=12\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1307419254','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('916','','0','0','down_c2','code','0','<a href=\"/download/list.php?fid=26\" target=\"_blank\">����..</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1307419280','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('911','','0','0','down_t1','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:91:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:97:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"28\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303370944','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('910','','0','0','down_dp2','code','0','<a href=\"#\">����Դ��</a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('909','','0','0','down_d2','code','0','�����Ƽ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('908','','0','0','down_t2','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:181:\"<div class=\"list l$i\"><a href=\"$list_url\" class=\"sort\" target=\"_blank\" >[{$fname}]</a><a href=\"$url\" class=\"title\" target=\"_blank\" >$title</a><span>{$time_m}-{$time_d} </span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"11\";s:3:\"sql\";s:97:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 11 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303370957','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('906','','0','0','down_t3v','code','0','<div>���ո������:<span>5</span>�� ��������:<span>1</span>��</div>\r\n                <div>�����������:<em>651</em>�� ����������:<em>103</em>��</div>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481879','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('907','','0','0','down_t3','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:91:\"<div class=\"list l$i\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303370973','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('905','','0','0','down_t5','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"34\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303371046','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('904','','0','0','down_t4','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"34\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303371008','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('903','','0','0','down_a1','code','0','װ���Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('726','','0','0','index_t22','code','0','<br><br>������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('727','','0','0','index_t23','code','0','<br><br>2 ������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('728','','0','0','index_t24','code','0','<br><br>33������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('729','','0','0','index_t25','code','0','<br><br>44������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('730','','0','0','index_j32','code','0','dd<br><br>������ʾ����,�����������������<br><br><br><br>dd','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1293084023','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('731','','0','0','index_j33','code','0','<br><br>������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('732','','0','0','index_j34','code','0','d<br><br>������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('733','','0','0','index_tr12','code','0','1<br><br>������ʾ����,�����������������<br><br><br><br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('734','','0','0','index_tr13','code','0','2<br><br>������ʾ����,�����������������<br><br><br><br>2','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('735','','0','0','index_tr14','code','0','3<br><br>������ʾ����,�����������������<br><br><br><br>3','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('736','','0','0','index_tr15','code','0','4<br><br>������ʾ����,�����������������<br><br><br><br>6','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('737','','0','0','index_trrr1','code','0','<span id=\"Span6\" onmouseover=\"ShowTab(6,6,11)\">����</span>\r\n            <span id=\"Span7\" onmouseover=\"ShowTab(7,6,11)\">ͼƬ</span>\r\n            <span id=\"Span8\" onmouseover=\"ShowTab(8,6,11)\">Ӱ��</span>\r\n            <span id=\"Span9\" onmouseover=\"ShowTab(9,6,11)\">�̳�</span>\r\n            <span id=\"Span10\" onmouseover=\"ShowTab(10,6,11)\">flash</span>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('738','','0','0','index_bfj3','code','0','<span id=\"Span11\" onmouseover=\"ShowTab(11,11,15)\">��װ</span>\r\n                    <span id=\"Span12\" onmouseover=\"ShowTab(12,11,15)\">����</span>\r\n                    <span id=\"Span13\" onmouseover=\"ShowTab(13,11,15)\">ʳƷ</span>\r\n                    <span id=\"Span14\" onmouseover=\"ShowTab(14,11,15)\">����</span>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('739','','0','0','index_5t2','code','0','	<span id=\"Span1\" onmouseover=\"ShowTab(1,1,6)\">����</span>\r\n            <span id=\"Span2\" onmouseover=\"ShowTab(2,1,6)\">ͼƬ</span>\r\n            <span id=\"Span3\" onmouseover=\"ShowTab(3,1,6)\">Ӱ��</span>\r\n            <span id=\"Span4\" onmouseover=\"ShowTab(4,1,6)\">�̳�</span>\r\n            <span id=\"Span5\" onmouseover=\"ShowTab(5,1,6)\">flash</span>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','0','0','0','default');
INSERT INTO `qb_label` VALUES ('919','','0','0','down_bv1','code','0','��վ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('920','','0','0','down_b4','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303371034','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('921','','0','0','down_b3','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303370996','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('922','','0','0','down_b2','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303371020','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('923','','0','0','down_ad4','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191109_shrig.gif\";s:7:\"imglink\";s:21:\"http://www.zwidc.com/\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"268\";s:5:\"div_h\";s:2:\"89\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292643722','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('924','','0','0','down_ad5','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191153_sdera.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"85\";}','a:3:{s:5:\"div_w\";s:3:\"270\";s:5:\"div_h\";s:2:\"84\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475675','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('925','','0','0','down_b1','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:87:\"<div class=\"list\"><a href=\"$url\" target=\"_blank\">$title</a><span>{$hits}��</span></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"42\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1303370985','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('926','','0','0','down_ad3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191142_bnynf.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"710\";s:6:\"height\";s:2:\"90\";}','a:3:{s:5:\"div_w\";s:3:\"708\";s:5:\"div_h\";s:2:\"88\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475569','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('927','','0','0','down_ad2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191154_ykdyp.jpg\";s:7:\"imglink\";s:21:\"http://www.1gftp.com/\";s:5:\"width\";s:3:\"270\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"267\";s:5:\"div_h\";s:2:\"68\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1292643191','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('928','','0','0','down_ad1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101111191127_zgile.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"710\";s:6:\"height\";s:2:\"70\";}','a:3:{s:5:\"div_w\";s:3:\"707\";s:5:\"div_h\";s:2:\"69\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289475404','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('929','','0','0','down_a4','code','0','���¸���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('930','','0','0','down_a3','code','0','���հ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1289481643','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('931','','0','0','down_a2','code','0','�����Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','0','30','0','0','default');
INSERT INTO `qb_label` VALUES ('932','','0','0','down_a1','code','0','װ���Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','2','30','0','0','default');
INSERT INTO `qb_label` VALUES ('933','','0','0','special_finance_7','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:67:\" <div class=\"al1\"><a href=\"$url\" target=\"_blank\">��$title</a></div>\";s:13:\"tplpart_2code\";s:421:\"<div style=\"width:100%;margin:7px\"> \r\n              <div class=\"al\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"90\" height=\"65\" border=\"0\" /></a></div>\r\n              <div  class=\"sm\"> \r\n                <p><span style=\"font-weight:bold;\">$title</span></p>\r\n                <p>��$content</p>\r\n              </div>\r\n            </div> \r\n           \";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:24:\"/common_zh_pic/zh_pc.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 8 \";s:4:\"sql2\";s:178:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid  WHERE A.yz=1  AND A.ispic=1 AND R.topic=1 ORDER BY A.list DESC LIMIT 1 \";s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:2:\"60\";s:8:\"titlenum\";s:2:\"38\";s:9:\"titlenum2\";s:2:\"30\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"304\";s:5:\"div_h\";s:3:\"303\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428550','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('934','','0','0','special_finance_6','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:75:\"<div><b><a href=\"$url\" target=\"_blank\">$title</a></b><br>\r\n��$content</div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"60\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"28\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"205\";s:5:\"div_h\";s:3:\"405\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428563','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('935','','0','0','special_finance_5','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:129:\"<p><a href=\"$url\" target=\"_blank\">��{$title}</a> <span style=\"color:#727171;padding-left:10px;\">({$time_m}-{$time_d})</span> </p>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"9\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 9 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"385\";s:5:\"div_h\";s:3:\"234\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428556','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('936','','0','0','special_finance_4','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:129:\"<p><a href=\"$url\" target=\"_blank\">��{$title}</a> <span style=\"color:#727171;padding-left:10px;\">({$time_m}-{$time_d})</span> </p>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"8\";s:3:\"sql\";s:95:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list ASC LIMIT 8 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"380\";s:5:\"div_h\";s:3:\"218\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428541','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('937','','0','0','special_sport_2','code','0','<a href=\"#\">��������</a> | <a href=\"#\">��������</a> | <a href=\"#\">��������</a> ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('938','','0','0','special_finance_3','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:153:\"<div class=\"diao_bt\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n            <div class=\"yy\">$content<a href=\"$url\" target=\"_blank\">[��ϸ]</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"120\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"358\";s:5:\"div_h\";s:2:\"85\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428532','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('939','','0','0','special_car_32','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:48:\" ��<a href=\"$url\" target=\"_blank\">$title</a><br>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"243\";s:5:\"div_h\";s:3:\"175\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428338','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('940','','0','0','special_car_25','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:298:\"<div class=\"spic\">\r\n        <div class=\"auto_08\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" width=\'150\' height=\'99\' onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" border=\"0\" /></a></div>\r\n        <div class=\"SHIPAI\"><a href=\"$ur\" target=\"_blank\">$title</a></div>\r\n      </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:126:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"350\";s:5:\"div_h\";s:3:\"320\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428354','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('941','','0','0','special_car_29','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:53:\"<div><a href=\"$url\" target=\"_blank\">$title</a></div> \";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"13\";s:3:\"sql\";s:97:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 13 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"46\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"326\";s:5:\"div_h\";s:3:\"312\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428346','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('942','','0','0','special_car_24','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:304:\"<div class=\"hpic\">\r\n          <div class=\"auto_08\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" width=\'150\' height=\'99\' onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" border=\"0\" /></a></div>\r\n          <div class=\"SHIPAI\"><a href=\"$ur\" target=\"_blank\">$title</a></div>\r\n        </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:127:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"26\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"988\";s:5:\"div_h\";s:3:\"325\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428325','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('943','','0','0','special_car_13','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:595:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                  <tr> \r\n                    <td class=\"Czhouju\"> \r\n                      <div class=\"L left_tu\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"80\" height=\"60\" /></div>\r\n                      <div class=\"L right_zi\"> <a href=\"$url\" target=\"_blank\" style=\"color:#004276;\">$title</a><br>����$content<a href=\"$url\" target=\"_blank\" style=\"color:#98122A;\">[ȫ��]</a><br>\r\n                      </div>\r\n                    </td>\r\n                  </tr>\r\n                </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:33:\"/common_pic/title_pic_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:2:\"cp\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"2\";s:3:\"sql\";s:195:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  AND R.topic=1 ORDER BY A.list ASC LIMIT 2 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"70\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"36\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"355\";s:5:\"div_h\";s:3:\"174\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428302','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('944','','0','0','special_car_23','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:49:\"��<A HREF=\"$url\" target=\'_blank\'  >$title</a><br>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:24:\"/common_title/0title.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"223\";s:5:\"div_h\";s:2:\"90\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428312','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('945','','0','0','special_car_12','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:56:\"<div><a href=\"$url\" target=\"_blank\">$title</a> </div>   \";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"46\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"352\";s:5:\"div_h\";s:3:\"137\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428291','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('946','','0','0','special_car_10','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:653:\"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                  <tr> \r\n                    <td class=\"Czhouju\"> \r\n                      <div class=\"L left_tu\"><a href=\"$url\" target=\"_blank\"><img width=\'95\' height=\'64\' src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" border=\"0\" /></a></div>\r\n                      <div class=\"L right_zi\"> <a href=\"$url\" style=\"color:#004276;\" target=\"_blank\">$title</a><br>\r\n                        $content<span href=\"$url\" style=\"color:#98122A;\">[��ϸ]</span><br>\r\n                      </div>\r\n                    </td>\r\n                  </tr>\r\n                </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:33:\"/common_pic/title_pic_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:2:\"cp\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:196:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  AND R.topic=1 ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"60\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"363\";s:5:\"div_h\";s:3:\"248\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428279','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('947','','0','0','special_car_8','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:55:\" <div><a href=\"$url\" target=\"_blank\">$title</a> </div> \";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:95:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list ASC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"347\";s:5:\"div_h\";s:3:\"139\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428270','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('948','','0','0','special_car_7','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:300:\"<div class=\"Calign\"> \r\n                <div class=\"Text\"> <span><a href=\"$url\" target=\"_blank\">$title</a></span></div>\r\n                <div class=\"line_ys\"> <span style=\"text-indent:20px;\">$content<a href=\"$url\" style=\"color:#98122A;\">[ȫ��]</a></span></div>\r\n                 \r\n              </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"2\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 2 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"160\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"370\";s:5:\"div_h\";s:3:\"207\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428262','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('949','','0','0','special_sport_23','article','1','a:32:{s:13:\"tplpart_1code\";s:194:\"<div class=\"content_list\"><span>��[<a href=\"$list_url\" target=\"_blank\">$fname</a>]<a href=\"$url\" target=\"_blank\">$title</a></span> \r\n                    <font>{$time_m}��{$time_d}��</font></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"15\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list ASC LIMIT 15 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"468\";s:5:\"div_h\";s:3:\"450\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290134248','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('950','','0','0','special_sport_22','article','1','a:32:{s:13:\"tplpart_1code\";s:194:\"<div class=\"content_list\"><span>��[<a href=\"$list_url\" target=\"_blank\">$fname</a>]<a href=\"$url\" target=\"_blank\">$title</a></span> \r\n                    <font>{$time_m}��{$time_d}��</font></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"15\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 15 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"468\";s:5:\"div_h\";s:3:\"466\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290134230','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('951','','0','0','special_sport_18','article','1','a:32:{s:13:\"tplpart_1code\";s:235:\"<div class=\"photo_list\"><a href=\"$url\" target=\"_blank\"><img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" width=\"160\" height=\"110\" border=\"0\" /></a><br />\r\n  <a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:132:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"925\";s:5:\"div_h\";s:3:\"134\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133716','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('952','','0','0','special_sport_17','article','1','a:32:{s:13:\"tplpart_1code\";s:75:\"<div class=\"content_list\">��<a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 4 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"375\";s:5:\"div_h\";s:3:\"108\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133507','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('953','','0','0','special_sport_16','article','1','a:32:{s:13:\"tplpart_1code\";s:75:\"<div class=\"content_list\">��<a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:101:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list ASC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"373\";s:5:\"div_h\";s:3:\"163\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133420','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('954','','0','0','special_sport_15','article','1','a:32:{s:13:\"tplpart_1code\";s:75:\"<div class=\"content_list\">��<a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:13:\"RollStyleType\";s:0:\"\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:1:\"0\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:102:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'0\'   ORDER BY A.list DESC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"375\";s:5:\"div_h\";s:3:\"160\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133428','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('955','','0','0','special_sport_1','code','0','<a href=\"#\">�����ղ�</a> | <a href=\"#\">��Ϊ��ҳ</a> ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"113\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290131646','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('956','','0','0','special_sport_2','code','0','<a href=\"#\">��������</a> | <a href=\"#\">��������</a> | <a href=\"#\">��������</a> ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"191\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290131639','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('957','','0','0','special_sport_3','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101119091126_q0kjm.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"960\";s:6:\"height\";s:3:\"160\";}','a:3:{s:5:\"div_w\";s:3:\"961\";s:5:\"div_h\";s:3:\"159\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290137907','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('958','','0','0','special_sport_4','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"306\";s:6:\"height\";s:3:\"262\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101119101151_gvdry.jpg\";i:2;s:32:\"label/1_20101119101155_mqgga.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:3:\"310\";s:5:\"div_h\";s:3:\"262\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290132179','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('959','','0','0','special_sport_5','swf','0','a:3:{s:8:\"flashurl\";s:58:\"http://player.youku.com/player.php/sid/XOTk1OTE2NjQ=/v.swf\";s:5:\"width\";s:3:\"305\";s:6:\"height\";s:3:\"275\";}','a:3:{s:5:\"div_w\";s:3:\"302\";s:5:\"div_h\";s:3:\"271\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290132344','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('960','','0','0','special_sport_6','code','0','ϣ��˹���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('961','','0','0','special_sport_7','code','0','<table width=\"96%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"right_content1\">\r\n					  <tr>\r\n						<td width=\"45%\"><img src=\"http://www_qibosoft_com/images/special/sports/tiyu_photo3.gif\" width=\"100\" height=\"80\" /></td>\r\n					    <td width=\"55%\">ϣ��˹����Ϊ�����ɫ�ı�����ѡ�֣������ļ���ʹ���õ����20���������ھ�...[<a href=\"#\">��ϸ</a>]</td>\r\n					  </tr>\r\n					 </table>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"243\";s:5:\"div_h\";s:2:\"90\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290132645','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('962','','0','0','special_sport_8','code','0','����ý��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('963','','0','0','special_sport_9','code','0','<img src=\"http://www_qibosoft_com/images/special/sports/tiyu_photo4.gif\" width=\"166\" height=\"78\" /><br />�Ϻ����¥���̶��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"187\";s:5:\"div_h\";s:3:\"104\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290132805','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('964','','0','0','special_sport_10','code','0','���ѵ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('965','','0','0','special_sport_11','code','0','<table width=\"96%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"right_content1 tiyu_top\">\r\n					  <tr>\r\n						<td id=\"vote_title\">���ϣ��˹����������������ô��?</td>\r\n				      </tr>\r\n					  <tr>\r\n						<td class=\"vote_cont\">\r\n							<span><input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\" /> ������,ϣ��˹������˵��°ܻ�</span>\r\n							<span><input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\" /> ������,˹ŵ������Ҳ���Ǹɾ�����</span>\r\n							<span><input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\" /> ������,ϣ��˹��������ô��</span>\r\n							<span><input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\" /> ����,��Աȷʵ�⿿�����������Լ�</span>\r\n							<span><input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\" /> ˵���壬����̬��չ��</span>\r\n						</td>\r\n				      </tr>\r\n				  </table>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"245\";s:5:\"div_h\";s:3:\"210\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290132887','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('966','','0','0','special_sport_12','code','0','<font face=\"����\"><a href=\"#\" >ϣ��˹ϴ�Ѷ�����</a> <a href=\"#\">����6���·�75000Ӣ��</a></font>\r\n\r\n\r\n ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"367\";s:5:\"div_h\";s:2:\"20\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133123','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('967','','0','0','special_sport_13','code','0','<font face=\"����\"><a href=\"#\" >ϣ��˹������ź�¶��</a> <a href=\"#\">�佱�񵱾ȳ��α�</a></font>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"366\";s:5:\"div_h\";s:2:\"20\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133184','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('968','','0','0','special_sport_14','code','0','<font face=\"����\"><a href=\"#\" >Ӣý��ϣ��˹�ջ�¸������</a> <a href=\"#\">����̨������</a></font> ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"370\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133258','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('969','','0','0','special_sport_19','code','0','ϣ��˹�ݶ������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"127\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290133781','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('970','','0','0','special_sport_20','code','0','���½�չ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('971','','0','0','special_sport_21','code','0','��������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('972','','0','0','special_car_1','code','0','�����ղ� | ��Ϊ��ҳ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"147\";s:5:\"div_h\";s:2:\"20\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290150121','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('973','','0','0','special_car_2','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101119151121_pnoj5.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:4:\"1014\";s:6:\"height\";s:3:\"166\";}','a:3:{s:5:\"div_w\";s:4:\"1008\";s:5:\"div_h\";s:3:\"153\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290150338','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('974','','0','0','special_car_3','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"346\";s:6:\"height\";s:3:\"250\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101119151138_usu7n.jpg\";i:2;s:32:\"label/1_20101119151145_ysl0g.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:3:\"180\";s:5:\"div_h\";s:3:\"253\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290150658','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('975','','0','0','special_car_4','swf','0','a:3:{s:8:\"flashurl\";s:58:\"http://player.youku.com/player.php/sid/XMjE3NjczMDQ0/v.swf\";s:5:\"width\";s:3:\"344\";s:6:\"height\";s:3:\"256\";}','a:3:{s:5:\"div_w\";s:3:\"172\";s:5:\"div_h\";s:3:\"257\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290150893','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('976','','0','0','special_car_5','code','0','�µ�A3���౱����չ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"154\";s:5:\"div_h\";s:2:\"17\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290150943','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('977','','0','0','special_car_6','code','0','<a href=\"#\"><span class=\"STYLE1\">[�µ�A3Ƶ��]</span></a> <a href=\"#\"><span class=\"STYLE1\">[ʵ�ʳ�չ]</span></a> \r\n                  <a href=\"#\"><span class=\"STYLE1\">[�µϳ��ѻ�]</span></a> <a href=\"#\"><span class=\"STYLE1\">[΢�����۰µ�A3]</span></a>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"339\";s:5:\"div_h\";s:2:\"16\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290152789','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('978','','0','0','special_car_9','code','0','�Լݰµ�A3','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('979','','0','0','mvshow','article','1','a:31:{s:13:\"tplpart_1code\";s:144:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\"> <A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','19','0','default');
INSERT INTO `qb_label` VALUES ('980','','0','0','special_car_11','code','0','�µ�A3����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('981','','0','0','mvshow','article','1','a:31:{s:13:\"tplpart_1code\";s:144:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\"> <A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('982','','0','0','mvshow','article','1','a:31:{s:13:\"tplpart_1code\";s:144:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\"> <A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('983','','0','0','mvshow','article','1','a:31:{s:13:\"tplpart_1code\";s:144:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\"> <A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('984','','0','0','special_car_14','code','0','�µ�A3����ָ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('985','','0','0','special_car_15','code','0','<li>\r\n                            <div class=\"PA10\">1.4T���ʰ�<span>26.8��</span></div>\r\n                          </li>\r\n                          <li>\r\n                            <div class=\"CALIGN_C2\">1.4T���ʰ�<span>26.8��</span></div>\r\n                          </li>\r\n                          <li>\r\n                            <div class=\"PA10\">1.4T���ʰ�<span>26.8��</span></div>\r\n                          </li>\r\n                          <li>\r\n                            <div class=\"CALIGN_C2\">1.4T���ʰ�<span>26.8��</span></div>\r\n                          </li>\r\n                          <li class=\"CANSHU\">���������೵�Ͳ�������>></li>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"207\";s:5:\"div_h\";s:3:\"140\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290153727','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('986','','0','0','special_car_16','code','0','�Ƽ�ָ��<span>4</span>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"118\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290153782','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('987','','0','0','special_car_17','code','0','<img src=\"http://www_qibosoft_com/news/images/special/car/c5.gif\" /> <img src=\"http://www_qibosoft_com/news/images/special/car/c5.gif\" /> \r\n                        <img src=\"http://www_qibosoft_com/news/images/special/car/c5.gif\" /> <img src=\"http://www_qibosoft_com/news/images/special/car/c5.gif\" /> \r\n                        <img src=\"http://www_qibosoft_com/news/images/special/car/c6.gif\" />','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"212\";s:5:\"div_h\";s:2:\"34\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300427512','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('988','','0','0','special_car_18','code','0','΢������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('989','','0','0','special_car_19','code','0','�ߵ����еľ�ƷС���µ�A3<br>\r\n                        �ܷ�Ӯ���й��г������ߵ��Ͽɣ�<br>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"178\";s:5:\"div_h\";s:2:\"48\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290153966','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('990','','0','0','special_car_20','code','0','����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('991','','0','0','special_car_21','code','0','1.����ο����µ�A3��<br>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        ��Ʒ��ʱ���³�</label><br>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        ��һ��һ�ڳ���Ϯ</label><br>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        ��߶���ͬƽ̨���ۼ۽ϸ�</label><br>\r\n                        <div style=\"margin-top:5px;\">2.����Ϊ�µϵ�����������ǣ�</div>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        MINI Cper</label> <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        �ֶ���C30</label><br>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        �߶��� GTI</label> <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        ����1ϵ</label><br>\r\n                        <label>\r\n                        <input type=\"radio\" name=\"RadioGroup1\" value=\"��ѡ\" />\r\n                        ����B��</label><br />\r\n                        <div style=\"margin:7px;\"> \r\n                          <input type=\"button\" value=\"�ύ\" />\r\n                          <input type=\"button\" value=\"�鿴\" />\r\n                        </div>\r\n                      ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"210\";s:5:\"div_h\";s:3:\"197\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290154073','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('992','','0','0','special_car_22','code','0','���ѻ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('993','','0','0','mvshow','article','1','a:31:{s:13:\"tplpart_1code\";s:149:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\">&nbsp;<A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:7:\"artcile\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";s:3:\"102\";s:7:\"tplpath\";s:30:\"/common_title/1title_noico.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:5:\"A.aid\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:103:\" SELECT A.*,A.aid AS id FROM qb_article A  WHERE A.yz=1  AND A.mid=\'102\'   ORDER BY A.aid DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"46\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"30\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1240201322','11','30','24','0','default');
INSERT INTO `qb_label` VALUES ('994','','0','0','mvshow','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:144:\"(mv,400,300,false)$mvurl(/mv)<div style=\"padding:8px 0 10px 0;\"> <A HREF=\"$url\" target=\'_blank\'  style=\"font-size:14px;\"><b>$title</b></a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:24:\"/common_title/0title.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"50\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:2:\"50\";s:5:\"div_h\";s:2:\"21\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428507','11','30','23','0','default');
INSERT INTO `qb_label` VALUES ('995','','0','0','special_car_26','code','0','�µ�A3ʵ��ͼ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('996','','0','0','special_car_27','code','0','�µ����۳��͵ģ����֣�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('997','','0','0','special_car_28','code','0','������������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('998','','0','0','special_car_30','code','0','�������г���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('999','','0','0','special_car_31','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101119161159_20k4y.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"240\";s:6:\"height\";s:3:\"130\";}','a:3:{s:5:\"div_w\";s:3:\"240\";s:5:\"div_h\";s:3:\"127\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290154756','11','30','22','0','default');
INSERT INTO `qb_label` VALUES ('1000','','0','0','special_finance_1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101122151143_g4zey.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"960\";s:6:\"height\";s:3:\"150\";}','a:3:{s:5:\"div_w\";s:3:\"958\";s:5:\"div_h\";s:3:\"149\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290409679','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1001','','0','0','special_finance_2','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"298\";s:6:\"height\";s:3:\"261\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101122151110_kzqtx.jpg\";i:2;s:32:\"label/1_20101122151126_jorrb.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:3:\"294\";s:5:\"div_h\";s:3:\"257\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290411221','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1002','','0','0','special_finance_8','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101122161156_ehzhv.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"354\";s:6:\"height\";s:3:\"120\";}','a:3:{s:5:\"div_w\";s:3:\"354\";s:5:\"div_h\";s:3:\"119\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290414265','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1003','','0','0','special_finance_12','code','0','��������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1004','','0','0','special_finance_19','code','0','��������Ҫ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1005','','0','0','special_finance_20','code','0','��ر���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1006','','0','0','special_finance_21','code','0','���±���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1007','','0','0','special_finance_22','code','0','׷�ٱ���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1008','','0','0','special_finance_23','code','0','��Ĵ��¼�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1009','','0','0','special_finance_24','code','0','��Ԫ�����������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1010','','0','0','special_finance_25','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101122161134_anvod.jpg\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"211\";s:6:\"height\";s:3:\"133\";}','a:3:{s:5:\"div_w\";s:3:\"213\";s:5:\"div_h\";s:3:\"129\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290414346','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1011','','0','0','special_finance_28','code','0','admin@qibosoft.com','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1012','','0','0','special_sp1_1','pic','0','a:4:{s:6:\"imgurl\";s:32:\"label/1_20101122161145_th99u.gif\";s:7:\"imglink\";s:1:\"#\";s:5:\"width\";s:3:\"950\";s:6:\"height\";s:3:\"150\";}','a:3:{s:5:\"div_w\";s:3:\"948\";s:5:\"div_h\";s:3:\"149\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290416100','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1013','','0','0','special_sp1_2','rollpic','0','a:6:{s:8:\"rolltype\";s:1:\"0\";s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"220\";s:6:\"picurl\";a:2:{i:1;s:32:\"label/1_20101122161104_gaaxz.jpg\";i:2;s:32:\"label/1_20101122161110_yoshc.jpg\";}s:7:\"piclink\";a:2:{i:1;s:1:\"#\";i:2;s:1:\"#\";}s:6:\"picalt\";a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}}','a:3:{s:5:\"div_w\";s:3:\"147\";s:5:\"div_h\";s:3:\"219\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290416339','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1014','','0','0','special_sp1_3','swf','0','a:3:{s:8:\"flashurl\";s:58:\"http://player.youku.com/player.php/sid/XMjIxMTM5MTMy/v.swf\";s:5:\"width\";s:3:\"301\";s:6:\"height\";s:3:\"261\";}','a:3:{s:5:\"div_w\";s:3:\"164\";s:5:\"div_h\";s:3:\"268\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290416435','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1015','','0','0','special_sp1_4','code','0','<table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:23px;\">\r\n					  <tr>\r\n						\r\n                      <td width=\"39%\"><img src=\"http://i1.sinaimg.cn/dy/2010/0512/S11612T1273624471182.jpg\" width=82 height=98/></td>\r\n					    <td width=\"61%\">\r\n							<div class=\"Cor3\"><a href=\"#\">�Ӳ���������������</a></div>\r\n							<div class=\"TEXT\">������᣺��Ϊ�����������Ῠ÷����ѭ����켣������˽��Сѧ�����ٹ�ѧ��ţ���ѧ��\r\n</div>\r\n						</td>\r\n					  </tr>\r\n				  </table>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"237\";s:5:\"div_h\";s:3:\"106\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290416780','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1016','','0','0','special_sp1_5','code','0','<div class=\"TANGBIAOT\">\r\n					   <a href=\"#\" style=\"font-weight:bold;\">��̳���ǣ�</a>\r\n					 <a href=\"#\">2005�꿨÷���ڼ������˿��õ�����£��Գ�ɫ�Ŀ��£��Գ�ɫ�Ŀ��£��Գ�ɫ�ĳɹ���ѡ�����£��Գ�ɫ���£��Գ�ɫ�ĵ��ص����ס�</a></div>\r\n					<div class=\"TANGBIAOT\">\r\n					  <a href=\"#\" style=\"font-weight:bold;\">������</a>\r\n				  <a href=\"#\">��÷���ԡ����ĿںŴ���ѡ���ڹ����쵼�����⻼֮�£��������뿴�������ɾ��ǡ�����</a> </div>\r\n					<div class=\"TANGBIAOT\">\r\n					  <a href=\"#\" style=\"font-weight:bold;\">�������⣺</a>\r\n				  <a href=\"#\">��÷�׳ƽ��ؽ����ڶ����ε����Σ������ʵ��Ŀ�ؽ����ڶ����ε����Σ������ʵ����Ȼ�д��۲졣</a></div>','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"248\";s:5:\"div_h\";s:3:\"232\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290416775','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1017','','0','0','special_sp1_16','code','0',' Ӧ����Ժ�����¼ұ����룬���е߼����������������������ά����÷�׽���11��9����10�ն��й�������ʽ���ʡ� ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:3:\"330\";s:5:\"div_h\";s:2:\"43\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1290476395','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1018','','0','0','special_sp1_19','code','0','�û��г�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1019','','0','0','special_sp1_20','code','0','�۽�Ӣ�����࿨÷��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1020','','0','0','special_sp1_21','code','0','ͼƬ����','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1021','','0','0','special_sp1_22','code','0','ͼ�ı���','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1022','','0','0','special_sp1_23','code','0','ʱ��׷��','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1023','','0','0','special_sp1_24','code','0','������','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1024','','0','0','special_sp1_25','code','0','������Ϣ','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1025','','0','0','special_sp1_26','code','0','�༭�Ƽ�','a:4:{s:9:\"html_edit\";N;s:5:\"div_w\";s:0:\"\";s:5:\"div_h\";s:0:\"\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','0','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1026','','0','0','special_finance_9','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:424:\"<div class=\"ren_h\">\r\n                <div class=\"at\"><img src=\"$webdb[www_url]/images/special/finance/finace_3.jpg\" width=\"15\" height=\"16\" /></div>\r\n                <div class=\"ab\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n              </div>\r\n              <div class=\"ren_by\"> \r\n                \r\n  <p>{$content} <a href=\"$url\" target=\"_blank\"><font color=\"#990000\">[����]</font></a> \r\n  </p>\r\n              </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"1\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 1 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"270\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"553\";s:5:\"div_h\";s:3:\"144\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428570','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1027','','0','0','special_finance_10','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:165:\"  <div><span style=\"float:left;\"><a href=\"$url\" target=\"_blank\">��$title</a></span><span style=\"float:right;\">({$time_m} -{$time_d})</span><br />\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"459\";s:5:\"div_h\";s:3:\"320\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428578','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1028','','0','0','special_finance_11','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:165:\"  <div><span style=\"float:left;\"><a href=\"$url\" target=\"_blank\">��$title</a></span><span style=\"float:right;\">({$time_m} -{$time_d})</span><br />\r\n            </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:95:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list ASC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"371\";s:5:\"div_h\";s:3:\"306\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428584','11','30','21','0','default');
INSERT INTO `qb_label` VALUES ('1029','','0','0','special_sp1_9','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:237:\"<div class=\"photo_list\">    \r\n<a href=\"$url\" target=\"_blank\">\r\n<img width=\"164\" height=\"123\" src=\"$picurl\" border=0 onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" /></a>\r\n\r\n<a href=\"$url\" target=\"_blank\">$title</a>\r\n</div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"p\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"5\";s:3:\"sql\";s:126:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"20\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"904\";s:5:\"div_h\";s:3:\"153\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428659','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1030','','0','0','special_sp1_10','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:571:\"<table width=\"96%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"right_content1\">\r\n					  <tr>\r\n						\r\n                <td width=\"37%\"><a href=\"$url\" target=\"_blank\">\r\n				<img src=\"$picurl\" onerror=\"this.src=\'$webdb[www_url]/images/default/nopic.jpg\'\" border=\"0\" width=\"100\" height=\"68\" /></a></td>\r\n					    \r\n                <td width=\"63%\"><a href=\"$url\" style=\"color:#1F4363;\" target=\"_blank\">$title</a> \r\n                  <div style=\"color:#6A6A6A;\">��$content  [<a href=\"$url\" target=\"_blank\">��ϸ</a>]</div></td>\r\n					  </tr>\r\n					 </table>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:33:\"/common_pic/title_pic_content.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:2:\"cp\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:196:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1  AND A.ispic=1   AND A.ispic=1  AND R.topic=1 ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"50\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"310\";s:5:\"div_h\";s:3:\"229\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428672','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1031','','0','0','special_sp1_11','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:71:\"<div class=\"Lianjie\">�� <a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:2:\"10\";s:3:\"sql\";s:97:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 10 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"351\";s:5:\"div_h\";s:3:\"326\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428665','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1032','','0','0','special_sp1_12','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:176:\"<div class=\"Tbiaoti\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n		\r\n<div class=\"xwzi\">{$content} <a href=\"$url\" target=\"_blank\" style=\"color:#990000;\">  [����] </a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:165:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list ASC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:3:\"100\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"236\";s:5:\"div_h\";s:3:\"232\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428651','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1033','','0','0','special_sp1_13','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:72:\" <div class=\"Lianjie\">�� <a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"7\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 7 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"46\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"360\";s:5:\"div_h\";s:3:\"190\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428644','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1034','','0','0','special_sp1_14','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:72:\" <div class=\"Lianjie\">�� <a href=\"$url\" target=\"_blank\">$title</a></div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:3:\"ASC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"6\";s:3:\"sql\";s:95:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list ASC LIMIT 6 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"359\";s:5:\"div_h\";s:3:\"162\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428629','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1035','','0','0','special_sp1_15','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:72:\"<div class=\"BJ_ljie\">�� <a href=\"$url\" target=\"_blank\">$title</a></div> \";s:13:\"tplpart_2code\";s:73:\"<div class=\"BIAOTI\"><a href=\"$url\" target=\"_blank\">$title</a></div>\r\n				\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:32:\"/common_zh_title/zh_bigtitle.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"t\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"4\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 5 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"44\";s:9:\"titlenum2\";s:2:\"32\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"354\";s:5:\"div_h\";s:3:\"196\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428623','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1036','','0','0','special_sp1_17','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:102:\"<a href=\"$url\" target=\"blank\" class=\"t\" style=\"color:#013979;\">$title</a> \r\n						<div>$content </div>\";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:29:\"/common_content/content_1.jpg\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"c\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:166:\" SELECT A.*,A.aid AS id,R.content FROM qb_download_article A LEFT JOIN qb_download_reply R ON A.aid=R.aid   WHERE A.yz=1   AND R.topic=1 ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"60\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"30\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"235\";s:5:\"div_h\";s:3:\"186\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428615','11','30','20','0','default');
INSERT INTO `qb_label` VALUES ('1037','','0','0','special_sp1_18','Info_download_','1','a:35:{s:13:\"tplpart_1code\";s:72:\"<div class=\"BJ_ljie\">�� <a href=\"$url\" target=\"_blank\">$title</a></div> \";s:13:\"tplpart_2code\";s:0:\"\";s:3:\"SYS\";s:3:\"CMS\";s:3:\"PRE\";s:9:\"download_\";s:5:\"ctype\";s:7:\"article\";s:13:\"RollStyleType\";s:0:\"\";s:7:\"fidtype\";s:1:\"0\";s:8:\"rolltype\";s:10:\"scrollLeft\";s:8:\"rolltime\";s:1:\"3\";s:11:\"roll_height\";s:2:\"50\";s:5:\"width\";s:3:\"250\";s:6:\"height\";s:3:\"187\";s:7:\"newhour\";s:2:\"24\";s:7:\"hothits\";s:3:\"100\";s:7:\"amodule\";N;s:7:\"tplpath\";s:0:\"\";s:6:\"DivTpl\";i:1;s:5:\"fiddb\";N;s:5:\"stype\";s:1:\"4\";s:2:\"yz\";s:1:\"1\";s:7:\"hidefid\";N;s:10:\"timeformat\";s:11:\"Y-m-d H:i:s\";s:5:\"order\";s:6:\"A.list\";s:3:\"asc\";s:4:\"DESC\";s:6:\"levels\";s:3:\"all\";s:7:\"rowspan\";s:1:\"3\";s:3:\"sql\";s:96:\" SELECT A.*,A.aid AS id FROM qb_download_article A  WHERE A.yz=1   ORDER BY A.list DESC LIMIT 3 \";s:4:\"sql2\";N;s:7:\"colspan\";s:1:\"1\";s:11:\"content_num\";s:2:\"80\";s:12:\"content_num2\";s:3:\"120\";s:8:\"titlenum\";s:2:\"40\";s:9:\"titlenum2\";s:2:\"40\";s:10:\"titleflood\";s:1:\"0\";s:10:\"c_rolltype\";s:1:\"0\";}','a:3:{s:5:\"div_w\";s:3:\"310\";s:5:\"div_h\";s:3:\"108\";s:11:\"div_bgcolor\";s:0:\"\";}','0','0','1','admin','1300428637','11','30','20','0','default');
INSERT INTO `qb_friendlink` VALUES ('12','0','PHPWIND�ٷ���̳','http://www.phpwind.net/','http://www.phpwind.net/logo.gif','PHPWIND�ٷ���̳','32','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('5','0','�벩CMS','http://www.qibosoft.com','../images/default/friendlink.gif','����������CMS��վϵͳ�ṩ��','40','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('13','3','�й�վ��վ','http://www.chinazhan.net/','','�й�վ��վ','0','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('17','3','������̳','http://www.dvbbs.net/','','������̳','0','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('18','3','��������','http://www.sudu.cn/','','','25','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('25','2','վ����','http://admin5.com/','friendlink/1_20090418160400_wqpAk.gif','վ����','37','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('26','2','�й�վ��վ','http://www.chinaz.com/','friendlink/1_20090418160432_JNCry.gif','�й�վ��վ','38','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('27','2','WEB������','http://www.cncms.com.cn/','friendlink/1_20090418160451_64IKO.gif','WEB������','34','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('29','2','�е绪ͨ','http://www.chinaccnet.com/','','�е绪ͨ','0','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink` VALUES ('34','3','CNZZ','http://www.cnzz.cn/','','CNZZ','26','0','0','0','0','0','','1','0');
INSERT INTO `qb_friendlink_sort` VALUES ('2','��������','0');
INSERT INTO `qb_friendlink_sort` VALUES ('3','�������','0');
INSERT INTO `qb_limitword` VALUES ('1','�췴','��**');
INSERT INTO `qb_limitword` VALUES ('2','���ֹ�','��**��');
INSERT INTO `qb_ad_norm_place` VALUES ('1','article_list','�����б�ҳ������','code','0','0','0','a:5:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";}','0','0','0','0','0','5','0','1','/do/job.php?job=jump&pagetype=list');
INSERT INTO `qb_ad_norm_place` VALUES ('10','article_content','����������ߵĹ��','pic','1','0','0','a:8:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:32:\"other/1_20090326120324_mnfIi.jpg\";s:7:\"linkurl\";s:22:\"http://www.qibosoft.com/\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";s:5:\"width\";s:3:\"400\";s:6:\"height\";s:3:\"400\";s:9:\"pictarget\";s:5:\"blank\";}','0','0','0','0','0','5','1','1','/do/job.php?job=jump&pagetype=bencandy');
INSERT INTO `qb_ad_norm_place` VALUES ('2','article_show','��������ҳ����·����','code','0','0','0','a:5:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:1782:\"<div style=\"LINE-HEIGHT: 150%\"><a href=\"http://www.zxx6.com/\" target=_blank><font color=#ff0000><strong>վ��ѧϰ��</strong></font></a> ����<a href=\"http://www.angelyyl.cn/\" target=_blank>��������</a><a href=\"http://www.czin.cn/\" target=_blank><br />�������ߡ������˵����ϼ�԰</a> <br /><a href=\"http://www.sy50.com/\" target=_blank>�������� �˽����� ��������</a> <br /><a href=\"http://www.771881.cn/\" target=_blank>�����㱧����-����Ůͬ������-�ܼ�Ů��վ </a><br /><a href=\"http://www.aihut.com/\" target=_blank>���С��ԭ����������� </a><br /><a href=\"http://www.popyule.com/\" target=_blank>����������--�����ۺ�վqibosoft����</a> <br /><a href=\"http://www.china551.cn/\" target=_blank><font color=#ff0000>����������</font></a> ����<a href=\"http://www.ym988.com/\" target=_blank>Բ��ģ�幤���� </a><br /><a href=\"http://www.welights.com/\" target=_blank>���ʵƾ���</a> ����<a href=\"http://www.hnmssy.cn/\" target=_blank>����������Ӱ��</a> <br /><a href=\"http://www.nuoyue.net/\" target=_blank><font color=#ff0000>ŵԾվ������ - վ��������ѧϰ�ĺõط�</font></a> <br /><a href=\"http://www.qzfl.com/\" target=_blank>Ȫ�ݷ��� ����Ȫ����Ϣ�������������</a> <br /><a href=\"http://www.stmsn.com/\" target=_blank>�й���������</a> ����<a href=\"http://www.downcc.cn/\" target=_blank>�󵱼����վ </a><br /><a href=\"http://www.yt12333.cn/\" target=_blank>�Ͷ��籣֮��-��ͤ�Ͷ�������</a> <br /><a href=\"http://www.gooyi.cn/\" target=_blank>������ - ��������Ż��� </a><br /><a href=\"http://www.idercn.com/\" target=_blank>I.D.����</a> ����<a href=\"http://www.tz0632.com/\" target=_blank>���ݳ�����</a> ����<a href=\"http://www.doubar.com/\" target=_blank>���� </a></div>\r\n<div style=\"LINE-HEIGHT: 150%\"><a href=\"http://www.wfseo.org/\" target=_blank><font color=#d2691e>������վ�Ż�</font><br /></a><br /></div>\";}','0','0','0','0','0','5','0','1','/do/job.php?job=jump&pagetype=bencandy');
INSERT INTO `qb_ad_norm_place` VALUES ('11','digg_list','�������а��߹��','code','0','0','0','a:5:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:813:\"<div style=\"LINE-HEIGHT: 200%\"><a href=\"http://www.ibioo.com/\" target=_blank><font color=#ff0000>�̹�������--������߻�������վ!</font> </a><br /><a href=\"http://www.51solo.net/\" target=_blank>���������Ż�����������������ҿ�ʼ </a><br /><a href=\"http://1.com/45/admin/www.china-highway.com\" target=_blank>�����·�߾����й����ٹ�·�� </a><br /><a href=\"http://www.nenbei.com/\" target=_blank><font color=#ff0000>�۱��ۺ���������ӭ���ĵ��� </font></a><br /><a href=\"http://www.liuv.net/\" target=_blank><font color=#ff0000>��ˮ���</font></a> <br /><a href=\"http://www.fming.net/\" target=_blank>����ԭ�� ��ѧ����Ӱ�Ĵ���ƽ̨ </a><br /><a href=\"http://www.netchinatown.com/\" target=_blank>ʱ���Ƴ�-���⻪�˾�Ӣ�������԰ </a><br /><a href=\"http://frp.ok586.cn/\" target=_blank>�Ϻ���������ȴ��רҵ��������. </a></div>\";}','0','0','0','0','0','5','0','1','/do/digg.php');
INSERT INTO `qb_ad_norm_place` VALUES ('19','list_page_topad','�б�ҳ��߶������λ','pic','0','0','0','a:8:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:13:\"ad/listad.jpg\";s:7:\"linkurl\";s:22:\"http://www.yeepay.com/\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";s:5:\"width\";s:3:\"290\";s:6:\"height\";s:3:\"130\";s:9:\"pictarget\";s:5:\"blank\";}','0','0','0','4','0','10','1','1','/do/job.php?job=jump&pagetype=list');
INSERT INTO `qb_ad_norm_place` VALUES ('18','show_topad','����ҳ����������','pic','0','0','0','a:8:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:18:\"ad/ad_show_top.jpg\";s:7:\"linkurl\";s:22:\"http://www.yeepay.com/\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";s:5:\"width\";s:3:\"980\";s:6:\"height\";s:2:\"60\";s:9:\"pictarget\";s:5:\"blank\";}','0','0','0','0','0','10','1','1','../do/job.php?job=jump&pagetype=bencandy');
INSERT INTO `qb_ad_norm_place` VALUES ('17','show_right_top_picad','����ҳ��߶���ͼƬ���λ','pic','0','0','0','a:8:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:15:\"ad/qyshowad.jpg\";s:7:\"linkurl\";s:43:\"http://www.qy.com.cn/idc/product_double.asp\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";s:5:\"width\";s:3:\"290\";s:6:\"height\";s:3:\"110\";s:9:\"pictarget\";s:5:\"blank\";}','0','0','0','29','0','10','1','1','/do/job.php?job=jump&pagetype=bencandy');
INSERT INTO `qb_ad_norm_place` VALUES ('20','AD_list_topad','�б�ҳ����������','pic','0','0','0','a:8:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:14:\"ad/cnidca1.gif\";s:7:\"linkurl\";s:21:\"http://www.cnidc.com/\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:0:\"\";s:5:\"width\";s:3:\"980\";s:6:\"height\";s:2:\"60\";s:9:\"pictarget\";s:5:\"blank\";}','0','0','0','4','0','10','1','1','/do/list.php?fid=1');
INSERT INTO `qb_ad_norm_place` VALUES ('21','sp_show_ad','ר��ҳ���λ','code','0','0','0','a:5:{s:4:\"word\";s:0:\"\";s:6:\"picurl\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:8:\"flashurl\";s:0:\"\";s:4:\"code\";s:943:\"<div style=\"LINE-HEIGHT: 150%\"><a href=\"http://3cq.org/\" target=_blank>�����׶����� һ��Ϊ�����ǵĺ���</a> <br /><a href=\"http://www.liuv.net/\" target=_blank>��ˮ���</a> <br /><a href=\"http://www.21yao.com/\" target=_blank>����ҽҩ��</a><br /><a href=\"http://www.fming.net/\" target=_blank>����ԭ��</a> <br /><a href=\"http://www.jnrx.net/\" target=_blank>��������</a> <br /><a href=\"http://www.7mt.cn/\" target=_blank>��Ħ��-�й���һĦ�г�����ý�� </a><br /><a href=\"http://www.hnpolice.net/\" target=_blank>���Ϲ����ߵ�ר��ѧУУ�ѻ� </a><br /><a href=\"http://www.seo178.com/\" target=_blank>SEO��ѵѡ��--����SEO��ѵ����</a> <br /><a href=\"http://www.51solo.net/\" target=_blank>Ʒ���ƹ�,SEO��վ�Ż� </a><br /><a href=\"http://www.kljy.cn/\" target=_blank>�����ڶ�ͯ���� </a><br /><a href=\"http://www.eia8.com/job/\" target=_blank>�й���������Ƹ��ְ��</a> <br /><a href=\"http://www.wenzhang8.com/\" target=_blank>���°� ������þ��������� </a>�� </div>\";}','0','0','0','0','0','0','0','1','/do/showsp.php?fid=1&id=23');
INSERT INTO `qb_ad_config` VALUES ('module_pre','ad_','');
INSERT INTO `qb_ad_config` VALUES ('Info_webname','���ϵͳ','');
INSERT INTO `qb_ad_config` VALUES ('Info_webOpen','1','');
INSERT INTO `qb_ad_config` VALUES ('module_close','0','');
INSERT INTO `qb_ad_config` VALUES ('module_id','24','');
INSERT INTO `qb_ad_compete_place` VALUES ('3','����ҳ���۹��','0','0','50','5','8','36','1','/do/digg.php');
INSERT INTO `qb_ad_compete_user` VALUES ('11','1','admin','1239277578','1239709578','50','3','1','http://www.qibosoft.com/','�벩�ٷ�վ','0','','0');
INSERT INTO `qb_ad_compete_user` VALUES ('12','1','admin','1239279810','1239711810','50','3','1','http://www.qibosoft.com/bbs','�벩�ٷ���̳','0','','0');
INSERT INTO `qb_upfile` VALUES ('1','0','0','0','1','1307093885','qb_w8_/ht/','tmp-1_20110603170605_aHR0cF9pbWdsb2FkZmZm.jpg','1','1');
INSERT INTO `qb_upfile` VALUES ('2','0','0','0','1','1307093915','qb_w8_/trade/','tmp-1_20110603170635_ZXJ3dHJl.jpg','1','1');
INSERT INTO `qb_upfile` VALUES ('3','0','0','0','1','1307093934','qb_w8_/trade/','tmp-1_20110603170654_MDAx.jpg','1','1');
INSERT INTO `qb_area` VALUES ('1','0','������','1','18','0','','0','0','','','','','N;','','0','','','0','','','','','0','b:0;');
INSERT INTO `qb_area` VALUES ('2','0','�Ϻ���','1','19','0','','0','0','','','','','N;','','0','','','0','','','','','0','b:0;');
INSERT INTO `qb_area` VALUES ('3','0','�����','1','18','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('4','0','������','1','40','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('5','0','�ӱ�ʡ','1','11','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('6','0','ɽ��ʡ','1','11','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('7','0','���ɹ�������','1','12','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('8','0','����ʡ','1','14','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('9','0','����ʡ','1','9','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('10','0','������ʡ','1','13','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('11','0','����ʡ','1','13','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('12','0','�㽭ʡ','1','11','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('13','0','����ʡ','1','17','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('14','0','����ʡ','1','9','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('15','0','����ʡ','1','11','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('16','0','ɽ��ʡ','1','17','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('17','0','����ʡ','1','17','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('18','0','����ʡ','1','17','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('19','0','����ʡ','1','14','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('20','0','�㶫ʡ','1','21','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('21','0','����׳��������','1','14','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('22','0','����ʡ','1','21','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('23','0','�Ĵ�ʡ','1','21','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('24','0','����ʡ','1','9','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('25','0','����ʡ','1','16','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('26','0','����������','1','7','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('27','0','����ʡ','1','10','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('28','0','����ʡ','1','14','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('29','0','�ຣʡ','1','8','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('30','0','���Ļ���������','1','5','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('31','0','�½�ά���������','1','18','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('32','0','̨��ʡ','1','25','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('33','0','����ر�������','1','18','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('34','0','�����ر�������','1','5','1','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('35','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('36','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('37','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('38','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('39','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('40','1','��̨��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('41','1','ʯ��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('42','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('43','1','��ͷ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('44','1','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('45','1','ͨ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('46','1','˳����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('47','1','��ƽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('48','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('49','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('50','1','ƽ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('51','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('52','1','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('53','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('54','2','¬����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('55','2','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('56','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('57','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('58','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('59','2','բ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('60','2','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('61','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('62','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('63','2','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('64','2','�ζ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('65','2','�ֶ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('66','2','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('67','2','�ɽ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('68','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('69','2','�ϻ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('70','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('71','2','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('72','3','��ƽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('73','3','�Ӷ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('74','3','������','2','0','0','','0','0','','','','','N;','','0','','','0','','','','','0','b:0;');
INSERT INTO `qb_area` VALUES ('75','3','�Ͽ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('76','3','�ӱ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('77','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('78','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('79','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('80','3','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('81','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('82','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('83','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('84','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('85','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('86','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('87','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('88','3','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('89','3','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('90','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('91','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('92','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('93','4','��ɿ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('94','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('95','4','ɳƺ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('96','4','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('97','4','�ϰ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('98','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('99','4','��ʢ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('100','4','˫����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('101','4','�山��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('102','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('103','4','ǭ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('104','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('105','4','�뽭��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('106','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('107','4','ͭ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('108','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('109','4','�ٲ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('110','4','�ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('111','4','��ƽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('112','4','�ǿ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('113','4','�ᶼ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('114','4','�潭��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('115','4','��¡��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('116','4','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('117','4','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('118','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('119','4','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('120','4','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('121','4','��Ϫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('122','4','ʯ��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('123','4','��ɽ����������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('124','4','��������������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('125','4','��ˮ����������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('126','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('127','4','�ϴ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('128','4','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('129','4','�ϴ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('130','5','ʯ��ׯ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('131','5','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('132','5','�ػʵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('133','5','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('134','5','��̨��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('135','5','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('136','5','�żҿ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('137','5','�е���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('138','5','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('139','5','�ȷ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('140','5','��ˮ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('141','6','̫ԭ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('142','6','��ͬ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('143','6','��Ȫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('144','6','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('145','6','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('146','6','˷����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('147','6','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('148','6','�˳���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('149','6','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('150','6','�ٷ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('151','6','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('152','7','���ͺ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('153','7','��ͷ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('154','7','�ں���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('155','7','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('156','7','ͨ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('157','7','������˹��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('158','7','���ױ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('159','7','�����׶���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('160','7','�����첼��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('161','7','�˰���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('162','7','���ֹ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('163','7','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('164','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('165','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('166','8','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('167','8','��˳��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('168','8','��Ϫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('169','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('170','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('171','8','Ӫ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('172','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('173','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('174','8','�̽���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('175','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('176','8','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('177','8','��«����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('178','9','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('179','9','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('180','9','��ƽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('181','9','��Դ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('182','9','ͨ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('183','9','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('184','9','��ԭ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('185','9','�׳���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('186','9','�ӱ߳�����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('187','10','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('188','10','���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('189','10','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('190','10','�׸���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('191','10','˫Ѽɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('192','10','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('193','10','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('194','10','��ľ˹��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('195','10','��̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('196','10','ĵ������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('197','10','�ں���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('198','10','�绯��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('199','10','���˰������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('200','11','�Ͼ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('201','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('202','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('203','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('204','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('205','11','��ͨ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('206','11','���Ƹ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('207','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('208','11','�γ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('209','11','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('210','11','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('211','11','̩����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('212','11','��Ǩ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('213','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('214','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('215','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('216','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('217','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('218','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('219','12','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('220','12','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('221','12','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('222','12','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('223','12','��ˮ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('224','13','�Ϸ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('225','13','�ߺ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('226','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('227','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('228','13','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('229','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('230','13','ͭ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('231','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('232','13','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('233','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('234','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('235','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('236','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('237','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('238','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('239','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('240','13','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('241','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('242','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('243','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('244','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('245','14','Ȫ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('246','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('247','14','��ƽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('248','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('249','14','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('250','15','�ϲ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('251','15','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('252','15','Ƽ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('253','15','�Ž���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('254','15','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('255','15','ӥ̶��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('256','15','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('257','15','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('258','15','�˴���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('259','15','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('260','15','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('261','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('262','16','�ൺ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('263','16','�Ͳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('264','16','��ׯ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('265','16','��Ӫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('266','16','��̨��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('267','16','Ϋ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('268','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('269','16','̩����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('270','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('271','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('272','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('273','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('274','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('275','16','�ĳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('276','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('277','16','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('278','17','֣����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('279','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('280','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('281','17','ƽ��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('282','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('283','17','�ױ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('284','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('285','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('286','17','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('287','17','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('288','17','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('289','17','����Ͽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('290','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('291','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('292','17','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('293','17','�ܿ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('294','17','פ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('295','18','�人��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('296','18','��ʯ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('297','18','ʮ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('298','18','�˲���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('299','18','�差��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('300','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('301','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('302','18','Т����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('303','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('304','18','�Ƹ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('305','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('306','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('307','18','��ʩ����������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('308','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('309','18','Ǳ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('310','18','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('311','18','��ũ������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('312','19','��ɳ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('313','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('314','19','��̶��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('315','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('316','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('317','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('318','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('319','19','�żҽ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('320','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('321','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('322','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('323','19','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('324','19','¦����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('325','19','��������������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('326','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('327','20','�ع���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('328','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('329','20','�麣��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('330','20','��ͷ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('331','20','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('332','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('333','20','տ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('334','20','ï����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('335','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('336','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('337','20','÷����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('338','20','��β��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('339','20','��Դ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('340','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('341','20','��Զ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('342','20','��ݸ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('343','20','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('344','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('345','20','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('346','20','�Ƹ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('347','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('348','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('349','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('350','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('351','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('352','21','���Ǹ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('353','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('354','21','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('355','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('356','21','��ɫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('357','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('358','21','�ӳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('359','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('360','21','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('361','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('362','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('363','22','��ָɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('364','22','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('365','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('366','22','�Ĳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('367','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('368','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('369','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('370','22','�Ͳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('371','22','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('372','22','�ٸ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('373','22','��ɳ����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('374','22','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('375','22','�ֶ�����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('376','22','��ˮ����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('377','22','��ͤ��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('378','22','������������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('379','22','��ɳȺ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('380','22','��ɳȺ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('381','22','��ɳȺ���ĵ������亣��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('382','23','�ɶ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('383','23','�Թ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('384','23','��֦����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('385','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('386','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('387','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('388','23','��Ԫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('389','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('390','23','�ڽ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('391','23','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('392','23','�ϳ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('393','23','üɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('394','23','�˱���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('395','23','�㰲��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('396','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('397','23','�Ű���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('398','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('399','23','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('400','23','���Ӳ���Ǽ��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('401','23','���β���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('402','23','��ɽ����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('403','24','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('404','24','����ˮ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('405','24','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('406','24','��˳��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('407','24','ͭ�ʵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('408','24','ǭ���ϲ���������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('409','24','�Ͻڵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('410','24','ǭ�������嶱��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('411','24','ǭ�ϲ���������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('412','25','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('413','25','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('414','25','��Ϫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('415','25','��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('416','25','��ͨ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('417','25','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('418','25','˼é��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('419','25','�ٲ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('420','25','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('421','25','��ӹ���������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('422','25','��ɽ׳������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('423','25','��˫���ɴ���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('424','25','�������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('425','25','�º���徰����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('426','25','ŭ��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('427','25','�������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('428','26','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('429','26','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('430','26','ɽ�ϵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('431','26','�տ������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('432','26','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('433','26','�������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('434','26','��֥����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('435','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('436','27','ͭ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('437','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('438','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('439','27','μ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('440','27','�Ӱ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('441','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('442','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('443','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('444','27','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('445','28','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('446','28','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('447','28','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('448','28','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('449','28','��ˮ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('450','28','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('451','28','��Ҵ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('452','28','ƽ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('453','28','��Ȫ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('454','28','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('455','28','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('456','28','¤����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('457','28','���Ļ���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('458','28','���ϲ���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('459','29','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('460','29','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('461','29','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('462','29','���ϲ���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('463','29','���ϲ���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('464','29','�������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('465','29','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('466','29','�����ɹ������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('467','30','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('468','30','ʯ��ɽ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('469','30','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('470','30','��ԭ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('471','30','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('472','31','��³ľ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('473','31','����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('474','31','��³������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('475','31','���ܵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('476','31','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('477','31','���������ɹ�������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('478','31','���������ɹ�������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('479','31','�����յ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('480','31','�������տ¶�����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('481','31','��ʲ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('482','31','�������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('483','31','���������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('484','31','���ǵ���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('485','31','����̩����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('486','31','ʯ������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('487','31','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('488','31','ͼľ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('489','31','�������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('490','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('491','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('492','32','��¡��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('493','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('494','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('495','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('496','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('497','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('498','32','��԰��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('499','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('500','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('501','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('502','32','�û���','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('503','32','��Ͷ��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('504','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('505','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('506','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('507','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('508','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('509','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('510','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('511','32','̨����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('512','32','�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('513','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('514','32','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('515','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('516','33','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('517','33','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('518','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('519','33','��������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('520','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('521','33','��ˮ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('522','33','�ƴ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('523','33','�ͼ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('524','33','�뵺��','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('525','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('526','33','����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('527','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('528','33','ɳ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('529','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('530','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('531','33','������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('532','33','Ԫ����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('533','34','�����л���������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('534','34','������ʥ����������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('535','34','�����д�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('536','34','��������������','2','0','0','','0','0','','','','','','','0','','','0','','','','','0','');
INSERT INTO `qb_area` VALUES ('537','34','�����з�˳����','2','0','0','','0','0','','','','','N;','','0','','','0','','','','','0','b:0;');
INSERT INTO `qb_jfabout` VALUES ('6','2','�������¿ɵ�{$webdb[postArticleMoney]}������','ֻ����˺�����²ſɵû���,û��˵����²��û���.','0');
INSERT INTO `qb_jfabout` VALUES ('7','2','ɾ�����¿۳�{$webdb[deleteArticleMoney]}������','','0');
INSERT INTO `qb_jfabout` VALUES ('5','1','�û�ע��ɵ�{$webdb[regmoney]}������','','0');
INSERT INTO `qb_jfabout` VALUES ('8','2','���±�����Ϊ�����ɵ�{$webdb[comArticleMoney]}������','','0');
INSERT INTO `qb_jfabout` VALUES ('9','1','ÿ���㿨�ɶһ�{$webdb[MoneyRatio]}������,�㿨����ͨ�����߳�ֵ���.','','0');
INSERT INTO `qb_jfsort` VALUES ('1','��Ա����','0');
INSERT INTO `qb_jfsort` VALUES ('2','��������','0');
INSERT INTO `qb_olpay` VALUES ('33','0','08nyzxrb9a','10','0','1284605041','1','admin','1','0','0','yeepay','0');
INSERT INTO `qb_olpay` VALUES ('34','0','qaqec2flpj','1','0','1291882682','1','admin','1','0','0','tenpay','0');
INSERT INTO `qb_olpay` VALUES ('35','0','tge8v0ag0w','1','0','1291882786','1','admin','1','0','0','tenpay','0');
INSERT INTO `qb_template` VALUES ('5','ͷ���װ�','7','template/default/none.htm','','0');
INSERT INTO `qb_template` VALUES ('6','�ײ��װ�','8','template/default/none.htm','','0');
INSERT INTO `qb_template` VALUES ('23','�����б�ҳ(�����խ)','2','template/default/list.htm','','0');
INSERT INTO `qb_template` VALUES ('22','����ҳ(�����խ)','3','template/default/bencandy.htm','','0');
INSERT INTO `qb_template` VALUES ('24','��ҳ(�����խ)','1','template/default/index.htm','','0');
INSERT INTO `qb_template` VALUES ('20','����ҳ(������)','3','template/default/bencandy_tpl_2.htm','','0');
INSERT INTO `qb_template` VALUES ('21','����ҳ','9','template/default/alonepage.htm','','0');
INSERT INTO `qb_template` VALUES ('25','ר��ģ��һ(ͷ���Ҫ�װ�)','11','template/special/showsp2.htm','','0');
INSERT INTO `qb_template` VALUES ('26','ר��ģ���(ͷ���Ҫ�װ�)','11','template/special/special_sport.htm','','0');
INSERT INTO `qb_template` VALUES ('27','ר��ģ����(ͷ���Ҫ�װ�)','11','template/special/special_car.htm','','0');
INSERT INTO `qb_template` VALUES ('28','ר��ģ����(ͷ���Ҫ�װ�)','11','template/special/special_finance.htm','','0');
INSERT INTO `qb_template` VALUES ('29','ר��ģ����(ͷ���Ҫ�װ�)','11','template/special/sp1.htm','','0');
INSERT INTO `qb_crontab` VALUES ('1','��ҳ��̬','3','','0','1292402491','inc/crontab/make_index_html.php','','1');
INSERT INTO `qb_crontab` VALUES ('2','�������ݿ�','0','0300','0','1292489459','inc/crontab/mysqlbak.php','','1');
INSERT INTO `qb_crontab` VALUES ('3','���CK�༭�����������ͼ','0','0330','0','1292489510','inc/crontab/delete_ckeditor_tmp.php','','1');
INSERT INTO `qb_crontab` VALUES ('4','��ո�����','0','','1296504125','0','inc/crontab/delete_table_upfile.php','','1');
INSERT INTO `qb_moneylog` VALUES ('6','1','1','����ͼƬͨ����˽���<A HREF=\'http://photo.net/photo/bencandy.php?fid=5&aid=619\' target=_blank>����ķ羰����</A>','1306374868');
INSERT INTO `qb_moneylog` VALUES ('7','1','1','����ͼƬͨ����˽���<A HREF=\'http://photo.net/photo/bencandy.php?fid=4&aid=620\' target=_blank>��ģ��Ů��չ��</A>','1306374992');
INSERT INTO `qb_yzimg` VALUES ('b8zvzq9d','4gRH','1307416848');
INSERT INTO `qb_download_article` VALUES ('535','Ѹ��5,Ѹ�������Ȩ����','','26','101','װ�����','6','1','0','1239786953','1239786953','1','admin','','','','','0','','0','1','','0','0','0','Ѹ�� ���� ��Ȩ����','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','1239787179','0','0','','1289453277','0','0','0','0','','','http://down.sandai.net/Thunder5.8.13.699.exe@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('537','QQ2009 Beta2 (����Windows Vista)','','26','101','װ�����','2','1','0','1239788244','1239788244','1','admin','','','','','0','','0','1','','0','0','0','QQ2009 Beta2 ���� Windows Vista','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1289453294','0','0','0','0','','','http://dl_dir.qq.com/qqfile/qq/QQ2009/QQ2009Beta2.exe@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('538','��������ϵͳ','','12','101','��վ���','2','1','0','1239788484','1239788484','1','admin','','','','','0','','0','1','','0','0','0','���� ���� ϵͳ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1289465148','0','0','0','0','','','http://down.qibosoft.com/module/wnarticle.rar@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('539','qibosoft������Ϣϵͳ','','12','101','��վ���','2','1','0','1239788649','1239788649','1','admin','','','','','0','','0','1','','0','0','0','qibosoft ���� ��Ϣϵͳ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1240209778','0','0','0','0','','','http://down.qibosoft.com/module/wnfenlei.rar@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('540','qibosoft����ϵͳ','','12','101','��վ���','1','1','0','1239788777','1239788777','1','admin','','','','','0','','0','1','','0','0','0','qibosoft ���� ϵͳ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1240192777','0','0','0','0','','','http://down.qibosoft.com/module/blog.rar@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('541','qibosoft֪��ϵͳ','','12','101','��վ���','3','1','0','1239788863','1239788863','1','admin','','','','','0','','0','1','','0','0','0','qibosoft ֪�� ϵͳ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1240111969','0','0','0','0','','','http://down.qibosoft.com/module/zhidao.rar@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('536','WPS���˰��������','','27','101','�칫���','2','1','0','1239788019','1239788019','1','admin','','','','','0','','0','1','','0','0','0','WPS ���˰� ���� ���','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1239788111','0','0','0','0','','','http://kad.www.wps.cn/wps/download/WPS2007.12012.exe@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('637','phpwind v8.0 ������������� GBK��','','12','101','��վ���','1','1','0','1289475859','1289475859','1','admin','','','','','0','','0','1','','0','0','0','phpwind v8.0 ���� ��� ���� GBK','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','1289475883','0','0','','1289475861','0','0','0','0','','','http://download.phpwind.net/index.php?m=download&a=do&did=477@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('638','Discuz! X1.5 ��ʽ����������','','12','101','��վ���','1','1','0','1289476013','1289476013','1','admin','','','','','0','','0','1','','0','0','0','Discuz X1.5 ��ʽ�� ��������','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1289476015','0','0','0','0','','','http://download2.comsenz.com/DiscuzX/1.5/Discuz_X1.5_SC_GBK.zip@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('641','qibosoft��վV6.0�������İ�','','12','101','��վ���','3','1','0','1289476573','1289476573','1','admin','','','','','0','','0','1','','0','0','0','qibosoft ��վ V6.0 ���� ���İ�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1303713052','0','0','0','0','','','http://down.qibosoft.com/down.php?v=v6@@@@@@','1','1','1','1','1303713038','','0');
INSERT INTO `qb_download_article` VALUES ('640','qibosoft��ҵB2BϵͳV3.0','','12','101','��վ���','0','1','0','1289476488','1289476488','1','admin','','','','','0','','0','1','','0','0','0','qibosoft ��ҵ B2B ϵͳ V3.0','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://bbs.qibosoft.com/downV6business.php@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('642','WinRAR V3.90 Final �ٷ��������İ�','','26','101','װ�����','0','1','0','1289476820','1289476820','1','admin','','','','','0','','0','1','','0','0','0','WinRAR V3.90 Final �ٷ� ���� ���İ�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=16060&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('643','Mydrivers�������� 2010��ʽ�� V3.5 | ��ȫ&������','','26','101','װ�����','2','1','0','1289476891','1289476891','1','admin','','','','','0','','0','1','','0','0','0','Mydrivers ���� ���� 2010 ��ʽ�� V3.5 ��ȫ ������','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1303713032','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=106848&dlType=gf@@@@@@','1','1','1','1','1303713025','','0');
INSERT INTO `qb_download_article` VALUES ('644','�ѹ�ƴ�����뷨 V4.31 ��ʽ��','','26','101','װ�����','0','1','0','1289476963','1289476963','1','admin','','','','','0','','0','1','','0','0','0','�ѹ� ƴ�� ���뷨 V4.31 ��ʽ��','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=80927&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('645','ACDSee Photo Manager V10.0.888 �ٷ��������İ�','','26','101','װ�����','0','1','0','1289477041','1289477041','1','admin','','','','','0','','0','1','','0','0','0','ACDSee Photo Manager V10.0.888 �ٷ� ���� ���İ�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=17460&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('646','VeryCD ��¿(easyMule) V1.1.15 101020 | �������ģʽ','','26','101','װ�����','0','1','0','1289477147','1289477147','1','admin','','','','','0','','0','1','','0','0','0','VeryCD ��¿ easyMule V1.1.15 101020 ���� ����ģʽ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=7453&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('647','ǧǧ���� V5.7 Beta 3�޶��� | ��������/������Ż�','','26','101','װ�����','0','1','0','1289477230','1289477230','1','admin','','','','','0','','0','1','','0','0','0','ǧǧ ���� V5.7 Beta �޶� �������� ��� �Ż�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=20769&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('648','�ȸ��ɽ�ʰԱ�����ǿ�� V2.0 2010.3.3.200','','27','101','�칫���','1','1','0','1289477316','1289477316','1','admin','','','','','0','','0','1','','0','0','0','�ȸ� ��ɽ �ʰ� ���� ��ǿ V2.0 2010.3.3.200','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1300095430','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=80375&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('649','PDF�ļ�ת���� V1.96','','27','101','�칫���','1','1','0','1289477382','1289477382','1','admin','','','','','0','','0','1','','0','0','0','PDF �ļ� ת�� V1.96','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1300072903','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=81009&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('650','����������뷨ƽ̨ 8.1 Beta5 | ���԰�','','27','101','�칫���','1','1','0','1289477502','1289477502','1','admin','','','','','0','','0','1','','0','0','0','������� ���뷨 ƽ̨ 8.1 Beta5 ���԰�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1300072896','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=81025&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('651','Foxmail V6.5.23 | �����ʼ��ͻ���','','27','101','�칫���','0','1','0','1289477740','1289477740','1','admin','','','','','0','','0','1','','0','0','0','Foxmail V6.5.23 �����ʼ� �ͻ���','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=1840&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('652','Windows Live Messenger(MSN) V9.0 �������İ�(������װ����','','27','101','�칫���','0','1','0','1289477875','1289477875','1','admin','','','','','0','','0','1','','0','0','0','Windows Live Messenger MSN V9.0 ���� ���İ� ���� ��װ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=1090&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('653','QQ���� V2.9 Beta1(667) | ���������¹���/��Ѷ��������','','27','101','�칫���','0','1','0','1289477945','1289477945','1','admin','','','','','0','','0','1','','0','0','0','���� V2.9 Beta1 667 ���� �¹��� ��Ѷ ����','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=6669&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('654','���ٿ�6 V1.3','','27','101','�칫���','0','1','0','1289478043','1289478043','1','admin','','','','','0','','0','1','','0','0','0','���� V1.3','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','0','0','','','http://down.it168.com/DownLoad.aspx?rsId=109341&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('655','360��ȫ��ʿ��ʽ�� V7.3.0.2003 | ���Ĺٷ���װ��','','40','101','ɱ�����','0','1','0','1289478207','1289478207','1','admin','','','','','0','','0','1','','0','0','0','360 ��ȫ ��ʿ ��ʽ�� V7.3.0.2003 ���� �ٷ� ��װ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=43634&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('656','����ɱ�����2010�����6���£�22.00.04.98','','40','101','ɱ�����','2','1','0','1289478474','1289478474','1','admin','','','','','0','','0','1','','0','0','0','���� ɱ����� 2010 ��� 6���� 22.00.04.98','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1307419293','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=43505&dlType=gf@@@@@@','1','1','1','1','1307419200','','0');
INSERT INTO `qb_download_article` VALUES ('657','����˹��ȫ���ܰ�ȫ���2010 V9.0.0.736sch','','40','101','ɱ�����','0','1','0','1289478575','1289478575','1','admin','','','','','0','','0','1','','0','0','0','��˹ ���� ��ȫ ��� 2010 V9.0.0.736sch','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','0','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=107344&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('658','��ɽ����','','40','101','ɱ�����','1','1','0','1289478756','1289478756','1','admin','','','','','0','','0','1','','0','0','0','��ɽ ����','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1289878940','0','0','1','0','','','http://cd001.www.duba.net/duba/install/2011/ever/KAV101109_DOWN_99_10.exe@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('659','����ɱ�����KV2011 | ��ʽ��','','40','101','ɱ�����','0','1','0','1289478928','1289478928','1','admin','','','','','0','','0','1','','0','0','0','���� ɱ����� KV2011 ��ʽ��','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','1303718771','0','0','','0','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=107323&dlType=gf@@@@@@','','0','0','0','0','','1303805168');
INSERT INTO `qb_download_article` VALUES ('660','ŵ�ٷ��������Norton Antivirus 2011 | ���ɼ���/��ȫ����','','40','101','ɱ�����','1','1','0','1289479006','1289479006','1','admin','','','','','0','','0','1','','0','0','0','ŵ�� ������ ��� Norton Antivirus 2011 ���� ��ȫ','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','0','0','0','','1303718313','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=15208&dlType=gf@@@@@@','','0','0','0','0','','0');
INSERT INTO `qb_download_article` VALUES ('661','��ɽ����-����΢��LNK©���ر��','','40','101','ɱ�����','31','1','0','1289479115','1289479115','1','admin','','','','','0','','0','1','','0','0','0','��ɽ ���� ΢�� LNK ©�� �ر�','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','1303717025','0','0','','1307419403','0','0','1','0','','','http://down.it168.com/DownLoad.aspx?rsId=125258&dlType=gf@@@@@@','1','1','1','1','1303713389','','0');
INSERT INTO `qb_download_article` VALUES ('662','����ɱ�����KV2010 ��׼��','','40','101','ɱ�����','14','1','0','1289479179','1289479179','1','admin','','','','','0','','0','1','','0','0','0','���� ɱ����� KV2010 ��׼��','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','0','','0','0','','','','','','1303716687','0','0','','1303719633','0','0','1','0','','','http://filedown.jiangmin.com/KV2011/KV2011_X86.EXE@@@@@@','7','7','7','7','1303718065','','0');
INSERT INTO `qb_download_config` VALUES ('Info_webOpen','1','');
INSERT INTO `qb_download_config` VALUES ('module_close','0','');
INSERT INTO `qb_download_config` VALUES ('SPbencandy_filename','html/5special{$fid}/show{$id}.htm','');
INSERT INTO `qb_download_config` VALUES ('ForbidShowPhpPage','0','');
INSERT INTO `qb_download_config` VALUES ('FlashGet_ID','6370','');
INSERT INTO `qb_download_config` VALUES ('view_sell_article','0','');
INSERT INTO `qb_download_config` VALUES ('SPlist_filename','html/4special{$fid}/list{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('bencandy_filename','html/{$fid}-{$dirid}/{$id}-{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('list_filename','html/{$fid}/{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('showNoPassComment','1','');
INSERT INTO `qb_download_config` VALUES ('Use_FlashGet','1','');
INSERT INTO `qb_download_config` VALUES ('XunLei_ID','08311','');
INSERT INTO `qb_download_config` VALUES ('special_show_html','html/special{$fid}/show{$id}.htm','');
INSERT INTO `qb_download_config` VALUES ('Use_XunLei','1','');
INSERT INTO `qb_download_config` VALUES ('CommentOrderType','0','');
INSERT INTO `qb_download_config` VALUES ('allowMemberCommentPass','1','');
INSERT INTO `qb_download_config` VALUES ('allowGuestCommentPass','1','');
INSERT INTO `qb_download_config` VALUES ('allowGuestComment','1','');
INSERT INTO `qb_download_config` VALUES ('CommentTime','5','');
INSERT INTO `qb_download_config` VALUES ('showCommentRows','8','');
INSERT INTO `qb_download_config` VALUES ('forbidComment','0','');
INSERT INTO `qb_download_config` VALUES ('showComment','1','');
INSERT INTO `qb_download_config` VALUES ('autoPlayFirstMv','1','');
INSERT INTO `qb_download_config` VALUES ('allowDownMv','0','');
INSERT INTO `qb_download_config` VALUES ('photoShowType','0','');
INSERT INTO `qb_download_config` VALUES ('Private_tpl_foot','','');
INSERT INTO `qb_download_config` VALUES ('Private_tpl_head','','');
INSERT INTO `qb_download_config` VALUES ('IF_Private_tpl','0','');
INSERT INTO `qb_download_config` VALUES ('ListPageTitle_nojs','0','');
INSERT INTO `qb_download_config` VALUES ('EditSystem','2','');
INSERT INTO `qb_download_config` VALUES ('PostNotice','<font face=SimSun>\r\n<p><font face=SimSun>1�������ת�����ݣ��������д�����Դ��ַ��������<br />2��������İ�Ȩ�����뷨�������ɷ����߳е���</font></p></font>','');
INSERT INTO `qb_download_config` VALUES ('showsortlogo','0','');
INSERT INTO `qb_download_config` VALUES ('ListLeng','70','');
INSERT INTO `qb_download_config` VALUES ('heart_noRecord','1','');
INSERT INTO `qb_download_config` VALUES ('Listsortnameline','2','');
INSERT INTO `qb_download_config` VALUES ('ListSonLeng','34','');
INSERT INTO `qb_download_config` VALUES ('ListSonRows','9','');
INSERT INTO `qb_download_config` VALUES ('JsListLeng','36','');
INSERT INTO `qb_download_config` VALUES ('JsListRows','5','');
INSERT INTO `qb_download_config` VALUES ('SideTitleStyle','side_tpl/2','');
INSERT INTO `qb_download_config` VALUES ('SideSortStyle','side_sort/2','');
INSERT INTO `qb_download_config` VALUES ('heart_time','30','');
INSERT INTO `qb_download_config` VALUES ('ArticleDownloadUseFtp','0','');
INSERT INTO `qb_download_config` VALUES ('special_list_html','html/special{$fid}/list{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('SortUseOtherModule','0','');
INSERT INTO `qb_download_config` VALUES ('Info_html_show','html/{$fid}-{$dirid}/{$id}-{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('ArticleHeart','Ƿ��|1.gif\r\n֧��|2.gif\r\n�ܰ�|3.gif\r\n����|4.gif\r\n��Ц|5.gif\r\n����|6.gif\r\n����|7.gif\r\n�Ծ�|8.gif','');
INSERT INTO `qb_download_config` VALUES ('cache_time_like','-1','');
INSERT INTO `qb_download_config` VALUES ('cache_time_com','-1','');
INSERT INTO `qb_download_config` VALUES ('cache_time_hot','-1','');
INSERT INTO `qb_download_config` VALUES ('cache_time_new','-1','');
INSERT INTO `qb_download_config` VALUES ('showsp_cache_time','0','');
INSERT INTO `qb_download_config` VALUES ('bencandy_cache_time','0','');
INSERT INTO `qb_download_config` VALUES ('list_cache_time','0','');
INSERT INTO `qb_download_config` VALUES ('index_cache_time','0','');
INSERT INTO `qb_download_config` VALUES ('cache_time_pic','-1','');
INSERT INTO `qb_download_config` VALUES ('fulist_cache_time','0','');
INSERT INTO `qb_download_config` VALUES ('Limit_postOne','0','');
INSERT INTO `qb_download_config` VALUES ('UseArticleHeart','1','');
INSERT INTO `qb_download_config` VALUES ('UseArticleDigg','0','');
INSERT INTO `qb_download_config` VALUES ('Html_Type','0','');
INSERT INTO `qb_download_config` VALUES ('Info_html_list','html/{$fid}/{$page}.htm','');
INSERT INTO `qb_download_config` VALUES ('DefaultIndexHtml','1','');
INSERT INTO `qb_download_config` VALUES ('ForceDel','0','');
INSERT INTO `qb_download_config` VALUES ('AutoTitleNum','1','');
INSERT INTO `qb_download_config` VALUES ('deleteArticleMoney','-1','');
INSERT INTO `qb_download_config` VALUES ('postArticleMoney','1','');
INSERT INTO `qb_download_config` VALUES ('comArticleMoney','3','');
INSERT INTO `qb_download_config` VALUES ('hotArticleNum','100','');
INSERT INTO `qb_download_config` VALUES ('newArticleTime','24','');
INSERT INTO `qb_download_config` VALUES ('ListShowIcon','0','');
INSERT INTO `qb_download_config` VALUES ('autoGetKeyword','0','');
INSERT INTO `qb_download_config` VALUES ('autoGetSmallPic','1','');
INSERT INTO `qb_download_config` VALUES ('autoCutSmallPic','1','');
INSERT INTO `qb_download_config` VALUES ('ForbidRepeatTitle','0','');
INSERT INTO `qb_download_config` VALUES ('viewNoPassArticle','0','');
INSERT INTO `qb_download_config` VALUES ('ArticlePicHeight','600','');
INSERT INTO `qb_download_config` VALUES ('ArticlePicWidth','800','');
INSERT INTO `qb_download_config` VALUES ('ArticleDownloadDirTime','0','');
INSERT INTO `qb_download_config` VALUES ('Info_titleName','','');
INSERT INTO `qb_download_config` VALUES ('module_pre','download_','');
INSERT INTO `qb_download_config` VALUES ('module_id','30','');
INSERT INTO `qb_download_config` VALUES ('Info_webname','����ϵͳ','');
INSERT INTO `qb_download_config` VALUES ('Info_weburl','','');
INSERT INTO `qb_download_gather_rule` VALUES ('20','0','article','article','','��������ԭ����ѧ�ռ�----->ɢ�� >> �������','http://wind.yinsha.com/ashow.php?sid=10&%20size=20&page=[page]','','1','3','1','0','','','','','','','','','','0','','','','','','','','','0','1165498531','1165498610','0','0','','0','0','','','','0','','<img src=images/{NO\"} border=0>\r\n                    \r\n            <a href=\"{url=NO\"}\" target=_blank>{title=NO<}</a> ','<div class=\"nr\">{content=*}</div>','','','0');
INSERT INTO `qb_download_keyword` VALUES ('1','fdsafds','0','1','1','','0');
INSERT INTO `qb_download_keyword` VALUES ('2','trew','0','1','1','','0');
INSERT INTO `qb_download_keyword` VALUES ('3','fdasfasd','0','1','1','','2');
INSERT INTO `qb_download_keyword` VALUES ('4','fda','0','1','1','','0');
INSERT INTO `qb_download_keywordid` VALUES ('3','92');
INSERT INTO `qb_download_keywordid` VALUES ('3','704');
INSERT INTO `qb_download_module` VALUES ('1','0','����ģ��','0','','','','0','0','');
INSERT INTO `qb_download_reply` VALUES ('517','','1239788649','539','12','1','1','�ǳ����õķ�����Ϣϵͳ','0');
INSERT INTO `qb_download_reply` VALUES ('518','','1239788777','540','12','1','1','��Ư���Ĳ��ͳ���','0');
INSERT INTO `qb_download_reply` VALUES ('519','','1239788863','541','12','1','1','���ܷǳ�ǿ��.���ưٶ�֪��','0');
INSERT INTO `qb_download_reply` VALUES ('513','','1239786953','535','26','1','1','�ǳ����õ����ع���','0');
INSERT INTO `qb_download_reply` VALUES ('514','','1239788019','536','27','1','1','�汾��6.3.0.1705 (2008-09-27)<br />\r\nWindows 2000/XP/Vista(��32λ��64λ) ','0');
INSERT INTO `qb_download_reply` VALUES ('515','','1239788244','537','26','1','1','<p style=\"color:#333333;\">ȫ���Ƴ����û��������棬Ϊ��������������µ��Ӿ����顣 </p>\r\n<p style=\"color:#333333;\">�Ƽ����ܣ�������ӡ��˵�����е�Ta������Ϸ������չʾ��ҳɳ�����</p>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('516','','1239788484','538','12','1','1','�൱������ģ��!','0');
INSERT INTO `qb_download_reply` VALUES ('618','','0','637','12','1','1','<p>��������ѿ�ԴBBS</p>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('619','','0','638','12','1','1','<p>��������ѿ�ԴBBS����</p>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('622','','0','641','12','1','1','qibosoft CMS��PHP����ǰ������ǿ��Ŀ�Դϵͳ��ȫ�ֲ��á�����+ģ��+ϵͳ+�����ģʽ�� ����ȫ���� Դ���ɼ��䷽��Ľ��ж��ο��������й���ģ��������ɰ�װ��ɾ���������û���ȫ���ʹ�á�','0');
INSERT INTO `qb_download_reply` VALUES ('621','','0','640','12','1','1','qibosoft��ҵB2B��Ϊ�����û������ṩ��ҵƽ̨��Ҳ���ֽ׶ι���PHP����Ψһһ��Ʒ�Ƶ�B2B��������<br />\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('623','','0','642','26','1','1','�����ʹ�õ�RAR���','0');
INSERT INTO `qb_download_reply` VALUES ('624','','0','643','26','1','1','����������һ���ʺϾ�����������û�������רҵ�����������ܹ���������������鲻�����Կ��ټ��ʶ������Ӳ���豸�������������ж�Ӳ��״̬��Ϊ�û��ṩ������ȶ��������������أ���װ�����ݡ���ԭ��ж�ص�ȫ��רҵ��������������ܡ�','0');
INSERT INTO `qb_download_reply` VALUES ('625','','0','644','26','1','1','<p>�ѹ�ƴ�����뷨�ǵ�ǰ���������С��û���������ߡ�������ǿ���ƴ�����뷨�����ҳ�ŵ������ѡ����޲����</p>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('626','','0','645','26','1','1','�������������Ƭ��ʲô���ͣ����������ѵģ�������Ϊҵ�మ�ö�����������գ�������Ҫ��Ƭ������������ɿ�ݵ������Լ��鿴�������͹�����Щ��Ƭ��','0');
INSERT INTO `qb_download_reply` VALUES ('627','','0','646','26','1','1','�Ժ���(����)��ͼ������ģʽ�������ص���Դȱ���޸����������������ʱ������0.0%��״̬����Ϊ����ȱ���޸�','0');
INSERT INTO `qb_download_reply` VALUES ('628','','0','647','26','1','1','ǧǧ������һ����ȫ��ѵ����ֲ��������ӵ�������з���ȫ����Ƶ���棬�����š���Ч��ת������ʵ��ڶ๦����һ����С�ɾ��¡�������ݡ�����ǿ����ص㣬����û�ϲ������������Ϊ�й�ʮ���������֮һ�����ҳ�ΪĿǰ�������ܻ�ӭ�����ֲ��������','0');
INSERT INTO `qb_download_reply` VALUES ('629','','0','648','27','1','1','���ȸ��ɽ�ʰԺ����桷�ǽ�ɽ�����ȫ�������������湫˾Google(�ȸ�)�����Ƴ��ġ���������û�����Ѵʵ䡢��������������˽�ɽ�ʰ�ʮ�꾭��Ʒ�ʵ�ͬʱ��Ҳ���û������˸�ǿ�Ĺ��ܡ����ŵĽ������顣','0');
INSERT INTO `qb_download_reply` VALUES ('630','','0','649','27','1','1','һ���������PDF�ĵ�ת�����ߡ���ȫ����PDF��񣬳�ǿת�����ܡ������ɵؽ������ı��ļ�Ѹ�ٵ�ת����ΪPDF�ļ���','0');
INSERT INTO `qb_download_reply` VALUES ('631','','0','650','27','1','1','����������뷨ƽ̨�������ʣ�����ʣ����ƴ������ƴ������Ӣ���Ӣ�����ƴ������Ӣ���ʻ�,����ʲô�ʹ�ʲô��������һ������ѡ��������͸�������Ϊ���Ŀ������뷨���������뷨����ʹ�ã�����ת����������������ѧ���á�','0');
INSERT INTO `qb_download_reply` VALUES ('632','','0','651','27','1','1','Foxmail��һ�������ĵ����ʼ��ͻ������,�ṩ����Internet��׼�ĵ����ʼ��շ�����.Foxmail 6.0�������ṩ����ݡ������ʵ�Foxmail��Ʒʹ������.Foxmail6.5 ��ʽ��� Beta3 �����Ҫ�Ľ� �����û����������ɹ������������ɶ���Ҫ�����������ѡ�','0');
INSERT INTO `qb_download_reply` VALUES ('633','','0','652','27','1','1','���۵�ʱ�����MSN�����¼���������ˣ��������꣬��������¼������ʧ������˾����ͥ��̨ʽ�����ʼǱ�������̨���Ե�MSN�����¼�޷��ϲ������ǻ������������ڼ���ȡ��ô�����Ա�������ߣ������ļ�û�б��ݣ����� ','0');
INSERT INTO `qb_download_reply` VALUES ('634','','0','653','27','1','1','1.�Ƴ��������ع��ܣ�֧��HTTP��eMule��BT����Э�飨�ݶ���ѻ�Ա��Vip5�����Ϸ����У�','0');
INSERT INTO `qb_download_reply` VALUES ('635','','0','654','27','1','1','���ٿ�6�ܹ������ڹۿ���Ƶʱ���ٶ�����������ߡ��������鵽�ܿ�����ܵĸо�:�ſ����沥�� ���ٿ�6�������沥�Ź��ܣ���Ϊ�����ٵ�ǰ���»��ṩ��������ҳ�����沥�Ź��ܣ������������������ɲ�����ϲ���Ŀ�6��Ƶ�����������Ը�������ϲ������������ĳߴ硣 ','0');
INSERT INTO `qb_download_reply` VALUES ('636','','0','655','40','1','1','360��ȫ��ʿ�ǵ�ǰ������ǿ��Ч����á������û���ӭ�������ر���ȫ���������ʹ�÷��㣬�û��ڱ��ã�Ŀǰ4.2���й������У���ѡ��װ360���ѳ���3�ڡ�','0');
INSERT INTO `qb_download_reply` VALUES ('637','','0','656','40','1','1','����ɱ�����2010���Ʒ���ܣ� 1����ɱ������̨��ɱ���ڲ�Ӱ���û�����������½��в����Ĵ���','0');
INSERT INTO `qb_download_reply` VALUES ('638','','0','657','40','1','1','����˹��ȫ���ܰ�ȫ��� 2010��ʵʱ�Զ�������ȫ�ҵ�������ȫ��','0');
INSERT INTO `qb_download_reply` VALUES ('639','','0','658','40','1','1','<p>2010��11��10������16��00��ʼ����ɽ���Կ�ʼȫ����ѡ�����ʱ��ʼ�������û����������ص�û�з������޵Ľ�ɽ���ԡ�</p>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('640','','0','659','40','1','1','����ɱ�����KV2011��ȫ����רҵ��ȫ�����ȫ���ں�ɱ�����������ǽ����ȫ��⡢©���޸��Ⱥ��İ�ȫ����Ϊ�л����壬����ɱ�����������ǽ��רҵ�����˾��ְ�Ľ��ޣ�Ϊ���˵����û��ṩȫ��İ�ȫ������','0');
INSERT INTO `qb_download_reply` VALUES ('641','','0','660','40','1','1','�������ÿ�ε��&nbsp; �����ſ������������ŵ�ٷ��������2011����SONAR3������������Ϊ����','0');
INSERT INTO `qb_download_reply` VALUES ('642','','0','661','40','1','1','<div style=\"font-size: 12px; font-family: ����\">\r\n	��ɽ�����׸��ɹ�����΢��LNK����ݷ�ʽ��©��</div>\r\n','0');
INSERT INTO `qb_download_reply` VALUES ('643','','0','662','40','1','1','&nbsp;����ɱ�����KV2010ϵ���񷴲��������з��Ŷ���ʱһ��֮�ã�Ϥ�Ĵ����һ������ȫ����ɱ�������','0');
INSERT INTO `qb_download_sort` VALUES ('11','0','0','0','��������','1','4','1','','0','0','','','','','a:3:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:4:\"list\";s:0:\"\";}','','0','','','0','','','','','0','a:8:{s:11:\"sonTitleRow\";s:0:\"\";s:12:\"sonTitleLeng\";s:0:\"\";s:9:\"cachetime\";N;s:12:\"sonListorder\";s:1:\"0\";s:14:\"listContentNum\";N;s:12:\"ListShowType\";N;s:15:\"ListShowBigType\";s:13:\"bigsort_tpl/2\";s:10:\"label_list\";s:0:\"\";}','','','','');
INSERT INTO `qb_download_sort` VALUES ('12','11','0','0','��վ���','2','0','0','','0','0','','','','','a:4:{s:4:\"head\";s:0:\"\";s:4:\"foot\";s:0:\"\";s:4:\"list\";s:0:\"\";s:8:\"bencandy\";s:0:\"\";}','','0','','','1','','','','','0','a:7:{s:11:\"sonTitleRow\";N;s:12:\"sonTitleLeng\";N;s:9:\"cachetime\";N;s:12:\"sonListorder\";N;s:14:\"listContentNum\";s:0:\"\";s:12:\"ListShowType\";s:1:\"0\";s:15:\"ListShowBigType\";N;}','','','','');
INSERT INTO `qb_download_sort` VALUES ('26','11','0','101','װ�����','2','0','0','','0','0','','','','','','','0','','','1','','','','','0','','','','','');
INSERT INTO `qb_download_sort` VALUES ('27','11','0','101','�칫���','2','0','0','','0','0','','','','','','','0','','','1','','','','','0','a:7:{s:11:\"sonTitleRow\";N;s:12:\"sonTitleLeng\";N;s:9:\"cachetime\";N;s:12:\"sonListorder\";N;s:14:\"listContentNum\";s:0:\"\";s:12:\"ListShowType\";s:1:\"0\";s:15:\"ListShowBigType\";N;}','','','','');
INSERT INTO `qb_download_sort` VALUES ('40','11','0','101','ɱ�����','2','0','0','','0','0','','','','','','','0','','','0','','','','','1','a:7:{s:11:\"sonTitleRow\";N;s:12:\"sonTitleLeng\";N;s:9:\"cachetime\";N;s:12:\"sonListorder\";N;s:14:\"listContentNum\";s:0:\"\";s:12:\"ListShowType\";s:0:\"\";s:15:\"ListShowBigType\";N;}','','','','');
