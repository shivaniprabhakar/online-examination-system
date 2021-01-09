<%@ Page Language="C#" MasterPageFile="~/ExamMaster.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<td></td>
<td>
    &nbsp; CRM EXAM STATUS</td>
</tr>
    <tr>
        <td>
        </td>
        <td>
            <script type="text/javascript" src="http://www.skypeassets.com/i/scom/js/skype-uri.js"></script>
<div id="SkypeButton_Call_MohanrajRavi_1">
  <script type="text/javascript">
    Skype.ui({
      "name": "call",
      "element": "SkypeButton_Call_MohanrajRavi_1",
      "participants": ["MohanrajRavi"],
      "imageSize": 32
    });
  </script>
</div>
        </td>
    </tr>
<tr>
<td align="right">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
        ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:Label runat="server" ID="lblSubject" Text="Subject:"></asp:Label></td>
<td><asp:TextBox Width="100%" runat="server" ID="txtSubject"></asp:TextBox></td>
</tr>
<tr>
<td align="right">
    &nbsp;<asp:Label runat="server" ID="lblCallType" Text="Call Type:"></asp:Label></td>
<td><asp:RadioButton runat="server" ID="rdbInbound" Checked="true" Text="Inbound" GroupName="CallType" /> <asp:RadioButton runat="server" ID="rdbOutbound" Text="Outbound" GroupName="CallType" /></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblCallPurpose" Text="Call Purpose:"></asp:Label></td>
<td>
    <asp:TextBox ID="cboCallPurpose" runat="server" Width="100%"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblCallFromTo" Text="Call From/To:"></asp:Label></td>
<td><asp:RadioButton runat="server" ID="rdbContact" Checked="true" Text="Contact" GroupName="CallFrom/To" /> <asp:RadioButton runat="server" ID="rdbLead" Text="Lead" GroupName="CallFrom/To" /></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblRelatedTo" Text="Related To:"></asp:Label></td>
<td>
    <asp:TextBox ID="cboRelatedTo" runat="server" Width="100%"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblDescription" Text="Description:"></asp:Label></td>
<td><asp:TextBox Width="100%" runat="server" ID="txtDescription" TextMode="MultiLine"></asp:TextBox></td>
</tr>
<tr>
<td align="right"><asp:Label runat="server" ID="lblBillable" Text="Billable:"></asp:Label></td>
<td><asp:CheckBox runat="server" ID="chkBillable" Text="Billable" /></td>
</tr>
<tr>
<td></td>
<td>
    <asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" /><asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" /></td>
</tr>
</table>
</asp:Content>

