using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Globalization;
using System.Text;

namespace CareerBase
{
    public partial class ViewSchedulings : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdInterviews;
        public string strDataPath;
        public DataSet dsInterviews;
        public DataSet dsSelectEmp;
        public DataTable dtSelectEmp;
        public DateTime dtJobExpire;
        public string strJobExpire;
        public string strInterviews;
        public string strSelectEmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            strInterviews = "SELECT ApplicantFName, ApplicantLName, EmployerName, JobTitle, InterviewDate, InterviewTime FROM Interviews WHERE ApplicantEmail = '" + Session["CurrentEmail"].ToString() + "'";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strInterviews, cnn);

            cmdInterviews = new OleDbCommand(strInterviews, cnn);
            dsInterviews = new DataSet();
            DataTable dtInterviews = new DataTable("Interviews");
            dsInterviews.Clear();
            dsInterviews.Tables.Add(dtInterviews);
            adpt.Fill(dtInterviews);
            grdSchedulings.DataSource = dsInterviews.Tables[0];
            grdSchedulings.DataBind();
     
        }

        protected void grdSchedulings_SelectedIndexChanged(object sender, EventArgs e)
        {
            StringBuilder sbSchedule = new StringBuilder();
            string strFName = grdSchedulings.SelectedRow.Cells[1].Text;

            sbSchedule.Append(grdSchedulings.SelectedRow.Cells[1].Text + " " + grdSchedulings.SelectedRow.Cells[2].Text);
            sbSchedule.Append(" your interview with " + grdSchedulings.SelectedRow.Cells[3].Text + "\r\n");
            sbSchedule.Append(" for the  " + grdSchedulings.SelectedRow.Cells[4].Text + " position\n\r");
            sbSchedule.Append("is scheduled for " + grdSchedulings.SelectedRow.Cells[5].Text.Substring(0,10) + " at " + grdSchedulings.SelectedRow.Cells[6].Text.Substring(10,11));

            //lblScheduleMessage.Text = sbSchedule.ToString();    
            lblEmpName.Text = grdSchedulings.SelectedRow.Cells[3].Text;
            lblEmpPos.Text = grdSchedulings.SelectedRow.Cells[4].Text;
            lblIntvwDate.Text = grdSchedulings.SelectedRow.Cells[5].Text.Substring(0, 9);
            lblIntvwTime.Text = grdSchedulings.SelectedRow.Cells[6].Text.Substring(10, 10);
        
        }
    }
}