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

public partial class frmAdminLogin : System.Web.UI.Page
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
        try
        {
            if (Login1.UserName.ToString() == "Admin" && Login1.Password.ToString() == "Admin")
            {
                Response.Redirect("~/Center.aspx");
                e.Authenticated = true;
                return;
            }
            else 
            {

            }


        }
        catch (Exception ee)
        {
            lblMessage.Text = "Error occured. <br> " + ee.ToString();
        }
        finally
        {

        }
    }
    
}
