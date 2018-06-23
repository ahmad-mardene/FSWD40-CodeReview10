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
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
</head>
<body>
<div class= "container-fluid">

<!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
   <h5 style=" color: white;"> Hi' <?php echo $userRow['userEmail']; ?> </h5>
  <a class="navbar-brand" href="logout.php?logout"> sign-out</a>
 
</nav>


           <!-- Hi' <?php echo $userRow['userEmail']; ?>
            
           <a href="logout.php?logout">Sign Out</a><br><hr> -->

		   <?php

// $sql = "SELECT * FROM media";
$sql = "SELECT * FROM media INNER JOIN auther ON media.fk_autherId = auther.autherId INNER JOIN publisher ON media.fk_publisherID = publisher.publisherID";
$result = mysqli_query($conn, $sql);
// fetch a next row (as long as there are some) into $row
?>

            <h2>here's our collection:</h2><hr><br>
		    <!-- <table class='table table-dark'>
			  <thead>
			    <tr>
			      <th scope='col'>ID</th>
			      <th scope='col'>TiTLE</th>
			      <th scope='col'>ImAGE</th>
				  <th scope='col'>AuTHER FiRST NaME</th>
				  <th scope='col'>AuTHER LaST NaME</th>
				  <th scope='col'>PuBLISHER</th>
				  <th scope='col'>PuBLISH DaTE</th>
				  <th scope='col'>DiSCRIPTION</th>
				  <th scope='col'>TyPE</th>
				  <th scope='col'>ISBN</th>
				  <th scope='col'>PuBLISHER AdDRESS</th>
				  <th scope='col'>PuBLISHER SiZE</th>

			    </tr>
			  </thead> -->
	<div class= "container">		 
	<div class="card-deck">
       <?php
	   		      
		
		    while($row = mysqli_fetch_array($result)) {
	   ?>    	


				<div class="card">
					<img class="card-img-top" src="<?php echo $row["image"];?>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">ISBN: <?php echo $row["ISBN"];?></h5>
						<h4 class="card-title">TiTle: <?php echo $row["title"];?></h4>
						<h5 class="card-title">AuTHER :<?php echo $row["autherName"];?> <?php echo $row["autherSurname"];?></h5>
						<h5 class="card-title">PuBLISHER: <?php echo $row["publisherName"];?> in <?php echo $row["publishDate"];?> </h5>
						<h5 class="card-title">CaTEGORY: <?php echo $row["type"];?></h5>
						<h5 class="card-title">PuBLISHER AdDRESS: <?php echo $row["address"];?></h5>
						<h5 class="card-title">PuBLISHER SiZE: <?php echo $row["size"];?></h5>
						<p class="card-text">DiSCRIPTION: <?php echo $row["discription"];?></p>
					</div>
					<div class="card-footer">
						<small class="text-muted">PuBLISH DaTE: <?php echo $row["publishDate"];?></small>
					</div>
				</div>
				
		             



				<!-- <tr>
				<td><?php echo $row["mediaId"];?></td>
				<td><?php echo $row["title"];?></td>
				<td><img src = "<?php echo $row["image"];?>" width = "100"></td>
				<td><?php echo $row["autherName"];?></td>
				<td><?php echo $row["autherSurname"];?></td>
				<td><?php echo $row["publisherName"];?></td>
				<td><?php echo $row["publishDate"];?></td>
				<td><?php echo $row["discreption"];?></td>
				<td><?php echo $row["type"];?></td>
				<td><?php echo $row["ISBN"];?></td>
				<td><?php echo $row["address"];?></td>
				<td><?php echo $row["size"];?></td>
				</tr>
			</table> -->
			 <?php
				 }
				
             ?>

			
    </div>
	</div>

</div>
</body>
</html>
<?php ob_end_flush(); ?>