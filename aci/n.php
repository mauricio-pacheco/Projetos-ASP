<LINK href="default.css" type=text/css rel=STYLESHEET>
<MARQUEE behavior="scroll" align="left" direction="up" height="100%" width="100%" scrollamount="1" scrolldelay="10" onmouseover='this.stop()' onmouseout='this.start()'><?php 
$feed = 'http://feeds.folha.uol.com.br/folha/emcimadahora/rss091.xml'; 

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

$html = '<p align="left">'; 
foreach ($items as $item) { 
    $title = untag($item, 'title'); 
    $link = untag($item, 'link'); 
    $html .= '<font face="Verdana" size=\"1\"><img src="setanot.gif">&nbsp;<a href="' . $link[0] . '" target="_blank">' . $title[0] . "</a></font><br><br />\n"; 
} 
$html .= '</p>'; 

echo $html; 
?></MARQUEE><style type="text/css">
<!--
body {
	background-color: #EFEFEF;
}
-->
</style>