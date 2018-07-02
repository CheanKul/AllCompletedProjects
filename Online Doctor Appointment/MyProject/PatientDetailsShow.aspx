<%@ Page Title="MyDetails" Language="C#" MasterPageFile="~/MasterPagePatient.master" AutoEventWireup="true"
    CodeFile="PatientDetailsShow.aspx.cs" Inherits="PatientDetailsShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
    <style type="text/css">
        .style2
        {
            width: 100%;
            font-size: x-large;
            margin-left:20%;
        }
        .style3
        {
            text-align: center;
        }
        .style5
        {
            text-align: left;
        }
        .style6
        {
            text-align: left;
        }
        .style7
        {
            width: 100%;
            margin-bottom:50px;
            margin-left:10px;
        }
        #tab3
        {
            height: 246px;
        }
        .style10
        {
            font-size: x-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <h1 style="margin-left:40%">My Details</h1>
    <div id="tab1" runat="server">
        <table cellspacing="5" class="style2">
            <tr>
                <td class="style6">
                    Name 
                </td>
                <td class="style5">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Address 
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Email ID 
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Phone No 
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Mobile No 
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Bloog Group 
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" CssClass="submit-btn" 
                        onclick="Button3_Click" Text="Change Details" />
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="tab2" runat="server">
        <br />
        <table cellspacing="5" style="margin-left:30%" class="style2" >
            <tr>
                <td width="150px" class="style10">
                    Name 
                </td>
                <td >
                    <asp:TextBox ID="TextBox1" runat="server" Height="10px" Width="240px" CssClass="email-form" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" >
                    Address 
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="10px" Width="240px" CssClass="email-form" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" >
                    Email ID 
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="10px" Width="240px" CssClass="email-form" > </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" >
                    Phone No 
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="10px" Width="240px" CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" >
                    Mobile No 
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="10px" Width="240px" CssClass="email-form" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" >
                    Bloog Group 
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Height="10px" Width="240px" CssClass="email-form"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Width="200px" Text="Save Details" CssClass="roundBtn"/>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div id="tab3" runat="server">
        <table id="table3" align="right" class="style7" runat="server">
            <tr>
                <td style="text-align: center; font-size: x-large">
                                    History 
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                        Width="1315px" onselectedindexchanged="GridView1_SelectedIndexChanged1">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <br />
    </asp:Content>
