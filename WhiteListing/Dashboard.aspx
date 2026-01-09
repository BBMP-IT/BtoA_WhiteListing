<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WhiteListing.Dashboard"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>White Listing Dashboard</title>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .dashboard-title {
            font-size: 26px;
            font-weight: 600;
            color: #0a3d62;
            margin-bottom: 30px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            padding: 35px;
            text-align: center;
            cursor: default;
        }

        .card-icon {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            margin: 0 auto 15px auto;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: #fff;
        }

        .card-icon.blue {
            background-color: #eaf1fb;
            color: #1e3799;
        }

        .card-icon.green {
            background-color: #e9f7ef;
            color: #27ae60;
        }

        .card-title {
            font-size: 16px;
            color: #666;
            margin-bottom: 8px;
        }

        .card-count {
            font-size: 42px;
            font-weight: 700;
            color: #1e3799;
        }

        .card-action {
            margin-top: 18px;
        }

        .create-btn {
            background-color: #0a3d62;
            color: #ffffff;
            padding: 12px 26px;
            font-size: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .create-btn:hover {
            background-color: #075985;
        }
        .clickable-card {
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .clickable-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.12);
        }




        .custom-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #fff;
    box-shadow: 0 4px 20px rgba(0,0,0,0.05);
    border-radius: 10px;
    overflow: hidden;
}

