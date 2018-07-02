<%@ Page Title="Patient Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogInPage.aspx.cs" Inherits="LogInPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 0px">  
      <br />
       <h1 style="margin-left:40%">Patient Login</h1>
         
        <table style="margin-left:35%" cellpadding="10px" cellspacing="10px">
            <tr>
                <td >
                    <asp:TextBox ID="UserBox" runat="server" Width="290px" Height="10px" style="margin-left: 0px" CssClass="email-form" required placeholder="Username"/>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:TextBox ID="PassBox" runat="server" Width="290px" Height="10px" required  CssClass="email-form" placeholder="Password" TextMode="Password"/>
                </td>
            </tr>
            <tr>
               
                <td >
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Log In" Width="150px"  CssClass="roundBtn" />
                    <asp:Button ID="Button2" runat="server" style="margin-left:20px" Text="Cancel"  Width="150px" onclick="Button2_Click" CssClass="roundBtn"
                        onclientclick="Button2_Click" />
                </td>
            </tr>
            <tr style="display:none" id="errorMsg" runat="server">
                 <td >
                    <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #f44336;"></asp:Label>
                </td>
            </tr>
            <tr>
               <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" style=" text-decoration:none"
                        NavigateUrl="~/RegisterPatient.aspx">Register here</asp:HyperLink>
              
                    <asp:HyperLink ID="HyperLink2" runat="server" style="margin-left:100px; text-decoration:none"
                        NavigateUrl="~/ForgotPasswordPatient.aspx">Forgot Password?</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>

</asp:Content>

