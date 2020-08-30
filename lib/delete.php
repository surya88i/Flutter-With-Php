<?php
include 'conn.php';
$rollno=$_POST['rollno'];
$con->query("DELETE FROM Employee WHERE rollno='".$rollno."'");
$con->query("SELECT * FROM Employee");
?>
