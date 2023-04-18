<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="tourism.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <%--<link href="css/login_and_signup.css" rel="stylesheet" />--%>
  <style>
    /*
form .form-field-1:nth-child(1)::before {
  background-image: url(img/user-icon.png);
  width: 20px;
  height: 20px;
  top: 15px;
}
form .form-field-1:nth-child(2)::before {
  background-image: url(img/lock-icon.png);
  width: 16px;
  height: 16px;
}*/

    
#a::before {
  background-image: url(img/user-icon.png);
  width: 20px;
  height: 20px;
  top: 15px;
}
#b::before {
  background-image: url(img/lock-icon.png);
  width: 16px;
  height: 16px;
}
  
#bg {
    background-image: url('img/background.jpg');
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
    filter: blur(5px);
}

body {
    font-family: 'Lato', sans-serif;
    color: #4A4A4A;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    overflow: hidden;
    margin: 0;
    padding: 0;
}

form {
    width: 350px;
    position: relative;
}

    form .form-field-1::before {
        font-size: 20px;
        position: absolute;
        left: 15px;
        top: 17px;
        color: #888888;
        content: " ";
        display: block;
        background-size: cover;
        background-repeat: no-repeat;
    }
    /* form .form-field:nth-child(1)::before {
  background-image: url(img/user-icon.png);
  width: 20px;
  height: 20px;
  top: 15px;
}
form .form-field:nth-child(2)::before {
  background-image: url(img/lock-icon.png);
  width: 16px;
  height: 16px;
}

form .form-field:nth-child(3)::before {
  background-image: url(img/lock-icon.png);
  width: 16px;
  height: 16px;
}

form .form-field:nth-child(4)::before {
  background-image: url(img/phone.jpg);
  width: 20px;
  height: 20px;
  top: 15px;
} */

    form .form-field-1 {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin-bottom: 1rem;
        position: relative;
    }

    form input {
        font-family: inherit;
        width: 100%;
        outline: none;
        background-color: #fff;
        border-radius: 4px;
        border: none;
        display: block;
        padding: 0.9rem 0.7rem;
        box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
        font-size: 17px;
        color: #4A4A4A;
        text-indent: 40px;
    }

    form .btn {
        outline: none;
        border: none;
        cursor: pointer;
        display: inline-block;
        margin: 0 auto;
        padding: 0.9rem 2.5rem;
        text-align: center;
        background-color: #47AB11;
        color: #fff;
        border-radius: 4px;
        box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
        font-size: 17px;
        
    }

      .auto-style1 {
          width: 349px;
      }

  </style>
   
</head>
<body>
    <div id="bg"></div>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="3" cellspacing="3" class="auto-style1">
                <tr>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Size="Large" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                <td>
                    <div class="form-field-1" id="a" >
                 <asp:TextBox placeholder="Email / Username" runat="server" ID="unametxt" Width="330px"></asp:TextBox>
                 
                 <%-- <input type="email" placeholder="Email / Username" required/>--%>
                    
            </div>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="unametxt" Font-Size="XX-Large" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Please Enter the UserName">*</asp:RequiredFieldValidator>
                </td>
                    </tr>


                <tr>
                    
                        <td>
  <div class="form-field-1" id="b">
      <asp:TextBox ID="passwordtxt"  type="password" placeholder="Password" runat="server"></asp:TextBox>
      <%-- <input type="password" placeholder="Password" required/>                         --%>

  </div>
                   </td> 
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordtxt" Font-Size="XX-Large" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Please Enter the Password">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                        
                  
           <tr>
               
               <td>
  <div class="form-field-1">
      <%--<button class="btn" type="submit">Log in</button>--%>
      <asp:Button class="btn"  ID="btnsubmit"  runat="server" Text="Login" OnClick="Button1_Click" />
  </div>
                   </td>
                
           </tr>
  </table>
        </div>
    </form>
</body>
</html>
