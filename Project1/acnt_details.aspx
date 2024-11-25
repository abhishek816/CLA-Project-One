<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acnt_details.aspx.cs" Inherits="Project1.acnt_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            display: flex;
            align-items: center;
            background-color: #4a3f8f;
            padding: 10px 20px;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
            margin-right: auto;
        }
        .navbar .logo .circle {
            width: 40px;
            height: 40px;
            border: 2px solid #00ff99;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #00ff99;
            font-weight: bold;
            margin-right: 10px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
        }
        .navbar a.active {
            color: #00ff99;
        }
        .navbar .search-icon {
            margin-left: 15px;
        }
        .styled-textbox {
    border: 2px solid #4a3f8f;
    border-radius: 5px;      
    padding: 10px;             
    font-size: 16px;        
    width: 100%;              
    box-sizing: border-box;  
        }

            .styled-textbox:focus {
                border-color: #00ff99; 
                outline: none;
                box-shadow: 0 0 5px rgba(0, 255, 153, 0.5);
            }

    .styled-fileupload {
    border: 2px solid #4a3f8f; 
    border-radius: 5px;        
    padding: 10px;            
    font-size: 16px;           
    width: 100%;               
    box-sizing: border-box;    
    background-color: #f0f0f0; 
    color: #333;         
}

.styled-fileupload:hover {
    border-color: #00ff99;    

     .styled-fileupload:focus {
            border-color: #00ff99; 
            outline: none;
            box-shadow: 0 0 5px rgba(0, 255, 153, 0.5); 
        }
    .styled-button {
    background-color: #4a3f8f; 
    color: white;              
    border: none;            
    border-radius: 5px;       
    padding: 10px 20px;        
    font-size: 16px;           
    cursor: pointer;           
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
    transition: background-color 0.3s, box-shadow 0.3s; 
}

.styled-button:hover {
    background-color: #00ff99; 
    box-shadow: 0 4px 8px rgba(0, 255, 153, 0.2); 

}

.styled-button:focus {
    outline: none;            
    box-shadow: 0 0 0 4px rgba(0, 255, 153, 0.3); 
}



    }
         .auto-style2 {
            width: 100%;
        }
         .auto-style3 {
             width: 235px;
         }
         .auto-style4 {
             width: 329px;
         }
         .auto-style5 {
             width: 248px;
         }
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div>
             <div class="navbar">
        <div class="logo">
           <a href="home.aspx"><img src="images/logo.png" alt="#" /></a>
        </div>
        <a href="home.aspx" class="active">Home</a>
       <a href="order_view.aspx">Orders</a>
        <a href="cart.aspx">Cart</a>
        <a href="Login.aspx">Login</a>
        <a href="#" class="search-icon">🔍</a>
        </div>
        </div>
              <table class="auto-style2">
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">Account Details</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">Account Number:</td>
                      <td class="auto-style3">
                          <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;Account&nbsp; Holder:</td>
                      <td class="auto-style3">
                          <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">IFSC Code:</td>
                      <td class="auto-style3">
                          <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">Enter Balance Amount:</td>
                      <td class="auto-style3">
                          <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">
                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Details" />
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">
                          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                      </td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td class="auto-style5">&nbsp;</td>
                      <td class="auto-style4">&nbsp;</td>
                      <td class="auto-style3">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
        <br />
        </div>
    </form>
</body>
</html>
