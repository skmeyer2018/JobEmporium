using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CareerBase
{
    public partial class NewUser : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdUsers;
        public string strDataPath;
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            string strUsers = "SELECT * FROM Users";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strUsers, cnn);
            cmdUsers = new OleDbCommand(strUsers, cnn);
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            StringBuilder sbEntryErr= new StringBuilder();
            if (txtNewUser.Text.Trim() == "")
                sbEntryErr.Append("Please enter User Name.\n\r");
            if (txtPassword.Text.Trim().Length < 8)
                sbEntryErr.Append("Please enter a password length of eight or more characters.\n\r");
            if (txtEmail.Text.Trim() == "")
                sbEntryErr.Append("Please enter an email address.\n\r");

            if (sbEntryErr.ToString() != "")
            {
                lblEntryErr.Text = sbEntryErr.ToString();
                lblEntryErr.Visible = true;
            }
            StringBuilder sbNewUser = new StringBuilder("INSERT INTO NewUsers (Uname, Pwd, UserEmail) VALUES (");
          
            sbNewUser.Append("'" + txtNewUser.Text + "',");
            sbNewUser.Append("'" + txtPassword.Text + "',");
            sbNewUser.Append("'" + txtEmail.Text + "')");
            Debug.WriteLine("\r\n"+sbNewUser.ToString());
            cnn.Open();
            OleDbCommand cmdNewUser= new OleDbCommand(sbNewUser.ToString(), cnn);
            cmdNewUser.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("LoginPortal.aspx");

        }
    }
}