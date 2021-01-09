<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="RegistrationForm.aspx.cs" Inherits="RegistrationForm" Title="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellspacing="5" cellpadding="3" width="100%">
        <tr>
            <td colspan="4" align="center">
                <h3>
                    TRAINEE ENQUIRY/REGISTRATION FORM</h3>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblmsg" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellspacing="3">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblRegId" Text="Registration ID : "></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtRegId" ReadOnly="true"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblCenter" Text="Center : "></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCenter" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblDepartment" Text="Department : "></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblCourse" Text="Course : "></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCourse" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblName" Text="NAME IN FULL(Block Letters)"></asp:Label></td>
            <td colspan="3">
                <asp:Label runat="server" ID="Label1" Text="First Name"></asp:Label>
                <asp:TextBox runat="server" ID="txtFirstName" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                <asp:Label ID="Label2" runat="server" Text="Middle Name"></asp:Label>
                <asp:TextBox runat="server" ID="txtMiddleName" Text=""></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
                <asp:TextBox runat="server" ID="txtLastName" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="User Name"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblGender" Text="Gender"></asp:Label>&nbsp;
            </td>
            <td colspan="3">
                <asp:RadioButton runat="server" ID="rdbMale" Text="Male" GroupName="Gender" Checked="true" />
                <asp:RadioButton runat="server" ID="rdbFemale" Text="Female" GroupName="Gender" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAadharNo" Text="Aadhar No"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtAadharNo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAadharNo"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblDateofBirth" Text="Date of Birth"></asp:Label></td>
            <td colspan="3">
                <asp:DropDownList ID="ddlDate" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlYear" runat="server">
                    <asp:ListItem>1990</asp:ListItem>
                    <asp:ListItem>1991</asp:ListItem>
                    <asp:ListItem>1992</asp:ListItem>
                    <asp:ListItem>1993</asp:ListItem>
                    <asp:ListItem>1994</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                    <asp:ListItem>1996</asp:ListItem>
                    <asp:ListItem>1997</asp:ListItem>
                    <asp:ListItem>1998</asp:ListItem>
                    <asp:ListItem>1999</asp:ListItem>
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Label runat="server" ID="lblContactNo" Text="Contact No"></asp:Label></td>
            <td colspan="3">
                <asp:Label runat="server" ID="lblMobile" Text="Mobile" Width="60px"></asp:Label>
                <asp:TextBox runat="server" ID="txtMobile"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label runat="server" ID="lblLandline" Text="Landline" Width="60px"></asp:Label> 
                <asp:TextBox runat="server" ID="txtLandline"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblEmailId" Text="Email ID"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtEmailId"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmailId"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAddress" Text="Contact Address"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label runat="server" ID="lblCity" Text="City"></asp:Label></td>
            <td style="width: 35%">
                <asp:TextBox runat="server" ID="txtCity"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td style="width: 20%">
                <asp:Label runat="server" ID="lblPinCode" Text="Pin Code"></asp:Label></td>
            <td style="width: 25%">
                <asp:TextBox runat="server" ID="txtPinCode"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPinCode"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblDistrict" Text="District"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtDistrict"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDistrict"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblCategory" Text="Category"></asp:Label></td>
            <td>
                <asp:RadioButton runat="server" ID="rdbGeneral" Text="General" GroupName="Category"
                    Checked="True" />
                <asp:RadioButton runat="server" ID="rdbSC" Text="SC" GroupName="Category" />
                <asp:RadioButton runat="server" ID="rdbST" Text="ST" GroupName="Category" />
                <asp:RadioButton runat="server" ID="rdbOBC" Text="OBC" GroupName="Category" /></td>
            <td>
                <asp:Label runat="server" ID="lblDisability" Text="Person with Disability"></asp:Label></td>
            <td>
                <asp:RadioButton runat="server" ID="rdbDisabilityYes" GroupName="Disability" Text="Yes" />
                <asp:RadioButton runat="server" ID="rdbDisabilityNo" Text="No" Checked="true" GroupName="Disability" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblReligion" Text="Religion"></asp:Label></td>
            <td colspan="3">
                <asp:RadioButton runat="server" ID="rdbHindu" Text="Hindu" GroupName="Religion" />
                <asp:RadioButton runat="server" ID="rdbMuslim" Text="Muslim" GroupName="Religion" />
                <asp:RadioButton runat="server" ID="rdbChristian" Text="Christian" GroupName="Religion" />
                <asp:RadioButton runat="server" ID="rdbSikh" Text="Sikh" GroupName="Religion" />
                <asp:RadioButton runat="server" ID="rdbOthers" Text="Others" GroupName="Religion"
                    Checked="True" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblFatherName" Text="Father/Husband's Name"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtFatherName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtFatherName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td>
                <asp:Label runat="server" ID="lblMotherName" Text="Mother's Name"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtMotherName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtMotherName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblFatherOccupation" Text="Father/Husband's Occupation"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtFatherOccupation"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFatherOccupation"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblBankName" Text="Bank Name"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox runat="server" ID="txtBankName"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtBankName"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblBankAC" Text="Bank A/C No"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtBankAC"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtBankAC"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td>
                <asp:Label runat="server" ID="lblBankIFSC" Text="Bank IFSC Code"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtBankIFSC"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBankIFSC"
                    ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" ValidationGroup="Submit" /></td>
                
                <td><asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="Cancel" /></td>
            <td >
            </td>
        </tr>
    </table>
</asp:Content>
