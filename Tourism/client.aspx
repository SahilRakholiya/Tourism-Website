<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="tourism.client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <link href="css/navbar.css" rel="stylesheet" />
    <style>
        #uname{
        float: left;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
        margin-left: 280px;
        }
        
#i1,#i2,#i3,#i4{
    display: block;
    margin-left: auto;
    margin-right: auto;
}

#h1, #h4 {
    margin-left: auto;
    margin-right: auto;
    width: 50%;
}

 
    </style>

</head>
<body>
<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="client_deal.aspx">Deals & Package</a>
      <a href="cart.aspx">Cart</a>
          <a href="order.aspx">Trip</a>
      <a href="booking_data.aspx">Contact Us</a>
  <a href="booking_data.aspx">About</a>
     <a href="logout.aspx" id="logout" >Logout</a>

    <asp:Label ID="uname" runat="server" Font-Size="Medium" ForeColor="White"></asp:Label>
<%--  <a href="signup.aspx" id="signup" style="margin-left: 441px;">Signup</a>--%>

</div>

<div style="padding-left:16px">
<h2>Welcome To our WebSites </h2>
  <p>"Jobs fill your pockets, adventures fill your soul."</p>
  <figure>
    <img id="i4" src="img/Eiffel Tower.jpg" style="width:50%;height: 400px;">

   <!-- <figcaption> Effil tower</figcaption> -->
 <h1 id="h1" ><b> Eiffel Tower Tour Photo</b></h1><br>
<h4 id="h4" style="font-weight: lighter;">The Eiffel Tower is undoubtedly one of the most popular tourist destinations in the world. And, if you're lucky enough to have visited Paris, then you know just how magical it is!</h4>  
<br>
  </figure>
  <figure>
    <img id="i1" src="img/Switzerland.jpg" style="width:50%;height: 400px;">
    <h1 id="h1"><b>Switzerland :    Charming Tri-Border City - Basel</b></h1><br>
   <h4 id="h4" style="font-weight: lighter;">Arriving in the third largest city in Switzerland on Sunday wasn’t stressful, since major arteries into the city were half empty and the navigation quickly located a car park by the Rhine despite a few road blocks. Parking is generally free on Sundays and during the night, but we planned on staying in the city for a couple of days. That’s why we couldn’t use white parking zones where free parking is limited to three hours maximum. </h4>
    <br>
</figure>
  <figure>
    <img id="i2" src="img/Taj Mahal Agra.jpg" style="width:50%;height: 400px;">
   <h1 id="h1" ><b>Taj Mahal</b></h1><br>
    <h4 id="h4"  style="font-weight: lighter;">Considered as one of the most beautiful buildings in the world, the Taj Mahal in Agra is a landmark like no other. Built to immortalise the undying love of a man for his wife, it is an iconic symbol of love and India’s most recognised monument. If you love architecture and travel photography, then chances are that you have either already been there or are dying to go.    </h4>
   <br>
  </figure>

  <figure>
    <img id="i3"  src="img/Dwarka.jpg" style="width:50%;height: 400px;">

    
    <h1 id="h1"><b>Dwarka </b></h1><br>
    <h4 id="h4" style="font-weight: lighter;">The city of Krishna, a land of ancient temples and beautiful beaches, Dwarka will charm you with all that it has to offer. Considered one of the four sacred cities (char dham) in Hindu mythology, Dwarka is steeped in spirituality and history. Its historical significance is highlighted by the fact that it has been chosen as one of the 12 cities of cultural significance to be developed by ASI under it heritage development scheme</h4><br>
    <br>
</figure>
</div>
</body>
</html>
