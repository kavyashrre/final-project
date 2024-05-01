<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="author" content="Grayrids" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
     <div align="center" class="aside" style="width:90%">
         <div class="row">
             <div class="col-lg-1"></div>
             <div class="col-lg-10">
                 <p style="font-family:Algerian;font-size:60px;color:darkgoldenrod">
                   Generation and validation of <br />
                   E- certificate using block chain
               </p>
                 <br />
                 <asp:Image ID="Image3" runat="server" Height="350px" Width="550px" ImageUrl="~/Images/12.png" /><br />                    
             </div>  
        </div>
     </div>
        <br /><br /><br /><br />

     <div id="About" class="card" align="center" style="width:75%;background-color:aliceblue;">
         <div class="aside">
             <br /><h2><strong>About</strong></h2><br />
             <p style="font-size:x-large">The primary objective is to eliminate the shortcomings of traditional, <br />
             paper-based certificate verification systems in universities globally. <br />
             By leveraging blockchain technology, the system ensures tamper-resistant certificates,<br />
             addressing security concerns and reducing the risk of fraud and forgery.<br /><br />
             The transparent and decentralized nature of the system enhances trust,<br />
             allowing users to easily verify the authenticity of their digital certificates.</p><br /><br />
         </div>
     </div>
        <br /><br /><br /><br />
     <div id="Features"  class="card" align="center" style="width:75%;background-color:white"">    
         <div class="aside">
             <br /><h3><strong>Unlock more possibilities with even more features</strong></h3><br />
             <center>
             <div class="row" align="center" style="width:95%">
                 <div class="col-lg-5" style="background-color:white">
                    <p align="left" style="font-size:15px">
                        <asp:Image ID="Image1" runat="server" Height="150px" Width="350px" ImageUrl="~/Images/3.png" /><br />
                    
                        <strong style="font-size:large">Company branding</strong><br />
                        Create certificates & badges that are fully tailored to 
                        your organization’s branding by customizing design elements, such as logos,
                        colors, text & more.
                    </p>
                </div>
                <div class="col-lg-1" ></div>
                <div class="col-lg-5"  >
                    <p align="left" style="font-size:15px">
                        <asp:Image ID="Image2" runat="server" Height="150px"  Width="350px" ImageUrl="~/Images/2.png" /><br />
                        <strong style="font-size:large">Verifiable documents</strong><br />
                
                        Replace useless PDF documents with easily verifiable,
                        legitimate,and credible certificates of achievement that 
                        protect the integrity of your recipients.
                    </p>
                </div>
             </div>
             <div class="row" style="width:95%">
                 <div class="col-lg-5">
                     <p align="left" style="font-size:15px">
                        <asp:Image ID="Image5" runat="server" Height="150px" Width="350px"  ImageUrl="~/Images/5.png" /><br />
                        <strong style="font-size:large">Create Digital Signature</strong><br />
                
                         We create digital signature while generation of certificate.
                         Signature made with hash of certificate comply the data protection.
                    </p>
                 </div>
                 <div class="col-lg-1" ></div>
                 <div class="col-lg-5">
                     <p align="left" style="font-size:15px">
                        <asp:Image ID="Image4" runat="server" Height="150px"  Width="350px" ImageUrl="~/Images/4.png" /><br />
                        <strong style="font-size:large">Credential renewals</strong><br />
                
                        Give your students, employees, or alumni the possibility to renew 
                         their credentials by tracking their expiration date and reminding
                         them when  >they are due for renewal.
                    </p>
                 </div>
             </div>
            </center>
             <br />
         </div>
     </div>
        <br /><br />
        <div class="panel-footer">
            <center><br />
                <p><strong style="font-size:medium">
                    Copyrights @2024. All Rights Reserved.
                   </strong></p><br />
            </center>
            
        </div>
    
    </center>
</asp:Content>

