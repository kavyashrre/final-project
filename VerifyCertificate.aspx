<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="VerifyCertificate.aspx.cs" Inherits="Project.VerifyCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="aside" style="width:80%">        
        <br /><h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Verify Certificate</strong></h2><br />
        <br />
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-2">
                <asp:Label ID="Label1" runat="server" Text="Verify By :" Font-Size="Medium" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-lg-4">
                <asp:DropDownList ID="ddlsearchby" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlsearchby_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Certificate No</asp:ListItem>
                    <asp:ListItem>Certificate Upload</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <br />
        <div class="row" id="tridDiv" runat="server" visible="false">
            <div class="col-lg-3"></div>
            <div align="center" class="col-lg-2">
                <asp:Label ID="Label4" runat="server" Text="Certificate No :" Font-Size="Medium" Font-Bold="true"></asp:Label>                                            
            </div>
            <div align="left" class="col-lg-3">
                <asp:TextBox ID="txttrid" runat="server" CssClass="form-control" style="border-style:outset;"></asp:TextBox>            </div>
            <div align="left" class="col-lg-2">
                <asp:LinkButton ID="lbtnverify" runat="server" CssClass="btn btn-primary" OnClick="lbtnverify_Click" >Verify</asp:LinkButton>
            </div>
            <div class="col-lg-2"></div>
        </div>
       
        <div class="row" id="fileDiv" runat="server" visible="false">
            <div class="col-lg-3"></div>
            <div align="center" class="col-lg-4">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>
            <div align="left" class="col-lg-2">
                <asp:LinkButton ID="lbtnupload" runat="server" CssClass="btn btn-primary" OnClick="lbtnupload_Click" >Upload <i class="fa-solid fa-upload" style="font-size:medium;color:white"></i></asp:LinkButton>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <br />
       
        <div id="successDiv" runat="server" style="width:60%" visible="false" class="alert alert-success">
          <h2><strong>Certificate Verified Successfully!!! <asp:LinkButton ID="LinkButton1" runat="server"><i class="fa-solid fa-check" style="font-size:xx-large;color:green"></i></asp:LinkButton></strong></h2>
        </div>
        
        <div id="nsuccessDiv" runat="server" visible="false" class="alert alert-danger">
          <h2><strong>Invalid Certificate !!!</strong> </h2>
        </div>

        <div id="trdetailsDiv" runat="server" visible="false">
            <div class="row">
                <div align="left" class="col-lg-2"></div>
                <div align="left" class="col-lg-8">
                    <h3><strong style="color:forestgreen">Certificate verified Successfully!!!</strong></h3>
                </div>
                <br />
                <div align="left" class="col-lg-2"></div>
            </div>
            <br />
            <div class="row">
                <div align="left" class="col-lg-2"></div>
                <div align="left" class="col-lg-5">
                    <asp:Label ID="lbregno" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label><br />                          
                    <asp:Label ID="lbname" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label><br />                
                    <asp:Label ID="lbdate" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></asp:Label><br />                    
                </div>
                <div align="left" class="col-lg-4">
                    <img id="img" runat="server" src="~/Images/Profile.jpg" style="height:200px;width:250px" />
                    
                </div>
                <div align="left" class="col-lg-1"></div>
            </div>
        </div>
    </div>
        
    </center>

   
</asp:Content>