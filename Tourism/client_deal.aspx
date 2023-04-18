<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client_deal.aspx.cs" Inherits="tourism.client_deal" %>

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
                            <asp:LinkButton ID="add_to_cart" Text="Add To Cart" runat="server" CommandArgument='<%# Eval("dealId") %>' OnClick="add_to_cart_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="timage" DataImageUrlFormatString="~/photo/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
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
