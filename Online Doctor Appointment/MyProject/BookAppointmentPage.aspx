<%@ Page Title="Book Appointment" Language="C#" MasterPageFile="~/MasterPagePatient.master" AutoEventWireup="true"
    CodeFile="BookAppointmentPage.aspx.cs" Inherits="BookAppointmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div style="margin-left: 0px; margin-top:30px">
   <br />
       <h1 style="margin-left:40%">Book Appointment</h1>
      
    <table style="margin-left:30%" cellspacing="10px" >
        <tr>
            <td width="180px" >
                Appointment No 
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" style=" text-align:center; font-size:19px"  Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                Select Category 
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="selectbox-mid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >
                Select Doctor 
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="selectbox-mid">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >
                Select Date 
            </td>
            <td >
                <asp:TextBox ID="TextBox1" runat="server"  CssClass="email-form" Width="150px" Height="8px"></asp:TextBox>
            
                <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/Images/calendar.png"
                    OnClick="ImageButton1_Click" Width="29px" />
            </td>
        </tr>
       
        <tr>
            <td >
                &nbsp;
            </td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px"
                    NextPrevFormat="FullMonth" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"
                    Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                        Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="submit-btn"  Text="Check"
                    Width="150px" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    <br />
    <div id="calender" runat="server" style="margin-left:30%" >
        <table  style="margin-left:15%" >
            <tr>
                <td colspan="2" style="text-align: center">
                   <h2> Select Time Slots </h2>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="5" >
                        <tr>
                            <td >
                                <asp:Button ID="Button2" runat="server" CssClass="button button1" Text="9:30-10:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button3" runat="server" CssClass="button button1" Text="10:00-10:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button4" runat="server" CssClass="button button1" Text="10:30-11:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button5" runat="server" CssClass="button button1" Text="11:00:11:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button6" runat="server" CssClass="button button1" Text="11:30-12:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Button ID="Button7" runat="server" CssClass="button button1" Text="12:00-12:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button8" runat="server" CssClass="button button1" Text="12:30-1:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button9" runat="server" CssClass="button button1" Text="1:00-1:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button10" runat="server" CssClass="button button1" Text="1:30-2:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button11" runat="server" CssClass="button button1" Text="2:00-2:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Button ID="Button12" runat="server" CssClass="button button1" Text="2:30-3:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button13" runat="server" CssClass="button button1" Text="3:00-3:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button14" runat="server" CssClass="button button1" Text="3:30-4:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button15" runat="server" CssClass="button button1" Text="4:00-4:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button16" runat="server" CssClass="button button1" Text="4:30-5:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Button ID="Button17" runat="server" CssClass="button button1" Text="5:00-5:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button18" runat="server" CssClass="button button1" Text="5:30-6:00" OnClientClick="return myFunction(this.id);"/>
                            </td>
                            <td >
                                <asp:Button ID="Button19" runat="server" CssClass="button button1" Text="6:00-6:30" OnClientClick="return myFunction(this.id);"/>
                            </td>
                            <td >
                                <asp:Button ID="Button20" runat="server" CssClass="button button1" Text="6:30-7:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button21" runat="server" CssClass="button button1" Text="7:00-7:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                &nbsp;
                            </td>
                            <td >
                                <asp:Button ID="Button22" runat="server" CssClass="button button1" Text="7:30-8:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button23" runat="server" CssClass="button button1" Text="8:00-8:30" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                            </td>
                            <td >
                                <asp:Button ID="Button24" runat="server" CssClass="button button1" Text="8:30-9:00" OnClientClick="return myFunction(this.id);">
                                </asp:Button>
                                &nbsp;
                            </td>
                            <td >
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr >
                <td >
                    <asp:HiddenField ID="tmslot" runat="server" Value="Hello" />
                </td>
                <td >
                    <asp:Button ID="Button25" runat="server" Height="40px" OnClientClick="Button25_Click"
                        Text="Book" Width="200px"  CssClass="submit-btn" style="margin-left:395px; margin-top:30px" onclick="Button25_Click1" />
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </div>
     <script type="text/javascript">
         function myFunction(id) {
          
             var btnArray = new Array("ContentPlaceHolder1_Button2", "ContentPlaceHolder1_Button3", "ContentPlaceHolder1_Button4",
           "ContentPlaceHolder1_Button5", "ContentPlaceHolder1_Button6", "ContentPlaceHolder1_Button7", "ContentPlaceHolder1_Button8",
           "ContentPlaceHolder1_Button9", "ContentPlaceHolder1_Button10", "ContentPlaceHolder1_Button11", "ContentPlaceHolder1_Button12",
           "ContentPlaceHolder1_Button13", "ContentPlaceHolder1_Button14", "ContentPlaceHolder1_Button15", "ContentPlaceHolder1_Button16",
           "ContentPlaceHolder1_Button17", "ContentPlaceHolder1_Button18", "ContentPlaceHolder1_Button19", "ContentPlaceHolder1_Button20",
           "ContentPlaceHolder1_Button21", "ContentPlaceHolder1_Button22", "ContentPlaceHolder1_Button23", "ContentPlaceHolder1_Button24");
             var i = 0;
             for (i = 0; i < btnArray.length; i++) {

                 var btn = document.getElementById(btnArray[i]);
              
                 if (btn.className != "aspNetDisabled button button3") {
                     
                     btn.className = "button button1";
                 }
             }
             var x = document.getElementById(id);
             var name = x.getAttribute("name");
             var x1 = document.getElementById("ContentPlaceHolder1_tmslot");
             var str = name.split("Button");
             x1.value = str[1];
             x.className = "button buttonSelected";
             //alert(x1.value);
             return false;

         }        
    </script>
</asp:Content>
