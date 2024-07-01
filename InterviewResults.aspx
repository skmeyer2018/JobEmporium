<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterviewResults.aspx.cs" Inherits="CareerBase.InterviewResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <link rel="stylesheet" href="Options.css" />
<head runat="server">
   
    <title>YOUR INTERVIEW RESULTS</title>
        <style>
          body {
    font-family:Arial;
            height: 371px;
        }
    .modern-button {
        border-radius: 12px;
        background-color:blue;
        color:white;
        font-weight:bold;
        }
    .modern-entry {
      border-radius: 12px;
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

 
    <center>
    <h1>YOUR INTERVIEW RESULTS</h1>
    <form id="form1" runat="server">
        <div style="text-align:left; margin-left:200px;">

                <div style="height: 137px; width: 945px; overflow: auto;">
                    <asp:GridView ID="grdEvaluations" runat="server" AutoGenerateSelectButton="True" Font-Size="Small" Width="713px" BackColor="#33CCFF" OnSelectedIndexChanged="grdEvaluations_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="Aqua" />
                    </asp:GridView>
            </div>
            <asp:Table ID="Table1" runat="server" Width="622px" Height="152px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server" Text="APPLICANT NAME:" Font-Bold="True"></asp:Label> 

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblAppName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

               <asp:TableRow>
                   <asp:TableCell>
                       <asp:Label ID="Label3" runat="server" Text="EMPLOYER:" Font-Bold="True"></asp:Label> 

                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
                   </asp:TableCell>
               </asp:TableRow>

                               <asp:TableRow>
                   <asp:TableCell>
                       <asp:Label ID="Label5" runat="server" Text="JOB TITLE:" Font-Bold="True"></asp:Label> 

                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:Label ID="lblJobTitle" runat="server" Text=""></asp:Label>
                   </asp:TableCell>
               </asp:TableRow>
                               <asp:TableRow>
                   <asp:TableCell>
                       <asp:Label ID="Label2" runat="server" Text="HIRING DECISION:" Font-Bold="True"></asp:Label> 

                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtHiringDecision" runat="server" TextMode="MultiLine" Height="200px" Width="360px"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>
            </asp:Table>
     </div>
    </form>
</center>
</body>
</html>
