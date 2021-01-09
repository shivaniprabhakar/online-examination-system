<%@ Page Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true"
    CodeFile="LoginAdmin.aspx.cs" Inherits="LoginAdmin" Title="Login Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width:100%;" >
    
    <table align="center" cellspacing="5" cellpadding="5">
        <tr><td colspan="2" align="center" style="font-size:large; font-weight:bolder;">Login</td></tr>
        <tr><td colspan="2"><asp:Label runat="server" ID="lblMessage"></asp:Label></td></tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblEmpId" Text="Employee Id"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtEmpId"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblPassword" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>
        
        
    </table></div>
</asp:Content>
