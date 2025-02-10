using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace studentsform
{
    public partial class registrationList : System.Web.UI.Page
    {
        connectioncls obj = new connectioncls();
        protected void Page_Load(object sender, EventArgs e)
        {
            string rd = "select FirstName,LastName,Age,Phone,Email from Student_reg where StudentId="+Session["uid"]+"";
            SqlDataReader dr = obj.Fn_Reader(rd);
            while (dr.Read()) 
            {
                Label1.Text = dr["FirstName"].ToString();
                Label2.Text = dr["LastName"].ToString();
                Label3.Text = dr["Age"].ToString();
                Label4.Text = dr["Phone"].ToString();
                Label5.Text = dr["Email"].ToString();

            };


        }
    }
}