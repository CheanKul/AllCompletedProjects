<%@ Page Title="Add Doctor" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddDoctor.aspx.cs" Inherits="AddDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div style="margin-left: 0px; margin-top:30px">
   <br />
       <h1 style="margin-left:40%">Add Doctor</h1>
    <table  style="margin-left:30%" cellpadding="10px" cellspacing="10px">
        <tr>
            <td >
                Doctor Id :-
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" style=" text-align:center; font-size:19px" Text="Label" Height="10px" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                Name :-</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                Address :-</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                Mobile No :-</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                Email ID :-</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                Category :-
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="selectbox-mid">
                </asp:DropDownList>
            <span style="margin-left:20px"> OR </span>
               
            </td>
        </tr>
        <tr>
            <td>
                 New Category :-
            </td>
            <td>
                  <asp:TextBox ID="TextBox5" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                UserName :-</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                Password :-</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" style="font-size: x-large" Height="10px" CssClass="email-form"></asp:TextBox>
            </td>
        </tr>
        <tr>            
        <td></td>
            <td>
                <asp:Button ID="Button1" runat="server"  Text="Add Doctor" width="150px" CssClass="roundBtn"
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr  style="display:none" id="errorMsg" runat="server">
            <td>
                <asp:Label ID="Label2" runat="server" style="font-size: x-large; color: #f44336;"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

