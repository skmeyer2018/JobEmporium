using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CareerBase
{
    public partial class LoginPortal : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdUsers;
        public string strDataPath;
        public string strUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            //Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\MikeHurst\CareerBase\WebForms\CareerBase\CareerBase\App_Data\CareerMarket.accdb; Mode = ReadWrite | Share Deny None; Persist Security Info = False

            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Mode = ReadWrite | Share Deny None;Persist Security Info=False";
            strUsers = "SELECT * FROM NewUsers ";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strUsers, cnn);
            cmdUsers = new OleDbCommand(strUsers, cnn);
            OleDbDataAdapter adptLogin = new OleDbDataAdapter(strUsers, cnn);
            OleDbCommand cmdLogin = new OleDbCommand(strUsers, cnn);
   
            DataSet dsLogin = new DataSet();
            DataTable dtLogin = new DataTable("NewUsers");
            dsLogin.Clear();
            dsLogin.Tables.Add(dtLogin);
            adptLogin.Fill(dtLogin);
            GridView1.DataSource = dsLogin;
            GridView1.DataBind();
            var u = (string) Session["CurrentUname"] ?? "";
            var eml = (string)Session["CurrentEmail"] ?? "";
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            StringBuilder sbLogin = new StringBuilder(strUsers);
            sbLogin.Append(string.Format("WHERE Uname = '{0}' AND Pwd = '{1}'", txtUser.Text.Trim(), txtPassword.Text.Trim()));
            Debug.WriteLine(sbLogin.ToString());
            OleDbDataAdapter adptLogin=new OleDbDataAdapter(sbLogin.ToString(), cnn);
            OleDbCommand cmdLogin=new OleDbCommand(sbLogin.ToString(), cnn);
            DataSet dsLogin= new DataSet();
            DataTable dtLogin = new DataTable("NewUsers");
            dsLogin.Clear();
            dsLogin.Tables.Add(dtLogin);
            adptLogin.Fill(dtLogin);
            GridView1.DataSource = dsLogin;
            GridView1.DataBind();
            Debug.WriteLine(dsLogin.Tables[0].Rows.Count.ToString());
            if (dsLogin.Tables[0].Rows.Count == 1)
            {
                Session["CurrentUname"] = txtUser.Text.Trim();
                Session["CurrentEmail"] = dsLogin.Tables[0].Rows[0]["UserEmail"];
                Session["CurrentUserID"] = dsLogin.Tables[0].Rows[0]["UserID"];
                Server.Transfer("Options.aspx");
            }
               

        }
    }
}