<%@ Page Title="Search Doctor" Language="C#" MasterPageFile="~/MasterPagePatient.master" AutoEventWireup="true"
    CodeFile="SearchDoctor.aspx.cs" Inherits="SearchDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: right;
        }
        .style3
        {
            text-align: left;
        }
        .style4
        {
            font-size: x-large;
        }
        .style5
        {
            font-size: xx-large;
        }
    </style>
    <script type="text/javascript">


        function checkSelected() {

            var obj1 = document.getElementById("ContentPlaceHolder1_DropDownList1");
            var obj2 = document.getElementById("ContentPlaceHolder1_DropDownList2");
            var obj3 = document.getElementById("ContentPlaceHolder1_TextBox1");
            
            if ((obj1.value.localeCompare("Select") == 0) && (obj2.value.localeCompare("Select") == 0) && (obj3.value.localeCompare("") == 0)) {
                alert("You Have To Select Any...");
                return false;
            }
            return true;
        }
    
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table class="style1">
        <tr>
            <td style="text-align: center" class="style5">
                <h1 style="margin-left:30%">Search Doctor :-</h1>
            </td>
        </tr>
    </table>
    <br />
    <table class="style1">
        <tr>
            <td class="style2">
               <h2>Search Doctor By :-</h2>
            </td>
            <td class="style3">
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <h2>By Specialist</h2>
                        </td>
                        <td class="style4">
                          <h2>  By Location</h2>
                        </td>
                        <td class="style4">
                            <h2>By Name</h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server"  Width="260px" CssClass="selectbox-mid">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server"  Width="260px" CssClass="selectbox-mid">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="260px"  CssClass="selectbox-mid"></asp:TextBox >
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" CssClass="roundBtn" Width="200px" style="margin-top:30px" OnClick="Button1_Click"
                    Text="Search" OnClientClick="return checkSelected()" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <table id="tab1" class="style1" runat="server">
        <tr>
            <td class="style4" style="text-align: center">
               <h2 > Doctor Details :-</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    Width="1272px" style="text-align: center; margin-top:30px;">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <table class="style1">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
