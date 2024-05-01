<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateBulk.aspx.cs" Inherits="Project.GenerateBulk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/all.css" />
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/sharp-solid.css" />
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/sharp-regular.css" />
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/sharp-light.css" />
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <style>
        #tldiv {
          position:absolute;
          z-index: 9;       
          border: 1px solid #d3d3d3;
          justify-content: center;
          align-items: center;
          width: 100%;
        }

        #stldiv {
          position: absolute;
          z-index: 9;               
          border: 1px solid #d3d3d3;
          justify-content: center;
          align-items: center;
          width: 100%;
        }

        #tldivheader {
         
          cursor: move;
          z-index: 10;        
          color: #fff;
          justify-content: center;
          align-items: center;
        }

        #stldivheader {
         
          cursor:move;
          z-index: 10;
          color: #fff;
          justify-content: center;
          align-items: center;
        }

        #onmdiv {
          position: absolute;
          z-index: 9;               
          border: 1px solid #d3d3d3;
          justify-content: center;
          align-items: center;
          width: 100%;
        }

        #onmdivheader {
         
          cursor: move;
          z-index: 10;        
          color: #fff;
          justify-content: center;
          align-items: center;
        }

        #descdiv {
          position: absolute;
          z-index: 9;   
          border: 1px solid #d3d3d3;
          justify-content: center;
          align-items: center;
          width: 60%;
        }

        #descdivheader {
         
          cursor: move;
          z-index: 10;        
          color: #fff;
          justify-content: center;
          align-items: center;
          width:100%;
        }

        #nmlndiv {
          position: absolute;
          z-index: 9;               
          border: 1px solid #d3d3d3;
          width:60%;
          justify-content: center;
          align-items: center;
        }

        #nmlndivheader {
         
          cursor: move;
          z-index: 10;        
          color: #fff;
          justify-content: center;
          align-items: center;
        }

        #label{
            text-align:center;
        }

        .bistyle{
            background-color:dodgerblue;
        }
      

    </style>
    <script>
        var markers = [
            <asp:Repeater ID="rptMarkers" runat="server">
                <ItemTemplate>
                {
                    "SrNo": '<%# Eval("SrNo") %>',
                    "RegNo": '<%# Eval("Reg No") %>',
                    "Emailid": '<%# Eval("EmailID") %>',
                    "OName": '<%# Eval("Organization/ Institute name") %>',
                    "CTitle": '<%# Eval("Certificate Title") %>',
                    "CSubtitle": '<%# Eval("Certificate Subtitle") %>',
                    "AName": '<%# Eval("Accredited's Full name") %>',
                    "Description": '<%# Eval("Description of Certificate") %>'                  
                }
                </ItemTemplate>
                <SeparatorTemplate>
                    ,
                </SeparatorTemplate>
            </asp:Repeater>
        ];
    </script>
    <script type="text/javascript">
        function GenAll() {
            const date = new Date();

            for (i = 0; i < markers.length; i++)
            {
                var x = parseInt(document.getElementById("lbcerno").innerHTML);                
                document.getElementById("lbcerno").innerHTML = x;
                
                var data = markers[i];
                var srno = data.SrNo;
                document.getElementById("lboname").innerHTML = data.OName;
                document.getElementById("lbtl").innerText = data.CTitle;
                document.getElementById("lbsubtl").innerHTML = data.CSubtitle;
                document.getElementById("lbname").innerHTML = data.AName;
                document.getElementById("lbdesc").innerHTML = data.Description;

                takeScreenshot(x, data.RegNo, data.AName, data.Emailid);
                
                x = x + 1;
                document.getElementById("lbcerno").innerHTML = x;
            }
        }
    </script>
    <script type="text/javascript">
        function ch1() {
            var checkBox = document.getElementById("chkb1");
            if (checkBox.checked)
            {
                document.getElementById("hdfchkb").value = checkBox.id;
                    
                document.getElementById("chkb2").checked = false;
                document.getElementById("chkb3").checked = false;
                document.getElementById("chkb4").checked = false;
                document.getElementById("chkb5").checked = false;
                dragElement(document.getElementById("tldiv"));
            } 
        };

        function ch2() {
            var checkBox = document.getElementById("chkb2");
                
            if (checkBox.checked) {
                document.getElementById("hdfchkb").value = checkBox.id;

                document.getElementById("chkb1").checked = false;
                document.getElementById("chkb3").checked = false;
                document.getElementById("chkb4").checked = false;
                document.getElementById("chkb5").checked = false;
                dragElement(document.getElementById("stldiv"));
            }
        };

        function ch3() {
            var checkBox = document.getElementById("chkb3");

            if (checkBox.checked) {
                document.getElementById("hdfchkb").value = checkBox.id;

                document.getElementById("chkb1").checked = false;
                document.getElementById("chkb2").checked = false;
                document.getElementById("chkb4").checked = false;
                document.getElementById("chkb5").checked = false;
                dragElement(document.getElementById("onmdiv"));
            }
        };

        function ch4() {
            var checkBox = document.getElementById("chkb4");

            if (checkBox.checked) {
                document.getElementById("hdfchkb").value = checkBox.id;

                document.getElementById("chkb1").checked = false;
                document.getElementById("chkb2").checked = false;
                document.getElementById("chkb3").checked = false;
                document.getElementById("chkb5").checked = false;
                dragElement(document.getElementById("descdiv"));
            }
        };

        function ch5() {
            var checkBox = document.getElementById("chkb5");

            if (checkBox.checked) {

                document.getElementById("chkb1").checked = false;
                document.getElementById("chkb2").checked = false;
                document.getElementById("chkb3").checked = false;
                document.getElementById("chkb4").checked = false;
                dragElement(document.getElementById("nmlndiv"));
            }
        };

        function setText() {
               
            var Checkbox = document.getElementById("hdfchkb").value;

            if (Checkbox == "chkb1") {
                var details = document.getElementById("txtset").value;
                document.getElementById("lbtl").innerText = details;
            }

            if (Checkbox == "chkb2") {
                var details = document.getElementById("txtset").value;
                document.getElementById("lbsubtl").innerHTML = details;
            }

            if (Checkbox == "chkb3") {
                var details = document.getElementById("txtset").value;
                document.getElementById("lboname").innerHTML = details;
            }

            if (Checkbox == "chkb4") {
                var details = document.getElementById("txtset").value;
                document.getElementById("lbdesc").innerHTML = details;
            }
        };

        function bold()
        {
            var element = document.getElementById("btnbold");
            element.classList.add("bistyle");
            document.getElementById("hdfbold").value = "Yes";
        };

        function italic() {
            var element = document.getElementById("btnitalic");
            element.classList.add("bistyle");
            document.getElementById("hdfitalic").value = "Yes";
            
        };

        function applyStyles() {
            var Checkbox = document.getElementById("hdfchkb").value;
            var Bold = document.getElementById("hdfbold").value;
            var Italic = document.getElementById("hdfitalic").value;

            if (Checkbox == "chkb1") {
                var fontfamily = document.getElementById("ddlFfamily").value;
                var fontsize = document.getElementById("ddlFsize").value + "px";
                                       
                document.getElementById("lbtl").style.fontFamily = fontfamily;
                document.getElementById("lbtl").style.fontSize = fontsize;
                if (Bold == "Yes") {
                    document.getElementById("lbtl").style.fontWeight = "900";
                }
                if (Italic == "Yes") {
                    var details = document.getElementById("lbtl").innerHTML;
                    details = "<i>" + details + "</i>"
                    alert(details);
                    document.getElementById("lbtl").innerHTML = details;
                }
            }

            if (Checkbox == "chkb2") {
                var fontfamily = document.getElementById("ddlFfamily").value;
                var fontsize = document.getElementById("ddlFsize").value + "px";

                document.getElementById("lbsubtl").style.fontFamily = fontfamily;
                document.getElementById("lbsubtl").style.fontSize = fontsize;
                if (Bold == "Yes") {
                    document.getElementById("lbsubtl").style.fontWeight = "900";
                }
                if (Italic == "Yes") {
                    var details = document.getElementById("lbsubtl").innerHTML;
                    details = "<i>" + details + "</i>"
                    alert(details);
                    document.getElementById("lbsubtl").innerHTML = details;
                }
            }

            if (Checkbox == "chkb3") {
                var fontfamily = document.getElementById("ddlFfamily").value;
                var fontsize = document.getElementById("ddlFsize").value + "px";

                document.getElementById("lboname").style.fontFamily = fontfamily;
                document.getElementById("lboname").style.fontSize = fontsize;
                if (Bold == "Yes") {
                    document.getElementById("lboname").style.fontWeight = "900";
                }
                if (Italic == "Yes") {
                    var details = document.getElementById("lboname").innerHTML;
                    details = "<i>" + details + "</i>"
                    alert(details);
                    document.getElementById("lboname").innerHTML = details;
                }
            }

            if (Checkbox == "chkb4") {
                var fontfamily = document.getElementById("ddlFfamily").value;
                var fontsize = document.getElementById("ddlFsize").value + "px";

                document.getElementById("lbdesc").style.fontFamily = fontfamily;
                document.getElementById("lbdesc").style.fontSize = fontsize;
                if (Bold == "Yes") {
                    document.getElementById("lbdesc").style.fontWeight = "900";
                }
                if (Italic == "Yes") {
                    var details = document.getElementById("lbdesc").innerHTML;
                    details = "<i>" + details + "</i>"
                    alert(details);
                    document.getElementById("lbdesc").innerHTML = details;
                }
            }
                
        };
    </script>
        
  
    <script>
        //Make the DIV element draggagle:
        //  
        

        function dragElement(elmnt) {
          
            var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
            if (document.getElementById(elmnt.id + "header")) {
                /* if present, the header is where you move the DIV from:*/
                document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
            } else {
                /* otherwise, move the DIV from anywhere inside the DIV:*/
                elmnt.onmousedown = dragMouseDown;
            }

            function dragMouseDown(e) {
                e = e || window.event;
                e.preventDefault();
                // get the mouse cursor position at startup:
                pos3 = e.clientX;
                pos4 = e.clientY;
                document.onmouseup = closeDragElement;
                // call a function whenever the cursor moves:
                document.onmousemove = elementDrag;
            }

            function elementDrag(e) {
                e = e || window.event;
                e.preventDefault();
                // calculate the new cursor position:
                pos1 = pos3 - e.clientX;
                pos2 = pos4 - e.clientY;
                pos3 = e.clientX;
                pos4 = e.clientY;
                // set the element's new position:
                elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
            }

            function closeDragElement() {
                /* stop moving when mouse button is released:*/
                document.onmouseup = null;
                document.onmousemove = null;
            }
        }
    </script>
    <script type="text/javascript">  
       

        function takeScreenshot(x,regno,name,emailid) {
            html2canvas(document.getElementById('templateDiv')).then(function (canvas) {
                // Convert canvas to base64 image data
                var imageData = canvas.toDataURL('image/png');
                // Create a link element
                const downloadLink = document.createElement("a");

                // Set the download attribute with the desired filename
                downloadLink.download = x + ".png";

                document.getElementById("hdfimgname").value += x + "-" + x + ".png-" + regno + "-" + name + "-" + emailid + ",";

                // Set the href attribute with the base64 image data
                downloadLink.href = imageData;

                // Append the link to the document
                document.body.appendChild(downloadLink);

                // Trigger a click event to simulate the download
                downloadLink.click();

                // Remove the link from the document
                document.body.removeChild(downloadLink);

                document.getElementById("doneDiv").style.display = "block";


            });
        }
       
    </script>  
    <script type="text/javascript">
        
            function handleFile(event) {
                const file = event.target.files[0];
                const reader = new FileReader();

                reader.onload = function (e) {
                    const data = new Uint8Array(e.target.result);
                    const workbook = XLSX.read(data, { type: 'array' });

                    // Assuming the first sheet is of interest, you can access other sheets as well
                    const sheetName = workbook.SheetNames[0];
                    const worksheet = workbook.Sheets[sheetName];

                    // Convert the worksheet data to JSON format
                    const jsonData = XLSX.utils.sheet_to_json(worksheet);

                    // Display the JSON data
                    displayData(jsonData);
                };

                reader.readAsArrayBuffer(file);
            }
       
    </script>
    <style>
        .navbar{
            background-color:teal;           
        }
        .navbar ul li 
        {
            color:white;    
        }
        .navbar-default .navbar-nav li a 
        {
            color: white;
        }        
        a
        {
            font-size:medium;
            font-weight:bold;
        }
        li:hover
        {
            background-color:white;           
        }
        .active
        {
            color:blueviolet;
        }
        .card 
        {
            box-shadow: 0 12px 23px 0 rgb(0 0 0 / 70%), 0 6px 25px 0 rgb(0 0 0 / 19%);
            text-align: center;
        }
    </style>
