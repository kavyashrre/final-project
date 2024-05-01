<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cert_View_Download.aspx.cs" Inherits="Project.Cert_View_Download" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />   
    <style type="text/css">        
        .gridview th{
            text-align:center;
            vertical-align:middle;
        }
         .gridview td{
            text-align:center;
            vertical-align:middle;
        }        
         .hiddencol{
             display:none;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div style="width:80%">        
        <br /><h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">View & Download Certificate</strong></h2><br /><br />

        <div align="center" id="gridDiv" runat="server" style="margin: 0%;width:75%">
            <asp:GridView ID="GridView1" CssClass="gridview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" width="100%" AutoGenerateColumns="False">       
                <Columns>
                    <asp:BoundField DataField="RegNo" HeaderText="RegNo" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"/>
                    <asp:BoundField DataField="Filename" HeaderText="Filename" />                               
                    <asp:BoundField DataField="Path" HeaderText="Path" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" />                               
                    <asp:BoundField DataField="Datetime" HeaderText="Datetime" />                               
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtndownload" runat="server" class="btn btn-primary" Font-Size="Medium" OnClick="lbtndownload_Click">Download <i class="fa fa-solid fa-cloud-arrow-down" style="color:white; font-size:medium; font-weight:bold"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>                         

                    
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="Larger"/>
                <PagerStyle BackColor="#284775" ForeColor="White" />
                <RowStyle BackColor="white" ForeColor="#333333" Height="50px" Font-Size="Medium"/>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <br /><asp:Label ID="lbnodata" runat="server" Text="No data Available" ForeColor="#5D7B9D" Font-Bold="true" Font-Size="X-Large"></asp:Label>


    </div>
    </center>
</asp:Content>
