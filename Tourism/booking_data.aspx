﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking_data.aspx.cs" Inherits="tourism.booking_data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <p>
            <asp:Button ID="homebtn" runat="server" Text="Home" Height="32px" OnClick="submitbtn_Click" Width="82px" />
        </p>
        <p>
    <asp:Label ID="printmessage" runat="server"></asp:Label>
                    </p>
    </form>
</body>
</html>
