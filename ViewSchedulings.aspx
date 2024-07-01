<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSchedulings.aspx.cs" Inherits="CareerBase.ViewSchedulings" %>

   
<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="Options.css" />
<head runat="server">
    <title>VIEW INTERVIEW SCHEDULINGS</title>
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
    .menu-bar {
     width: 35px;
     height: 5px;
     background-color: black;
     margin: 7px 0;
     }
  .flex-container {
  display: flex;
  flex-wrap: nowrap;
  width:708px;
  margin-left: 6px;
               }

.flex-container > div {
  background-color: #f1f1f1;
  width: 200px;
  margin: 10px;
  padding:10px;
  text-align: center;
  line-height: 35px;
  font-size: 15px;
  font-family:Eczar;
}
  </style>
</head>
<body>
    <!DOCTYPE html>
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
    <h1>VIEW YOUR INTERVIEW SCHEDULINGS</h1>
        <h2>Select a row in this grid to display a message from the data.</h2>
    <form id="form1" runat="server">
        <div>
            <div style="overflow:auto; width: 963px;">
            <asp:GridView ID="grdSchedulings" runat="server" AutoGenerateSelectButton="True" Width="720px" BackColor="#CC9900" Font-Size="Small" OnSelectedIndexChanged="grdSchedulings_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#E1DEB3" />

            </asp:GridView>
            </div>
            <asp:Label ID="lblScheduleMessage" runat="server" Font-Bold="False" Font-Names="eczar" Font-Size="X-Large" ></asp:Label>
            <div class="flex-container">
                <div>EMPLOYER NAME</div>
                <div>POSITION</div>
                <div>TIME</div>
                <div>DATE</div>
             </div>
            <div class="flex-container">
            <div><asp:Label ID="lblEmpName" runat="server" ></asp:Label> </div>
            <div><asp:Label ID="lblEmpPos" runat="server" Text=""></asp:Label> </div>
             <div><asp:Label ID="lblIntvwDate" runat="server" Text=""></asp:Label> </div>
            <div><asp:Label ID="lblIntvwTime" runat="server" Text=""></asp:Label> </div>  
            </div>
           </div>
    </form>
</center>
</body>
    
</html>