.custom-table thead {
    background: linear-gradient(90deg, #0056b3, #007bff);
    color: #fff;
    font-weight: 600;
    font-size: 14px;
}

.custom-table th, .custom-table td {
    padding: 14px 12px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
    font-size: 14px;
}

.custom-table tbody tr:nth-child(even) {
    background: #f9f9f9;
}

.custom-table tbody tr:hover {
    background: #f1f5f9;
}


.form-switch .form-check-input {
    width: 40px;
    height: 20px;
    cursor: pointer;
}
.form-switch .form-check-input:checked {
    background-color: #007bff;
    border-color: #007bff;
}




        @media (max-width: 768px) {
            .card-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
      <form id="form1" runat="server">
          <asp:HiddenField runat="server" ID="tkn" />
      <asp:HiddenField runat="server" ID="apiToken1" />

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




<div class="dashboard-container">

    <div class="dashboard-title">
        White Listing Dashboard
    </div>

    <div class="card-grid">

        <!-- Card 1: Application Count -->
        <div class="card">
            <div class="card-icon blue">✔</div>
            <div class="card-title">TOTAL APPLICATIONS</div>
            <div id="applicationCount" class="card-count">0</div>
        </div>

        <!-- Card 2: Create New Request -->
        <div class="card clickable-card" onclick="createNewRequest()">
            <div class="card-icon green">＋</div>
            <div class="card-title">CREATE NEW REQUEST</div>
            <div class="card-action">
                <button class="create-btn">
                    Create
                </button>
            </div>
        </div>


    </div>


<div class="dashboard-container mt-5">
    

  



    <div style="overflow-x:auto;">
    <table class="custom-table" id="officerTable">
        <thead>
            <tr>
                <th>Sl.No</th>
                <th>Name</th>
                <th>Mobile Number</th>
                <th>Username</th>
                <th>Created Date</th>
                <th>Email</th>
               <th>Select</th>
            </tr>
        </thead>
        <tbody>
            <!-- JS will append rows here -->
        </tbody>
    </table>
</div>




</div>

    </form>

<%--     <footer style="background-color:#f1f1f1; padding:20px; text-align:center; margin-top:40px; margin-bottom:0px">
                    <p>&copy; Designed & Developed by City Corporations © 2026 ಬೆಂಗಳೂರು ನಗರ ಪಾಲಿಕೆಗಳು. All rights reserved.</p>
                </footer>--%>

<script>
    var cby = '<%= Session["Cby"] %>';
    let token = "";
    $(document).ready(function () {
        token = document.getElementById('apiToken1').value;
        if (!cby) {
            alert("Session expired. Please login again.");
            window.location.href = "Login.aspx";
            return;
        }

        loadOfficerData(cby);
    });

    function loadOfficerData(cby) {
        $.ajax({
            url: 'https://localhost:44364/api/GetWhiteListDashdata',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ Createdby: cby }), 
            success: function (response) {
                // Set total applications in the card
                $('#applicationCount').text(response.totalCount || 0);

                var tbody = $('#officerTable tbody');
                tbody.empty();

                if (!response.data || response.data.length === 0) {
                    tbody.append('<tr><td colspan="6" class="text-center">No data found</td></tr>');
                    return;
                }

                //$.each(response.data, function (index, officer) {
                //    tbody.append(
                //        '<tr>' +
                //        '<td>' + (index + 1) + '</td>' +
                //        '<td>' + (officer.Ofcr_Name || '') + '</td>' +
                //        '<td>' + (officer.Ofcr_MNo || '') + '</td>' +
                //        '<td>' + (officer.Ofcr_Username || '-') + '</td>' +
                //        '<td>' + (officer.Ofcr_CDte || '-') + '</td>' +
                //        '<td>' + (officer.Ofcr_Email || '-') + '</td>' +
                //        '<td>' +
                //        '<div class="form-check form-switch">' +
                //        '<input class="form-check-input statusSwitch" type="checkbox" role="switch" data-userid="' + officer.Ofcr_Id + '" ' + (officer.IsActive ? 'checked' : '') + '>' +
                //        '</div>' +
                //        '</td>'+
                //        '</tr>'
                //    );
                //});


                $.each(response.data, function (index, officer) {
                    tbody.append(
                        '<tr>' +
                        '<td>' + (index + 1) + '</td>' +
                        '<td>' + (officer.Ofcr_Name || '') + '</td>' +
                        '<td>' + (officer.Ofcr_MNo || '') + '</td>' +
                        '<td>' + (officer.Ofcr_Username || '-') + '</td>' +
                        '<td>' + (officer.Ofcr_CDte || '-') + '</td>' +
                        '<td>' + (officer.Ofcr_Email || '-') + '</td>' +
                        '<td>' +
                        '<div class="form-check form-switch">' +
                        '<input class="form-check-input statusSwitch" type="checkbox" role="switch" data-userid="' + officer.Ofcr_Id + '" ' + (officer.Ofcr_Active ? 'checked' : '') + '>' +
                        '</div>' +
                        '</td>' +
                        '</tr>'
                    );
                });

            },
            error: function (xhr, status, error) {
                alert('Error fetching officer data: ' + error);
            }
        });
    }

    function createNewRequest() {
        window.location.href = "White_listing.aspx";
    }



    // Handle checkbox change
    $(document).on('change', '.statusSwitch', function () {
        var toggle = $(this);
        var rowId = toggle.data('userid');      // Ofcr_Id
        var willActivate = toggle.is(':checked');

        Swal.fire({
            title: 'Are you sure?',
            text: 'Do you want to ' + (willActivate ? 'activate' : 'deactivate') + ' this user?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'Cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {

                var payload = {
                    Flag: 3,          // STATUS TOGGLE
                    Rowid: rowId,     // Ofcr_Id
                    isActive: willActivate,
                    CBy: cby
                };

                $.ajax({
                    url: apiBaseUrl + "InsertOfficer",
                    type: 'POST',
                    headers: { "Authorization": "Bearer " + token.trim() },
                    contentType: 'application/json',
                    data: JSON.stringify([payload]), // ARRAY (important)
                    success: function (response) {
                        Swal.fire('Success!', 'User status updated.', 'success');
                    },
                    error: function () {
                        Swal.fire('Error!', 'Failed to update status.', 'error');
                        toggle.prop('checked', !willActivate); // revert UI
                    }
                });

            } else {
                toggle.prop('checked', !willActivate); // revert UI
            }
        });
    });






</script>



</body>
</html>
