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
    public partial class Evaluate : System.Web.UI.Page
    {

        public OleDbConnection cnn;
        public OleDbDataAdapter daInterviews;
        public OleDbCommand cmdInterviews;
        public string strDataPath;
        public DataSet dsInterviews;
        public DataTable dtJobOpenings, dtApplications, dtApplicants;
        public DateTime dtJobExpire;
        public string strInterviews;
        public string strApplicants;
        public string strApplications;
        public string strUserID, strAppName, strAppPhone, strAppEmail, strEmpName, strJobTitle, strAppSkills,strReqSkills;
        public float skillFit;

        protected void btnSubmitEvaluation_Click(object sender, EventArgs e)
        {
            StringBuilder sbAddEvals = new StringBuilder("INSERT INTO EVALUATIONS (InterviewID,UserID,EmployerName,JobTitle,ApplicantFName,ApplicantLName,ApplicantPhone,ApplicantEmail,ApplicantSkills,RequiredJobSkills,RequirementFit,ApplicantReview,HiringDecision,ReasonForDecision) VALUES (");
            int r = grdInterviews.SelectedIndex;
            string strFName = grdInterviews.Rows[r].Cells[8].Text.Trim();
            string strLName = grdInterviews.Rows[r].Cells[9].Text.Trim();
            strUserID = Session["CurrentUserID"].ToString();
            removeSingleQuote(ref strFName);
            removeSingleQuote(ref strLName);
            strEmpName =txtEmpName.Text.Trim();
            removeSingleQuote(ref strEmpName);
            strAppPhone = txtAppPhone.Text.Trim();
            removeSingleQuote(ref strAppPhone);
            strAppEmail = txtAppEmail.Text.Trim();
            removeSingleQuote(ref strAppEmail);
            strJobTitle=txtJobTitle.Text.Trim();
            removeSingleQuote(ref strJobTitle);
            string strSkillFit=txtSkillFit.Text.Trim();   
            string strReview=txtComment.Text.Trim();
            removeSingleQuote(ref strReview);
            string strReason=txtReason.Text.Trim(); 
            removeSingleQuote (ref strReason);
            bool boolDecision=CheckBox1.Checked;
            int iDecide=Convert.ToInt32(boolDecision);
            int interviewID=int.Parse(grdInterviews.Rows[r].Cells[1].Text.Trim());
            strAppSkills=txtAppSkills.Text.Trim();
            removeSingleQuote(ref strAppSkills);
            strReqSkills=txtReqSkills.Text.Trim();
            removeSingleQuote(ref strReqSkills);
            sbAddEvals.Append(string.Format("{0}, {1},'{2}','{3}','{4}','{5}','{6}', '{7}'", interviewID.ToString(), strUserID, strEmpName, strJobTitle, strFName, strLName, strAppPhone, strAppEmail));
            //,'{7}','{8]',{9},'{10}',{11},'{12}' ,strAppSkills,strReqSkills,skillFit,strReview,iDecide,strReason
            sbAddEvals.Append(",'" + strAppSkills + "'");
            sbAddEvals.Append(",'" + strReqSkills + "'");
            sbAddEvals.Append("," + strSkillFit);
            sbAddEvals.Append(",'" + strReview + "'");
            sbAddEvals.Append("," + iDecide.ToString());
            sbAddEvals.Append(",'" + strReason + "')");
            Debug.WriteLine(sbAddEvals.ToString());
            OleDbCommand cmd = new OleDbCommand(sbAddEvals.ToString(), cnn);
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            txtAppEmail.Text = "";
            txtAppName.Text = "";
            txtAppPhone.Text = "";
            txtEmpName.Text = "";
            txtJobTitle.Text = "";
            txtAppSkills.Text = "";
            txtReqSkills.Text = "";
            txtSkillFit.Text = "";
            txtComment.Text = "";
            txtReason.Text = "";
            CheckBox1.Checked = false;
        }

         public string strSceduleApplicant;

        protected void grdInterviews_SelectedIndexChanged(object sender, EventArgs e)
        {
            int r = grdInterviews.SelectedIndex;

            strAppName = grdInterviews.Rows[r].Cells[8].Text + " " + grdInterviews.Rows[r].Cells[9].Text;
            FillInCandidateInfo(strAppName, txtAppName);
            strAppPhone = grdInterviews.Rows[r].Cells[10].Text;
            FillInCandidateInfo(strAppPhone, txtAppPhone);
            strAppEmail = grdInterviews.Rows[r].Cells[11].Text;
            FillInCandidateInfo(strAppEmail, txtAppEmail);
            strEmpName = grdInterviews.Rows[r].Cells[6].Text;
            FillInCandidateInfo(strEmpName, txtEmpName);
            strJobTitle = grdInterviews.Rows[r].Cells[7].Text;
            FillInCandidateInfo(strJobTitle, txtJobTitle);
            strAppSkills = grdInterviews.Rows[r].Cells[12].Text;
            FillInCandidateInfo(strAppSkills, txtAppSkills);
            string strReqSkills = grdInterviews.Rows[r].Cells[17].Text;
            FillInCandidateInfo(strReqSkills, txtReqSkills);
            string[] arrReqSkills= strReqSkills.Split('|');
            string[] arrAppSkills = strAppSkills.Split('|');
            HashSet<string> setReqSkills= buildSkillSet(arrReqSkills);
            float reqCount=(float)setReqSkills.Count;
            HashSet<string> setAppSkills = buildSkillSet(arrAppSkills);
            setAppSkills.IntersectWith(setReqSkills); 
            float appCount = (float)setAppSkills.Count;
            skillFit = appCount / reqCount * 100;
            txtSkillFit.Text = skillFit.ToString();
        }

        public HashSet<string> buildSkillSet(string[] arr)
        {

            HashSet<string> returnSet=new HashSet<string>();
            foreach (string strSkill in arr)
            {
                returnSet.Add(strSkill);
            }
            return returnSet;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            cnn = new OleDbConnection(strCareerDB);

            // strInterviews = "SELECT * FROM Interviews";
            strInterviews = "SELECT  Interviews.*, JobOpenings.JobID, JobOpenings.EmpID, JobOpenings.JobSkillsList from Interviews, JobOpenings WHERE JobOpenings.JobID = Interviews.JobID";
            cnn = new OleDbConnection(strCareerDB);
            daInterviews = new OleDbDataAdapter(strInterviews, cnn);

            cmdInterviews = new OleDbCommand(strInterviews, cnn);
            dsInterviews = new DataSet();
            DataTable dtInterviews = new DataTable("Interviews");
            dsInterviews.Clear();
            dsInterviews.Tables.Add(dtInterviews);
            daInterviews.Fill(dtInterviews);
            grdInterviews.DataSource = dsInterviews.Tables[0];
            grdInterviews.DataBind();


        }

        protected void removeSingleQuote(ref string str)
        {
            if (str.Contains("'"))
            {
                str = str.Replace("'", "");
            }
            
        }
        protected void FillInCandidateInfo(string fieldInfo, TextBox field)
        {
            field.Text = fieldInfo;
        }
    }
}