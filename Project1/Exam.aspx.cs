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

public partial class Exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            BindDropdownlist();
            BindGrid();
        }
    }

    const string TableName = "ExamQuestions";
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            if (btnSubmit.Text == "Submit")
            {

                command.CommandText = "Insert into " + TableName + " (CourseID, Question, OptionA, OptionB, OptionC, OptionD, Answer) values (@CourseID, @Question, @OptionA, @OptionB, @OptionC, @OptionD, @Answer)";
            }
            else
            {
                command.CommandText = "Update " + TableName + " set CourseID = @CourseID, Question = @Question, OptionA=@OptionA, OptionB=@OptionB, OptionC=@OptionC, OptionD=@OptionD, Answer=@Answer where QuestionId = " + HiddenField1.Value;
            }
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);
            command.Parameters.AddWithValue("@Question", txtQuestion.Text);
            command.Parameters.AddWithValue("@OptionA", txtOptionA.Text);
            command.Parameters.AddWithValue("@OptionB", txtOptionB.Text);
            command.Parameters.AddWithValue("@OptionC", txtOptionC.Text);
            command.Parameters.AddWithValue("@OptionD", txtOptionD.Text);
            command.Parameters.AddWithValue("@Answer", txtAnswer.Text);
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

    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        con = new SqlConnection(ConnectionString());
        HiddenField1.Value = e.CommandArgument.ToString();
        btnSubmit.Text = "Update";
        try
        {
            command.Connection = con;
            command.CommandText = "Select * from  " + TableName + " E inner join CourseDetails C on E.CourseId = C.CourseId where QuestionId=" + HiddenField1.Value;
            con.Open();
            dreader = command.ExecuteReader();
            if (dreader.Read())
            {
                ddlCourse.SelectedValue = dreader["CourseId"].ToString();
                txtQuestion.Text = dreader["Question"].ToString();
                txtOptionA.Text = dreader["OptionA"].ToString();
                txtOptionB.Text = dreader["OptionB"].ToString();
                txtOptionC.Text = dreader["OptionC"].ToString();
                txtOptionD.Text = dreader["OptionD"].ToString();
                txtAnswer.Text = dreader["Answer"].ToString();
                ddlCourse.Focus();
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
            command.CommandText = "Delete from  " + TableName + " where QuestionId = " + HiddenField1.Value;
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
            da.Fill(ds, "ExamQuestions");
            GridView1.DataSource = ds.Tables["ExamQuestions"];
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
    public void BindDropdownlist()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select CourseId, Course, Description from  CourseDetails";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "CourseDetails");
            ddlCourse.DataSource = ds.Tables["CourseDetails"];
            ddlCourse.DataTextField = "Course";
            ddlCourse.DataValueField = "CourseID";
            ddlCourse.DataBind();
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
        txtQuestion.Text = "";
        txtOptionA.Text = "";
        txtOptionB.Text = "";
        txtOptionC.Text = "";
        txtOptionD.Text = "";
        txtAnswer.Text = "";
        btnSubmit.Text = "Submit";
        BindDropdownlist();
        ddlCourse.Focus();

    }
}
