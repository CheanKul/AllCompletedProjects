<%@ Page Title="Cancel Booking" Language="C#" MasterPageFile="~/MasterPagePatient.master" AutoEventWireup="true" CodeFile="CancelBooking.aspx.cs" Inherits="CancelBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        font-size: xx-large;
    }
    .style3
    {
        text-align: center;
    }
    .style4
    {
        text-align: right;
        font-size: x-large;
        width: 621px;
    }
</style>
<script type="text/javascript">

    function checking() {
        var obj = document.getElementById("ContentPlaceHolder1_TextBox1");
        alert(obj.value);
        if(obj.value.localeCompare("abc")==0)
        {
        alert("Select Any");
        return false;
        }
        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
    <br />
    <table class="style1">
        <tr>
            <td style="text-align: center">
                <h1 style="margin-left:30%">Cancel Booking :-</h1>
            </td>
        </tr>
    </table>
</p>
<br />
<table class="style1" cellspacing="10px">
    <tr>
        <td class="style4">
            Enter Booking Id :-</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="email-form" Height="10px" Width="120px" required ></asp:TextBox>
        </td>
    </tr>
   
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" CssClass="roundBtn" Width="150px" style="margin-top:20px"
                onclick="Button1_Click" Text="Submit"  OnClientClick="return checking()"/>
        </td>
    </tr>
   
    <tr>
        <td class="style3" colspan="2">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

