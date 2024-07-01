<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPortal.aspx.cs" Inherits="CareerBase.LoginPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CAREER BASE PORTAL PAGE</title>
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
                   font-family:Arial;
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
        </style>
</head>
<body>
    <h1>JOB MARKET USER PORTAL</h1>
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#9966FF" NavigateUrl="~/NewUser.aspx">Create user account</asp:HyperLink>
    <center>
    <form id="form1" runat="server">
        <div>

            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>User Name:</asp:TableCell> <asp:TableCell> <asp:TextBox ID="txtUser" runat="server" CssClass="modern-entry"></asp:TextBox>  </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>Password:</asp:TableCell><asp:TableCell><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="modern-entry"></asp:TextBox>   </asp:TableCell>

                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnLogin" runat="server" Text="NOW LOG IN" CssClass="modern-button" Height="38px" OnClick="btnLogin_Click" Width="108px" />
<asp:GridView ID="GridView1" runat="server" Visible="False" Width="745px"></asp:GridView>
        </div>
    </form>
</center>

    
</body>
</html>
