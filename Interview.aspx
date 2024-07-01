<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Interview.aspx.cs" Inherits="CareerBase.Interview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="Options.css">
    <title>INTERVIEW A CANDIDATE</title>
         <style>
      body {
          font-family:Arial;
      }
     .modern-button {
         border-radius: 12px;
         background-color:blue;
         color:white;
         font-weight:bold;
          height:30px;
         }
     .modern-entry {
         border-radius: 12px;
        width: 300px;
        height:30px;
     }
     #Button1 {
         width: 129px;
         height: 41px;
     }
      .errLabel {
          font-family:Elephant;
          font-size:xx-large;
          font-weight:bold;
          color:red;

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
    <h1>SCHEDULE AN INTERVIEW</h1>
        <h2>To set up an interview, select a row from each grid</h2>
    <form id="form1" runat="server">
       
        <div style="display:flex; flex-direction:column; margin-top: 0px;">
            <div>
                <asp:Label ID="Label3" runat="server" Text="Job Openings (select a job post to display applications list)" Font-Size="Large" Font-Bold="True"></asp:Label>
                <div style="height: 137px; width: 945px; overflow: auto;">
                <asp:GridView ID="grdPostings" runat="server" Width="775px" Font-Size="X-Small" AutoGenerateSelectButton="True" BackColor="Lime" OnSelectedIndexChanged="grdPostings_SelectedIndexChanged" > 
                    <AlternatingRowStyle BackColor="#66FFFF" Font-Size="X-Small" />
                    <SelectedRowStyle BackColor="Yellow" />
                </asp:GridView>
                </div>
            </div>
            <div >
                
            <asp:Label ID="Label2" runat="server" Text="Applications (select an application to display applicants)" Font-Size="Large" Font-Bold="True"></asp:Label><br />
            
            <div style="height: 137px; width: 816px; overflow: auto;">
               
                
               
                <asp:GridView ID="grdApplications" runat="server" AutoGenerateSelectButton="True" Font-Size="X-Small" Height="113px" Width="733px" BackColor="#CCCC00" OnSelectedIndexChanged="grdApplications_SelectedIndexChanged">
                 <AlternatingRowStyle BackColor="#FFFFCC" Font-Size="X-Small" />
                 <SelectedRowStyle BackColor="Yellow" />
                </asp:GridView>
                
            </div>  
                <asp:HyperLink ID="hlViewCoverLetter" runat="server" NavigateUrl="~/CoverLetter.aspx" Visible="False">View Cover Letter</asp:HyperLink><br />
                <asp:HyperLink ID="hlViewResume" runat="server" NavigateUrl="Resume.aspx" Visible="False">View Resume</asp:HyperLink>
            </div>

            <div>
            <br />    
            <asp:Label ID="Label1" runat="server" Text="Applicants (select an applicant to schedule an interview)" Font-Size="Large" Font-Bold="True"></asp:Label><br />
            <div style="height: 137px; width: 945px; overflow: auto;">
                <asp:GridView ID="grdApplicants" runat="server" AutoGenerateSelectButton="True" Width="762px" Font-Size="X-Small"  BackColor="#FF9933" OnSelectedIndexChanged="grdApplicants_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="#FFCC99" Font-Size="X-Small" />


                <SelectedRowStyle BackColor="Yellow" />
                </asp:GridView>
            </div>
        </div>
            <center>
                <h3>Interview Call Time</h3>
            <div id="interviewSchedule" runat="server" style="width:356px; height: 273px;" visible="True" >
                <asp:Label ID="forApplicant" runat="server" Text="Schedule interview for " Visible="False"></asp:Label>
                <asp:Label ID="lblApplicantName" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="lblScheduleDate" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Calendar ID="calInterviewDate" runat="server" Font-Size="Small" Height="10px" Width="10px" Visible="False" OnSelectionChanged="calInterviewDate_SelectionChanged"></asp:Calendar>
                <asp:Label runat="server" id="scheduleFor" for="interviewTime" Visible="False">Scheduled time:</asp:Label>
                <input type="time" runat="server" id="interviewTime" name="interviewTime" visible="false"/>
            </div>
                <asp:Button ID="btnSchedule" runat="server" Text="SCHEDULE APPLICANT" CssClass="modern-button" Font-Bold="True" Font-Size="Large" OnClick="btnSchedule_Click" Visible="False" /><br />
                <asp:Label ID="lblScheduleErr" runat="server" CssClass="errLabel"></asp:Label>
            </center>
        </div>
          

        
    </form>
</center>
</body>
</html>
