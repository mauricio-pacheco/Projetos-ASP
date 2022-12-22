<?php
##################################################################
# General Gallery Configuration
#
# Go to the Admin Panel (General Settings) to modify this File
#
##################################################################

$basepath= "modules/My_eGallery";
$baseurl= "modules.php?op=modload&name=My_eGallery&file=index";
$adminurl= "admin.php?op=GallAdmin";

$imagepath= "modules/My_eGallery/images";
$gallerypath= "modules/My_eGallery/gallery";
$languagepath= "modules/My_eGallery/lang";
$temppath= "modules/My_eGallery/temp";

$galleryvar['allowcomments']= "1";
$galleryvar['anoncomments']= "1";
$galleryvar['commentsASC']= "0";
$galleryvar['allowpostpics']= "1";
$galleryvar['anonpostpics']= "0";
$galleryvar['allowrate']= "1";
$galleryvar['anonrate']= "0";
$galleryvar['setRateCookies']= "1";
$galleryvar['floodtime']= "3600";
$galleryvar['limitSize']= "1";
$galleryvar['maxSize']= "2000000";
$galleryvar['GalleryPictureName']= "gallery.jpg";
$galleryvar['maxNumberMedia']= "12";
$galleryvar['displaytop']= "1";
$galleryvar['displaysortbar']= "1";
$galleryvar['defaultsortmedia']= "dateA";
$galleryvar['maintemplate']= "";
$galleryvar['numColMain']= "3";
$galleryvar['imageSoftware']= "browser";
$galleryvar['imageSoftwarePath']= "";
$galleryvar['displaySearchForm']= "1";
$galleryvar['postcardpath']= "/cgi-bin/postcard-direct/postcard.cgi";
$galleryvar['allowpostcard']= "0";
$galleryvar['allowdownload']= "1";
$galleryvar['downloadmode']= "zip";
$galleryvar['allowprint']= "1";
$galleryvar['displaySubCatIcon']= "1";
$galleryvar['SubCatIconwidth']= "135";
$galleryvar['ThumbWidth']= "150";
$galleryvar['DescriptLen']= "10";
$galleryvar['SubCatLen']= "10";
$galleryvar['SumRate']= "1";
$galleryvar['GDVersion2']= "1";

?>