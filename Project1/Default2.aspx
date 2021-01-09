<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                <table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label runat="server" ID="lblMessage" Font-Bold="true" ForeColor="Green" Font-Size="18px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Please view the sample file before uploading<br />
                            <asp:LinkButton runat="server" ID="Sample" Text="Click here to download sample file"
                                OnClick="Sample_Click"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%">
                            <asp:Label runat="server" ID="Label12" Text="Choose a File"></asp:Label>
                        </td>
                        <td style="width: 80%">
                            <asp:FileUpload runat="server" ID="FileUpload1" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                ID="BtnUpload" runat="server" Text="Upload" OnClick="BtnUpload_Click" />
                            <asp:HiddenField runat="server" ID="HiddenField1" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Panel runat="server" ID="Panel1" ScrollBars="Auto">
                                <asp:GridView runat="server" ID="GridView1" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    Width="100%">
                                    <RowStyle BackColor="#EFF3FB" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit" Visible="false" Width="75px"
                                OnClick="btnSubmit_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" ID="btnCancel" Text="Cancel" Width="75px"
                                Visible="false" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
</asp:Content>