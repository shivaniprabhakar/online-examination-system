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

public partial class AdminRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    const string TableName = "AdminDetails";
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        int Count = 0;
        try
        {
            command.Connection = con;
            command.CommandText = "Select Count(*) from AdminDetails WHERE EmpId = '" + txtEmployeeId.Text + "' And Password = '" + txtPassword.Text + "'";
            con.Open();
            Count = int.Parse(command.ExecuteScalar().ToString());
            con.Close();
            if (Count == 0)
            {
                command.CommandText = "Insert into " + TableName + " (EmpId, Name, Password) values (@EmpId, @Name, @Password)";
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@EmpId", txtEmployeeId.Text);
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@Password", txtPassword.Text);
                con.Open();
                command.ExecuteNonQuery();
                lblError.Text = "";
                ClearControls();
            }
            else
                lblError.Text = "Already Exist";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            command.Dispose();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        ClearControls();
    }
    private void ClearControls()
    {
        txtEmployeeId.Text = "";
        txtName.Text = "";
        txtPassword.Text = "";
        txtConfirmPassword.Text = "";
        txtEmployeeId.Focus();
    }
}
