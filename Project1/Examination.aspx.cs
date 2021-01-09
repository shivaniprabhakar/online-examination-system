using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient; 

public partial class Examination : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            LoadStudent();
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

    public void LoadStudent()
    {
        String Course = "";
        lblRegId.Text = Request.QueryString["RegId"].ToString();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select * from  Register where RegId="+lblRegId.Text;
            con.Open();
            Dr=command.ExecuteReader();
            if(Dr.Read())
            {
                lblName.Text=Dr["FirstName"].ToString()+", "+ Dr["LastName"].ToString();
                Course = Dr["Course"].ToString();
            }
            LoadQuestions(Course);
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
    
    public void LoadQuestions(String Course)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select EQ.* from ExamQuestions as EQ inner join CourseDetails as CD on CD.CourseId=EQ.CourseId where Course='"+Course+"'";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "ExamQuestions");
            DataList1.DataSource = ds.Tables["ExamQuestions"];
            DataList1.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            command.Dispose();
            ds.Clear();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        Dictionary<int, string> CorrectAnswers = new Dictionary<int, string>();
        Dictionary<int, string> UserAnswers = new Dictionary<int, string>();
        int Count = 0, TotalQuestion=0;
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select * from  ExamQuestions";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "Examination");
            foreach (DataRow DRow in ds.Tables["Examination"].Rows)
            {
                CorrectAnswers.Add(Int32.Parse(DRow["QuestionId"].ToString()), DRow["Answer"].ToString());
            }

            foreach (DataListItem DList in DataList1.Items)
            {
                TotalQuestion++;
                RadioButton OptionA = (RadioButton)DList.FindControl("rdbOptionA");
                RadioButton OptionB = (RadioButton)DList.FindControl("rdbOptionB");
                RadioButton OptionC = (RadioButton)DList.FindControl("rdbOptionC");
                RadioButton OptionD = (RadioButton)DList.FindControl("rdbOptionD");
                HiddenField QuestionId = (HiddenField)DList.FindControl("hfQuestionId");
                UserAnswers.Add(Int32.Parse(QuestionId.Value), (OptionA.Checked == true) ? "A" : ((OptionB.Checked == true) ? "B" : ((OptionC.Checked == true) ? "C" : "D")));
            }

            foreach (KeyValuePair<int, string> UserAnsKeyValue in UserAnswers)
            {
                if (UserAnsKeyValue.Value == CorrectAnswers[UserAnsKeyValue.Key])
                    Count++;
            }
            Response.Redirect("~/Result.aspx?Result=" + Count + "&TotalQuestion=" + TotalQuestion);
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
