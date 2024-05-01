<?php
// Start the session
session_start();

// Check if user is logged in
if (!isset($_SESSION["username"])) {
    // If not logged in, redirect to login page
    header("Location: admin.php");
    exit();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminDashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
 body {
            font-family: Arial, sans-serif;
            background-color: #a3c2c2;
        }
        
.navbar-nav {
    display: flex;
    align-items: center;
}

.nav-item {
    margin: 0 10px;
    position: relative;
    font-weight: bold;
}

.nav-link {
    font-size: 16px;
    color: black;
    text-decoration: none;
    transition: color 0.3s ease;
}

.nav-link:hover {
    color: palevioletredgreen;
}

/* Optional: Add an underline effect on hover */
.nav-link::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -5px;
    width: 100%;
    height: 2px;
    background-color: plum;
    transform: scaleX(0);
    transition: transform 0.3s ease;
}

.nav-link:hover::after {
    transform: scaleX(1);
}
        /* Sidebar Styles */
.sidebar {
    background-color: white;
    padding: 20px;
    border-radius: 15px;
    margin-bottom: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    height: 100%;
}

.profile-info {
    margin-bottom: 30px;
}

.profile-image img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #fff;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}

.profile-details h6 {
    
    margin: 10px 0;
}

.menu h6 {
    font-weight: bold;
    margin-bottom: 10px;
}

.menu ul {
    list-style-type: none;
    padding: 0;
}

.menu ul li {
    margin-bottom: 5px;
}

.menu ul li a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s ease;
    font-weight: bold;
}

.menu ul li a:hover {
    color: green;
}

.main-content {
    min-height: calc(100vh - 80px);
    background-color: white;
    border-radius: 10px;
}
.fas {
        padding: 10px;
    }
    
.container {
            max-width: 800px;
        }
.cube-box {
            background: linear-gradient(145deg, #ffffff, #e6e6e6);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
.cube-box:hover {
            transform: scale(1.05);
        }
 .cube-box h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #333;
        }
.cube-box p {
            font-size: 18px;
            margin-bottom: 0;
            color: #555;
        }
.ico {
            font-size: 40px;
            margin-bottom: 15px;
            color: #007bff;
        }

</style>
</head>
<body>
    <nav style="background-color:white;" class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="../img/logo.png" width="50px" height="50px" alt="Logo">NEMHR
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="../global/logout.php">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div style="margin-top: 100px;" class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Profile info -->
                    <div class="profile-info">
                    <div class="profile-image">
                        <img src="../img/profile.png" alt="Profile Picture">
                    </div>
                    <div style="margin-top:20px" class="profile-details">
                        <h6>Welcome</h6>
                        <h6>ID: <?php echo $_SESSION["adminID"]; ?></h6>
                        <h6>Name: <?php echo $_SESSION["name"]; ?></h6>
                        <h6>Email: <?php echo $_SESSION["username"]; ?></h6>

                        
                    </div>
                </div>
                        <hr>
                    <!-- Main menu -->
                    <div class="menu">
                        <h6>Main Menu</h6>
                        <hr>
                        <ul>
                       <li><a href="#dashboard" id="dashboard-link"><i class="fas fa-tachometer-alt fa-icon"></i> Dashboard</a></li>
                       <li><a href="#" id="country-link"><i class="fas fa-globe icon"></i> Country</a></li>
                       <li><a href="#" id="state-link"><i class="fas fa-map-marker-alt icon"></i> State</a></li>
                       <li><a href="#" id="city-link"><i class="fas fa-city icon small-icon"></i> City</a></li>
                       <li><a href="#" id="hospital-link"><i class="fas fa-hospital fa-icon"></i> Hospital</a></li>
                       <li><a href="#" id="doctor-link"><i class="fas fa-user-md fa-icon"></i> Doctor</a></li>
                       <li><a href="#" id="patient-link"><i class="fas fa-user-injured fa-icon"></i> Patient</a></li>
                        
                       </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <!-- Main content -->
                <h4 class="text-center">Welcome To Dashboard</h4>
                <hr>
            <div class="main-content" id="dashboard">
                <div style="padding-top:15px;">
                <h4 class="text-center">Dashboard</h4>
            </div>
<hr>
            <div style="padding-top:5px" class="container" >
        
            <div class="row">
            <?php
            // Connect to your database and fetch the numbers
            require_once "../db/configdb.php";

            $sql = "SELECT COUNT(*) as count FROM country";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $countries_count = $row['count'];

            $sql = "SELECT COUNT(*) as count FROM state";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $states_count = $row['count'];

            $sql = "SELECT COUNT(*) as count FROM city";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $cities_count = $row['count'];

            $sql = "SELECT COUNT(*) as count FROM hospital";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $hospitals_count = $row['count'];

            $sql = "SELECT COUNT(*) as count FROM doctor";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $doctors_count = $row['count'];

            $sql = "SELECT COUNT(*) as count FROM patient";
            $result = $conn->query($sql);
            $row = $result->fetch_assoc();
            $patients_count = $row['count'];

            $conn->close();
            ?>
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-globe ico"></i>
                        <h2>Countries</h2>
                        <p><?php echo $countries_count; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-map-marker-alt ico"></i>
                        <h2>States</h2>
                        <p><?php echo $states_count; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-city ico"></i>
                        <h2>Cities</h2>
                        <p><?php echo $cities_count; ?></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-hospital ico"></i>
                        <h2>Hospitals</h2>
                        <p><?php echo $hospitals_count; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-user-md ico"></i>
                        <h2>Doctors</h2>
                        <p><?php echo $doctors_count; ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="cube-box">
                    <div class="text-center">
                        <i class="fas fa-user ico"></i>
                        <h2>Patients</h2>
                        <p><?php echo $patients_count; ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    
                    <!-- Content will be loaded here -->
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
    <script>
    $(document).ready(function(){
        // Function to load content
        function loadContent(url) {
            $('.main-content').load(url, function() {
                // Reload Font Awesome icons after loading content
                loadFontAwesomeIcons();
            });
        }

        // Function to reload Font Awesome icons
        function loadFontAwesomeIcons() {
            var icons = $('.fa-icon');
            icons.each(function() {
                $(this).removeClass('fa-icon');
                $(this).addClass('fa');
            });
        }

        // Click event handlers for menu items
        $('#dashboard-link').click(function(e) {
            e.preventDefault();
            loadContent('dashboard.php');
        });

        $('#country-link').click(function(e) {
            e.preventDefault();
            loadContent('country.php');
        });
        $('#state-link').click(function(e) {
            e.preventDefault();
            loadContent('state.php');
        });
        $('#city-link').click(function(e) {
            e.preventDefault();
            loadContent('city.php');
        });

        $('#doctor-link').click(function(e) {
            e.preventDefault();
            loadContent('doctor.php');
        });

        $('#patient-link').click(function(e) {
            e.preventDefault();
            loadContent('patient.php');
        });

        $('#hospital-link').click(function(e) {
            e.preventDefault();
            loadContent('hospital.php');
        });

        // Initial load of Font Awesome icons
        loadFontAwesomeIcons();
    });
</script>


</body>
</html>
