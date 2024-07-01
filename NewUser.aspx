<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="CareerBase.NewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NEW USER</title>
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
        }
     #Button1 {
                 }
      .errLabel {
          font-family:Elephant;
          font-size:xx-large;
          font-weight:bold;
          color:red;

      }
      </style>
</head>
<body>
    <h1>REGISTER AS NEW USER</h1>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" CssClass="modern-entry" Width="414px">
                <asp:TableRow>
                    <asp:TableCell>User name:</asp:TableCell><asp:TableCell><asp:TextBox ID="txtNewUser" runat="server" CssClass="modern-entry"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Password:</asp:TableCell><asp:TableCell><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="modern-entry"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>Email:</asp:TableCell><asp:TableCell><asp:TextBox ID="txtEmail" runat="server" CssClass="modern-entry"></asp:TextBox></asp:TableCell>
           </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnNewUser" runat="server" Text="CREATE YOUR ACCOUNT" CssClass="modern-button" Width="235px" OnClick="btnNewUser_Click" />
        </div>
        <br />
        <asp:Label ID="lblEntryErr" runat="server" CssClass="errLabel" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
