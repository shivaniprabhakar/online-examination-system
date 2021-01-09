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

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    const string TableName = "tbl_CRMExam";
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
            command.CommandText = "Insert into " + TableName + " (Subject,CallType,CallPurpose,CallFromTo,Related," +
                                "Description,Billable) values (@Subject,@CallType,@CallPurpose" +
                                ",@CallFromTo,@Related,@Description,@Billable)";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@Subject", txtSubject.Text);
            command.Parameters.AddWithValue("@CallType", rdbInbound.Checked?"Inbound":"Outbound");
            command.Parameters.AddWithValue("@CallPurpose", cboCallPurpose.Text);
            command.Parameters.AddWithValue("@CallFromTo", rdbContact.Checked?"Contact":"Lead");
            command.Parameters.AddWithValue("@Related", cboRelatedTo.Text);
            command.Parameters.AddWithValue("@Description", txtDescription.Text);
            command.Parameters.AddWithValue("@Billable", chkBillable.Checked?true:false);
            //command.Parameters.AddWithValue("@CallResult", txtCallResult.Text);
            con.Open();
            command.ExecuteNonQuery();
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
