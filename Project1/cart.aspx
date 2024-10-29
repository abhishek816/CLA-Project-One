<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Project1.cart" %>

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
         .auto-style1 {
             text-align: center;
         }
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="navbar">
        <div class="logo">
           <a href="home.aspx"><img src="images/logo.png" alt="#" /></a>
        </div>
        <a href="home.aspx" class="active">Home</a>
       
        <a href="#">Products</a>
        <a href="Login.aspx">Login</a>
        <a href="#" class="search-icon">🔍</a>
        </div>
        </div>
        <br />
        <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cart_id" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:ImageField DataImageUrlField="p_photo" HeaderText="Product Image">
                    <ControlStyle Height="80px" Width="80px" />
                </asp:ImageField>
                <asp:BoundField DataField="p_name" HeaderText="Product Name" />
                <asp:BoundField DataField="p_qty" HeaderText="Quantity" />
                <asp:BoundField DataField="p_price" HeaderText="Total Price" />
            </Columns>
        </asp:GridView>
        </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buy Products" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
