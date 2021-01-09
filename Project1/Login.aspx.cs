using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    SqlCommand command = new SqlCommand();
    SqlConnection con;
    SqlDataReader Dr = null;

    public string ConnectionString()
    {
        try
        {
            string ConnectionString = "Data Source=LAPTOP-ICG8G5PD\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True;";
            return ConnectionString;
        }
        catch (SystemException ex)
        {
            throw ex;
        }
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        try
        {
            if (Login1.UserName.ToString() == "Admin" && Login1.Password.ToString() == "Admin")
            {
                Response.Redirect("~/Center.aspx");
                e.Authenticated = true;
                return;
            }
            else if (Login1.UserName.ToString() == "Incharge" && Login1.Password.ToString() == "Incharge")
            {
                Response.Redirect("~/CaseEntry.aspx");
                e.Authenticated = true;
                return;
            }




            command.Connection = con;
            command.CommandText = " select Std.RegId as EnrolmentNo, Std.FirstName, Std.LastName,Cnt.Center,CD.Course from Register as Std inner join " +
                                    " CityCenter as Cnt on Std.Center=Cnt.Center inner join  dbo.CourseDetails CD on Std.Course=CD.Course where " +
                                    " (Std.UserName)='" + Login1.UserName + "' and Std.Password='" + Login1.Password + "'";
            con.Open();
            Dr = command.ExecuteReader();
            
            if (Dr.Read())
            {
                if (Dr["Course"].ToString().ToUpper() == "CRM")
                {
                    String Id = Dr["EnrolmentNo"].ToString();
                    e.Authenticated = true;
                    Response.Redirect("~/Default3.aspx?RegId=" + Id);
                }
                else
                {
                    String Id = Dr["EnrolmentNo"].ToString();
                    e.Authenticated = true;
                    Response.Redirect("~/Examination.aspx?RegId=" + Id);
                }
            }
            else
            {
                e.Authenticated = false;
            }
        }
        catch (Exception ee)
        {
            lblMessage.Text = "Error occured. <br> " + ee.ToString();
        }
        finally
        {
            con.Close();
            command.Dispose();
        }
    }
    
}
