<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="SUOMI.Homepage" %>

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

        <!--
		SMARTPHONE AND DESKTOP MAIN COLUMN
		-->
        <div class="col1">
            <asp:Button ID="btnLogoutDesktop" runat="server" Text="Log out" OnClick="btnLogoutDesktop_Click" class="button" />
        </div>
        <div class="col2">
            <br>


            <h1 style="font-family: SkranjiR;">Services</h1>
            <h3><b>Welcome <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label>!</b><br>
                Your BMI is
                <asp:Label ID="lblBMI" runat="server" Text=""></asp:Label>
                <br />
                Also, your Heart Rate is
                <asp:Label ID="lblHR" runat="server" Text=""></asp:Label>
                <br />
                Because of your height and your weight, we suggest you some specific healthy practices.</h3>
            <asp:ImageButton src="img/area-relax.jpg" ID="ImageButton1" runat="server" Height="200px" Width="400px" border="1" class="image" OnClick="ImageButton1_Click" />
            <br>
            <h3>Relax Area</h3>
            <br>
            <asp:ImageButton src="img/Spa.jpg" ID="ImageButton2" runat="server" Height="200px" Width="400px" border="1" class="image" OnClick="ImageButton2_Click" />
            <br>
            <h3>SPA</h3>
            <asp:ImageButton src="img/are-accessori.jpg" ID="ImageButton3" runat="server" Height="200px" Width="400px" border="1" class="image" OnClick="ImageButton3_Click" />
            <br>
            <h3>Tools</h3>
            <asp:ImageButton src="img/tisane.jpg" ID="ImageButton4" runat="server" Height="200px" Width="400px" border="1" class="image" OnClick="ImageButton4_Click" />
            <br>
            <h3>Tisanes and Infusions</h3>
        </div>

    </body>
</asp:Content>
