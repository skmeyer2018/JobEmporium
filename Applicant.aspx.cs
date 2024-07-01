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
    public partial class Applicant : System.Web.UI.Page
    {
        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdEmployers;
        public string strDataPath;
        public string strApplicants;
        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            strApplicants = "SELECT * FROM Applicants";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strApplicants, cnn);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            StringBuilder sbRegister = new StringBuilder("INSERT INTO Applicants (UserID, ApplicantFname, ApplicantLname, ApplicantAddress, ApplicantAddress2, ApplicantCity, ApplicantState, ApplicantZip, ApplicantPhone, ApplicantEmail) VALUES (");
            string strFname=txtFname.Text;
            string strLname = txtLname.Text;
            string strAddr = txtAddr.Text;
            string strAddr2 = txtAddr2.Text;
            string strCity = txtCity.Text;
            string strState = txtState.Text;
            string strZip = txtZip.Text;
            string strPhone = txtPhone.Text;
            string strEmail = txtEmail.Text;
            StringBuilder sbEntryErr = new StringBuilder();
            if (strFname == "") sbEntryErr.Append("First name is needed.\n\r");
            if (strLname == "") sbEntryErr.Append("Last name is needed.\n\r");
            if (strAddr == "") sbEntryErr.Append("Address first line is needed.\n\r");
            if (strCity == "") sbEntryErr.Append("City is needed.\n\r");
            if (strState == "") sbEntryErr.Append("State is needed.\n\r");
            if (strZip == "") sbEntryErr.Append("Zip code is needed.\n\r");
            if (strPhone == "") sbEntryErr.Append("Phone number is needed.\n\r");
            if (strEmail == "") sbEntryErr.Append("Email is needed.\n\r");
            if (sbEntryErr.ToString().Trim() != "")
            {
                lblEntryErr.Text = sbEntryErr.ToString();
                return;
            }
                
            ApplicantClass newApplicant=new ApplicantClass();
            newApplicant.userID = (int)Session["CurrentUserID"];
            newApplicant.fName = strFname;
            newApplicant.lName = strLname;
            newApplicant.appAddr = strAddr;
            newApplicant.appAddr2 = strAddr2;
            newApplicant.appCity = strCity;
            newApplicant.appState = strState;
            newApplicant.appZip = strZip;
            newApplicant.appPhone = strPhone;
            newApplicant.appEmail = strEmail;
            sbRegister.Append("" + newApplicant.userID.ToString() + ",");
            sbRegister.Append("'" + newApplicant.fName + "',");
            sbRegister.Append("'" + newApplicant.lName + "',");
            sbRegister.Append("'" + newApplicant.appAddr + "',");
            sbRegister.Append("'" + newApplicant.appAddr2 + "',");
            sbRegister.Append("'" + newApplicant.appCity + "',");
            sbRegister.Append("'" + newApplicant.appState + "',");
            sbRegister.Append("'" + newApplicant.appZip + "',");
            sbRegister.Append("'" + newApplicant.appPhone + "',");
            sbRegister.Append("'" + newApplicant.appEmail + "')");
            Debug.WriteLine(sbRegister.ToString());
            OleDbCommand cmdPostEmployer = new OleDbCommand(sbRegister.ToString(), cnn);
            cnn.Open();
            cmdPostEmployer.ExecuteNonQuery();

            cnn.Close();
            resetFields();
        }

        public void resetFields()
        {
            txtFname.Text = "";
            txtLname.Text = "";
            txtAddr.Text = "";
            txtAddr2.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZip.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            lblEntryErr.Text = string.Empty;


        }
    }
}