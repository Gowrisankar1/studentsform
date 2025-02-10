using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace studentsform
{
    public partial class studentreg : System.Web.UI.Page
    {
        connectioncls obj = new connectioncls();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtStudentId.Text = GenerateStudentId();
        }
        private string GenerateStudentId()
        {         
            return "SID" + DateTime.Now.Year + new Random().Next(1000, 9999);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var courseNames = Request.Form.GetValues("courseName");
            var percentages = Request.Form.GetValues("percentage");
            var passingYears = Request.Form.GetValues("yearOfPassing");

            string inr = "INSERT INTO Student_reg values(" + txtStudentId.Text + ",' " + txtFirstName.Text + "',' " + txtLastName.Text + "', " + txtAge.Text + ",'" + txtDOB.Text + "','" + ddlGender.SelectedValue + "','" + txtEmail.Text + "', " + txtPhoneNumber.Text + ",'" + txtUsername.Text + "', '" + txtPassword.Text + "'";
            int il = obj.Fn_NonQuery(inr);
            if (il == 1)
            {
                Label1.Visible = true;
                Label1.CssClass = "text-success";
                Label1.Text = "inserted";

            }
            for (int i = 0; i < courseNames.Length; i++)
            {
                string inq = "INSERT INTO Qualifications values('" + txtStudentId.Text + "', '" + courseNames[i] + "', " + percentages[i] + ", " + passingYears[i] + ")";
                int iq = obj.Fn_NonQuery(inq);
                if (iq == 1 && il == 1)
                {
                    Label1.Visible = true;
                    Label1.CssClass = "text-success";
                    Label1.Text = "Data inserted successfully.";
                }
                else if (iq != 1)
                {
                    Label1.Visible = true;
                    Label1.CssClass = "text-danger";
                    Label1.Text = "Failed to insert qualification data.";
                }
                else if (il != 1)
                {
                    Label1.Visible = true;
                    Label1.CssClass = "text-danger";
                    Label1.Text = "Failed to insert related data.";
                }
            }

        }
    }
}