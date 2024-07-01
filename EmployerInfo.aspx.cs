using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Windows;
using System.Diagnostics;
using System.Threading;

namespace CareerBase
{
    public partial class EmployerInfo : System.Web.UI.Page
    {

        public OleDbConnection cnn;
        public OleDbDataAdapter adpt;
        public OleDbCommand cmdEmployers;
        public string strDataPath;
        protected void btnNewEmp_Click(object sender, EventArgs e)
        {
            StringBuilder sbEmployerPost=new StringBuilder();
            string strEmpName=txtEmployerName.Text;
            string strEmpAddr=txtEmpAddr.Text;
            string strEmpAddr2 = txtEmpAddr2.Text;
            string strEmpCity = txtCity.Text;
            string strEmpState = txtState.Text;
            string strEmpZip = txtZip.Text;
            string strEmpPhone=txtPhone.Text;
            string strEmail = txtEmail.Text;
            string strURL = txtEmpURL.Text;
            
            sbEmployerPost.Append("INSERT INTO Employers (EmployerName, EmployerAddress, EmployerAddress2, EmployerCity, EmployerState, EmployerZip, EmployerPhone, EmployerEmail, EmployerURL) Values (");
            sbEmployerPost.Append(string.Format("'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", strEmpName, strEmpAddr, strEmpAddr2, strEmpCity, strEmpState, strEmpZip, strEmpPhone, strEmail, strURL));
            cnn.Open();
            OleDbCommand cmdPostEmployer = new OleDbCommand(sbEmployerPost.ToString(),cnn);
            cmdPostEmployer.ExecuteNonQuery();
          
            cnn.Close();
            resetFields();
          }



        protected void Page_Load(object sender, EventArgs e)
        {
            strDataPath = Server.MapPath("~/App_Data");
            Debug.Write(strDataPath);
            string strCareerDB = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strDataPath + "/CareerMarket.accdb;Persist Security Info=False";
            string strEmployers = "SELECT * FROM Employers";

            cnn = new OleDbConnection(strCareerDB);
            adpt = new OleDbDataAdapter(strEmployers, cnn);
            cmdEmployers = new OleDbCommand(strEmployers, cnn);
    
            


        }
        
        
        private void resetFields()
            {
                txtEmployerName.Text = "";
                txtEmpAddr.Text = "";
                txtEmpAddr2.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
                txtZip.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtEmpURL.Text = "";
              //  lblAddSuccess.Visible = false;
                txtEmployerName.Focus();
            }

        
    }

}