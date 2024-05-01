<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Project.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <center>
    <div align="center" class="card" style="width:35%;height:auto;background-color:white;border-radius: 35px;margin-left:2%">        
        <div class="aside">
        <br /><h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Login</strong></h2><br />       
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div align="left" class="row">
                    <asp:Label ID="Label4" runat="server" Text="Email-Id :" Font-Size="Medium" Font-Bold="true"></asp:Label>                        
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control input-lg" style="border-style:outset;border-radius:10px"></asp:TextBox>
                </div>
                <br />
                <div align="left" class="row">
                    <asp:Label ID="Label5" runat="server" Text="Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>                        
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control input-lg" style="border-style:outset;border-radius:10px"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" style="border-radius:10px" OnClick="btnlogin_Click" />
                </div>
                <br />
            
            </div>
            <div class="col-lg-1"></div>
        </div>
        <br /><br />
        </div>
    </div>
    </center>
</asp:Content>
