<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" Title="Student Information Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
    <tr>
        <td><asp:Label runat="server" ID="lblCenter" Text="Center "></asp:Label> <asp:DropDownList runat="server" ID="ddlCenter"></asp:DropDownList></td>
        <td><asp:Label runat="server" ID="lblDepartment" Text="Department "></asp:Label> <asp:DropDownList runat="server" ID="ddlDepartment"></asp:DropDownList></td>
        <td><asp:Label runat="server" ID="lblCourse" Text="Course "></asp:Label> <asp:DropDownList runat="server" ID="ddlCourse"></asp:DropDownList></td>
        <td align="left"><asp:Button runat="server" ID="btnRefresh" Text="Refresh" OnClick="btnRefresh_Click" /></td>
    </tr>
</table>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Name"><ItemTemplate>
                <asp:Label runat="server" ID="Label1" Text='<%#Eval("FirstName")+" "+Eval("MiddleName")+" "+Eval("LAstName") %>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Gender"><ItemTemplate>
                <asp:Label runat="server" ID="Label2" Text='<%#Eval("Gender")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Aadhar No"><ItemTemplate>
                <asp:Label runat="server" ID="Label3" Text='<%#Eval("AadharNo")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Birth"><ItemTemplate>
                <asp:Label runat="server" ID="Label4" Text='<%#Eval("DateofBirth")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile"><ItemTemplate>
                <asp:Label runat="server" ID="Label5" Text='<%#Eval("Mobile")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail Id"><ItemTemplate>
                <asp:Label runat="server" ID="Label6" Text='<%#Eval("EmailId")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Address"><ItemTemplate>
                <asp:Label runat="server" ID="Label7" Text='<%#Eval("Adress")+", "+Eval("City")+", "+Eval("District")+"-"+Eval("PinCode")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Category"><ItemTemplate>
                <asp:Label runat="server" ID="Label8" Text='<%#Eval("Category")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Religion"><ItemTemplate>
                <asp:Label runat="server" ID="Label9" Text='<%#Eval("Religion")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Person with Disability"><ItemTemplate>
                <asp:Label runat="server" ID="Label10" Text='<%#Eval("Disability")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            
        </Columns>
    </asp:GridView>

</asp:Content>

