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
    public partial class Interview : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter daJobOpenings, daApplications, daApplicants;
        public OleDbCommand cmdJobOpenings, cmdApplications, cmdApplicants;
        public string strDataPath, strUserID;
        public DataSet dsJobOpenings, dsApplications, dsApplicants;
        public DataTable dtJobOpenings, dtApplications, dtApplicants;

        protected void grdApplicants_SelectedIndexChanged(object sender, EventArgs e)
        {
      
            forApplicant.Visible = true;
            calInterviewDate.Visible = true;
            scheduleFor.Visible = true;
            interviewTime.Visible = true;
            string strApplicantFName = grdApplicants.SelectedRow.Cells[2].Text;
            string strApplicantLName= grdApplicants.SelectedRow.Cells[3].Text;
            lblApplicantName.Text = strApplicantFName + " " + strApplicantLName;
            lblApplicantName.Visible = true;
         

        }   

        protected void grdApplications_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strApplicantID = grdApplications.SelectedRow.Cells[1].Text;
            strApplicants = "SELECT ApplicantID, ApplicantFName, ApplicantLName, ApplicantPhone, ApplicantEmail  FROM Applicants WHERE ApplicantID = " + strApplicantID;
            customizeTable(strApplicants, cmdApplicants, dtApplicants, daApplicants, dsApplicants, grdApplicants);
            grdApplicants.Visible = true;
      
        }

        protected void calInterviewDate_SelectionChanged(object sender, EventArgs e)
        {
            lblScheduleDate.Text=calInterviewDate.SelectedDate.ToString("D");
            lblScheduleDate.Visible = true;
            btnSchedule.Visible = true;
        }

        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            StringBuilder sbScheduleErr=new StringBuilder();
            DateTime dtToday=DateTime.Now;
            if (calInterviewDate.SelectedDate.ToString() == "")
            {
                sbScheduleErr.Append("Please select a scheduling date on the calendar.\n\r");
                
            }
            if (DateTime.Compare(calInterviewDate.SelectedDate, dtToday) < 0)
            {
                sbScheduleErr.Append("Please select a future scheduling date on the calendar.\n\r");
                
            }
            if (interviewTime.Value.ToString().Trim() == "")
            {
                sbScheduleErr.Append("Please set an interiew time for the applicant.");
            }
            if (sbScheduleErr.ToString() != "")
            {
                lblScheduleErr.Text = sbScheduleErr.ToString();
                return;
            }
            Debug.WriteLine(interviewTime.Value.ToString());
            string strToday = String.Format("{0:MM/dd/yyyy}", dtToday);
            strUserID = Session["CurrentUserID"].ToString();
            StringBuilder sbSchedule = new StringBuilder("INSERT INTO INTERVIEWS (JobAppID, UserID, EmpID, JobID, EmployerName, JobTitle, ApplicantFName, ApplicantLName, ApplicantPhone, ApplicantEmail, ApplicantSkills, InterviewDate, InterviewTime) VALUES (");
            sbSchedule.Append(grdApplicants.SelectedRow.Cells[1].Text + ",");
            sbSchedule.Append(strUserID + ",");
            sbSchedule.Append(grdPostings.SelectedRow.Cells[2].Text + ",");
            sbSchedule.Append(grdPostings.SelectedRow.Cells[1].Text + ",");
            sbSchedule.Append("'" + grdPostings.SelectedRow.Cells[3].Text + "',");
            sbSchedule.Append("'" +  grdPostings.SelectedRow.Cells[4].Text + "',");
            sbSchedule.Append("'" + grdApplicants.SelectedRow.Cells[2].Text + "',");
            sbSchedule.Append("'" + grdApplicants.SelectedRow.Cells[3].Text + "',");
            sbSchedule.Append("'" + grdApplicants.SelectedRow.Cells[4].Text + "',");
            sbSchedule.Append("'" + grdApplicants.SelectedRow.Cells[5].Text + "',");
            sbSchedule.Append("'" + grdApplications.SelectedRow.Cells[6].Text + "',");
            sbSchedule.Append("'" + String.Format("{0:MM/dd/yyyy}", calInterviewDate.SelectedDate) + "',");
            sbSchedule.Append("'" + string.Format("{0:hh:mm tt}",interviewTime.Value) + "')");
            OleDbCommand cmdScheduleInterview = new OleDbCommand(sbSchedule.ToString(), cnn);
            cnn.Open();
            cmdScheduleInterview.ExecuteNonQuery();
            cnn.Close();
            grdApplications.Visible = false;
            grdApplicants.Visible = false;
            hlViewCoverLetter.Visible = false;
            hlViewResume.Visible = false;
            calInterviewDate.Visible = false;
            interviewTime.Visible = false;
            lblScheduleDate.Visible = false;
            lblApplicantName.Visible = false;
            lblScheduleErr.Visible = false;
            btnSchedule.Visible = false;



        }

        protected void grdPostings_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strJobID = grdPostings.SelectedRow.Cells[1].Text;
            strApplications= "SELECT ApplicantID, ApplicantFName, ApplicantLName, AppliedDate, CoverLetter, ApplicantSkills  FROM Applications WHERE JobID = " + strJobID;
            customizeTable(strApplications, cmdApplications, dtApplications, daApplications, dsApplications, grdApplications);
            
            cnn.Close();
            hlViewResume.Visible = false;  
            string strResume="SELECT CoverLetter,Resume from Applications WHERE JobID = " + strJobID;
            OleDbDataAdapter daResume = new OleDbDataAdapter(strResume, cnn);
            cnn.Open();
            OleDbCommand cmdResume=new OleDbCommand(strResume, cnn);
            DataSet dsResume = new DataSet();
            DataTable dtResume=new DataTable(strResume);
            dsResume.Clear();
            dsResume.Tables.Add(dtResume);
            daResume.Fill(dtResume);
            try
            { 
                Session["CurrentApplicantResume"] =  dsResume.Tables[0].Rows[0]["Resume"].ToString();
                Session["CurrentApplicantCoverLetter"] =  dsResume.Tables[0].Rows[0]["CoverLetter"].ToString();
                if (dsResume.Tables[0].Rows.Count > 0)
                {
                    if (dsResume.Tables[0].Rows[0]["Resume"].ToString().Trim().Length > 0)
                    {
                        Session["CurrentApplicantResume"] =  dsResume.Tables[0].Rows[0]["Resume"].ToString();
                        hlViewResume.Visible = true;
                    }
                    if (dsResume.Tables[0].Rows[0]["CoverLetter"].ToString().Trim().Length > 0)
                    {
                        Session["CurrentApplicantCoverLetter"] = dsResume.Tables[0].Rows[0]["CoverLetter"].ToString();
                        hlViewCoverLetter.Visible = true;
                    }



                }
            }
            catch {
                forApplicant.Visible = false;
                calInterviewDate.Visible = false;
                scheduleFor.Visible = false;
                interviewTime.Visible = false;
                grdApplicants.Visible = false;
                hlViewCoverLetter.Visible = false;


            }
        }

        public DateTime dtJobExpire;
        public string strJobOpenings;
        public string strApplicants;
        public string strApplications;
        public string strSceduleApplicant;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            cnn = new OleDbConnection(strCareerDB);
            
            strJobOpenings = "SELECT * FROM JobOpenings";
            customizeTable(strJobOpenings, cmdJobOpenings, dtJobOpenings, daJobOpenings, dsJobOpenings, grdPostings );
            strUserID = Session["CurrentUserID"].ToString();
 
           
        }
       protected void customizeTable(string strSQL, OleDbCommand cmdCustomCommand, DataTable dtCustomTable, OleDbDataAdapter daCustomAdapter, DataSet dsCustomSet, GridView grdCustom)
        {
           OleDbDataAdapter daCustomTable = new OleDbDataAdapter(strSQL, cnn);
           OleDbCommand cmdCustomTable = new OleDbCommand(strSQL, cnn);
           dsCustomSet = new DataSet();
           dtCustomTable = new DataTable(strSQL);
            dsCustomSet.Clear();  
            dsCustomSet.Tables.Add(dtCustomTable);
            daCustomTable.Fill(dtCustomTable);
            grdCustom.DataSource = dsCustomSet;
            grdCustom.DataBind();
        }

      
    }
}