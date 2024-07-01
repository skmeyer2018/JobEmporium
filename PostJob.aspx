<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="CareerBase.PostJob" %>

<!DOCTYPE html>
    
<html xmlns="http://www.w3.org/1999/xhtml">
        <link rel="stylesheet" href="Options.css" />
<head runat="server">
    <title>Post a Job</title>
       <style>
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

<body style="font-family:Arial;">
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
    <h1>JOB POSTING PAGE</h1>
    <h2>Select an employer, enter job posting information</h2>
    
  
    <form id="form1" runat="server">
        <div>
 <div style="margin-left:350px; text-align:left;">
        <label for="ddlSelectEmpField">Select a field:</label><br />
     <asp:DropDownList ID="ddlSelectEmpField" runat="server" Height="16px" Width="439px">
         <asp:ListItem>EmployerName</asp:ListItem>
         <asp:ListItem>EmployerAddress</asp:ListItem>
         <asp:ListItem>EmployerAddress2</asp:ListItem>
         <asp:ListItem>EmployerCity</asp:ListItem>
         <asp:ListItem>EmployerState</asp:ListItem>
         <asp:ListItem>EmployerZip</asp:ListItem>
         <asp:ListItem>EmployerPhone</asp:ListItem>
         <asp:ListItem>EmployerEmail</asp:ListItem>
         <asp:ListItem>EmployerURL</asp:ListItem>
        </asp:DropDownList>

        <br />
       <label for="txtEmpContactValue">Enter a value (whole or part text):</label><br />
       <asp:TextBox ID="txtEmpContactValue" runat="server" Width="486px" CssClass="modern-entry"></asp:TextBox>
        <br />
     <asp:Button ID="btnSelectEmps" runat="server" Text="SELECT" class="modern-button" OnClick="btnSelectEmps_Click" Font-Bold="True" Font-Size="Large"/>
 </div>
   <label for="grdEmployers" style="font-size:20px; text-align:center; font-size:25px;"> <b><u>EMPLOYERS</u></b></label>
        <br /><br />
        <div style="height: 206px; width: 945px; overflow: auto;">
        <asp:GridView  ID="grdEmployers" runat="server" height="99px" Width="829px" OnSelectedIndexChanged="grdEmployers_SelectedIndexChanged" BackColor="White" Font-Size="X-Small" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateSelectButton="True" AllowCustomPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
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
            
                        <asp:Button ID="btnResetEmps" runat="server" Text="RESET EMPLOYER DATA" CssClass="modern-button" Font-Bold="True" Font-Size="Medium" OnClick="btnResetEmps_Click" /><br /><br />
            <div id="jobPosting" style="text-align:left;margin-left:400px;">
            <asp:Label ID="Label1" runat="server" Text="JOB TITLE:" Font-Bold="True" Font-Size="Medium"></asp:Label>
<asp:TextBox ID="txtJobTitle" runat="server" Width="498px" CssClass="modern-entry"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="JOB DESCRIPTION:" Font-Bold="True"></asp:Label><br />
            <asp:TextBox ID="txtJobDescription" runat="server" Height="93px" TextMode="MultiLine" Width="605px" CssClass="modern-entry"></asp:TextBox><br />
                <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True">SKILLS (separate with pipe symbol |):</asp:Label>
                <asp:TextBox ID="txtSkills" runat="server" Width="668px" CssClass="modern-entry"></asp:TextBox><br />
                <asp:Label ID="Label4" runat="server" Text="PAYING $:" Font-Bold="True"></asp:Label><asp:TextBox ID="txtPayAmount" runat="server" Width="105px" CssClass="modern-entry"></asp:TextBox><br />
                <asp:Label ID="Label5" runat="server" Text="PER" Font-Bold="True"></asp:Label><br />

            <asp:ListBox ID="lbRate" runat="server" Font-Bold="False" Font-Size="Medium" Width="134px">
                <asp:ListItem Selected="True">Hour</asp:ListItem>
                <asp:ListItem>Week</asp:ListItem>
                <asp:ListItem>Month</asp:ListItem>
                <asp:ListItem>Year</asp:ListItem>
                </asp:ListBox><br /><br />

                <asp:Label ID="Label6" runat="server" Text="Label">EXPIRING:</asp:Label>
                <asp:Calendar ID="Calendar1" runat="server" Font-Size="X-Small" Height="161px" Width="268px"></asp:Calendar>
                <br />
                <br />

                <asp:Button ID="btnPostNewJob" runat="server" Text="POST NEW JOB" CssClass="modern-button" Font-Bold="True" Font-Size="Large" OnClick="btnPostNewJob_Click" />
            </div>
            
            
            <br />

            <asp:Label ID="lblNoEmpInfo" runat="server" Text="**Please select an employer from the above list!" CssClass="errLabel" Visible="False"></asp:Label><br />
            <asp:Label ID="lblPayAmtErr" runat="server" Text="**Please enter a number for Pay value!" CssClass="errLabel" Visible="False"></asp:Label><br />
            <asp:Label ID="lblEntryErr" runat="server" Text="**Please enter data for all fields, NO BLANKS!" Font-Bold="False" Visible="False" CssClass="errLabel"></asp:Label><br />
            <asp:Label ID="lblNoSelectDate" runat="server" Text="**Please choose a date on the calendar!" CssClass="errLabel" Visible="False"></asp:Label>

            <br />
            <br />
</div>
    </form>

   <a href="Options.aspx" style="font-size:25px;">Back to Options page</a>     
    </center>

</body>
</html>
