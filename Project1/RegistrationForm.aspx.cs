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
using System.Drawing;
using System.IO;

public partial class RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            RegistrationID();
            BindDropdownlist();
        }
    }

    const string TableName = "Register";
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
    public string upload(FileUpload lfile)
    {
        try
        {
             String path = Server.MapPath(".//images1");
             string lran = Guid.NewGuid().ToString().Substring(0, 4);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            String Imagefilename = lran + Path.GetExtension(lfile.FileName).ToString() ;
            if (lfile.HasFile)
            {
                lfile.PostedFile.SaveAs
                    (path + "/" + Imagefilename);
            }

            Bitmap myBitmap = new Bitmap(path + "/" + Imagefilename);

            // Get the color of a pixel within myBitmap.
            Color pixelColor = myBitmap.GetPixel(50, 50);

            string color1 = pixelColor.R.ToString();
            string color2 = pixelColor.G.ToString();
            string color3 = pixelColor.B.ToString();

            string lcolor=color1+color2+color3;
            return lcolor;
        }
        catch(SystemException ex)
        {
            throw ex;
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        
          // string lcolor1=upload(FileUpload1);
          // string lcolor2=upload(FileUpload2);
            //if (lcolor1!=lcolor2)
            //{
            //    lblmsg.Text="Image not matched!!";
            //    return;
            //}
        
        
        
        string pwd = Guid.NewGuid().ToString().Substring(0, 6);
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Insert into " + TableName + "( Center, Department, Course, FirstName, MiddleName, " + 
                                   " LastName, Gender, AadharNo, DateofBirth, Mobile, Landline, EmailId, Adress, City, PinCode," +
                                   " District, Category, Disability, Religion, FatherName, FatherOccupation, MotherName, BankName, " +
                                   " BankAC, BankIFSC,Password,UserName) Values ( @Center, @Department, @Course, @FirstName, @MiddleName, @LastName, " +
                                   " @Gender, @AadharNo, @DateofBirth, @Mobile, @Landline, @EmailId, @Adress, @City, @PinCode," +
                                   " @District, @Category, @Disability, @Religion, @FatherName, @FatherOccupation, @MotherName," +
                                   " @BankName, @BankAC, @BankIFSC,@Password,@UserName )";
            command.Parameters.Clear();
           // command.Parameters.AddWithValue("@RegId", txtRegId.Text);
            command.Parameters.AddWithValue("@Center", ddlCenter.Text);
            command.Parameters.AddWithValue("@Department", ddlDepartment.Text);
            command.Parameters.AddWithValue("@Course", ddlCourse.Text);
            command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            command.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
            command.Parameters.AddWithValue("@LastName", txtLastName.Text);
            command.Parameters.AddWithValue("@Gender", (rdbMale.Checked==true)?'M':'F');
            command.Parameters.AddWithValue("@AadharNo", txtAadharNo.Text);
            command.Parameters.AddWithValue("@DateofBirth", ddlDate.SelectedValue +'/'+ ddlMonth.SelectedValue +'/'+ ddlYear.SelectedValue);
            command.Parameters.AddWithValue("@Mobile", txtMobile.Text);
            command.Parameters.AddWithValue("@Landline", txtLandline.Text);
            command.Parameters.AddWithValue("@EmailId", txtEmailId.Text);
            command.Parameters.AddWithValue("@Adress", txtAddress.Text);
            command.Parameters.AddWithValue("@City", txtCity.Text);
            command.Parameters.AddWithValue("@PinCode", txtPinCode.Text);
            command.Parameters.AddWithValue("@District", txtDistrict.Text);
            command.Parameters.AddWithValue("@Category", (rdbGeneral.Checked==true)?"General":((rdbSC.Checked==true)?"SC":(rdbST.Checked==true)?"ST":"OBC"));
            command.Parameters.AddWithValue("@Disability", (rdbDisabilityYes.Checked==true)?'Y':'N');
            command.Parameters.AddWithValue("@Religion", (rdbHindu.Checked==true)?"Hindu":((rdbChristian.Checked==true)?"Christian":((rdbMuslim.Checked==true)?"Muslim":(rdbSikh.Checked==true)?"Sikh":"Other")));
            command.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
            command.Parameters.AddWithValue("@FatherOccupation", txtFatherOccupation.Text);
            command.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
            command.Parameters.AddWithValue("@BankName", txtBankName.Text);
            command.Parameters.AddWithValue("@BankAC", txtBankAC.Text);
            command.Parameters.AddWithValue("@BankIFSC", txtBankIFSC.Text);
            command.Parameters.AddWithValue("@Password", txtPassword.Text);
            command.Parameters.AddWithValue("@UserName", txtUserName.Text);
            con.Open();
            command.ExecuteNonQuery();


            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            rdbMale.Checked = true;
            txtAadharNo.Text = "";
            txtMobile.Text = "";
            txtLandline.Text = "";
            txtEmailId.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtPinCode.Text = "";
            txtDistrict.Text = "";
            rdbGeneral.Checked = true;
            rdbDisabilityNo.Checked = true;
            rdbOthers.Checked = true;
            txtFatherName.Text = "";
            txtFatherOccupation.Text = "";
            txtMotherName.Text = "";
            txtBankName.Text = "";
            txtBankAC.Text = "";
            txtBankIFSC.Text = "";
            txtFirstName.Focus();
            RegistrationID();
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Registered Successfully!!');", true);
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
    protected void Cancel_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtMiddleName.Text = "";
        txtLastName.Text = "";
        rdbMale.Checked = true;
        txtAadharNo.Text = "";
        txtMobile.Text = "";
        txtLandline.Text = "";
        txtEmailId.Text = "";
        txtAddress.Text = "";
        txtCity.Text = "";
        txtPinCode.Text = "";
        txtDistrict.Text = "";
        rdbGeneral.Checked = true;
        rdbDisabilityNo.Checked = true;
        rdbOthers.Checked = true;
        txtFatherName.Text = "";
        txtFatherOccupation.Text = "";
        txtMotherName.Text = "";
        txtBankName.Text = "";
        txtBankAC.Text = "";
        txtBankIFSC.Text = "";
        txtFirstName.Focus();
        RegistrationID();
    }

    public void RegistrationID()
    {
        int RegId = 0;
        con = new SqlConnection(ConnectionString());
        try
        {
            command.Connection = con;
            command.CommandText = "Select Count(*) from " + TableName ;
            con.Open();
            RegId = Convert.ToInt32(command.ExecuteScalar()) + 1;
            txtRegId.Text = RegId.ToString();
            txtRegId.ReadOnly = true;
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
            ddlCourse.DataValueField = "Course";
            ddlCourse.DataBind();
            con.Close();
            command.CommandText = "Select DeptId, Department, Description from DeptDetails";
            da.SelectCommand = command;
            con.Open();
            da.Fill(ds, "DeptDetails");
            ddlDepartment.DataSource = ds.Tables["DeptDetails"];
            ddlDepartment.DataTextField = "Department";
            ddlDepartment.DataValueField = "Department";
            ddlDepartment.DataBind();
            con.Close();
            command.CommandText = "Select CenterId, Center, Addres from CityCenter";
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

}
