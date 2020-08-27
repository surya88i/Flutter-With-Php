<?php
include 'conn.php';

$firstname=$_POST['firstname'];
$lastname=$_POST['lastname'];
$mobile=$_POST['mobile'];
$con->query("INSERT INTO Employee(firstname,lastname,mobile)VALUES('".$firstname."','".$lastname."','".$mobile."')");

?>