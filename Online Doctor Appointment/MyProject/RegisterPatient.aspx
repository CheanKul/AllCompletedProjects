<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterPatient.aspx.cs" Inherits="RegisterPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 1324px;
            height: 359px;
        }
        .style2
        {
            text-align: right;
            width: 382px;
        }
        .style3
        {
            text-align: center;
            width: 314px;
        }
        .style4
        {
            text-align: right;
            width: 382px;
            height: 25px;
        }
        .style5
        {
            text-align: center;
            width: 314px;
            height: 25px;
        }
        .style6
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" 
            Text="User Registration :-"></asp:Label>
        <br />
        <br />
        <table class="style1">
            <tr>
                <td class="style2">
        <asp:Label ID="Label2" runat="server" Text="Name :- "></asp:Label>
                </td>
                <td class="style3">
        <asp:TextBox ID="NameBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="NameBox" ErrorMessage="*" ForeColor="Red">Name Is Must</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label3" runat="server" Text="Address :- "></asp:Label>
                </td>
                <td class="style3">
        <asp:TextBox ID="AddressBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="AddressBox" ErrorMessage="Address Is Must" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label4" runat="server" Text="Email Id :- "></asp:Label>
                </td>
                <td class="style3">
        <asp:TextBox ID="EmailBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="EmailBox" ForeColor="Red">Email ID Is Must</asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="EmailBox" ErrorMessage="Verify Your Email ID" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label5" runat="server" Text="Phone No :- "></asp:Label>
                </td>
                <td class="style3">
        <asp:TextBox ID="PhoneBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Mobile No :-</td>
                <td class="style3">
                    <asp:TextBox ID="MobileBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ForeColor="Red" ControlToValidate="MobileBox">Mobile Number Is Must</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label6" runat="server" Text="Blood Group :- "></asp:Label>
                </td>
                <td class="style3">
        <asp:TextBox ID="BloodBox" runat="server" Width="280px" ForeColor="Black"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="BloodBox" ForeColor="Red">Blood Group Is Must</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label7" runat="server" Text="Username :- "></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="UserBox" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="UserBox" ForeColor="Red">Username Is Must</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Password :-</td>
                <td class="style3">
                    <asp:TextBox ID="PassBox1" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
            ControlToValidate="PassBox1" ForeColor="Red">Password Is Must</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label8" runat="server" Text="Confirm Password :- "></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="PassBox2" runat="server" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ForeColor="Red" ControlToValidate="PassBox2">Confirm Your Password</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassBox1" 
                        ControlToValidate="PassBox2" ForeColor="Red">Wrong Password</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                        Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Reset" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td class="style5">
                    </td>
                <td class="style6">
                    </td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;</div>
   
</asp:Content>

