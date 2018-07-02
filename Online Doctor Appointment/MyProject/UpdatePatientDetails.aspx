<%@ Page Title="Update Details" Language="C#" MasterPageFile="~/MasterPagePatient.master" AutoEventWireup="true" CodeFile="UpdatePatientDetails.aspx.cs" Inherits="UpdatePatientDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: right;
            width: 450px;
            font-size: x-large;
        }
        .style3
        {
            font-size: xx-large;
            margin-left: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p class="style3">
        Update My Details :-
    </p>
    <p>
        &nbsp;</p>
    <table class="style1">
        <tr>
            <td class="style2">
                Name :-</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Address :-</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Email Id :-</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Phone No :-
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Mobile No :-</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Blood Group :-</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Width="190px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Update" />
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
&nbsp; 
</asp:Content>

