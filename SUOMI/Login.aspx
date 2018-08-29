<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SUOMI.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <title>SUOMI 🐧</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans|Raleway&effect=3d" rel="stylesheet">
        <link rel="stylesheet" href="styles.css" type="text/css">
        <meta charset="utf-8" />
        <script language="javascript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js">
        </script>
        <!--
		FUNCTION: FROM HEADER TO HEADER.SMALLER
		-->
        <script>
            $(function () {
                $(window).scroll(function () {
                    var scroll = $(window).scrollTop();
                    if (scroll >= 100) {
                        $(".header").addClass('smaller');
                        $(".col1").addClass('smaller');
                        $(".col3").addClass('smaller');
                        $(".trigram").addClass('smaller');
                        $(".basketIcon").addClass('smaller');
                        $(".buynow").addClass('smaller');
                    } else {
                        $(".header").removeClass("smaller");
                        $(".col1").removeClass("smaller");
                        $(".col3").removeClass("smaller");
                        $(".trigram").removeClass('smaller');
                        $(".basketIcon").removeClass('smaller');
                        $(".buynow").removeClass('smaller');
                    }
                });
            });
        </script>
    </head>
    <body>
        <!--
		SMARTPHONE HEADER
		-->
        <div class="header">

            <div class="font-effect-3d">
                <h1 id="logo">SUOMI 🐧</h1>
            </div>
        </div>
        <div class="col1">
        </div>
        <div class="col2">
            <h1>Welcome! Please Log In</h1>
            <br />
            <h3>
                <asp:Label ID="lblNickname" runat="server" Text="Nickname:"></asp:Label>
                <br />
                <asp:TextBox ID="txtNickname" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPassword" runat="server" Text="Password:" ></asp:Label>
                <br />
                <asp:TextBox type="password" ID="txtPassword" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" Class="button" OnClick="btnLogin_Click" />
                <br />
                </h3>
                
            
                <br />
                <br />
                <h1>Don't have an account? Create one!</h1>
            <h3>
                <br />
                <asp:Label ID="lblNicknameNew" runat="server" Text="New nickname:"></asp:Label>
                <br />
                <asp:TextBox ID="txtNicknameNew" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblPasswordNew" runat="server" Text="New password:"></asp:Label>
                <br />
                <asp:TextBox type="password" ID="txtPasswordNew" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnLoginNew" runat="server" Text="Register" Class="button" OnClick="btnLoginNew_Click" />
                <br />
                </h3>
                
        </div>
        
    </body>
</asp:Content>
