<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Spa.aspx.cs" Inherits="SUOMI.Spa" %>

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
        <!--
		FUNCTION: ACCORDION
		-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            <asp:Button ID="Button1" runat="server" Text="Go back" OnClick="btnBack_Click" class="button" />
        </div>
        <div class="col2">
            <br>
            <h1 style="font-family: SkranjiR;">Spa</h1>
            <br>
            <h3>Here you can have a bath and follow our suggested journey in the spa.</h3>
            <br />
            <br />
            <br />

            <asp:Label runat="server" Text="Hot Pool" CssClass="accordion" />
            <div class="panel">
                <h5>
                    <br />
                    <br />
                    <p>Salvatore</p>
                    <p>Lorenzo</p>
                    <p>Giuseppe</p>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                    <asp:Button ID="Button2" runat="server" Text="Register!" OnClick="Button2_Click" CssClass="button" Visible="true" />
                    <asp:Button ID="Button3" runat="server" Text="Delete registration!" OnClick="Button3_Click" CssClass="button" Visible="false" />
                    <br />
                    <br />
                    <br />
                    --
                </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Cold Pool" CssClass="accordion" />
            <div class="panel">
                <h5>
                    <br />
                    <br />
                    <p>Federico</p>
                    <p>Simone</p>
                    <p>Gianmarco</p>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br />
                    <asp:Button ID="Button4" runat="server" Text="Register!" OnClick="Button4_Click" CssClass="button" Visible="true" />
                    <asp:Button ID="Button5" runat="server" Text="Delete registration!" OnClick="Button5_Click" CssClass="button" Visible="false" />
                    <br />
                    <br />
                    <br />
                    --
                </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Finnish Sauna" CssClass="accordion" />
            <div class="panel">
                <h5>
                    <br />
                    <br />
                    <p>Antonio</p>
                    <p>Bernardo</p>
                    <p>Francesco</p>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label><br />
                    <asp:Button ID="Button6" runat="server" Text="Register!" OnClick="Button6_Click" CssClass="button" Visible="true" />
                    <asp:Button ID="Button7" runat="server" Text="Delete registration!" OnClick="Button7_Click" CssClass="button" Visible="false" />
                    <br />
                    <br />
                    <br />
                    --
                </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Turkish Bath" CssClass="accordion" />
            <div class="panel">
                <h5>
                    <br />
                    <br />
                <p>Gabriele</p>
                <p>Andrea</p>
                <p>Elisa</p>
                <p>Roberta</p>
                <p>Ion</p>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="Button8" runat="server" Text="Register!" OnClick="Button8_Click" CssClass="button" Visible="true" />
                <asp:Button ID="Button9" runat="server" Text="Delete registration!" OnClick="Button9_Click" CssClass="button" Visible="false" />
                <br />
                <br />
                <br />
                --
            </div>
            </h5>
        </div>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                });
            }
        </script>
    </body>
</asp:Content>
