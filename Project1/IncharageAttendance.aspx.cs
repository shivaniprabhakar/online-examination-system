using System;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.OleDb;
using System.Net;


public partial class IncharageAttendance : System.Web.UI.Page
{
    SqlBulkCopy bulkcopy = new SqlBulkCopy("Data Source=PRAKASH-PC\\SQLEXPRESS;Initial Catalog=Attendance;Integrated Security=True");

    OleDbConnection oledbconn = new OleDbConnection();
    OleDbCommand oledbcmd = new OleDbCommand();

    DataSet DS = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.PostedFile.FileName.Length > 0)
            {
                if (FileUpload1.PostedFile.FileName.ToString().Trim() == null)
                {
                    return;
                }
                else
                {
                    if (SingleExcel(FileUpload1.PostedFile.FileName))
                    {
                        String _path = Server.MapPath("Upload\\");

                        HiddenField1.Value = _path + FileUpload1.PostedFile.FileName;

                        FileUpload1.SaveAs(_path + FileUpload1.PostedFile.FileName);

                        oledbconn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HiddenField1.Value + "; Extended Properties=Excel 12.0;";
                        oledbcmd.Connection = oledbconn;
                        oledbcmd.CommandText = "SELECT * FROM [SHEET1$]";
                        OleDbDataAdapter DA = new OleDbDataAdapter(oledbcmd);

                        oledbconn.Open();
                        DA.Fill(DS, "EXCEL");
                        oledbconn.Close();

                        GridView1.DataSource = DS.Tables["EXCEL"];
                        GridView1.DataBind();
                        btnSubmit.Visible = true;
                        btnCancel.Visible = true;
                    }
                    else
                    {
                        lblMessage.Text = "Please upload only Excel files";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            oledbcmd.Dispose();
            oledbconn.Close();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            oledbconn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HiddenField1.Value + "; Extended Properties=Excel 12.0;";
            oledbcmd.Connection = oledbconn;
            oledbcmd.CommandText = "SELECT * FROM [SHEET1$]";
            OleDbDataAdapter DA = new OleDbDataAdapter(oledbcmd);

            oledbconn.Open();
            DA.Fill(DS, "EXCEL");
            oledbconn.Close();
            

            bulkcopy.DestinationTableName = "Attendance";
            bulkcopy.WriteToServer(DS.Tables["EXCEL"]);

            lblMessage.Text = "Successfully Saved in Database";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            GridView1.Visible = false;
            btnSubmit.Visible = false;
            btnCancel.Visible = false;
            
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        btnCancel.Visible = false;
        btnSubmit.Visible = false;
        lblMessage.Text = "";
    }
    private static bool SingleExcel(string fileName)
    {
        Regex regex = new Regex("(.*?)\\.(XLS|XLSX|xls|xlsx)$");
        return regex.IsMatch(fileName);
    }

    
    protected void Sample_Click(object sender, EventArgs e)
    {
        try
        {
            string strURL = "~\\Upload\\Sample.xlsx";
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + Server.MapPath(strURL) + "\"");  
            byte[] data = req.DownloadData(Server.MapPath(strURL));
            response.BinaryWrite(data);
            response.End();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

}
