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

public partial class AdminCRM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }

    const string TableName = "tbl_CRMExam";
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
            con.Open();
            if (HiddenField1.Value != "")
            {
                command.Connection = con;
                command.CommandText = "Update  " + TableName + " set CallResult=@CallResult Where CrmId=" + HiddenField1.Value.ToString();
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@CallResult", txtCallResult.Text);
                command.ExecuteNonQuery();
                txtSubject.Text = "";
                txtDescription.Text = "";
                txtCallResult.Text = "";
                HiddenField1.Value = "";
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
    protected void btnSaveCreate_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        HiddenField1.Value = e.CommandArgument.ToString();
        btnSave.Text = "Update";
        try
        {
            command.Connection = con;
            command.CommandText = "Select * from  " + TableName + " where CrmId = " + HiddenField1.Value;
            con.Open();
            dreader = command.ExecuteReader();
            if (dreader.Read())
            {
                txtSubject.Text = dreader["Subject"].ToString();
                txtDescription.Text = dreader["Description"].ToString();
                txtDescription.Text = dreader["CallResult"].ToString();
                txtSubject.Focus();
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
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        HiddenField1.Value = e.CommandArgument.ToString();
        try
        {
            command.Connection = con;
            command.CommandText = "Delete from  " + TableName + " where CrmId = " + HiddenField1.Value;
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
        SqlDataAdapter da = new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select * from  " + TableName;
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

}
