<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="tourism.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server">

                <Columns>
                                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="pay_now" Text="Pay Now" runat="server" CommandArgument='<%# Eval("bookingId") %>' OnClick="pay_now_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
        <p>
                        
                        <asp:Button ID="homebtn" runat="server" Text="Home" CausesValidation="False" Height="32px" OnClick="homebtn_Click" Width="82px" />
        </p>
        <p>
    <asp:Label ID="printmessage" runat="server"></asp:Label>
                    </p>
    </form>
</body>
</html>
