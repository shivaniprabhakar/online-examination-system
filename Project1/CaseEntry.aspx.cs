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

public partial class CaseEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindGrid();
    }

    const string TableName = "tbl_Cash";
    SqlCommand command = new SqlCommand();
    SqlConnection con;
    SqlDataReader dreader = null;
    
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

            if (btnSave.Text == " Save ")
                command.CommandText = "Insert into " + TableName + " (StudentName, Amount) values (@StudentName, @Amount)";
            else
                command.CommandText = "Update " + TableName + " set StudentName = @StudentName, Amount = @Amount where CashId = " + HiddenField1.Value;
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
            command.Parameters.AddWithValue("@Amount", txtAmount.Text);
            con.Open();
            command.ExecuteNonQuery();
            BindGrid();
            clearcontrols();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            command.Dispose();
            HiddenField1.Value = null;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            clearcontrols();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void  lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        HiddenField1.Value = e.CommandArgument.ToString();
        btnSave.Text = "Update";
        try
        {
            command.Connection = con;
            command.CommandText = "Select StudentName, Amount from  " + TableName + " where CashId = " + HiddenField1.Value;
            con.Open();
            dreader = command.ExecuteReader();
            if (dreader.Read())
            {
                txtStudentName.Text = dreader["StudentName"].ToString();
                txtAmount.Text = dreader["Amount"].ToString();
                txtStudentName.Focus();
            }
            BindGrid();
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
    protected void  lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        HiddenField1.Value = e.CommandArgument.ToString();
        try
        {
            command.Connection = con;
            command.CommandText = "Delete from  " + TableName + " where CashId = " + HiddenField1.Value;
            con.Open();
            command.ExecuteNonQuery();
            BindGrid();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            command.Dispose();
            HiddenField1.Value = null;
        }
    }

    public void BindGrid()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da=new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select CashId, StudentName, Amount from  " + TableName;
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "Coursedetails");
            GridView1.DataSource = ds.Tables["Coursedetails"];
            GridView1.DataBind();
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
    public void clearcontrols()
    {
        txtStudentName.Text = "";
        txtAmount.Text = "";
        btnSave.Text = " Save ";
        txtStudentName.Focus();
    }
}
