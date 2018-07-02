<%@ Page Title="Doctor Details" Language="C#" MasterPageFile="~/MasterPageDoctor.master" AutoEventWireup="true" CodeFile="ShowDoctorDetails.aspx.cs" Inherits="ShowDoctorDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        #tab3
        {
            height: 269px;
            width: 1311px;
        }
        .style11
        {
            text-align: left;
        }
        .style12
        {
            font-size: x-large;
        }
        .style13
        {
            text-align: left;
            font-size: x-large;
        }
        .style15
        {
            font-size: xx-large;
            margin-left: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        
        <h1>My Details </h1>
    <div id="tab1"  runat="server">
        <table cellspacing="5" style="width: 422px; margin-left:32%;" >
            <tr>
                <td class="style13">
                  <h2>  Name </h2>
                </td>
                <td >
                    <h2><asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label></h2>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <h2>Address </h2>
                </td>
                <td>
                    <h2><asp:Label ID="Label2" runat="server" Text="Label" CssClass="style12"></asp:Label></h2>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <h2>Email ID </h2>
                </td>
                <td>
                  <h2>  <asp:Label ID="Label3" runat="server" Text="Label" CssClass="style12"></asp:Label></h2>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <h2>Mobile No </h2>
                </td>
                <td>
                    <h2><asp:Label ID="Label4" runat="server" Text="Label" CssClass="style12"></asp:Label></h2>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <h2>Speciality </h2>
                </td>
                <td>
                    <h2><asp:Label ID="Label5" runat="server" Text="Label" CssClass="style12"></asp:Label></h2>
                </td>
            </tr>
            <tr>
                <td >

                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-top:20px" Text="Update Details" CssClass="roundBtn" />
                </td>
            </tr>
            </table>
        <br />
    </div>

    <div id="tab2" runat="server">
        <table cellspacing="8px" style="margin-left:30%" cellpadding="5px">
            <tr>
                <td width="180px">
                    <h2>Name </h2>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="8px" Width="290px" CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>Address </h2>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="8px" Width="290px"  CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>Email ID </h2>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="8px" Width="290px"  CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>Mobile No </h2>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="8px" Width="290px"  CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>Speciality </h2>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="320px" style="font-size:14px" CssClass="selectbox-mid">
                    </asp:DropDownList>
                </td>
            </tr>
           
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Save Details" style="margin-top:40px" width="150px" CssClass="roundBtn"/>
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server"  Text="Cancel" style="margin-top:40px" width="150px" CssClass="roundBtn"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

