<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in users detail
$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

// sql query - inner join (media, author, publisher)
$sql = "SELECT * FROM cars";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
</head>
<body>
           Welcome Back <?php echo $userRow['userEmail']; ?>
           
           <a href="logout.php?logout">Sign Out</a>
 
       <!-- Landing Page -->


<body>
    <div class="container">

        <div class="jumbotron">
            <h1>Check out our offices!</h1>            
        </div>
        
        <?php
        while($row = $result->fetch_assoc()) {
            echo
            "<div class='card col'>" .
            " <b>Brand:</b> " . $row["brand"].
            " <b>Model:</b> " . $row["class"] . " " . $row["surname"].
            " <b>Fuel:</b> " . $row["fuel"].
            " <b>Transmission:</b> " . $row["transmission"].
            " <b>Passengers:</b> " . $row["seas"].
            " <b>Available:</b> " . $row["available"].
            "</div>";
            }
            $conn->close();
        ?>
</body>
</html>
<?php ob_end_flush(); ?>