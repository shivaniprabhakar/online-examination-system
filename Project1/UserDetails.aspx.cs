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

public partial class UserDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            String CmdText = "Select * from Register order by FirstName";
            BindGrid(CmdText);
            BindDropdownlist();
        }

         
    }

    SqlCommand command = new SqlCommand();
    SqlConnection con;
    SqlDataReader dreader;

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

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        String CmdText = "Select * from Register where Center='" + ddlCenter.SelectedValue + "'or Department='" + ddlDepartment.SelectedValue + "'or Course='" + ddlCourse.SelectedValue + "' Order by FirstName ";
        BindGrid(CmdText);
    }

    
    public void BindDropdownlist()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select Course from  CourseDetails";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "CourseDetails");
            ddlCourse.DataSource = ds.Tables["CourseDetails"];
            ddlCourse.DataTextField = "Course";
            ddlCourse.DataValueField = "Course";
            ddlCourse.DataBind();
            con.Close();
            command.CommandText = "Select Department from DeptDetails";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "DeptDetails");
            ddlDepartment.DataSource = ds.Tables["DeptDetails"];
            ddlDepartment.DataTextField = "Department";
            ddlDepartment.DataValueField = "Department";
            ddlDepartment.DataBind();
            con.Close();
            command.CommandText = "Select  Center from CityCenter";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "CityCenter");
            ddlCenter.DataSource = ds.Tables["CityCenter"];
            ddlCenter.DataTextField = "Center";
            ddlCenter.DataValueField = "Center";
            ddlCenter.DataBind();

            con.Close();
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

    public void BindGrid(string CmdText)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = CmdText;
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "UserDetails");
            GridView1.DataSource = ds.Tables["UserDetails"];
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
