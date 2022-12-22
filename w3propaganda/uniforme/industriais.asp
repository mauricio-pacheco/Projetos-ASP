<!--#include file="meta.asp"-->
<BODY>
<DIV id=layAll align=center>
<style type="text/css">
* html img/**/ {
filter:expression(
  this.alphaxLoaded ? "" :
  (
    this.src.substr(this.src.length-4)==".png"
    ?
    (
    (!this.complete)
    ? "" :
      this.runtimeStyle.filter=
      ("progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+this.src+"')")+
      (this.onbeforeprint="this.runtimeStyle.filter='';this.src='"+this.src+"'").substr(0,0)+
      String(this.alphaxLoaded=true).substr(0,0)+
      (this.src="blank.gif").substr(0,0)
    )
    :
    this.runtimeStyle.filter=""
  )
  );
}
</style><DIV id=layTop><img src="home_arquivos/encima.png">
</DIV><!--#include file="busca.asp"-->
<DIV id=layMainBg1>
<DIV id=layMainBg2>
<DIV id=layMain_Home>
<DIV id=layMainBgHome>
  <table width="98%" border="0" align="center">
    <tr>
      <td><table width="100%" border="0">
        <tr>
          <td width="25%"><!--#include file="menu.asp"--></td>
          <td width="75%"><table width="100%" border="0">
            <tr>
              <td><img src="icone.gif" width="14" height="14"> <span style="font-size: 10px; color: #0D7A29; font-family: Verdana, Arial, Helvetica, sans-serif">Uniformes Industriais</span><br>
                  <hr></td>
            </tr>
          </table>
            <table width="100%" border="0">
            <tr>
              <td><div align="center"><img src="infdutriais.jpg" width="240" height="97"></div></td>
              <td><div align="center"><img src="c5.jpg" width="240" height="94"></div></td>
            </tr>
            <tr>
              <td><div align="center"><span style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">SUGEST&Otilde;ES DE UNIFORMES</span></div></td>
              <td><div align="center"><span style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">CAMISA SOCIAL</span></div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><div align="center"><img src="c1.jpg" width="240" height="97"></div></td>
              <td><div align="center"><img src="c2.jpg" width="240" height="97"></div></td>
            </tr>
            <tr>
              <td><div align="center" style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">CAMISA ESPORTE</div></td>
              <td><div align="center" style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">CAMISA ITALIANA</div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><div align="center"><img src="c3.jpg" width="240" height="94"></div></td>
              <td><div align="center"><img src="c4.jpg" width="240" height="97"></div></td>
            </tr>
            <tr>
              <td><div align="center"><span style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">CAMISA ITALIANA SEM GOLA</span></div></td>
              <td><div align="center"><span style="font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif">CAMISA ITALIANA COM GOLA TIPO POLO</span></div></td>
            </tr>
          </table>
            <hr></td>
        </tr>
      </table></td>
    </tr>
  </table>
<DIV 
></DIV></DIV></DIV></DIV></DIV>
<DIV id=layFooter>
<!--#include file="baixo.asp"-->
</DIV>
</DIV>
</BODY></HTML>
