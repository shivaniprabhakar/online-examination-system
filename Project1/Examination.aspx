<%@ Page Language="C#" MasterPageFile="~/ExamMaster.master" AutoEventWireup="true"
    CodeFile="Examination.aspx.cs" Inherits="Examination" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    // set minutes
    var mins = 1;

    // calculate the seconds (don't change this! unless time progresses at a different speed for you...)
    var secs = mins * 60;
    function countdown() {
        //$('#btnSubmit').trigger('click');
       
        setTimeout('Decrement()', 1000);
      
    }
    function Decrement() {
        if (document.getElementById) {
            minutes = document.getElementById("minutes");
            seconds = document.getElementById("seconds");
            // if less than a minute remaining
            if (seconds < 59) {
                seconds.value = secs;
            } else {
                minutes.value = getminutes();
                seconds.value = getseconds();
            }

            secs--;
            if (secs > -1) {
                setTimeout('Decrement()', 1000);
            }
            else {
                alert(1);
                var myButton = document.getElementById("<%= btnSubmit.ClientID %>");
                myButton.click();
            }
        }
    }
    function getminutes() {
        // minutes is seconds divided by 60, rounded down
        mins = Math.floor(secs / 60);
        return mins;
    }
    function getseconds() {
        // take mins remaining (as seconds) away from total seconds remaining
        return secs - Math.round(mins * 60);
    }
</script>

 <script type="text/javascript">
     countdown();
</script>

    <table width="100%">
        <tr>
            <td align="right">
                <table>
                    <tr>
                        <td align="right">
                         Time :
                        </td>
                        <td>
                            <div id="timer">
	                         <input id="minutes" type="text" style="width: 14px; border: none; background-color:none; font-size: 16px; font-weight: bold;"> minutes and <input id="seconds" type="text" style="width: 26px; border: none; background-color:none; font-size: 16px; font-weight: bold;"> seconds.
                            </div>
                            </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Name :
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lblName"></asp:Label></td>
                    </tr>
                    <tr align="left">
                        <td>
                            Reg. ID :
                        </td>
                        <td>
                            <asp:Label runat="server" ID="lblRegId"></asp:Label></td>
        </tr>
    </table>
    </td> </tr>
    <tr>
        <td>
            <h3>
                Questions:</h3>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList runat="server" ID="DataList1" Width="100%">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td rowspan="3" valign="top" style="width: 3%">
                                <asp:Label runat="server" ID="lblQuestionNo" Text='<%#Container.ItemIndex+1 %>'></asp:Label>
                                <asp:HiddenField runat="server" ID="hfQuestionId" Value='<%#Eval("QuestionId") %>' />
                            </td>
                            <td colspan="2">
                                <asp:Label runat="server" ID="lblQuestion" Text='<%#Eval("Question")%>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                <asp:RadioButton runat="server" ID="rdbOptionA" GroupName="Options" Text='<%#Eval("OptionA") %>' /></td>
                            <td style="width: 47%">
                                <asp:RadioButton runat="server" ID="rdbOptionB" GroupName="Options" Text='<%#Eval("OptionB") %>' /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" ID="rdbOptionC" GroupName="Options" Text='<%#Eval("OptionC") %>' /></td>
                            <td>
                                <asp:RadioButton runat="server" ID="rdbOptionD" GroupName="Options" Text='<%#Eval("OptionD") %>' /></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr align="center">
        <td>
            <asp:Button runat="server" Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click" /></td>
    </tr>
    </table>
</asp:Content>
