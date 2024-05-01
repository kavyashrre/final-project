<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Project.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div style="width:80%">        
       
        <br /><h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Change Password</strong></h2><br />
        <div class="aside1" align="left" style="width:40%;background-color:aliceblue">
            <br /><br />
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="row">                                
                        <asp:Label ID="Label3" runat="server" Text="Reg. No. :" Font-Size="Medium" Font-Bold="true"></asp:Label>&nbsp;&nbsp;                                
                        <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label>                                
                    </div>
                    <br /><br />
                    <div class="row">
                        <asp:Label ID="Label1" runat="server" Text="New Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>                                                                
                        <asp:TextBox ID="txtnewpass" runat="server" CssClass="form-control"  TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="check1" runat="server" ErrorMessage="" ControlToValidate="txtnewpass" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>                                
                    </div>
                    <br />
                    <div class="row">                               
                        <asp:Label ID="Label2" runat="server" Text="Confirm Password :" Font-Size="Medium" Font-Bold="true"></asp:Label>                               
                        <asp:TextBox ID="txtconfpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="check1" runat="server" ErrorMessage="" ControlToValidate="txtconfpass" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not match" ControlToCompare="txtnewpass" ControlToValidate="txtconfpass"></asp:CompareValidator>                                
                    </div>
                    <br />
                    <div class="row" align="center">
                        <asp:Button ID="btnchngpass" runat="server" Text="Change Password"  ValidationGroup="check1" CssClass="btn btn-primary btn-lg" OnClick="btnchngpass_Click" />
                    </div>
                    <br /><br />
                </div>
                <div class="col-lg-2"></div>
            </div>                                            
        </div>
        </div>
    </center>
</asp:Content>