</head>
<body>
  
    <form id="form1" runat="server">
        <div class="aside">     
        <div  class="row" style="width:100%">
            <div align="center"  id="templateDiv" class="col-lg-8">
            <div  style="height:700px;margin-top:0px;margin-left:2px" id="contentDiv" runat="server">
                
                <div style="border: none;position: absolute;z-index: 9;margin: 1%;background-color:white" >
                    <div>
                      &nbsp;<asp:Label ID="label" runat="server" CssClass="label" Font-Size="15px"  ForeColor="black"  Text=" Certificate No. : " style="font-family:'Times New Roman'" ></asp:Label>
                      <asp:Label ID="lbcerno" CssClass="label" runat="server" Font-Size="15px"  ForeColor="black"  Text="100" style="font-family:'Times New Roman'" ></asp:Label>&nbsp;
                    </div>           
                </div><br /><br /><br /><br />
                <div style="border: none;" id="onmdiv">
                    <div id="onmdivheader">
                      <asp:Label ID="lboname" runat="server" CssClass="label" Font-Size="25px" ForeColor="black"  Text="Organization Name" style="font-family:'Times New Roman'" ></asp:Label>
                    </div>           
                </div><br /><br /><br /><br />
                <div style="border: none;" id="tldiv" >
                    <div id="tldivheader">
                      <asp:Label ID="lbtl" runat="server" CssClass="label" Font-Size="60px" ForeColor="DarkGoldenrod" Text="Certificate Of Appreciation" style="font-family:'Old English Text MT';"  ></asp:Label>
                    </div>           
                </div><br /><br /><br /><br /><br />              
                <div style="border: none;" id="stldiv" >
                    <div id="stldivheader">
                      <asp:Label ID="lbsubtl" runat="server" CssClass="label" Font-Size="25px" ForeColor="black"  Text="is proudly Presented to :" style="font-family:'Times New Roman'" ></asp:Label>
                    </div>           
                </div><br /><br /><br /><br />
                <center>
                <div style="border: none;" id="nmlndiv" >
                    <div id="nmlndivheader" style="border-bottom:1px solid black">   
                        <asp:Label ID="lbname" runat="server" CssClass="label" Font-Size="25px" ForeColor="black"  Text="Name" style="font-family:'Times New Roman'"></asp:Label>
                    </div>
                </div>
                </center><br /><br />
                <div style="border: none;" id="descdiv">
                    <div id="descdivheader" >
                      <asp:Label ID="lbdesc" runat="server" CssClass="label" Font-Size="20px" ForeColor="DarkSlateGray" Text="in appreciation of their service and contribution to Organization/Institute.<br/> Your Dedication, hardwork and generosity have made a significant<br/> impact, andd we are greatful for your support." style="font-family:'Times New Roman';"  ></asp:Label>
                    </div>           
                </div>
               </div>
            </div>
            <div class="col-lg-4" style="background-color: aliceblue;">                
                <h3><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Select Context</strong></h3><br />
                <div class="row" style="margin-left: 5px;">
                    <label><input type="checkbox" id="chkb3" value="Oname" onclick="ch3()" /> Organization Name</label><br />
                    <label><input type="checkbox" id="chkb1" value="Title" onclick="ch1()" /> Title</label><br />
                    <label><input type="checkbox" id="chkb2" value="Subtitle" onclick="ch2()" /> Sub Title</label><br />
                    <label><input type="checkbox" id="chkb5" value="NameLine" onclick="ch5()" /> Name Line</label><br />
                    <label><input type="checkbox" name="TT_sticky_header" id="chkb4" value="Desc" onclick="ch4()" /> Description</label><br />                    
                </div>
                <asp:HiddenField ID="hdfchkb" runat="server"  />
                <asp:HiddenField ID="hdfbold" runat="server"  />
                <asp:HiddenField ID="hdfitalic" runat="server"  />
                <asp:HiddenField ID="hdfimage" runat="server"  />
                <br />
                <h3><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Set Text And Apply Styles </strong></h3><br />
                <%--<div class="row">
                    <div class="col-lg-12">
                        <asp:TextBox ID="txtset" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <button type="button" id="btnsettext" class="btn btn-primary btn-lg btn-block" onclick="setText()">Set Text</button>
                    </div>
                    <div class="col-lg-4"></div>
                </div>--%>
                <br />
                <div class="row" >              
                    <div class="col-lg-6">
                        <asp:DropDownList ID="ddlFfamily" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="ddlFsize" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="col-lg-1" align="center">
                        <button type="button" id="btnbold" style="border-style:none" class="btn btn-default" onclick="bold()">B</button>
                    </div>
                    <div class="col-lg-1" align="left">
                        <button type="button" id="btnitalic" style="border-style:none" class="btn btn-default" onclick="italic()">I</button>
                    </div>                                 
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <button type="button" id="btnapply" class="btn btn-primary btn-lg btn-block" onclick="applyStyles()">Apply Styles</button>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
                <br />
                <div class="row">
                    <button type="button" id="btndownload" class="btn btn-primary btn-lg btn-block" onclick="GenAll()">Generate Certificate</button>
                </div>
                <br />
                <div id="doneDiv" class="row" style="display:none">                    
                    <asp:LinkButton ID="lbtnfinish" runat="server" CssClass="btn btn-success btn-lg btn-block" OnClick="lbtnfinish_Click" data-toggle="tooltip" title="Click Me!">Upload Certificate</asp:LinkButton>                   
                </div>
                <asp:HiddenField ID="hdfimgname" runat="server" />
            </div>
          
        </div>
        </div>

    </form>

  
</body>
</html>
