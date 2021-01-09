<%@ Page Language="C#" MasterPageFile="~/ExamMaster.master" AutoEventWireup="true" CodeFile="AdminCRM.aspx.cs" Inherits="AdminCRM" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<td></td>
<td>
    &nbsp; CRM EXAM STATUS</td>
</tr>
<tr>
<td align="right">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="D" runat="server" ControlToValidate="txtSubject"
        ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="lblSubject" Text="Subject:"></asp:Label></td>
<td><asp:TextBox Width="100%" runat="server" ID="txtSubject"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblDescription" Text="Description:"></asp:Label></td>
<td><asp:TextBox Width="100%" runat="server" ID="txtDescription" TextMode="MultiLine"></asp:TextBox></td>
</tr>
    <tr>
        <td align="right">
            <asp:Label ID="Label3" runat="server" Text="Result:"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtCallResult" runat="server" Width="285px"></asp:TextBox></td>
    </tr>
<tr>
<td></td>
<td>
    <asp:Button runat="server" ID="btnSave" ValidationGroup="D" Text="Save" OnClick="btnSave_Click" /><asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" /></td>
</tr>

    <tr>
        <td colspan="2">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4"
                ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("Subject")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CallType">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#Bind("CallType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CallPurpose">
                        <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Text='<%#Bind("CallPurpose")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CallFromTo">
                        <ItemTemplate>
                            <asp:Label ID="Label22" runat="server" Text='<%#Bind("CallFromTo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Related">
                        <ItemTemplate>
                            <asp:Label ID="Label23" runat="server" Text='<%#Bind("Related")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="Label24" runat="server" Text='<%#Bind("Description")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Billable">
                        <ItemTemplate>
                            <asp:Label ID="Label25" runat="server" Text='<%#Bind("Billable")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CallResult">
                        <ItemTemplate>
                            <asp:Label ID="Label27" runat="server" Text='<%#Bind("CallResult")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnEdit" runat="server" CommandArgument='<%#Eval("CrmId") %>'
                                OnCommand="lnkbtnEdit_Command" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandArgument='<%#Eval("CrmId") %>'
                                OnCommand="lnkbtnDelete_Command" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        
         
        </td>
    </tr>
</table>
</asp:Content>

