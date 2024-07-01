<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyToJob.aspx.cs" Inherits="CareerBase.ApplyToJob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Options.css">
    <title>JOB APPLICATION</title>
    <style>
        body {
            font-family:Verdana;
        }
       .modern-button {
           border-radius: 12px;
           background-color:blue;
           color:white;
           font-weight:bold;
           }
       .modern-entry {
         border-radius: 12px;
         width: 300px;
         }
      .menu-bar {
        width: 35px;
        height: 5px;
        background-color: black;
        margin: 7px 0;
        }
    </style>
</head>
<body>
<script src="DisplayOptions.js">

</script>
  <label for="optionsButton">See options:</label> 
    <div id="optionsButton" style="width:40px; background-color:lightgray;"  onclick="openNav()" >
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
    </div>
<center>
<H1>JOB APPLICATION FORM</H1>
<h2>LIST OF AVAILABLE JOBS</h2>
<H3>Select and apply</H3>
    <!-- The overlay -->
<div id="myNav" class="overlay">

  <!-- Button to close the overlay navigation -->
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

  <!-- Overlay content -->
  <div class="overlay-content">
       
           <a href="Applicant.aspx" target="_parent">Register Applicant Data</a> 
            <a href="EmployerInfo.aspx" target="_parent">Add New Employer</a> 
            <a href="PostJob.aspx" " target="_parent">Post a Job</a> 
            <a href="ApplyToJob.aspx" target="_parent">Apply for Job</a> 
            <a href="Interview.aspx" target="_parent">Schedule Interview</a> 
            <a href="ViewSchedulings.aspx" target="_parent">Your Scheduled Interviews</a> 
            <a href="Evaluate.aspx">Recruiter Evaluation</a> 
            <a href="InterviewResults.aspx">Interview Results</a> 
            <a href="Options.aspx" target="_parent">Home Page (Options)</a> 
            <a href="LoginPortal.aspx">LOG OFF</a> 

       
  </div>

</div>

<!-- Use any element to open/show the overlay navigation menu -->


    <form id="form1" runat="server">
        <div style="margin-left:150px">
            <div style="height: 180px; width: 886px; overflow: auto;">
            <asp:GridView ID="grdOpenings" runat="server" AutoGenerateSelectButton="True" BackColor="White" Width="804px" Height="147px" Font-Size="X-Small" OnSelectedIndexChanged="giveEmpInfo">
                <AlternatingRowStyle BackColor="Gainsboro" />
                  <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                  <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                  <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                  <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#0000A9" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            </div>
            <asp:Label ID="Label3" runat="server" Text="Employer Contact:"></asp:Label>
            <asp:TextBox ID="txtEmpInfo" runat="server" ReadOnly="True" Width="730px" CssClass="modern-entry"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Cover Letter:"></asp:Label><br />

            <asp:TextBox ID="txtCover"  runat="server" Width="613px" Height="111px" TextMode="MultiLine" style="margin-left: 0px" CssClass="modern-entry"></asp:TextBox><br /><br />
            <asp:Label ID="Label2" runat="server" Text="Resume"></asp:Label><br />
            <asp:TextBox ID="txtResume" runat="server" Height="184px" TextMode="MultiLine" Width="628px" CssClass="modern-entry"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Please list your skills (separate with pipe symbol |):" Font-Bold="True" Font-Size="Small"></asp:Label><asp:TextBox ID="txtSkills" runat="server" CssClass="modern-entry" Width="579px"></asp:TextBox><br />
            <asp:Button ID="btnApply" runat="server" Text="APPLY NOW" CssClass="modern-button" Font-Bold="True" Height="36px" OnClick="btnApply_Click" Width="164px" />

        </div>
    </form>
    </center>
</body>
</html>
