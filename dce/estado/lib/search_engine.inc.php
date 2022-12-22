<?php
#-----------------------------------------------------------------------#
# PHP i-Stats: Web Traffic Analysis System                              #
# =========================================                             #
#                                                                       #
# Copyright (c) 2004 by Sam Tang                                        #
# http://www.samphp.com/                                                #
#                                                                       #
# This program is free software. You can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation; either version 2 of the License.        #
#-----------------------------------------------------------------------#
# Description: search engine lib                                        #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


/***************************************************************
 * including search engine URL
 ***************************************************************/
$searchEngine = Array("Google" => "google",
					  "DMOZ" => "dmoz\.org",
					  "Yahoo" => "yahoo",
					  "MSN" => "msn\.com",
					  "Sina (CN)" => "sina\.com\.cn",
					  "Sina" => "sina\.com",
					  "Baidu" => "baidu\.com",
					  "SOHU" => "sohu\.com",
					  "LookSmart" => "looksmart\.com",
					  "AlltheWeb" => "alltheweb\.com",
					  "Lycos" => "lycos\.com",
					  "Netscape" => "netscape\.com",
					  "HotBot" => "hotbot\.com",
					  "Altavista" => "altavista\.com",
					  "Google (HK)" => "google\.com\.hk",
					  "Google (TW)" => "google\.com\.tw",
					  "Yahoo (HK)" => "hk.*.yahoo\.com",
					  "Yahoo (CN)" => "cn.*.yahoo\.com",
					  "Yahoo (TW)" => "tw.*.yahoo\.com",
					  "Yam (TW)" => "yam\.com",
					  "PCHome (TW)" => "pchome\.com\.tw",
					  "Openfind" => "openfind\.com",
					  "Timway" => "timway\.com");


/***************************************************************
 * URL appear in $searchEngine, but actully not search engine
 ***************************************************************/
$notEngineKey = Array("Yahoo" => "mail\.yahoo",
					  "MSN" => "hotmail\.msn");


/***************************************************************
 * define search engines has coded in UTF8
 ***************************************************************/
$EngineUTF = Array("google", "msn", "alltheweb");



/***************************************************************
 * the rules to extract keywords and charset from a referrer URL
 ***************************************************************/
$searchKeyword = Array("Google" => Array("key" => "q", "charset" => "UTF-8"),
					   "DMOZ" => Array("key" => "search", "charset" => "UTF-8"),
					   "Yahoo" => Array("key" => "p", "charset" => "UTF-8"),
					   "MSN" => Array("key" => "q", "charset" => "UTF-8"),
					   "Sina (CN)" => Array("key" => "_searchkey|word", "charset" => "GB2312"),
					   "Sina" => Array("key" => "_searchkey|word", "charset" => "BIG5"),
					   "Baidu" => Array("key" => "word|w", "charset" => "GB2312"),
					   "SOHU" => Array("key" => "key_word", "charset" => "GB2312"),
					   "LookSmart" => Array("key" => "r_search", "charset" => "UTF-8"),
					   "AlltheWeb" => Array("key" => "q", "charset" => "UTF-8"),
					   "Lycos" => Array("key" => "query", "charset" => "ISO-8859-1"),
					   "Netscape" => Array("key" => "where|query", "charset" => "ISO-8859-1"),
					   "HotBot" => Array("key" => "query", "charset" => "ISO-8859-1"),
					   "Altavista" => Array("key" => "q", "charset" => "UTF-8"),
					   "Google (HK)" => Array("key" => "q", "charset" => "UTF-8"),
					   "Google (TW)" => Array("key" => "q", "charset" => "UTF-8"),
					   "Yahoo (HK)" => Array("key" => "p", "charset" => "UTF-8"),
					   "Yahoo (CN)" => Array("key" => "p", "charset" => "GB2312"),
					   "Yahoo (TW)" => Array("key" => "p", "charset" => "BIG5"),
					   "Yam (TW)" => Array("key" => "k", "charset" => "UTF-8"),
					   "PCHome (TW)" => Array("key" => "key", "charset" => "BIG5"),
					   "Openfind" => Array("key" => "Query", "charset" => "BIG5"),
					   "Timway" => Array("key" => "keyword", "charset" => "BIG5"));
?>