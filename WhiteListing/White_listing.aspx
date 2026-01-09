<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="White_listing.aspx.cs" Inherits="WhiteListing.White_listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>White Listing</title>
    <style>
       
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 30px;
            max-width: 1000px;
            margin: 40px auto;
        }

        .card h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: 600;
            font-size: 1.6rem;
        }

        .form-section {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            color: #444;
            min-width: 130px;
        }

        select, input[type="text"] {
            flex: 1;
            min-width: 200px;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        select:focus, input:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
        }

        /* Gradient buttons (only inside card) */
        .card .btn {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.2s;
        }

        .card .btn:hover {
            background: linear-gradient(135deg, #0056b3, #003f88);
            transform: translateY(-1px);
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 10px 12px;
            text-align: center;
            font-size: 14px;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #f0f2f5;
            font-weight: 600;
            color: #333;
        }

        tbody tr:nth-child(even) {
            background-color: #fafafa;
        }

        #btnSave {
            display: block;
            margin: 25px auto 0 auto;
            font-size: 15px;
        }

        .hidden {
            display: none;
        }

        #txtMobile {
            width: 305px !important;     
            min-width: 120px !important;
            flex: 0 0 auto !important;   
        }

        #btnAddOfficer {
            margin-left: 150px;
        }


        /* Field container and alignment */
.form-section.officer-row {
    display: flex;
    gap: 20px;        
    flex-wrap: wrap;
}

/* Each field container wider (~50% of row) */
.form-section.officer-row > div {
    flex: 0 0 45%;   /* roughly half of the row */
    display: flex;
    align-items: center;
    gap: 20px;        /* space between label and input/select */
}

/* Label styling */
.form-section.officer-row > div > label {
    width: 100px;       /* slightly wider label */
    margin-bottom: 0;
    text-align: left;
}

/* Input/select styling */
.form-section.officer-row > div > select,
.form-section.officer-row > div > input {
              /* fills remaining space in its container */
    height: 35px;
    padding: 5px 10px;
    border-radius: 0;
    border: 1px solid #ccc;
    box-sizing: border-box;
    min-width:319px
}

/* Hidden class */
.hidden {
    display: none !important;
}


        @media (max-width: 768px) {
            .form-section {
                flex-direction: column;
                align-items: flex-start;
            }
        }



    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Content/Style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="apiToken" />
       <%-- <asp:HiddenField ID="hdnCby" runat="server" Value="<%= Session["Cby"] %>" />--%>



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


        <nav class="navbar navbar-expand-lg navbar-dark button_color sticky-top" id="navbarDiv">
    <div class="container-fluid">

        <!-- Navbar Toggle Button for Mobile -->
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
            aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>&nbsp;&nbsp;City Corporation
      <img src="Images/bbmp%20(2).png" width="40" height="40" style="margin-left: 60px;" />
        </button>

        <!-- Navbar Menu -->

        <div class="collapse navbar-collapse" id="navbarMenu">
            <!-- Left Side Items -->
            <%--<ul class="navbar-nav me-auto text-light">
              
                <li class="nav-item">
                    <a href="Application_Count.aspx" data-i18n="Status.ApplicationCount" class="nav-link text-white " role="button" aria-expanded="false">
                       Corporation wise Application Count
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Home.aspx" data-i18n="Status.ApplicationDetail" class="nav-link text-white" role="button" aria-expanded="false">
                        Application Detailed Status
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Payment_Report.aspx"  data-i18n="Status.ApplicationPayment" class="nav-link text-white" role="button" aria-expanded="false">
                       Payment Report
                    </a>
                </li>
                <li class="nav-item">
                    <a href="Status.aspx" data-i18n="Status.ApplicationStatus" class="nav-link text-white" role="button" aria-expanded="false">
                        Application Status
                    </a>
                </li>

                <li class="nav-item">
                    <a href="javascript:void(0)" <%--data-i18n="Status.ApplicationStatus" class="nav-link text-white" role="button" aria-expanded="false">
                        White Listing
                    </a>
                </li>
            </ul>--%>
            
            

            <div class="d-flex ms-auto">

                <button type="button" class="btn btn-light me-2" onclick="confirmLogout()">Logout</button>

                        <script>
                            function confirmLogout() {
                                Swal.fire({
                                    title: "Are you sure?",
                                    text: "Do you really want to logout?",
                                    icon: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: "#3085d6",
                                    cancelButtonColor: "#d33",
                                    confirmButtonText: "Yes, logout",
                                    cancelButtonText: "Cancel"
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = 'Logout.aspx';
                                    }
                                });
                            }
                        </script>


                        <button type="button" class="btn btn-sm btn-light me-2" onclick="loadLanguage('english')" hidden="hidden">English</button>
                        <button type="button" class="btn btn-sm btn-light" onclick="loadLanguage('kannada')" hidden="hidden">ಕನ್ನಡ</button>
                    </div>
        </div>
        
    </div>
