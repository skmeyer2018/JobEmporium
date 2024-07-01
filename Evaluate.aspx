<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Evaluate.aspx.cs" Inherits="CareerBase.Evaluate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EVALUATE CANDIDATE</title>
        <link rel="stylesheet" href="Options.css">
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
      #Button1 {
          width: 129px;
          height: 41px;
      }
          .auto-style1 {
              width: 363px;
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
    <h1>EVALUATION OF CANDIDATE </h1>
    <h2>Select an applicant</h2>
    <form id="form1" runat="server">
        <div>
            <div style="height: 137px; width: 945px; overflow: auto;">
                <asp:GridView ID="grdInterviews" runat="server" Width="997px" BackColor="Lime" BorderColor="#33CC33" Font-Size="Small" AutoGenerateSelectButton="True" OnSelectedIndexChanged="grdInterviews_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCFF99" />
                </asp:GridView>
              </div>
            
            <div style="margin-left:90px;text-align:left; width: 700px;">
<asp:Label ID="lblApplicant" runat="server" Text="Evaluation for " Visible="False" Font-Size="X-Large"></asp:Label><br /><br />
                <table style="padding:30px;">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="APPLICANT NAME:" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">  
                        <asp:TextBox ID="txtAppName" runat="server" Width="350px" ReadOnly="True" CssClass="modern-entry"></asp:TextBox>
                    </td>
                    </tr>
                        <tr>
                            <td>
                            <asp:Label ID="Label5" runat="server" Text="APPLICANT PHONE:" Font-Bold="True"></asp:Label>
                            </td>
                           <td class="auto-style1">
                               <asp:TextBox ID="txtAppPhone" runat="server" Width="343px" CssClass="modern-entry"></asp:TextBox>
                            </td>
                        </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="APPLICANT EMAIL:" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1">

                            <asp:TextBox ID="txtAppEmail" runat="server" Width="350px" CssClass="modern-entry"></asp:TextBox>
                        </td>

                    </tr>
 

                <tr>
                    <td>
                            <asp:Label ID="Label2" runat="server" Text="EMPLOYER NAME:" Font-Bold="True" Font-Size="Medium"></asp:Label>
                     </td>
                    <td class="auto-style1">
                            <asp:TextBox ID="txtEmpName" runat="server" Width="350px" ReadOnly="True" CssClass="modern-entry"></asp:TextBox>
                    </td>
                </tr>
               <tr>
                   <td>
                <asp:Label ID="Label1" runat="server" Text="JOB TITLE:" Font-Bold="True"></asp:Label>
                </td>
                   <td class="auto-style1">
                <asp:TextBox ID="txtJobTitle" runat="server" Width="347px" ReadOnly="True" CssClass="modern-entry"></asp:TextBox>
                </td>
            </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="APPLICANT SKILLS:" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtAppSkills" runat="server" Width="346px" CssClass="modern-entry" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
               <tr>
                   <td>
                       <asp:Label ID="Label7" runat="server" Text="REQUIRED SKILLS:" Font-Bold="True"></asp:Label>
                   </td>
                   <td class="auto-style1">
                       <asp:TextBox ID="txtReqSkills" runat="server" Width="346px" CssClass="modern-entry" ReadOnly="True"></asp:TextBox>
                   </td>
               </tr>
              <tr>
                  <td>
                      <asp:Label ID="Label8" runat="server" Text="SKILL FIT:" Font-Bold="True"></asp:Label>
                  </td>
                  <td class="auto-style1">
                      <asp:TextBox ID="txtSkillFit" runat="server" Width="46px" CssClass="modern-entry" ReadOnly="True"></asp:TextBox>
                      <asp:Label ID="Label9" runat="server" Text="%" Font-Bold="True"></asp:Label>
                  </td>
              </tr>
            </table>
            <br /><br />
                    <asp:Label ID="lblComments" runat="server" Text="EVALUATIVE COMMENTS:" Font-Size="X-Large" Font-Underline="True"></asp:Label><br />
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="138px" Width="711px" CssClass="modern-entry"></asp:TextBox><br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="INTERESTED IN HIRING CANDIDATE? (check if YES)" /><br /><br />
            <asp:Label ID="lblReason" runat="server" Text="EXPLAIN WHY OR WHY NOT:" Font-Size="X-Large" ></asp:Label><br />
                <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Height="142px" Width="711px" CssClass="modern-entry" Font-Size="Medium"></asp:TextBox><br />
                <asp:Button ID="btnSubmitEvaluation" runat="server" Text="SUBMIT" CssClass="modern-button" Height="46px" Width="236px" Font-Bold="True" Font-Size="Large" OnClick="btnSubmitEvaluation_Click" />
            </div>
            
        </div>
    </form>
</center>
</body>
</html>
