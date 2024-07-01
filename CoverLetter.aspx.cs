using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CareerBase
{
    public partial class CoverLetter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCoverLetter.Text = Session["CurrentApplicantCoverLetter"].ToString();
        }
    }
}