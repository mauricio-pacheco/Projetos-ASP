
function newWindow(mypage,myname,w,h) { 
  if(screen.width){
  var winl = (screen.width-w)/2;
  var wint = (screen.height-h)/2;
  }else{winl = 0;wint =0;}
  if (winl < 0) winl = 0;
  if (wint < 0) wint = 0;
  var settings = 'height=' + h + ',';
  settings += 'width=' + w + ',';
  settings += 'top=' + wint + ',';
  settings += 'left=' + winl + ',';
  //settings += 'toolbar=no,location=no,status=no,scrollbars=yes,resizable=no';
  win = window.open(mypage,myname,settings);
  win.window.focus();
};

function newWindow2(mypage,myname,w,h) { 
  if(screen.width){
  var winl = (screen.width-w)/2;
  var wint = (screen.height-h)/2;
  }else{winl = 0;wint =0;}
  if (winl < 0) winl = 0;
  if (wint < 0) wint = 0;
  var settings = 'height=' + h + ',';
  settings += 'width=' + w + ',';
  settings += 'top=' + wint + ',';
  settings += 'left=' + winl + ',';
  settings += 'toolbar=no,location=no,status=no,scrollbars=yes,resizable=no';
  win = window.open(mypage,myname,settings);
  win.window.focus();
};

function MRP_over(src,clrOver,clrOverF) {
 if (!src.contains(event.fromElement)) {
  src.style.cursor = 'hand';
  src.bgColor = clrOver;
  src.style.color = clrOverF;
 }
}
function MRP_hout(src,clrIn,clrInF) {
 if (!src.contains(event.toElement)) {
  src.style.cursor = 'default';
  src.bgColor = clrIn;
  src.style.color = clrInF;
 }
}

