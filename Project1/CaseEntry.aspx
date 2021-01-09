<%@ Page Language="C#" MasterPageFile="~/InchargeMaster.master" AutoEventWireup="true"
    CodeFile="CaseEntry.aspx.cs" Inherits="CaseEntry" Title="CaseEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <h3>
                    Cash Entry</h3>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblCourse" Text="Student Name"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStudentName"
                    ErrorMessage="*" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtStudentName"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblDescription" Text="Amount"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAmount"
                    ErrorMessage="*" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtAmount"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button runat="server" ID="btnSave" Text=" Save " OnClick="btnSave_Click" ValidationGroup="Save" /></td>
            <td align="right">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" /></td>
        </tr>
    </table>
    &nbsp;
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <br />
    <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" CellPadding="4"
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label1" Text='<%#Bind("StudentName")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label2" Text='<%#Bind("Amount")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkbtnEdit" Text="Edit" CommandArgument='<%#Eval("CashId") %>'
                        OnCommand="lnkbtnEdit_Command"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkbtnDelete" Text="Delete" CommandArgument='<%#Eval("CashId") %>'
                        OnCommand="lnkbtnDelete_Command"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
