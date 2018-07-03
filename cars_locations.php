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


// sql query
$sql = "SELECT * FROM cars JOIN location ON cars.fk_location = location.id"; 
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"></head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link rel="stylesheet" href="style/main.css">
<body>
<body>
           Welcome Back <?php echo $userRow['userEmail']; ?>
           
           <a href="logout.php?logout">Sign Out</a>

               <div class="container">

                <div class="jumbotron">
                <h1>
                Select Location</h1>
                </br>
 
       <!-- List Data in Front-End -->

       <!-- ............
select location filter -->    
<form action="results.php" method="post">
    <div class="select">
        <select name="locValue">
            <option> -- Select Branch -- </option>
            <option value="1">Wien Kagran</option>
            <option value="2">Wien City</option>
            <option value="3">Wien Vösendorf</option>
            <option value="4">Wien Flughafen</option>
            <option value="5">Wien Hauptbahnhof</option>
            <option value="6">Wien Innenstadt</option>
            <option value="7">Wien Süd</option>
            <option value="8">Wien MQ</option>
            <option value="9">Wien Josefstadt</option>
            <option value="10">Wien Hietzing</option>
            <option value="11">Wien Simmering</option>
            <option value="12">Wien Ottakring</option>
        </select>
            <div class="select_arrow">
            </div>
    </div>
    </br>
    <div>
        <span class="input-group-btn">
                <input class="btn btn-color" type="submit" name="submit" value="Show Cars" />
        </span>
    </div>
</form>
</br>

<?php
   $result = $conn->query($sql);
   if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<div class='card cars_card'>";
        echo "  <div class='card-body'>";
        echo " <h5 class='card-title'><b>Current location: </b><span class='badge badge-info'>". $row['name']."</span></h5>";
        echo "    <p class='card-text'>". $row['brand'] . " " . $row['class']. "</p>";
                echo "<ul class='list-group list-group-flush'>";
                    echo "<li class='list-group-item'>Seats: " . $row['seats'] . "</li>";
                echo "</ul>";
        echo "  </div>";
        echo "</div>";
    }
    } else {
    echo "0 results";
    }
    $conn->close();
   
?>
</div>
    </div>
    <script src="script/main.js"></script>
</div>
</div>
</body>
</html>
<?php ob_end_flush(); ?>