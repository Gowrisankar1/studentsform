using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace studentsform
{
    public partial class Login : System.Web.UI.Page
    {
        connectioncls obj = new connectioncls();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string ins = "select count(StudentId) fromStudentId where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
            string s = obj.Fn_Scalar(ins);
            if (s == "1")
            {
                string ind = "select StudentId from StudentId where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
                string sp = obj.Fn_Scalar(ind);
                if (sp == "1")
                {
                    Session["uid"] = sp;
                    Response.Redirect("registrationList.aspx");

                }
                else
                {
                    lblErrorMessage.Text = "invalid username and password";
                }
            }
        }
    }
}