<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GenCertificate.aspx.cs" Inherits="Project.GenCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function template(srno)
        {
            $("#<%=hdf_Srno.ClientID%>").val(srno);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="aside" style="width:80%;margin-top: -2%;">        
        <h2><strong style="font-family:'Kristen ITC';color:darkgoldenrod">Generate Certificate</strong></h2><br />
        <br />
        <asp:Button ID="btnstdetails" runat="server" Text="Add Student Details" CssClass="btn btn-success btn-lg" OnClick="btnstdetails_Click" />
        <br /><br />
        <div class="row">
            <div class="col-lg-7"><h4>Choose one from below templates or Upload image of your Template</h4></div>
            <div class="col-lg-3">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>
            <div align="left" class="col-lg-1">
                <asp:LinkButton ID="lbtnupload" runat="server" CssClass="btn btn-primary" OnClick="lbtnupload_Click"><i class="fa-solid fa-upload" style="font-size:medium;color:white"></i></asp:LinkButton>
            </div>
            <div class="col-lg-1">
                <asp:Image ID="imgPhoto" runat="server" Visible="false"/>
            </div>
        </div>
        <br />
        <div id="contentDiv" class="row" runat="server" style="height:300px;width: 96%;margin-left: 5%;overflow-y:scroll;overflow-x:hidden"></div>
        <center>
            <div id="mytemplateDiv" visible="false" class="row" runat="server" style="height:300px;width: 25%;margin-left: 0%;"></div>
        </center>
        <br /><br />
        <asp:HiddenField ID="hdf_Srno" runat="server" />
        <asp:Button ID="btnstartgen" runat="server" Text="Start to Generate" CssClass="btn btn-primary btn-lg" OnClick="btnstartgen_Click" /><br />
    </div>
    </center>

    <!--Create Transction details Modal -->
    <div id="addModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Certificate Transaction</h4>
          </div>
          <div class="modal-body">
              <br />
              <div class="row">
                  <div class="col-lg-4">
                      <asp:Label ID="Label1" runat="server" Text="Select Student :" Font-Bold="true" Font-Size="Medium"></asp:Label>
                  </div>
                  <div class="col-lg-8">
                      <asp:DropDownList ID="ddlstudents" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ValidationGroup="sreg" runat="server" ErrorMessage="" InitialValue="Select" ControlToValidate="ddlstudents" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                  </div>
              </div>
              <br />
              <asp:HiddenField ID="hdfregno" runat="server" />
              <asp:HiddenField ID="hdftrid" runat="server" />
              
          </div>
          <div class="modal-footer">
              <asp:Button ID="btnadd" runat="server" Text="Add" ValidationGroup="sreg" CssClass="btn btn-primary btn-lg" OnClick="btnadd_Click" />
          </div>
        </div>

      </div>
    </div>
    

</asp:Content>
