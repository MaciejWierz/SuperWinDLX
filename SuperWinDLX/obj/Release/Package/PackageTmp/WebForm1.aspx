<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SuperWinDLX.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="style1.css" />
    <title>SuperWinDLX</title>

              <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
                <link rel="stylesheet" href="/resources/demos/style.css"/>


          <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
          <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
          <script>
              $(function () {
                  $(".item").resizable({
                      helper: "ui-resizable-helper",
                      maxHeight: 1000,
                  });
              });
           </script>




</head>
<body>
<form runat="server" class ="form">
    <header >Program super WinDLX
  
    <asp:Button ID="playButtonn" runat="server"  class="headerButton" OnClick="playButton_Click"/>
     <asp:Button ID="stepbutton" runat="server"  class="headerButton" OnClick="stepbutton_Click"/>
    <asp:Button ID="cyclebutton" runat="server"  class="headerButton" OnClick="cyclebutton_Click"/>




    </header>


        <div class="container center">
            

                  <div class="item center" runat="server" >
                      <div class="tabs">

                          <asp:Button runat="server" id="btn11" Text="1" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn12" Text="2" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn13" Text="3" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn14" Text="4" class="switchbutton"  OnClick="btn_Click"/>
                          
                      </div>
<!-- 1. CodePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                      <div>
                          <asp:Panel ID="codePanel1" runat="server">
                              <div class ="tabheader" > Kod programu</div>
                              <div style="text-align: center" > 
                                  <asp:FileUpload ID="fileUpload1"  runat="server"/>
                                  <asp:Button runat="server" Text="Wczytaj" ID="readFileBtn1" OnClick="readFileBtn_Click"/>
                              </div>
                              
                             <asp:Table ID="codeTable1" runat="server" >
                                  <asp:TableRow class ="tablecell"  runat="server">
                                      <asp:TableCell class ="tablecell"  runat="server">NUMER</asp:TableCell>
                                      <asp:TableCell class ="tablecell"  runat="server">KOD</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>

                                  
                          </asp:Panel>
<!--1. RegisterPane ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

                          <asp:Panel ID="registerPanel1" runat="server">
                              <div class ="tabheader" > Rejestry</div>
                              <div style="text-align: right">
                                  <asp:DropDownList runat="server" ID="selectDisplayModDDL1" AutoPostBack="true" OnSelectedIndexChanged="selectDisplayModDDL1_SelectedIndexChanged" ></asp:DropDownList>
                              </div>
                                <asp:Label ID="registerLbl1" runat="server"></asp:Label>
                          </asp:Panel>

<!--1. CyclePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                          <asp:Panel ID="cyclePanel1" runat="server">
                              <div class ="tabheader" > Diagram cykli programu</div>
                              
                             <asp:Table ID="cycleTable1" runat="server" >
                                  <asp:TableRow class ="tablecell"  runat="server">
                                      <asp:TableCell class ="tablecell" runat="server">1</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellif"  runat="server">IF</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellid"  runat="server">ID</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellex"  runat="server">EX</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellmem"  runat="server">MEM</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellwb" runat="server">WB</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>

                          </asp:Panel>
                      </div>

                  </div>



                  <div class="item center">
                      <div class="tabs">

                          <asp:Button runat="server" id="btn21" Text="1" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn22" Text="2" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn23" Text="3" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn24" Text="4" class="switchbutton"  OnClick="btn_Click"/>

                      </div>
<!-- 2. CodePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                 <div>
                          <asp:Panel ID="codePanel2" runat="server">
                              <div class ="tabheader" > Kod programu</div>
                              <div style="text-align: center" > 
                                  <asp:FileUpload ID="fileUpload2"  runat="server"/>
                                  <asp:Button runat="server" Text="Wczytaj" ID="readFileBtn2" OnClick="readFileBtn_Click"/>
                              </div>

                               <asp:Table ID="codeTable2" runat="server" >
                                  <asp:TableRow BorderStyle="Ridge" BorderWidth="2px">
                                      <asp:TableCell BorderStyle="Ridge" BorderWidth="2px">NUMER</asp:TableCell>
                                      <asp:TableCell BorderStyle="Ridge" BorderWidth="2px">KOD</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>

                          </asp:Panel>

