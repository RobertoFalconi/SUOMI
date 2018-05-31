<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserData.aspx.cs" Inherits="SUOMI.UserData" %>

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
            <form id="form1" enctype="multipart/form-data">
                <h1>User Data</h1>
                <h3>
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblHeight" runat="server" Text="Height"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblWeight" runat="server" Text="Weight"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblHeartRate" runat="server" Text="Heart Rate"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtHeartRate" runat="server"></asp:TextBox>
                    <br />
                    <br />
                </h3>
                <asp:Button ID="btnNext" runat="server" Text="Next" class="button" OnClick="btnNext_Click" />
            </form>
        </div>
    </body>



</asp:Content>
