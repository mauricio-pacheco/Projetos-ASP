<?php

$megtables = array();

$megtables['categories'] = $prefix.'_gallery_categories';
$megtables['categories_column'] = array ('gallid'        => "$megtables[categories].gallid",
                                      'gallname'        => "$megtables[categories].gallname",
                                      'gallimg'        => "$megtables[categories].gallimg",
                                      'galloc'        => "$megtables[categories].galloc",
                                      'description'        => "$megtables[categories].description",
                                      'parent'        => "$megtables[categories].parent",
                                      'visible'        => "$megtables[categories].visible",
                                      'template'        => "$megtables[categories].template",
                                      'thumbwidth'        => "$megtables[categories].thumbwidth",
                                      'numcol'        => "$megtables[categories].numcol",
                                      'total'        => "$megtables[categories].total",
                                      'lastadd'        => "$megtables[categories].lastadd"
                                      );

$megtables['comments'] = $prefix.'_gallery_comments';
$megtables['comments_column'] = array ('cid'        => "$megtables[comments].cid",
                                      'pid'        => "$megtables[comments].pid",
                                      'comment'        => "$megtables[comments].comment",
                                      'date'        => "$megtables[comments].date",
                                      'name'        => "$megtables[comments].name",
                                      'parent'        => "$megtables[comments].parent",
                                      'member'        => "$megtables[comments].member"
                                      );

$megtables['media_class'] = $prefix.'_gallery_media_class';
$megtables['media_class_column'] = array ('id'        => "$megtables[media_class].id",
                                      'class'        => "$megtables[media_class].class"
                                      );

$megtables['media_types'] = $prefix.'_gallery_media_types';
$megtables['media_types_column'] = array ('extension'        => "$megtables[media_types].extension",
                                      'description'        => "$megtables[media_types].description",
                                      'filetype'        => "$megtables[media_types].filetype",
                                      'displaytag'        => "$megtables[media_types].displaytag",
                                      'thumbnail'        => "$megtables[media_types].thumbnail"
                                      );

$megtables['pictures'] = $prefix.'_gallery_pictures';
$megtables['pictures_column'] = array ('pid'        => "$megtables[pictures].pid",
                                      'gid'        => "$megtables[pictures].gid",
                                      'img'        => "$megtables[pictures].img",
                                      'counter'        => "$megtables[pictures].counter",
                                      'submitter'        => "$megtables[pictures].submitter",
                                      'date'        => "$megtables[pictures].date",
                                      'name'        => "$megtables[pictures].name",
                                      'description'        => "$megtables[pictures].description",
                                      'votes'        => "$megtables[pictures].votes",
                                      'rate'        => "$megtables[pictures].rate",
                                      'extension'        => "$megtables[pictures].extension",
                                      'width'        => "$megtables[pictures].width",
                                      'height'        => "$megtables[pictures].height"
                                      );

$megtables['pictures_newpicture'] = $prefix.'_gallery_pictures_newpicture';
$megtables['pictures_newpicture_column'] = array ('pid'        => "$megtables[pictures_newpicture].pid",
                                      'gid'        => "$megtables[pictures_newpicture].gid",
                                      'img'        => "$megtables[pictures_newpicture].img",
                                      'counter'        => "$megtables[pictures_newpicture].counter",
                                      'submitter'        => "$megtables[pictures_newpicture].submitter",
                                      'date'        => "$megtables[pictures_newpicture].date",
                                      'name'        => "$megtables[pictures_newpicture].name",
                                      'description'        => "$megtables[pictures_newpicture].description",
                                      'votes'        => "$megtables[pictures_newpicture].votes",
                                      'rate'        => "$megtables[pictures_newpicture].rate",
                                      'extension'        => "$megtables[pictures_newpicture].extension",
                                      'width'        => "$megtables[pictures_newpicture].width",
                                      'height'        => "$megtables[pictures_newpicture].height"
                                      );


$megtables['rate_check'] = $prefix.'_gallery_rate_check';
$megtables['rate_check_column'] = array ('ip'        => "$megtables[rate_check].ip",
                                      'time'        => "$megtables[rate_check].time",
                                      'pid'        => "$megtables[rate_check].pid"
                                      );


$megtables['template_types'] = $prefix.'_gallery_template_types';
$megtables['comments_column'] = array ('id'        => "$megtables[template_types].id",
                                      'title'        => "$megtables[template_types].title",
                                      'type'        => "$megtables[template_types].type",
                                      'templateCategory'        => "$megtables[template_types].templateCategory",
                                      'templatePictures'        => "$megtables[template_types].templatePictures",
                                      'templateCSS'        => "$megtables[template_types].templateCSS"
                                      );

?>