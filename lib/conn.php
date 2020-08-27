<?php

$con=mysqli_connect('127.0.0.1','root','password','mydb');
if($con->connection_error){
	echo "Connection failed:".$con->connection_error;
}

$query=$con->query("SELECT * FROM Employee");
$result=array();
while ($row = $query->fetch_assoc()) {
	$result[] = $row;
}
echo json_encode($result);
?>
