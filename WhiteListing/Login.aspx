<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WhiteListing.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>White Listing Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f3f6fc;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-card {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            width: 380px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #1d4e89;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #555;
            font-size: 14px;
            margin-bottom: 30px;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
        }

        .error-label {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>



    
     <div id="pageHeader" style="background: linear-gradient(45deg, rgb(2, 62, 138), rgb(0, 119, 182)); color:white; padding:30px 0; display:flex; align-items:center; justify-content:space-between; font-family:Arial, sans-serif;">

    <div class="container-fluid">
        <div class="row text-center align-items-center">

            <!-- CM -->
            <div class="col-md-2 col-6 mb-3 order-1 order-md-1">
                <div class="d-flex flex-column align-items-center">
                    <img src="Images/chief_minister_of_karrnataka_icon (1).png" alt="CM" width="80" height="80"
                        class="rounded-circle bg-white p-1" />
                    <div class="fw-bold text-white mt-2" data-i18n="Status.CM_NAME">Sri Siddaramaiah</div>
                    <div class="badge bg-secondary mt-1" data-i18n="Status.CM_T">Hon'ble CM</div>
                </div>
            </div>

            <!-- DCM -->
            <div class="col-md-2 col-6 mb-3 order-2 order-md-5">
                <div class="d-flex flex-column align-items-center">
                    <div style="background-color: white; border-radius: 50%; width: 85px; height: 85px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                        <img src="Images/DeputyCM (1).jpeg" alt="DCM"
                            style="width: 100%; height: 100%; object-fit: cover;" />
                    </div>
                    <div class="fw-bold text-white mt-2" data-i18n="Status.dCM_NAME">Sri DK. Shivakumar</div>
                    <div class="badge bg-secondary mt-1" data-i18n="Status.dCM_T">Hon'ble Deputy Chief Minister</div>
                </div>
            </div>


            <!-- GOK -->
            <div class="col-md-2 col-6 mb-3 order-3 order-md-2">
                <div class="d-flex flex-column align-items-center">
                    <div style="background-color: white; border-radius: 50%; width: 85px; height: 85px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                        <img src="Images/gok (1).png" alt="GOK"
                            style="width: 100%; height: 100%; object-fit: cover;" />
                    </div>
                    <div class="fw-bold text-white mt-2 text-center" data-i18n="Status.GOK" style="width: 100px;">Government of Karnataka</div>
                </div>
            </div>

            <!-- BBMP -->
            <div class="col-md-2 col-6 mb-3 order-4 order-md-4">
                <div class="d-flex flex-column align-items-center">
                    <div style="background-color: white; border-radius: 50%; width: 85px; height: 85px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                        <img src="Images/bbmp (2).png" alt="BBMP"
                            style="width: 100%; height: 100%; object-fit: cover;" />
                    </div>
                    <div class="fw-bold text-white mt-2 text-center" data-i18n="Status.CC" style="width: 100px;">City Corporation</div>
                </div>
            </div>




            <!-- Heading -->
            <div class="col-md-4 col-12 mb-3 order-5 order-md-3">
                <hr class="border-light d-block d-md-none" />
                <h2 class="text-white">ಬೆಂಗಳೂರು ನಗರ ಪಾಲಿಕೆಗಳು</h2>
                <br />
                <center>
                    <h6 data-i18n="Status.allcorp">South | North | East | West | Central</h6>
                </center>
            </div>

        </div>
    </div>
</div>








    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-card">
                <h2>White Listing Login</h2>
                <div class="subtitle">Enter your credentials to continue</div>

                <label>Username</label>
                <asp:TextBox ID="txtUser" runat="server" placeholder="Enter username" />

                <label>Password</label>
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Enter password" />

                <asp:Button ID="btnLogin" runat="server"
                    Text="Login"
                    CssClass="btn btn-primary"
                    OnClick="btnLogin_Click" />

                <asp:Label ID="lblMsg" runat="server" CssClass="error-label" />
            </div>
        </div>
    </form>







    <footer style="background-color:#f1f1f1; padding:20px; text-align:center; margin-top:40px; margin-bottom:0px">
                    <p>&copy; Designed & Developed by City Corporations © 2026 ಬೆಂಗಳೂರು ನಗರ ಪಾಲಿಕೆಗಳು. All rights reserved.</p>
                </footer>
</body>
</html>
