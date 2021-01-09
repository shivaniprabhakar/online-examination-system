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
using System.Collections.Generic;
public partial class LoginAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlCommand command = new SqlCommand();
    SqlConnection con;
    public string ConnectionString()
    {
        try
        {
            string ConnectionString = "Data Source=LAPTOP-ICG8G5PD\\SQLEXPRESS;Initial Catalog=Project1;Integrated Security=True";
            return ConnectionString;
        }
        catch (SystemException ex)
        {
            throw ex;
        }
    }
    
    protected void btnLogin_Click(object sender, EventArgs e)
    {


        SqlDataReader dreader=null;
        con = new SqlConnection(ConnectionString());
        con.Open();
        try
        {
            command.CommandText = "SELECT * from AdminDetails WHERE EmpId = '" + txtEmpId.Text + "' And Password = '" + txtPassword.Text + "'";
            command.Connection = con;
            dreader=command.ExecuteReader();
            if (dreader.Read())
            {
                //Session["CifNo"]=dreader["CIFNo"].ToString();
                Session["Name"]=dreader["Name"].ToString();
                Response.Redirect("~/CaseEntry.aspx");
            }
            else
            {
                lblMessage.Text = "Incorrect UserName or Password";
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
