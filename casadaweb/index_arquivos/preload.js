if (document.images) {
	SrcArr = new Array ("uhome_","ucompany_","uportfolio_","uservices_","upartnership_","ucontact_","submenu1","submenu2","submenu3","submenu4");
	ImgArr = new Array ();
	for (i in SrcArr)
	{
		ImgArr[i] = new Image ();
		ImgArr[i].src =  "img/" + SrcArr[i] + ".gif";
	}
}