<!--2. RegisterPane ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

                          <asp:Panel ID="registerPanel2" runat="server">
                              <div class ="tabheader" > Rejestry</div>
                              <div style="text-align: right">
                                  <asp:DropDownList runat="server" ID="selectDisplayModDDL2" AutoPostBack="true" OnSelectedIndexChanged="selectDisplayModDDL1_SelectedIndexChanged" ></asp:DropDownList>
                              </div>
                             <asp:Label ID="registerLbl2" runat="server"></asp:Label>
                          </asp:Panel>

<!--2. CyclePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                          <asp:Panel ID="cyclePanel2" runat="server">
                              <div class ="tabheader" > Diagram cykli programu</div>
                              
                             <asp:Table ID="cycleTable2" runat="server" >
                                  <asp:TableRow class ="tablecell"  runat="server">
                                      <asp:TableCell class ="tablecell" runat="server">1</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellif"  runat="server">IF</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellid"  runat="server">ID</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellex"  runat="server">EX</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellmem"  runat="server">MEM</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellwb" runat="server">WB</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>

                          </asp:Panel>



                      </div>
                  </div>

                  <div class="item center">
                      <div class="tabs">

                          <asp:Button runat="server" id="btn31" Text="1" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn32" Text="2" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn33" Text="3" class="switchbutton"  OnClick="btn_Click"/>
                          <asp:Button runat="server" id="btn34" Text="4" class="switchbutton"  OnClick="btn_Click"/>

                      </div>
<!-- 3. CodePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                      <div>
                          <asp:Panel ID="codePanel3" runat="server">
                              <div class ="tabheader" > Kod programu</div>
                              <div style="text-align: center" > 
                                  <asp:FileUpload ID="fileUpload3"  runat="server"/>
                                  <asp:Button runat="server" Text="Wczytaj" ID="readFileBtn3" OnClick="readFileBtn_Click"/>
                              </div>
                              <asp:Table ID="codeTable3" runat="server" >
                                  <asp:TableRow BorderStyle="Ridge" BorderWidth="2px">
                                      <asp:TableCell BorderStyle="Ridge" BorderWidth="2px">NUMER</asp:TableCell>
                                      <asp:TableCell BorderStyle="Ridge" BorderWidth="2px">KOD</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>
                          </asp:Panel>

<!--3. RegisterPane ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

                          <asp:Panel ID="registerPanel3" runat="server">
                              <div class ="tabheader" > Rejestry</div>
                              <div style="text-align: right">
                                  <asp:DropDownList runat="server" ID="selectDisplayModDDL3" AutoPostBack="true" OnSelectedIndexChanged="selectDisplayModDDL1_SelectedIndexChanged" ></asp:DropDownList>
                              </div>
                             <asp:Label ID="registerLbl3" runat="server"></asp:Label>
                          </asp:Panel>

<!-- CyclePanel ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
                          <asp:Panel ID="cyclePanel3" runat="server">
                              <div class ="tabheader" > Diagram cykli programu</div>
                              
                             <asp:Table ID="cycleTable3" runat="server" >
                                  <asp:TableRow class ="tablecell"  runat="server">
                                      <asp:TableCell class ="tablecell" runat="server">1</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellif"  runat="server">IF</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellid"  runat="server">ID</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellex"  runat="server">EX</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellmem"  runat="server">MEM</asp:TableCell>
                                      <asp:TableCell class ="tablecell tablecellwb" runat="server">WB</asp:TableCell>
                                  </asp:TableRow>
                              </asp:Table>

                          </asp:Panel>



                      </div> 
                      </div>


            
        </div>

    <footer class="center" ><asp:Label ID="iolabel" runat="server" ></asp:Label></footer>
</form>
</body>
</html>
