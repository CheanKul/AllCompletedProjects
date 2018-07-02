<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
     
         .roundBtnPatient {
        background: #1a62bc;
        color: #fff;
        padding: 10px 0px;
        text-align: center;        
        font-size: 20px;
        border: none;
        width: 30%;
        margin:0 0 0;
        margin-left:50px;
        border-radius: 4px;
    }
    
       .roundBtnDoctor {
        background: #1ABC9C;
        color: #fff;
        padding: 10px 0px;
        text-align: center;        
        font-size: 20px;
        border: none;
        width: 30%;
        border-radius: 4px;
        margin:0 0 0;
        margin-left:20px;
    }
    
     .roundBtnAdmin {
        background: #1a80bc;
        color: #fff;
        padding: 10px 0px;
        text-align: center;        
        font-size: 20px;
        border: none;
        width: 30%;
        border-radius: 4px;
        margin-left:20px;
    }
    
   
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p style="margin-top:100px; margin-bottom:100px" >
        <asp:Button PostBackUrl="~/LogInPage.aspx" runat="server" ID="Button1" CssClass="roundBtnPatient" Text="Patient Login"/>
        
        <asp:Button PostBackUrl="~/DoctorLogin.aspx" runat="server" ID="Button2" CssClass="roundBtnDoctor" Text="Doctor Login"/>
        
         <asp:Button PostBackUrl="~/AdminLogin.aspx" runat="server" ID="Button3" CssClass="roundBtnAdmin" Text="Administrator Login"/>
         </p>
        
</asp:Content>
 