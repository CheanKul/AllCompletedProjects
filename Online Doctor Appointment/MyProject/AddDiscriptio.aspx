<%@ Page Title="Add Descripion" Language="C#" MasterPageFile="~/MasterPageDoctor.master" AutoEventWireup="true"
    CodeFile="AddDiscriptio.aspx.cs" Inherits="AddDiscriptio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            width: 493px;
            font-size: x-large;
        }
        .style4
        {
            width: 198px;
        }
        .style5
        {
            text-align: right;
            width: 585px;
        }
        .style6
        {
            text-align: right;
            font-size: x-large;
            width: 585px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" style="text-align: center">
                Add Discription :-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table class="style1">
        <tr>
            <td class="style3" style="text-align: right">
                Appointment Id :-
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server" Height="39px" Width="186px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="button1" OnClick="Button1_Click"
                    Text="Button" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div id="tab2" runat="server">
        <table class="style1" id="table">
            <tr>
                <td class="style5">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Name :-
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label1" runat="server" Style="font-size: x-large"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Treatment :-
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Style="font-size: x-large"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Note :-
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Style="font-size: x-large"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;
                </td>
                <td>
                    <br />
                    <asp:Button ID="Button2" runat="server" CssClass="button1" OnClick="Button2_Click"
                        Text="Button" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="text-align: center">
        <asp:Label ID="Label2" runat="server" Style="font-size: x-large"></asp:Label>
    </div>
</asp:Content>
