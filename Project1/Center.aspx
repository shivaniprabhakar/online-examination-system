<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Center.aspx.cs" Inherits="Center" Title="Center" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <h3>
                    Center</h3>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblCityCenter" Text="City Center"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCityCenter"
                    ErrorMessage="*" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtCityCenter"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAddress" Text="Address"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="*" ValidationGroup="Save"></asp:RequiredFieldValidator></td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtAddress"></asp:TextBox></td>
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
            <asp:TemplateField HeaderText="City Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("Center")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label2" Text='<%#Bind("Addres")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkbtnEdit" Text="Edit" CommandArgument='<%#Eval("CenterId") %>'
                        OnCommand="lnkbtnEdit_Command"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lnkbtnDelete" Text="Delete" CommandArgument='<%#Eval("CenterId") %>'
                        OnCommand="lnkbtnDelete_Command"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
