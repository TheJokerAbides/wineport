<%--
  Created by IntelliJ IDEA.
  User: Joker
  Date: 4/26/2016
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wine Port</title>
    <style>
        body {
            background-image: url("/images/portglass.jpg");
            background-repeat: no-repeat;
            background-position: 80%;
        }

        h1 {
            font: 40px Vivaldi, sans-serif;
        }

        .footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 1rem;
            background-color: #efefef;
            text-align: center;
            font: 20px Vivaldi, sans-serif;
        }

        .header {
            background-color: #efefef;

        }
    </style>

    <link rel="stylesheet" href="/css/winemenu.css">

</head>
<body>


<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '1241356429236139',
            cookie: true,  // enable cookies to allow the server to access
                           // the session
            xfbml: true,  // parse social plugins on this page
            version: 'v2.5' // use graph api version 2.5
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>


<div class="header">
    <h1>The Wine Port</h1>

    <ul>
        <li><a class="active" href="#home">Home</a></li>
        <li><a href="#news">News</a></li>
        <li><a href="#news">My Wine</a></li>
        <li><a href="#news">Reports</a></li>
      <%--  <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">Dropdown</a>
            <div class="dropdown-content" id="myDropdown">
                <a href="#">Link 1</a>
                <a href="#">Link 2</a>
                <a href="#">Link 3</a>
            </div>
        </li>--%>
    </ul>

    <%--$END$--%>
</div>


<center>
    <div style="align-content: center; background-color: #efefef; width: 650px; border-radius: 25px;padding: 20px; background: rgba(0,0,0,0.3)">
        Welcome to the Wine Port. Here you can read reviews, read wine related news and most importantly you can
        catalog, modify and rate your own wine lists!<p></p>
        The Wine Port uses Facebook login solely so you can view your own personalized wine catalog. We will never use
        any information from Facebook nor will we EVER post anything on your wall.
    </div>
</center>

<center>
    <div id="fbLogin" style="padding: 25px">
        Login in here:<br>
        <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
        </fb:login-button>

        <p></p>
        <div id="status">
        </div>

    </div>
</center>


<div class="footer">Developed By <strong>Joker's</strong> Dank Designs</div>

</body>
</html>
