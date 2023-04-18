<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client_payment.aspx.cs" Inherits="tourism.client_payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="css/StyleSheet1.css" rel="stylesheet" />

    <style>
        .auto-style9 {
            width: 778px;
            height: 930px;
        }
        
        .auto-style11 {
            width: 482px;
        }
        
         #nametxt,#paymenttxt, #cvvtxt, #dnumbertxt,#validdatetxt {
    width: 100%;
    padding: 5px 10px;
    margin: 8px 0;
    box-sizing: border-box;
    background-color: #7ab8e6;
    border: 10px solid;
    box-shadow: 5px 5px 5px #888888;
    border-radius: 25px;
    font-family: Trebuchet MS;
    border: 1px solid #CCC;
    margin-bottom: 5px;
}
        .auto-style15 {
            width: 177px;
        }
        .auto-style16 {
            width: 177px;
            height: 58px;
        }
        .auto-style17 {
            width: 482px;
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
                        <asp:Label ID="Label1" runat="server" Text="Payment"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        <asp:Label ID="lblpname" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="auto-style17">
                        <asp:TextBox ID="nametxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nametxt" Display="Dynamic" ErrorMessage="Please enter the Name" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblcnumber0" runat="server" Text="payment" Enabled="False"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="paymenttxt" runat="server" Width="169px" CssClass="auto-style8" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblcnumber" runat="server" Text="Debit card Number"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dnumbertxt" runat="server" Width="169px" CssClass="auto-style8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dnumbertxt" Display="Dynamic" ErrorMessage="Please Enter Debit Card Number" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="dnumbertxt" Display="Dynamic" Font-Size="X-Large" ForeColor="Red" ValidationExpression="[0-9]{16}" ErrorMessage="Please Enter the valid Debit Card number">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblemail" runat="server" Text="CVV"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="cvvtxt" runat="server" Width="169px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cvvtxt" Display="Dynamic" ErrorMessage="Please Enter the cvv" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cvvtxt" Display="Dynamic" Font-Size="X-Large" ForeColor="Red" ValidationExpression="[0-9]{3}" ErrorMessage="Please Enter the valid CVV number">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="lblemail0" runat="server" Text="Valid Up to"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="validdatetxt" runat="server" Width="169px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="validdatetxt" Display="Dynamic" ErrorMessage="Please Enter the Date" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td>
                        <asp:Button ID="payButton" runat="server" Text="Pay Now"  Height="32px" Width="82px" OnClick="payButton_Click" />
 
                        &nbsp;&nbsp;
 
                        <asp:Button ID="clearbtn" runat="server" Text="Clear" Height="32px" OnClick="clearbtn_Click" Width="82px" CausesValidation="False" />
                        
                        &nbsp;&nbsp;
                        
                        <asp:Button ID="homebtn" runat="server" Text="Home" CausesValidation="False" Height="32px" OnClick="homebtn_Click" Width="82px" />
                    </td>
                </tr>
            </table>
            <br />
    <asp:Label ID="printmessage" runat="server"></asp:Label>

            <br />

        </div>

    </form>

</body>
</html>
