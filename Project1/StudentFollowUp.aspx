<%@ Page Language="C#" MasterPageFile="~/ExamMaster.master" AutoEventWireup="true" CodeFile="StudentFollowUp.aspx.cs" Inherits="StudentFollowUp" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<td></td>
<td>
    &nbsp; Employee Status</td>
</tr>
<tr>
<td align="right">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStudentName"
        ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="lblSubject" Text="StudentName"></asp:Label></td>
<td><asp:TextBox Width="157%" runat="server" ID="txtStudentName"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblCallPurpose" Text="Employement"></asp:Label></td>
<td>
    <asp:TextBox ID="txtEmployement" runat="server" Width="100%" TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblRelatedTo" Text="Salary"></asp:Label></td>
<td>
    <asp:TextBox ID="txtSalary" runat="server" Width="100%"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblDescription" Text="Designation"></asp:Label></td>
<td><asp:TextBox Width="100%" runat="server" ID="txtDesignation"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblBillable" Text="WorkingArea"></asp:Label></td>
<td>
    <asp:TextBox ID="txtWorkingArea" runat="server" Width="100%"></asp:TextBox></td>
</tr>
<tr>
<td></td>
<td>
    <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" /><asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" /></td>
</tr>
</table>
</asp:Content>

