<%@ Page Title="Doctor Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorLogin.aspx.cs" Inherits="DoctorLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-left: 0px; margin-top:30px">
        <br />
       <h1 style="margin-left:40%">Doctor Login</h1>
        <table  align="center" cellpadding="10px" cellspacing="10px">
            <tr>
                <td >
                    <asp:TextBox ID="UserBox" runat="server" Width="290px"  Height="10px" style="margin-left: 0px " CssClass="email-form " placeholder="Username" required/>
                   
                </td>
            </tr>
            <tr>
                <td >
                    <asp:TextBox ID="PassBox" runat="server" Width="290px" Height="10px" TextMode="Password" CssClass="email-form " placeholder="Password" required/>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Log In"  Width="150px" CssClass="roundBtn"/>
             
                    <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" style="margin-left:20px" CssClass="roundBtn"  Width="150px" onclientclick="Button2_Click" />
                </td>
            </tr>
            <tr style="display:none" id="errorMsg" runat="server">
                <td>
                    <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #f44336;"></asp:Label>
                </td>
              
            </tr>
        </table>
    </div>

</asp:Content>

