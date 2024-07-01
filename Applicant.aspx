<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Applicant.aspx.cs" Inherits="CareerBase.Applicant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>JOB APPLICANTS</title>
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
            font-family:Verdana;
        }

        .modern-entry {
           border-radius: 12px;
           width: 300px;
           height:30px; 
       }
        .modern-button {
            border-radius: 12px;
            background-color:blue;
            color:white;
            font-weight:bold;
            height:30px;
            }
    </style>
</head>
<body>
    <center><h1>JOB APPLICANTS PAGE</h1></center>
    <form id="form1" runat="server">
        <div style="margin-left: 400px;">
            <asp:Table ID="tblApplicantData" runat="server">
                <asp:TableRow>
                    <asp:TableCell>*First Name:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtFname" class="modern-entry"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>*Last Name:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtLname" class="modern-entry"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>*Address:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtAddr" class="modern-entry"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>Address2:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtAddr2" class="modern-entry"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>*City:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtCity" class="modern-entry"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>*State:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtState" class="modern-entry"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>*Zip:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtZip" class="modern-entry"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>*Phone:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtPhone" class="modern-entry"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
              <asp:TableRow>
                  <asp:TableCell>*Email:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" id="txtEmail" class="modern-entry"></asp:TextBox></asp:TableCell>
              </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnRegister" runat="server" Text="REGISTER AS APPLICANT" CssClass="modern-button" OnClick="btnRegister_Click" />
            <br />
            <br /><p>fields with a * are required</p>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Options.aspx">back to home page</asp:HyperLink><br />
            <asp:Label ID="lblEntryErr" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>

