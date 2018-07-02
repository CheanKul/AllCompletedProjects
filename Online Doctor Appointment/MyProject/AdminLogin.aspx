<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-left: 0px; margin-top:30px">
   <br />
       <h1 style="margin-left:40%">Admin Login</h1>
    <table  style="margin-left:35%" cellpadding="10px" cellspacing="10px">
       
        <tr>
           
            <td >
                <asp:TextBox ID="TextBox1" runat="server"  Width="290px" Height="10px"  CssClass="email-form" placeholder="Username" required></asp:TextBox>
            </td>
        </tr>
        <tr>
          
            <td >
                <asp:TextBox ID="TextBox2" runat="server" Width="290px" Height="10px" CssClass="email-form" placeholder="Password" TextMode="Password" required></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td >
                <asp:Button ID="Button1" runat="server" CssClass="roundBtn" 
                    onclick="Button1_Click" Text="LogIn" Width="150px" />
           
                <asp:Button ID="Button2" runat="server" style="margin-left:20px" CssClass="roundBtn" Text="Cancel" 
                    Width="150px" />
            </td>
        </tr>
        <tr style="display:none" id="errorMsg" runat="server">            
            <td >
                <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #f44336;"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

