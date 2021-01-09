<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminRegistration.aspx.cs" Inherits="AdminRegistration" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellspacing="5" cellpadding="5" width="100%">
        <tr>
            <td colspan="4" align="center">
                <h1>
                    Admin Registration</h1>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label runat="server" ID="lblError" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label></td>
        </tr>
        
        <tr>
            <td style="width:30%"></td>
            <td style="width:20%" align="left">
                <asp:Label runat="server" ID="lblEmployeeId" Text="Employee Id"></asp:Label><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeId" ErrorMessage="*"
                    ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td style="width:30%">
                <asp:TextBox runat="server" ID="txtEmployeeId"></asp:TextBox></td>
            <td style="width:20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <asp:Label runat="server" ID="lblName" Text="Name"></asp:Label><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="*"
                    ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox runat="server" ID="txtName"></asp:TextBox></td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <asp:Label runat="server" ID="lblPassword" Text="Password"></asp:Label><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*"
                    ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td>
                <asp:TextBox runat="server" ID="txtPassword"></asp:TextBox></td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <asp:Label runat="server" ID="lblConfirmPassword" Text="Confirm Password"></asp:Label><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*"
                    ValidationGroup="Submit"></asp:RequiredFieldValidator></td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtConfirmPassword"></asp:TextBox>
                &nbsp;&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not Match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ValidationGroup="Change"></asp:CompareValidator></td>
        </tr>
        <tr>
        <td></td>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                &nbsp; &nbsp; &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" /></td>
            <td ></td>
        </tr>
    </table>
    <asp:HiddenField ID="hfMyCifNo" runat="server" />
</asp:Content>

