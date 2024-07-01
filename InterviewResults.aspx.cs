using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace CareerBase
{

    public partial class InterviewResults : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter daEvaluations;
        public OleDbCommand cmdEvaluations;
        public string strDataPath, strEvaluations;
        public DataSet dsEvaluations;
        public DataTable dtEvaluations;
        public string strUserID, strUserName,strEmail;

        protected void grdEvaluations_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strFName = grdEvaluations.SelectedRow.Cells[6].Text;
            string strLName = grdEvaluations.SelectedRow.Cells[7].Text;
            lblAppName.Text = strFName + " " + strLName;
            string strEmpName = grdEvaluations.SelectedRow.Cells[4].Text;
            string strJobTitle = grdEvaluations.SelectedRow.Cells[5].Text;
            lblEmpName.Text = strEmpName;
            lblJobTitle.Text = strJobTitle;
            txtHiringDecision.Text = grdEvaluations.SelectedRow.Cells[15].Text;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath); 
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            cnn = new OleDbConnection(strCareerDB);
            strUserID = Session["CurrentUserID"].ToString();
            strUserName = Session["CurrentUname"].ToString();
            strEmail = Session["CurrentEmail"].ToString();
            strEvaluations = "SELECT * FROM Evaluations WHERE UserID = " + strUserID;
            dtEvaluations = new DataTable(strEvaluations);
            cmdEvaluations=new OleDbCommand(strEvaluations, cnn);
            daEvaluations=new OleDbDataAdapter(cmdEvaluations);
            dsEvaluations=new DataSet();
            dsEvaluations.Clear();
            daEvaluations.Fill(dtEvaluations);
            dsEvaluations.Tables.Add(dtEvaluations);
            grdEvaluations.DataSource = dsEvaluations;
            grdEvaluations.DataBind();

        }

    }
}