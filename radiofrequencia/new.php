<LINK href="default.css" type=text/css rel=STYLESHEET>
<?php 
$feed = 'http://rss.terra.com.br/0,,EI1,00.xml'; 

ini_set('allow_url_fopen', true); 
$fp = fopen($feed, 'r'); 
$xml = ''; 
while (!feof($fp)) { 
    $xml .= fread($fp, 128); 
} 
fclose($fp); 

function untag($string, $tag) 
{ 
    $tmpval = array(); 
    $preg = "|<$tag>(.*?)</$tag>|s"; 
    preg_match_all($preg, $string, $tags); 
    foreach ($tags[1] as $tmpcont){ 
        $tmpval[] = $tmpcont; 
    } 
    return $tmpval; 
} 

$items = untag($xml, 'item'); 

$html = '<p>'; 
foreach ($items as $item) { 
    $title = untag($item, 'title'); 
    $link = untag($item, 'link'); 
    $html .= '&nbsp;<font face="Verdana" size="1"><img src="seta.gif" width="4" height="7">&nbsp;<a href="' . $link[0] . '" target="_blank">' . $title[0] . "</a></font><br><br />\n"; 
} 
$html .= '</p>'; 

echo $html; 
?> 
<body bgcolor="#FFFFFF">
