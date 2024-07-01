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

    public partial class ApplyToJob : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdOpenings;
        public string strDataPath;
        public DataSet dsOpenings;
        public DataSet dsSelectEmp;
        public DataTable dtSelectEmp;
        public DateTime dtJobExpire;
        public string strJobExpire;
        public string strOpenings;
        public string strSelectEmp;
        public string strApplicant;
        public string strUserID;

        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            strOpenings = "SELECT * FROM JobOpenings ";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strOpenings, cnn);

            cmdOpenings = new OleDbCommand(strOpenings, cnn);
            dsOpenings = new DataSet();
            DataTable dtOpenings = new DataTable("Openings");
            dsOpenings.Clear();
            dsOpenings.Tables.Add(dtOpenings);
            adpt.Fill(dtOpenings);
            grdOpenings.DataSource = dsOpenings.Tables[0];
            grdOpenings.DataBind();
            strUserID = Session["CurrentUserID"].ToString();
        
   
        }
        
        protected void giveEmpInfo(object sender, EventArgs e)
        {
          Debug.WriteLine(grdOpenings.SelectedRow.RowIndex.ToString());
            int selectJobPostRow = grdOpenings.SelectedRow.RowIndex;
            Debug.WriteLine(grdOpenings.Rows[selectJobPostRow].Cells[3].Text);
            StringBuilder sbSelectEmp = new StringBuilder("SELECT * FROM Employers WHERE ");
            string strEmpID = grdOpenings.Rows[selectJobPostRow].Cells[2].Text;
            Debug.WriteLine(strEmpID);
            sbSelectEmp.Append("EmpID = " + strEmpID);
            OleDbDataAdapter daSelectEmp= new OleDbDataAdapter(sbSelectEmp.ToString(), cnn);
            OleDbCommand cmdSelectEmp = new OleDbCommand(sbSelectEmp.ToString(), cnn);
            DataTable dtSelectEmp = new DataTable(sbSelectEmp.ToString());
            daSelectEmp.Fill(dtSelectEmp);
            DataSet dsSelectEmp = new DataSet();
            dsSelectEmp.Clear();
            dsSelectEmp.Tables.Add(dtSelectEmp);
            StringBuilder sbEmpContact = new StringBuilder();
            for (int c=1; c< dsSelectEmp.Tables[0].Columns.Count; c++)
            {
                sbEmpContact.Append(dsSelectEmp.Tables[0].Rows[0][c] + ", ");
            }
            string strEmpContact=sbEmpContact.ToString().Substring(0,sbEmpContact.Length - 2);
            txtEmpInfo.Text = strEmpContact;
        }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            string strRegisteredApplicant = string.Format("SELECT * FROM Applicants WHERE UserID = {0}", Session["CurrentUserID"]);
            OleDbDataAdapter daRegisterApp = new OleDbDataAdapter(strRegisteredApplicant, cnn);
            DataTable dtRegisterApp = new DataTable(strRegisteredApplicant);
            daRegisterApp.Fill(dtRegisterApp);
            DataSet dsRegsiterApp = new DataSet();
            dsRegsiterApp.Clear();
            dsRegsiterApp.Tables.Add( dtRegisterApp );
            if (dsRegsiterApp.Tables[0].Rows.Count == 0)
                Server.Transfer("Applicant.aspx");
            StringBuilder sbApplyToJob = new StringBuilder("INSERT INTO Applications (UserID, EmpID, JobID, ApplicantID, ApplicantFName, ApplicantLName, AppliedDate, ApplicantSkills, CoverLetter, Resume, Email) VALUES (");
            int selectJobPostRow = grdOpenings.SelectedRow.RowIndex;
            string strJobID = grdOpenings.Rows[selectJobPostRow].Cells[1].Text;
            string strEmpID = grdOpenings.Rows[selectJobPostRow].Cells[2].Text;
            string strApplicantID = dsRegsiterApp.Tables[0].Rows[0]["ApplicantID"].ToString();
            string strAppFName = dsRegsiterApp.Tables[0].Rows[0]["ApplicantFName"].ToString();
            string strAppLName = dsRegsiterApp.Tables[0].Rows[0]["ApplicantLName"].ToString();
            DateTime dtAppDate= DateTime.Now;
            string strSkillSet=txtSkills.Text;
            string strCoverLetter = txtCover.Text;
            strCoverLetter=removeSingleQuote(ref strCoverLetter);
            string strResume=txtResume.Text;
            strResume=removeSingleQuote(ref strResume);
            Debug.WriteLine(strResume);
            string strAppEmail = dsRegsiterApp.Tables[0].Rows[0]["ApplicantEmail"].ToString();
            sbApplyToJob.Append(string.Format("{0},{1},{2},'{3}','{4}','{5}','{6}','{7}','{8}','{9}', '{10}')", strEmpID, strUserID, strJobID, strApplicantID,strAppFName, strAppLName, dtAppDate.ToString(), strSkillSet, strCoverLetter, strResume, strAppEmail));
            OleDbCommand cmdApplyToJob = new OleDbCommand(sbApplyToJob.ToString(), cnn);
            cnn.Open();
            cmdApplyToJob.ExecuteNonQuery();
            cnn.Close();
            resetFields();
            
        }

        string removeSingleQuote(ref string message)
        {
            if (message.Contains("'"))
            {
                message=message.Replace("'","");
            }
            return message;
        }
        protected void resetFields()
        {
            txtCover.Text = "";
            txtResume.Text = "";
            txtEmpInfo.Text = "";
            txtSkills.Text = "";
        }
        
    }
}