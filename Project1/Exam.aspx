
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Exam.aspx.cs" Inherits="Exam" Title="Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%" cellpadding="5" cellspacing="3">
        <tr>
            <td>
                <asp:Label runat="server" ID="lblCourse" Text="Course"></asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList runat="server" ID="ddlCourse"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblQuestion" Text="Question"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtQuestion" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblOptionA" Text="Option A :"></asp:Label>  
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtOptionA" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblOptionB" Text="Option B :"></asp:Label>   
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtOptionB" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblOptionC" Text="Option C :"></asp:Label>  
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtOptionC" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblOptionD" Text="Option D :"></asp:Label>  
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtOptionD" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAnswer" Text="Answer"></asp:Label>  
            </td>
            <td colspan="2">
                <asp:TextBox runat="server" ID="txtAnswer"  Columns="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:15%">                
            </td>
            <td align="right" style="width:35%">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
            </td>
            <td style="width:50%">
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="HiddenField1" />
    <asp:GridView runat="server" ID="GridView1" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Course"><ItemTemplate>
                <asp:Label runat="server" ID="Label1" Text='<%#Eval("CourseId")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Question"><ItemTemplate>
                <asp:Label runat="server" ID="Label2" Text='<%#Eval("Question")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Option A"><ItemTemplate>
                <asp:Label runat="server" ID="Label3" Text='<%#Eval("OptionA")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Option B"><ItemTemplate>
                <asp:Label runat="server" ID="Label4" Text='<%#Eval("OptionB")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Option C"><ItemTemplate>
                <asp:Label runat="server" ID="Label5" Text='<%#Eval("OptionC")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Option D"><ItemTemplate>
                <asp:Label runat="server" ID="Label6" Text='<%#Eval("OptionD")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Answer"><ItemTemplate>
                <asp:Label runat="server" ID="Label7" Text='<%#Eval("Answer")%>'></asp:Label>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Edit"><ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkbtnEdit" Text="Edit" CommandArgument='<%#Eval("QuestionId") %>' OnCommand="lnkbtnEdit_Command"></asp:LinkButton>
            </ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Delete"><ItemTemplate>
                <asp:LinkButton runat="server" ID="lnkbtnDelete" Text="Delete" CommandArgument='<%#Eval("QuestionId") %>' OnCommand="lnkbtnDelete_Command"></asp:LinkButton>
            </ItemTemplate></asp:TemplateField>
        </Columns>
    </asp:GridView>    
</asp:Content>