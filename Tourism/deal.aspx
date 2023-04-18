<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deal.aspx.cs" Inherits="tourism.palace" %>

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
        
        .auto-style12 {
            height: 31px;
        }
         #placeNametxt,#providerNametxt, #detailstxt, #durationtxt, #pricetxt {
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
        .auto-style13 {
            height: 31px;
            width: 442px;
        }
        .auto-style14 {
            width: 442px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div id="main"  class="auto-style9">
<asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="Large" ForeColor="#000066" />
            <table cellpadding="3" cellspacing="3" class="auto-style1">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Deals and Packages"></asp:Label>

                    </td>

                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="palceName" runat="server" Text="Place Name"></asp:Label>

                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="placeNametxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="placeNametxt" Display="Dynamic" ErrorMessage="Please enter the place name" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Provider Name"></asp:Label>
                    </td>
                    <td>

                        <asp:TextBox ID="providerNametxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="providerNametxt" Display="Dynamic" ErrorMessage="Please enter the Provider Name" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="image" runat="server" Text="Image"></asp:Label></td><td class="auto-style11">
                        

                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Please select the image" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        

                   </td>

                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label2" runat="server" Text="Details"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="detailstxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="detailstxt" Display="Dynamic" ErrorMessage="Please enter the details" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="Label3" runat="server" Text="Duration"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="durationtxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="durationtxt" Display="Dynamic" ErrorMessage="Please enter the duration" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="pricetxt" runat="server" Width="167px" CssClass="auto-style7" ></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pricetxt" Display="Dynamic" ErrorMessage="Please enter the price" ForeColor="Red" SetFocusOnError="True" Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="pricetxt" Display="Dynamic" ErrorMessage="Please Enter the valid price" Font-Size="X-Large" ForeColor="Red" MaximumValue="10000000" MinimumValue="0" Type="Integer">*</asp:RangeValidator>

                    </td>
                </tr>
    <tr>
        <td class="auto-style14">

        </td>
        <td>
            <asp:Button ID="submitbtn" runat="server" Text="Submit" Height="32px" OnClick="submitbtn_Click" Width="82px" />
        &nbsp;&nbsp;
 
                        <asp:Button ID="clearbtn" runat="server" Text="Clear" Height="32px" OnClick="clearbtn_Click" Width="82px" CausesValidation="False" />
                        
                        &nbsp;&nbsp;
                        
                        <asp:Button ID="homebtn" runat="server" Text="Home" CausesValidation="False" Height="32px" OnClick="homebtn_Click" Width="82px" />
        </td>
    </tr>
                <br />
     
</table>
            <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Update" ShowHeader="True" Text="Update" />
                    <asp:ImageField DataImageUrlField="timage" DataImageUrlFormatString="~/photo/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
    <asp:Label ID="printmessage" runat="server"></asp:Label>
            </div>

    </form>
                    <br />
            </body>
</html>
