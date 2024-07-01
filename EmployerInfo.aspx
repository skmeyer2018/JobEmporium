<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployerInfo.aspx.cs" Inherits="CareerBase.EmployerInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employer Info</title>
        <link rel="stylesheet" href="Options.css">
    <style>
        .modern-button {
            border-radius: 12px;
            background-color:blue;
            color:white;
            font-weight:bold;
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
              .menu-bar {
        width: 35px;
        height: 5px;
        background-color: black;
        margin: 7px 0;
        }
    </style>
</head>

<script src="DisplayOptions.js">

</script>

  <label for="optionsButton">See options:</label> 
    <div id="optionsButton" style="width:40px; background-color:lightgray;"  onclick="openNav()" >
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
        <div class="menu-bar"></div>
    </div>

<center>

<body>
    <script src="DisplayOptions.js">

</script>
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
<h1>ENTER EMPLOYER CONTACT INFORMATION</h1>
    <center>
    <form id="form1" runat="server" style="font-size:25px; font-family:Arial; text-align:left; margin-top: 0px;">
       
            <center>
        <div>
         <asp:Table ID="Table1" runat="server" Width="535px" class="modern-entry" >
             <asp:TableRow AutoPostBack="True"> 
                 <asp:TableCell>Employer Name:</asp:TableCell><asp:TableCell> <asp:TextBox width=250  ID="txtEmployerName" runat="server" CssClass="modern-entry"  ></asp:TextBox>  </asp:TableCell>
             </asp:TableRow>
            <asp:TableRow> 
                <asp:TableCell>Address:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtEmpAddr" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow> 
                <asp:TableCell>Address2:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtEmpAddr2" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
            </asp:TableRow>
           <asp:TableRow> 
               <asp:TableCell>City:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtCity" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
           </asp:TableRow>
             <asp:TableRow> 
                 <asp:TableCell>State:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtState" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
             </asp:TableRow>
            <asp:TableRow> 
                <asp:TableCell>Zip:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtZip" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow> 
                <asp:TableCell>Phone:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtPhone" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
            </asp:TableRow>
           <asp:TableRow> 
               <asp:TableCell>Email:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtEmail" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
           </asp:TableRow> 
           <asp:TableRow> 
              <asp:TableCell>URL:</asp:TableCell><asp:TableCell> <asp:TextBox width=250 ID="txtEmpURL" runat="server" CssClass="modern-entry"></asp:TextBox></asp:TableCell> 
          </asp:TableRow>             
         </asp:Table>
            </div>

         
  
    <asp:Button class="modern-button" ID="btnNewEmp" runat="server" Text="Submit Employer Info" OnClick="btnNewEmp_Click" CssClass="modern-button" BorderStyle="Solid" Font-Size="Medium" Height="49px" Width="263px" />
     </center>  
    </form>
    <asp:Label ID="lblAddSuccess" runat="server" Text="Employer sucessfully added to database." Visible="False" ForeColor="#009900" Font-Size="Large" Font-Bold="True"></asp:Label><br /><br />
    <a href="Options.aspx" style="font-size:25px;">Back to Options page</a>

        </center>
    
    
    &nbsp;
</body>
</html>
