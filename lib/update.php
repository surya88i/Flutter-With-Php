<?php
include 'conn.php';
$rollno=$_POST['rollno'];
$firstname=$_POST['firstname'];
$lastname=$_POST['lastname'];
$mobile=$_POST['mobile'];
$con->query("UPDATE Employee SET firstname='".$firstname."',lastname='".$lastname."',mobile='".$mobile."' WHERE rollno='".$rollno."'");
?>