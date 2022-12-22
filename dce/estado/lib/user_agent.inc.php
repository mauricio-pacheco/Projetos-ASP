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
# Description: user agent lib                                           #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$userOS = Array("Windows XP" => "Windows NT 5.1",
				"Windows 2000" => "Windows NT 5.0",
				"Windows NT 4.0" => "Windows NT 4",
				"Windows 9x" => "Windows 9",
				"Windows 9x" => "Win 9",
				"Windows Me" => "Windows Me",
				"Linux" => "Linux",
				"Macintosh" => "Macintosh");

$userBrowser = Array("Internet Explorer 6" => "MSIE 6",
					 "Internet Explorer 5" => "MSIE 5",
					 "Internet Explorer 4" => "MSIE 4",
					 "Firefox" => "Firefox",
					 "Netscape 7" => "Netscape7",
					 "Netscape 6" => "Netscape6",
					 "Opera" => "Opera");

$userScreen = Array("640 x 480" => "640",
					"800 x 600" => "800",
					"1024 x 768" => "1024",
					"1152 x 864" => "1152",
					"1280 x 1024 " => "1280");


$userColor = Array("256 color" => "8",
				   "16 bit" => "16",
				   "24 bit" => "24",
				   "32 bit" => "32");
?>