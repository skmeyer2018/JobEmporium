<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Options.aspx.cs" Inherits="CareerBase.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Career Base Options</title>
    <style>
           .column {
             width: 100%;
                }

            @media (min-width: 600px) {
                .column {
                    width: 50%;
                        }
                }

       body {
            font-size:25px;
            font-family:Arial;

        }
    </style>
</head>
<body>
    

    <center>

<h1 style="font-size:36px;">WELCOME TO JOB MARKET WEBSITE</h1>
    <div style="margin-left:500px; text-align:left;">
  
    <form id="form1" runat="server">
        <div >
      
        <h3>Select an Option:</h3>
        <ul >
            <li><a href="Applicant.aspx">Register Applicant Data</a></li>
            <li><a href="EmployerInfo.aspx">Add New Employer</a></li>
            <li><a href="PostJob.aspx">Post a Job</a></li>
            <li><a href="ApplyToJob.aspx">Apply for Job</a></li>
            <li><a href="Interview.aspx">Schedule Interview</a></li>
            <li><a href="ViewSchedulings.aspx">Your Scheduled Interviews</a></li>
            <li><a href="Evaluate.aspx">Recruiter Evaluation</a></li>
            <li><a href="InterviewResults.aspx">Interview Results</a></li>
            <li><a href="LoginPortal.aspx">LOG OFF</a></li>
        </ul>
        </div>
    </form>
</div>
</center>
</body>
</html>
