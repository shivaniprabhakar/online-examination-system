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

public partial class StudentFollowUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    const string TableName = "tbl_FollowUp";
    SqlCommand command = new SqlCommand();
    SqlConnection con;

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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Insert into " + TableName + " (StudentName,Employement,Salary,Designation,WorkingArea)Values " +
                                "(@StudentName,@Employement,@Salary,@Designation,@WorkingArea)";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
            command.Parameters.AddWithValue("@Employement", txtEmployement.Text);
            command.Parameters.AddWithValue("@Salary", txtSalary.Text);
            command.Parameters.AddWithValue("@Designation", txtDesignation.Text);
            command.Parameters.AddWithValue("@WorkingArea", txtWorkingArea.Text);
            con.Open();
            command.ExecuteNonQuery();
            txtStudentName.Text = "";
            txtEmployement.Text = "";
            txtSalary.Text = "";
            txtDesignation.Text = "";
            txtWorkingArea.Text = "";
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
    protected void btnSaveCreate_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}
