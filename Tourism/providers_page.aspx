<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="providers_page.aspx.cs" Inherits="tourism.providers_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 116%;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style3 {
            width: 131px;
            height: 31px;
        }
        .auto-style4 {
            height: 31px;
        }
        .auto-style5 {
            width: 131px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
        .auto-style7 {
            margin-left: 0;
        }
        .auto-style8 {
            margin-left: 69;
        }
        .auto-style9 {
            width: 778px;
            height: 844px;
        }
        .auto-style10 {
            width: 131px;
            height: 58px;
        }
        .auto-style11 {
            height: 58px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main" class="auto-style9">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="Large" ForeColor="#000066" />
            <br />
            <table cellpadding="3" cellspacing="3" class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Provider Details"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="lblpname" runat="server" Text="Provider Name"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="pnameTextBox" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pnameTextBox" Display="Dynamic" ErrorMessage="Please enter the Provider Name" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblcnumber" runat="server" Text="Contact Number"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="cnumberTextBox" runat="server" Width="169px" CssClass="auto-style8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cnumberTextBox" Display="Dynamic" ErrorMessage="Please Enter Contact Number" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="cnumberTextBox" Display="Dynamic" ErrorMessage="Please Enter Valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}" Font-Size="X-Large">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="emailTextBox" runat="server" Width="169px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please Enter the Email" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter Valid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="X-Large">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:RadioButton ID="maleRadioButton" runat="server" GroupName="gender" Text="Male" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="femaleRadioButton" runat="server" GroupName="gender" Text="Female" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="Please Select The Gender" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" Font-Size="X-Large">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" Height="32px" Width="82px" />
 
                        &nbsp;&nbsp;
 
                        <asp:Button ID="clearbtn" runat="server" Text="Clear" Height="32px" OnClick="clearbtn_Click" Width="82px" CausesValidation="False" />
                        
                        &nbsp;&nbsp;
                        
                        <asp:Button ID="homebtn" runat="server" Text="Home" CausesValidation="False" Height="32px" OnClick="homebtn_Click" Width="82px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Update" ShowHeader="True" Text="Update" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
    <asp:Label ID="printmessage" runat="server"></asp:Label>

            <br />

        </div>

    </form>
    
    </body>
</html>
