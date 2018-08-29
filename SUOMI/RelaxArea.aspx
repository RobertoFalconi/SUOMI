<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RelaxArea.aspx.cs" Inherits="SUOMI.RelaxArea" %>

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
        <script>
            function registration() {
                confirm("Are you sure to register in this service?");
            }
            function deletion() {
                confirm("Are you sure to delete from this service?");
            }
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
            <h1 style="font-family: SkranjiR;">Relax Area</h1>
            <br>
            <h3>Here you can spend some time to have relax: eat, drink or just have a talk with your friends or partner.</h3>
            <br />
            <asp:Label runat="server" Text="Table for 1" CssClass="accordion" />
            <div class="panel">
                <h5>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                <asp:Button ID="Button2" runat="server" Text="Register!" OnClick="Button2_Click" OnClientClick="registration()" CssClass="button" Visible="true" />
                <asp:Button ID="Button3" runat="server" Text="Delete registration!" OnClick="Button3_Click" OnClientClick="deletion()" CssClass="button" Visible="false" />
                <asp:Button ID="Button4" runat="server" Text="Open the store!" OnClick="Button4_Click" CssClass="button" Visible="false" />
                <br />
                --
                    </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Table for 2" CssClass="accordion" />
            <div class="panel">
                <h5>
                <br />
                <br />
                <p>Roberto</p>
                <p>Giulia</p>
                </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Table for 3" CssClass="accordion" />
            <div class="panel">
                <h5>
                <br />
                <br />
                <p>Chiara</p>
                <p>Bini</p>
                <p>Francesco</p>
                </h5>
            </div>
            <br />
            <br />
            <asp:Label runat="server" Text="Table for 4" CssClass="accordion" />
            <div class="panel">
                <h5>
                <br />
                <br />
                <p>Tommaso</p>
                <p>Stefan</p>
                <p>Nicolò</p>
                <p>Roberta</p>
                </h5>
            </div>
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