</nav>




        <div class="card"  style="background-color: #e9ecef; padding: 20px; border-radius: 8px;">
            <h2>Officer Login (White Listing)</h2>

           




            <div class="mobile-section" style="margin-bottom: 15px; width: 100%; display: flex; align-items: center; gap: 10px;">
    <!-- Label -->
                <label for="txtMobile" style="font-weight: bold; min-width: 180px;">Search officer by Mobile No:</label>

                <!-- Input -->
                <input type="text" id="txtMobile" placeholder="Enter Mobile No" maxlength="10"
                       oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);"
                       style="flex: 1; padding: 8px 12px; height: 38px; border: 1px solid #ccc; border-radius: 4px;"/>

                <!-- Search Button -->
                <button type="button" id="btngetmobile" 
                        style="padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">
                    Search
                </button>
            </div>










            

           <div class="form-section officer-row">
    <!-- Level -->
    <div>
        <label for="ddlLevel">Jurisdiction:</label>
        <select id="ddlLevel">
            <option value="">Select Jurisdiction</option>
            <option value="corp">Corporation</option>
            <option value="zone">Zone</option>
            <option value="ward">Ward</option>
        </select>
    </div>

    <!-- Corporation -->
    <div id="corpSection" class="hidden">
        <label for="ddlCorporation">Corporation:</label>
        <select id="ddlCorporation">
            <option value="">Select Corporation</option>
        </select>
    </div>

    <!-- Zone -->
    <div id="zoneSection" class="hidden">
        <label for="ddlZone">Zone:</label>
        <select id="ddlZone">
            <option value="">Select Zone</option>
        </select>
    </div>

    <!-- Ward -->
    <div id="wardSection" class="hidden">
        <label for="ddlWard">Ward:</label>
        <select id="ddlWard">
            <option value="">Select Ward</option>
        </select>
    </div>
