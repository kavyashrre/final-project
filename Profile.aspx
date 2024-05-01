<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div style="width:80%">        
        <h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Profile</strong></h2><br />
        <div  class="aside" style="width:70%;background-color:aliceblue">
            <br />
            <div align="left" class="row">            
                <div align="center" class="col-lg-5" style="margin:0% 3% 0% 3%" >
                    <br /><br />
                    <asp:Image ID="imgPhoto" runat="server" Height="150px" Width="150px" ImageUrl="~/Images/Profile.jpg" /><br /><br />               
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" /><br />                    
                    <asp:LinkButton ID="lbtnupload" runat="server" CssClass="btn btn-primary" OnClick="lbtnupload_Click">Upload <i class="fa-solid fa-upload" style="font-size:medium;color:white"></i></asp:LinkButton>                  
                </div>
                <div  class="col-lg-6">
                    <div id="regnoDiv" runat="server" class="row">                        
                        <asp:Label ID="Label1" runat="server" Text="Reg No :" Font-Size="Medium" Font-Bold="true"></asp:Label>&nbsp;&nbsp;                   
                        <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>                                                                
                    </div>                                 
                    <br />              
                    <div class="row">
                        <asp:Label ID="Label3" runat="server" Text="Name :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" style="border-style:outset;margin-top: 10px;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtname" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> 
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="Label4" runat="server" Text="Mobile / Landline No.:" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtmobno" runat="server" CssClass="form-control" style="border-style:outset;margin-top: 10px;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtmobno" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobno" ErrorMessage="Invalid Mobile No" ValidationGroup="sreg" ValidationExpression="^[7-9][0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>    
                    <div class="row">
                        <asp:Label ID="Label6" runat="server" Text="Email Id :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" style="border-style:outset;margin-top: 10px;" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtemail" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="Red" ValidationGroup="sreg" ></asp:RegularExpressionValidator>
                    </div>
                    <div class="row">                   
                        <asp:Label ID="Label8" runat="server" Text="Address :" Font-Size="Medium" Font-Bold="true"></asp:Label>
                        <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" style="border-style:outset;margin-top: 10px;" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ValidationGroup="sreg" runat="server" ErrorMessage="" ControlToValidate="txtaddress" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>                                                            
                    </div>              
                    <br />
                </div>
                <div class="col-lg-1"></div>
            </div>            
        
        <br />
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <asp:Button ID="btnedit" runat="server" Text="Edit Details"  CssClass="btn btn-warning btn-lg btn-block" style="border-radius:10px" OnClick="btnedit_Click" />
            <asp:Button ID="btnupdate" runat="server" Text="Update Details" ValidationGroup="sreg" Visible="false"  CssClass="btn btn-primary btn-lg btn-block" style="border-radius:10px" OnClick="btnupdate_Click"/>
            </div>
            <div class="col-lg-4"></div>
            <br /><br />
        </div>
        <br />
       </div>
    </div>
    </center>
</asp:Content>
