using System;
using System.Data;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Web.WebPages;

namespace CareerBase
{
    public partial class PostJob : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdEmployers;
        public string strDataPath;
        public DataSet dsEmployers;
        public DataSet dsSelectEmp;
        public DataTable dtSelectEmp;
        public DateTime dtJobExpire;
        public string strJobExpire;
        public string strEmployers;
        public string strSelectEmp;
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            strEmployers = "SELECT * FROM Employers";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strEmployers, cnn);

            cmdEmployers = new OleDbCommand(strEmployers, cnn);
            dsEmployers = new DataSet();
            DataTable dtEmployers = new DataTable("Employers");
            dsEmployers.Clear();
            dsEmployers.Tables.Add(dtEmployers);
            adpt.Fill(dtEmployers);
            grdEmployers.DataSource = dsEmployers.Tables[0];
            grdEmployers.DataBind();
            Debug.WriteLine("SELECTED DATE: " + Calendar1.SelectedDate.ToString());
            strJobExpire = Calendar1.SelectedDate.ToString();

        }
       
        protected void btnSelectEmps_Click(object sender, EventArgs e)
        {
            if (txtEmpContactValue.Text.Trim() == "") { return; }
            string strSelectedField = ddlSelectEmpField.SelectedItem.ToString();
            string strContactValue = txtEmpContactValue.Text;
            for (int i = 0; i < grdEmployers.Rows.Count; i++)
            {

                // grdEmployers.SelectRow(i).
                //if (i == 3) return;
                Debug.WriteLine(ddlSelectEmpField.SelectedIndex);
                grdEmployers.SelectRow(i);
                string searchInfo = grdEmployers.SelectedRow.Cells[ddlSelectEmpField.SelectedIndex + 2].Text;
                // Debug.WriteLine(grdEmployers.SelectedRow.Cells[ddlSelectEmpField.SelectedIndex + 2].Text);
                // if (i == 4) return;
                if (searchInfo.ToLower().Contains(strContactValue.ToLower())) return;

            }
           
            
           // strSelectEmp = string.Format("{0} WHERE {1} LIKE '%{2}%'", strEmployers, strSelectedField, strContactValue);
           // Debug.WriteLine(strSelectEmp);
           /*
            adpt = new OleDbDataAdapter(strEmployers, cnn);

            cmdEmployers = new OleDbCommand(strEmployers, cnn);
            dsSelectEmp = new DataSet();
            dtSelectEmp = new DataTable("Employers");
            dsSelectEmp.Clear();
            dsSelectEmp.Tables.Add(dtSelectEmp);
            adpt.Fill(dtSelectEmp);
            grdEmployers.DataSource = dsSelectEmp.Tables[0];
            grdEmployers.DataBind();
           */

        }

        protected void grdEmployers_SelectedIndexChanged(object sender, EventArgs e)
        {
            //btnSelectEmps_Click(sender, e);


        }

        protected void btnResetEmps_Click(object sender, EventArgs e)
        {
            Page_Load(sender, e);
            txtEmpContactValue.Text = "";
            lblEntryErr.Text = string.Empty;
            lblNoEmpInfo.Text = string.Empty;
            lblPayAmtErr.Text = string.Empty;
        }

        protected void btnPostNewJob_Click(object sender, EventArgs e)
        {
            if (txtJobDescription.Text.Trim() == "" || txtJobTitle.Text.Trim() == "" || txtPayAmount.Text.Trim() == "" || txtSkills.Text.Trim() == "")
            {
                lblEntryErr.Visible = true;
                return;

            }
            double dbltemp;
            if (double.TryParse(txtPayAmount.Text.Trim(), out dbltemp) == false)
            {
                lblPayAmtErr.Visible = true;
                return;
            }
            if (Calendar1.SelectedDate.ToString().Contains("1/1/0001"))
            {
                lblNoSelectDate.Visible = true;
                return;
            }
            StringBuilder sbAddJobPost=new StringBuilder();
            lblEntryErr.Visible=false;
            lblPayAmtErr.Visible=false;
            lblNoEmpInfo.Visible=false; 
            string empID=null;
            try
            {
                 empID = grdEmployers.SelectedRow.Cells[1].Text;
            }
            catch
            {
                lblNoEmpInfo.Visible = true;
                return;
            }
            string strEmpName= grdEmployers.SelectedRow.Cells[2].Text;
            string strTitle=txtJobTitle.Text.Trim();
            string strDescription = txtJobDescription.Text.Trim();
            string strSkills=txtSkills.Text.Trim(); 
            string strPay=txtPayAmount.Text.Trim();
            string strTimeUnit=lbRate.SelectedItem.Text;
            sbAddJobPost.Append("INSERT INTO JobOpenings (EmpID, EmployerName, JobTitle, JobDescription, JobSkillsList, JobPay, TimeUnit, JobExpiration) VALUES (");
            JobPosting newJobPost  = new JobPosting();
            newJobPost.empID = int.Parse(empID);
            newJobPost.empName = strEmpName;
            newJobPost.jobTitle = strTitle;
            newJobPost.jobDescription = strDescription;
            newJobPost.jobSkills = strSkills;
            newJobPost.jobPayAmount= float.Parse(strPay);
            newJobPost.perTimeUnit=strTimeUnit;
            newJobPost.openingExpiration = strJobExpire.AsDateTime();  
            sbAddJobPost.Append(newJobPost.empID.ToString() + ",");
            sbAddJobPost.Append("'" + newJobPost.empName + "',");
            sbAddJobPost.Append("'" + newJobPost.jobTitle + "',");
            sbAddJobPost.Append("'" + newJobPost.jobDescription + "',");
            sbAddJobPost.Append("'" + newJobPost.jobSkills + "',");
            sbAddJobPost.Append( newJobPost.jobPayAmount.ToString() + ",");
            sbAddJobPost.Append("'" + newJobPost.perTimeUnit + "',");
            sbAddJobPost.Append("'" + newJobPost.openingExpiration.ToString("MM-dd-yyyy") + "'");
            sbAddJobPost.Append(')');
            Debug.WriteLine(sbAddJobPost.ToString());
            cnn.Open();
            OleDbCommand cmdPostEmployer = new OleDbCommand(sbAddJobPost.ToString(), cnn);
            cmdPostEmployer.ExecuteNonQuery();

            cnn.Close();
            resetFields();
        }

       public void resetFields()
        {
            txtEmpContactValue.Text = "";
            txtJobDescription.Text = "";
            txtJobTitle.Text = "";
            txtPayAmount.Text = "";
            txtSkills.Text = "";
            lblEntryErr.Text = string.Empty;
            lblNoEmpInfo.Text = string.Empty;
            lblPayAmtErr.Text = string.Empty;
            lblNoSelectDate.Text = string.Empty;

        }

      
    }
}