</div>





            <div class="form-section officer-row">
                <label for="txtName">Officer Name:</label>
                <input type="text" id="txtName" placeholder="Enter Name" />

                <label for="ddlOfficerRole">Officer Role:</label>
                <select id="ddlOfficerRole">
                    <option value="">Select Role</option>
                </select>
            </div>


            






            <div class="form-section officer-row">
                <div>
                    <label for="txtUsername">Username:</label>
                    <input type="text" id="txtUsername" placeholder="Enter Username" />
                </div>

                <div>
                    <label for="txtPassword">Password:</label>
                    <div style="display:flex; gap:8px; align-items:center;">
                        <input type="text" id="txtPassword"  maxlength="16"
                            oninput="this.value = this.value.slice(0,16);" style="background:#f1f1f1;" />
                        <button type="button" id="btnGenerate" onclick="generatePassword()" style="border-radius: 4px;">Generate</button>
                    </div>
                </div>
            </div>




            <div class="form-section officer-row">
                <div>
                    <label for="txtEmail">Email:</label>
                    <input type="email" id="txtEmail" placeholder="Enter Email" />
                </div>
            </div>





         <div style="min-width:319px; display:flex; flex-direction: column; gap:5px;">
            <label for="txtApplication"><strong>Select Application:</strong></label>
            <input type="text" id="txtApplication" style="min-width:250px;" placeholder="Type or select application"/>
             <input type="hidden" id="txtApplicationIds" />
        </div>



   


           

            



           

             


            <div class="form-section" style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 15px;">
                <button type="button" class="btn btn-primary" id="btnAddOfficer">Add Officer</button>
                <button type="button" class="btn btn-secondary" id="btnClearOfficers">Clear</button>
            </div>

            

            

           



            <table id="tblOfficers" style="display: none; width: 100%; border: 2px solid #555; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th>Level</th>
                        <th>Corp</th>
                        <th>Zone</th>
                        <th>Ward</th>
                        <th>Application</th>
                        <th>Officer Name</th>
                        <th>Role</th>
                        <th>Mobile No</th>
                        
                        <th>Edit</th>
                        
                    </tr>
                </thead>
                <tbody></tbody>
            </table>

            <button type="button" class="btn" id="btnSave" style="display: none;">Save</button>

        </div>
   


         <!-- Loader Overlay -->
                    <div id="loader" style="
                        display: none;
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(255,255,255,0.7);
                        z-index: 9999;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    ">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>



    </form>

    <footer style="background-color:#f1f1f1; padding:20px; text-align:center; margin-top:40px; margin-bottom:0px">
                    <p>&copy; Designed & Developed by City Corporations © 2026 ಬೆಂಗಳೂರು ನಗರ ಪಾಲಿಕೆಗಳು. All rights reserved.</p>
                </footer>

    <script>



        


        

        let globalOfficerFlag = 1;

        

         
        let token = "";
        let officers = [];
        let cby = null;
        $(document).ready(function () {
            // Get token from hidden field
            <%--//let cby = $('#<%= hdnCby.ClientID %>').val();--%>
        

            token = document.getElementById('apiToken').value;
            console.log("Generated Token: " + token);

            if (!token) {
                Swal.fire("Error", "Token not available. Please refresh page.", "error");
                return;
            }

            loadOfficerRoles();
            loadApplications();

            // Handle Level Change
            $('#ddlLevel').on('change', function () {
                const level = $(this).val();
                $('#corpSection, #zoneSection, #wardSection').addClass('hidden');

                if (level === "corp") {
                    $('#corpSection').removeClass('hidden');
                    loadCorporations();
                } else if (level === "zone") {
                    $('#corpSection, #zoneSection').removeClass('hidden');
                    loadCorporations();
                } else if (level === "ward") {
                    $('#corpSection, #zoneSection, #wardSection').removeClass('hidden');
                    loadCorporations();
                }
            });

            // Corporation change → Load Zones
            $('#ddlCorporation').on('change', function () {
                const corpId = $(this).val();
                if (corpId) loadZones(corpId);
                else {
                    $('#ddlZone').empty().append('<option value="">Select Zone</option>');
                    $('#ddlWard').empty().append('<option value="">Select Ward</option>');
                }
            });

            // Zone change → Load Wards
            $('#ddlZone').on('change', function () {
                const zoneId = $(this).val();
                if (zoneId) loadWards(zoneId);
                else $('#ddlWard').empty().append('<option value="">Select Ward</option>');
            });

           



            





            $('#btnAddOfficer').on('click', function () {
               
                const levelStr = $('#ddlLevel').val(); // "corp", "zone", "ward"
                const corpId = $('#ddlCorporation').val();
                const zoneId = $('#ddlZone').val();
                const wardId = $('#ddlWard').val();
                /*const appId = $('#ddlApplication').val();*/
               
                // New multi-select logic for #txtApplication
                const selectedAppsStr = $('#txtApplication').val().trim();
                const selectedApps = selectedAppsStr
                    ? selectedAppsStr.split(',').map(a => a.trim()).filter(a => a.length > 0)
                    : [];

                if (selectedApps.length === 0) {
                    Swal.fire("Warning", "Please select at least one Application", "warning");
                    return;
                }

                const appIdsCsv = $('#txtApplicationIds').val();

                const appCsv = selectedApps.join(',');
                const name = $('#txtName').val().trim();
                const roleId = $('#ddlOfficerRole').val();
                const mobile = $('#txtMobile').val().trim();

                const username = $('#txtUsername').val().trim();
                const password = $('#txtPassword').val().trim();
                const email = $('#txtEmail').val().trim();

                if (!email) { Swal.fire("Warning", "Please enter Email", "warning"); return;}
                if (!username) { Swal.fire("Warning", "Please enter a Username", "warning"); return; }
                if (!password) { Swal.fire("Warning", "Please enter a Password", "warning"); return; }


                // Validation (same as before)
                //if (!levelStr) { Swal.fire("Warning", "Please select Level", "warning"); return; }
               // if (!appId) { Swal.fire("Warning", "Please select Application", "warning"); return; }
                if (!roleId) { Swal.fire("Warning", "Please select Officer Role", "warning"); return; }
                if (!name) { Swal.fire("Warning", "Please enter Officer Name", "warning"); return; }
                if (!mobile.match(/^[0-9]{10}$/)) { Swal.fire("Warning", "Please enter valid Mobile Number", "warning"); return; }

                if (password.length > 16) {
                    Swal.fire("Warning", "Password cannot exceed 16 characters", "warning");
                    return;
                }


                // Map level string → integer
                let level = null;
                if (levelStr === "corp") level = 1;
                else if (levelStr === "zone") level = 2;
                else if (levelStr === "ward") level = 3;

                // Validate based on level
                // if (level === 1 && !corpId) { Swal.fire("Warning", "Corporation is required for this level", "warning"); return; }
                if (level === 2 && (!corpId || !zoneId)) { Swal.fire("Warning", "Corporation and Zone are required for this level", "warning"); return; }
                if (level === 3 && (!corpId || !zoneId || !wardId)) { Swal.fire("Warning", "Corporation, Zone, and Ward are required for this level", "warning"); return; }

               

                const officer = {
                    level,
                    corpId: corpId || null,
                    corpName: $('#ddlCorporation option:selected').text() || null,
                    zoneId: zoneId || null,
                    zoneName: $('#ddlZone option:selected').text() || null,
                    wardId: wardId || null,
                    wardName: $('#ddlWard option:selected').text() || null,
                    /*appId: appCsv, */
                    appId: appIdsCsv,
                    appName: selectedApps.join(", "), // display multiple apps
                    roleId: roleId || null,
                    roleName: $('#ddlOfficerRole option:selected').text() || null,
                    name,
                    mobile,
                    username,   
                    password,
                    email
                };

                

                

                officers.push(officer);
                renderTable();

                // Show table and save button
                $('#tblOfficers').show();
                $('#btnSave').show();
            });










            $('#btngetmobile').on('click', function () {
                const mobile = $('#txtMobile').val().trim();

                if (mobile.length !== 10) {
                    Swal.fire("Warning", "Please enter a valid 10-digit mobile number.", "warning");
                    return;
                }

                const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';

                $.ajax({
                    //url: "https://localhost:44364/api/GetOfficerByMobile",
                    url:apiBaseUrl +"GetOfficerByMobile",
                    type: "POST",
                    headers: { "Authorization": "Bearer " + token.trim() },
                    data: JSON.stringify({ Mobile: mobile }),
                    contentType: "application/json",
                    success: function (response) {
                        if (response && response.length > 0) {
                            // Map API response to officers array using correct keys
                            officers = response.map(o => ({
                                level: o.Ofcr_Level,
                                corpId: o.Ofcr_CorporationId,
                                corpName: o.Ofcr_CorporationId,   
                                zoneId: o.Ofcr_ZoneId,
                                zoneName: o.Ofcr_ZoneId,          
                                wardId: o.Ofcr_WardId,
                                wardName: o.Ofcr_WardId,          
                                appId: o.Ofcr_ApplicationId,
                                appName: o.Ofcr_ApplicationId,    
                                roleId: o.Ofcr_RoleId,
                                roleName: o.Ofcr_RoleId,          
                                name: o.Ofcr_Name,
                                mobile: o.Ofcr_MNo,
                                
                            }));

                            renderTable();
                            $('#tblOfficers').show();
                            $('#btnSave').show();


                            // Show table and Save button
                            $('#tblOfficers, #btnSave').show();
                            renderTable();

                            Swal.fire("Info", "Officer found!", "info");
                        } else {
                            Swal.fire("Info", "No record found for this mobile number.", "info");

                            // Clear table if no data
                            officers = [];
                            renderTable();
                            $('#tblOfficers, #btnSave').hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error(error);
                        Swal.fire("Error", "Something went wrong while fetching data.", "error");
                    }
                });
            });




            $(document).on('click', '.btn-edit', function () {
                const index = $(this).data('index');
                const o = officers[index];

                // Set values back into UI
                $('#ddlLevel').val(o.level === 1 ? 'corp' : o.level === 2 ? 'zone' : 'ward').trigger("change");

                setTimeout(() => {
                    $('#ddlCorporation').val(o.corpId);
                    $('#ddlZone').val(o.zoneId);
                    $('#ddlWard').val(o.wardId);
                }, 300);

                $('#ddlApplication').val(o.appId);
                $('#ddlOfficerRole').val(o.roleId);

                $('#txtName').val(o.name);
                $('#txtMobile').val(o.mobile);

                globalOfficerFlag = 2;

                //$('#txtUsername').prop('disabled', true).css('background-color', '#e9ecef');
                //$('#txtPassword').prop('disabled', true).css('background-color', '#e9ecef');


               
                


                $('#tblOfficers tbody').empty();
                officers.splice(index, 1);
                // Remove old row
                
                renderTable();
            });


           
            
                let cby = '<%= Session["Cby"] ?? "" %>';
            


            $('#btnSave').on('click', async function () {
                if (officers.length === 0) {
                    Swal.fire("Warning", "No officers added yet!", "warning");
                    return;
                }

             



                


                //const formattedOfficers = officers.map(o => ({
                //    Flag: o.editOfficerFlag || globalOfficerFlag,
                //    Level: parseInt(o.level) || null,
                //    Corporation: o.corpId ? parseInt(o.corpId) : null,
                //    Zone: o.zoneId ? parseInt(o.zoneId) : null,
                //    Ward: o.wardId ? parseInt(o.wardId) : null,
                //    Application: o.appId,
                //    OfficerName: o.name,
                //    Role: o.roleId ? parseInt(o.roleId) : null,
                //    Mobile: o.mobile,
                //    Username: o.username,    
                //    /*Password: o.password,*/
                //    Password: await sha256(o.password),
                //    Email: o.email
                //}));

                const formattedOfficers = await Promise.all(
                    officers.map(async o => ({
                        Flag: o.editOfficerFlag || globalOfficerFlag,
                        Level: parseInt(o.level) || null,
                        Corporation: o.corpId ? parseInt(o.corpId) : null,
                        Zone: o.zoneId ? parseInt(o.zoneId) : null,
                        Ward: o.wardId ? parseInt(o.wardId) : null,
                        Application: o.appId,
                        OfficerName: o.name,
                        Role: o.roleId ? parseInt(o.roleId) : null,
                        Mobile: o.mobile,
                        Username: o.username,

                        Password: await sha256(o.password),

                        Email: o.email,
                        Cby: cby
                    }))
                );




                const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';



                $.ajax({
                    //url: 'https://localhost:44364/api/InsertOfficer',
                    url: apiBaseUrl+"InsertOfficer",
                    type: 'POST',
                    headers: { "Authorization": "Bearer " + token.trim() },
                    data: JSON.stringify(formattedOfficers), // send the full array
                    contentType: 'application/json',
                    success: function (response) {
                        let res = null;

                        if (Array.isArray(response) && response.length > 0) {
                            res = response[0];
                        } else if (response && typeof response === "object") {
                            res = response;
                        }

                        if (!res || !res.Status) {
                            Swal.fire("Info", "Unexpected response from server.", "info");
                            return;
                        }

                        const status = res.Status.toUpperCase();

                        if (status === "SUCCESS") {
                            globalOfficerFlag = 1;
                            //formattedOfficers.forEach(o => {
                            //    sendOfficerEmail(o.Email, o.Username, o.Password);
                            //});
                            officers.forEach(o => {
                                sendOfficerEmail(o.email, o.username, o.password); 
                            });

                            Swal.fire("Success", res.Message, "success");
                            
                        } else if (status === "DUPLICATE") {
                            Swal.fire("Warning", res.Message, "warning");
                        } else if (status === "ERROR") {
                            Swal.fire("Error", res.Message, "error");
                        } else if (status === "BLACKLISTED") {
                            Swal.fire("Error", res.Message, "error");
                        } else if (status ==="NOT_FOUND") {
                            Swal.fire("Warning", res.Message, "warning");
                        } else if (status ==="DUPLICATE_USERNAME") {
                            Swal.fire("Warning", res.Message, "warning");
                        } else {
                            Swal.fire("Info", "Unexpected response from server.", "info");
                        }



                        //CLEAR FILEDS AFTER SAVING OFFICER DETAILS

                        officers = [];
                        renderTable();
                        $('#ddlLevel').val('');
                        $('#ddlCorporation').val('');
                        $('#ddlZone').val('');
                        $('#ddlWard').val('');
                        $('#txtApplication').val('');
                        $('#txtApplicationIds').val('');
                        $('#ddlOfficerRole').val('');
                        $('#txtName').val('');
                        $('#txtMobile').val('');
                        $('#tblOfficers').hide();
                        $('#btnSave').hide();
                        $('#txtPassword').val('');
                        $('#txtUsername').val('');

                        $('#txtUsername').prop('disabled', false).css('background-color', '');
                        $('#txtPassword').prop('disabled', false).css('background-color', '');

                        globalOfficerFlag = 1;

                        $('#txtEmail').val('');
                        $('#corpSection, #zoneSection, #wardSection').addClass('hidden');





                    },
                    error: function (xhr) {
                        Swal.fire("Error", xhr.responseText || "Something went wrong", "error");
                    }
                });
            });
        });

        
        $('#btnClearOfficers').on('click', function () {
            officers = []; 
            renderTable();
            $('#ddlLevel').val('');     
            $('#ddlCorporation').val('');
            $('#ddlZone').val('');
            $('#ddlWard').val('');
            $('#txtApplication').val('');      
            $('#txtApplicationIds').val('');
            $('#ddlOfficerRole').val('');
            $('#txtName').val('');      
            $('#txtMobile').val('');    
            $('#tblOfficers').hide();
            $('#btnSave').hide();
            $('#txtPassword').val('');
            $('#txtUsername').val('');

            $('#txtUsername').prop('disabled', false).css('background-color', '');
            $('#txtPassword').prop('disabled', false).css('background-color', '');

            globalOfficerFlag = 1;

            $('#txtEmail').val('');
            $('#corpSection, #zoneSection, #wardSection').addClass('hidden');
        });


        function generatePassword() {
            let username = document.getElementById("txtUsername").value.trim();

            if (username.length < 2) {
                
                Swal.fire("Warning", "Please Enter UserName", "warning");
                return;
            }

            // 2 letters from username (1st uppercase, 2nd lowercase)
            let part1 = username.charAt(0).toUpperCase() + username.charAt(1).toLowerCase();

            // 3 random numbers
            let part2 = Math.floor(100 + Math.random() * 900); // always 3 digits

            // 2 random letters
            let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            let part3 =
                letters.charAt(Math.floor(Math.random() * letters.length)) +
                letters.charAt(Math.floor(Math.random() * letters.length));

            // special chars
            let part4 = "@!#%";

            let finalPwd = part1 + part2 + part3 + part4;
            finalPwd = finalPwd.substring(0, 16);

            document.getElementById("txtPassword").value = finalPwd;
        }



        function sendOfficerEmail(email, username, password) {
            console.log("sendOfficerEmail called:", email, username, password);
            $.ajax({
                
                type: "POST",
                
               // url: "White_listing.aspx/SendOfficerEmail",
                url: "Services/Email.asmx/SendOfficerEmail",
                data: JSON.stringify({
                    email: email,
                    userName: username,
                    password: password
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (response) {
                    if (response.d === "SUCCESS") {
                        console.log("Email sent successfully to " + email);
                    } else {
                        console.error("Email error:", response.d);
                    }
                },
                error: function (xhr) {
                    console.error("AJAX error:", xhr.responseText);
                }
            });
        }



        function renderTable() {
            const tbody = $('#tblOfficers tbody');
            tbody.empty();

            officers.forEach((o, index) => {
                tbody.append(`
            <tr>
                <td>${o.level}</td>
                <td>${o.corpName || ''}</td>
                <td>${o.zoneName || ''}</td>
                <td>${o.wardName || ''}</td>
                <td>${o.appName}</td>
                <td>${o.name}</td>
                <td>${o.roleName}</td>
                <td>${o.mobile}</td>
                
                <td>
                    <button class="btn btn-sm btn-warning btn-edit" data-index="${index}">Edit</button>
                </td>
               
            </tr>
        `);
            });
        }


        function handleLevelChange() {
            if (!token) {
                Swal.fire("Token Error", "Token not available. Please refresh page.", "error");
                return;
            }

            const level = document.getElementById("ddlLevel").value;
            const corp = document.getElementById("corpSection");
            const zone = document.getElementById("zoneSection");
            const ward = document.getElementById("wardSection");

            corp.classList.add("hidden");
            zone.classList.add("hidden");
            ward.classList.add("hidden");

            if (level === "corp") {
                corp.classList.remove("hidden");
                loadCorporations();
            } else if (level === "zone") {
                corp.classList.remove("hidden");
                zone.classList.remove("hidden");
                loadCorporations();
            } else if (level === "ward") {
                corp.classList.remove("hidden");
                zone.classList.remove("hidden");
                ward.classList.remove("hidden");
                loadCorporations();
            }
        }


        // Load Corporations
        function loadCorporations() {
            if (!token) return;
            $('#ddlCorporation').empty().append('<option value="">Select Corporation</option>');

            const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';

            $.ajax({
                url: apiBaseUrl + "Values/fnGetCorporations",
                type: "GET",
                headers: { "Authorization": "Bearer " + token.trim() },
                contentType: "application/json",
                dataType: "json",
                success: function (response) {
                    response.sort((a, b) => a.cityCorportationName.localeCompare(b.cityCorportationName));
                    response.forEach(c => {
                        $('#ddlCorporation').append(`<option value="${c.easthiULBNAME_CorpId}">${c.cityCorportationName}</option>`);
                    });
                },
                error: function (xhr) {
                    console.error("Error loading corporations:", xhr);
                    Swal.fire("Error", "Unable to load corporations.", "error");
                }
            });
        }

        // Load Zones
        function loadZones(corpId) {
            if (!token) return;
            $('#ddlZone').empty().append('<option value="">Select Zone</option>');
            $('#ddlWard').empty().append('<option value="">Select Ward</option>');

            const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';

            $.ajax({
                url: apiBaseUrl + "fnGetZones",
                type: "POST",
                headers: { "Authorization": "Bearer " + token.trim() },
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({ corpId: parseInt(corpId) }),
                success: function (zones) {
                    zones.sort((a, b) => a.GBAZoneName_En.localeCompare(b.GBAZoneName_En));
                    zones.forEach(z => {
                        $('#ddlZone').append(`<option value="${z.GBAZoneID}">${z.GBAZoneName_En}</option>`);
                    });
                },
                error: function (xhr) {
                    console.error("Error loading zones:", xhr);
                }
            });
        }

        /*// Load Wards*/
        function loadWards(zoneId) {
            if (!token) return;
            $('#ddlWard').empty().append('<option value="">Select Ward</option>');

            const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';

            $.ajax({
                url: apiBaseUrl + "fnGetWards",
                type: "POST",
                headers: { "Authorization": "Bearer " + token.trim() },
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({ zoneId: parseInt(zoneId) }),
                success: function (wards) {
                    wards.sort((a, b) => a.BBMPWardName.localeCompare(b.BBMPWardName));
                    wards.forEach(w => {
                        $('#ddlWard').append(`<option value="${w.BBMPWardId}">${w.BBMPWardName}</option>`);
                    });
                },
                error: function (xhr) {
                    console.error("Error loading wards:", xhr);
                }
            });
        }

        function loadApplications() {

            const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';


            $.ajax({
                url: apiBaseUrl + "GetApplication",
                //url:'https://localhost:44364/api/GetApplication',
                type: "GET",
                headers: { "Authorization": "Bearer " + token.trim() },
                contentType: "application/json",
                success: function (applications) {
                    // Store both name and id for lookup
                    const appMap = {}; // key: AppName, value: AppId
                    applications.forEach(a => appMap[a.AppName] = a.AppId);

                    const appNames = applications.map(a => a.AppName);

                    function split(val) {
                        return val.split(/,\s*/);
                    }

                    function extractLast(term) {
                        return split(term).pop();
                    }

                    $("#txtApplication")
                        .on("keydown", function (event) {
                            if (event.key === "Tab" && $(this).autocomplete("instance").menu.active) {
                                event.preventDefault();
                            }
                        })
                        .autocomplete({
                            minLength: 0,
                            source: function (request, response) {
                                const term = extractLast(request.term);
                                response($.ui.autocomplete.filter(appNames, term));
                            },
                            focus: function () {
                                return false;
                            },
                            select: function (event, ui) {
                                let terms = split(this.value);

                                terms = terms.map(t => t.trim()).filter(t => t.length > 0);

                                // Append selected name
                                terms.push(ui.item.value);
                                this.value = terms.join(", ");

                                // Also store selected IDs in a hidden field
                                const selectedIds = terms.map(name => appMap[name]);
                                $("#txtApplicationIds").val(selectedIds.join(",")); // hidden input to hold AppIds

                                $(this).autocomplete("search", "");
                                return false;
                            }
                        })
                        .focus(function () {
                            $(this).autocomplete("search", "");
                        });
                },
                error: function (xhr) {
                    console.error("Error loading applications:", xhr);
                    Swal.fire("Error", "Unable to load applications.", "error");
                }
            });
        }


        function loadOfficerRoles() {
            const apiBaseUrl = '<%= System.Configuration.ConfigurationManager.AppSettings["BaseURL"] %>';

            $.ajax({
                url: apiBaseUrl + "GetRoles",
                //url:'https://localhost:44364/api/GetRoles',
                type: "GET",
                headers: { "Authorization": "Bearer " + token.trim() },
                contentType: "application/json",
                success: function (roles) {
                    const ddl = $('#ddlOfficerRole');
                    ddl.empty().append('<option value="">Select Role</option>');
                    roles.forEach(role => {
                        ddl.append(`<option value="${role.RoleId}">${role.RoleName}</option>`);
                    });
                },
                error: function (xhr) {
                    console.error("Error loading roles:", xhr);
                    Swal.fire("Error", "Unable to load roles.", "error");
                }
            });
        }


        function loadLanguage(lang) {
            // Save selected language
            localStorage.setItem("selectedLang", lang);
            const pathParts = window.location.pathname.split("/").filter(Boolean);
            let baseFolder = "";

            // If there is more than 1 part, remove last part (page name)
            if (pathParts.length > 1) {
                baseFolder = "/" + pathParts.slice(0, pathParts.length - 1).join("/");
            }

            // Build full URL to language JSON
            const langUrl = `${window.location.origin}${baseFolder}/languages/local.json`;

            // Fetch local JSON
            fetch(langUrl)
                .then(response => response.json())
                .then(data => {
                    const selectedData = data[lang];
                    if (!selectedData) {
                        console.error("Language not found:", lang);
                        return;
                    }

                    // Update text content
                    document.querySelectorAll("[data-i18n]").forEach(el => {
                        const key = el.getAttribute("data-i18n");
                        const value = getNestedValue(selectedData, key);
                        if (value) el.textContent = value;
                    });

                    // Update placeholders
                    document.querySelectorAll("[data-i18n-placeholder]").forEach(el => {
                        const key = el.getAttribute("data-i18n-placeholder");
                        const value = getNestedValue(selectedData, key);
                        if (value) el.placeholder = value;
                    });
                })
                .catch(err => console.error("Error loading language:", err));
        }

        // Helper function to fetch nested keys like Status_Public.title
        function getNestedValue(obj, path) {
            return path.split('.').reduce((acc, part) => acc && acc[part], obj);
        }



        // PASSWORD HASHING 

        async function sha256(text) {
            const data = new TextEncoder().encode(text);
            const hash = await crypto.subtle.digest("SHA-256", data);
            return Array.from(new Uint8Array(hash))
                .map(b => b.toString(16).padStart(2, "0"))
                .join("");
        }


        // Load saved language or default
        window.onload = function () {
            const savedLang = localStorage.getItem("selectedLang") || "english";
            loadLanguage(savedLang);
        };


        $(document).on({
            ajaxStart: function () {
                $("#loader").fadeIn(10);   
            },
            ajaxStop: function () {
                $("#loader").fadeOut(10);  
            }
        });

    </script>

</body>
</html>
