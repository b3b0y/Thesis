<?php date_default_timezone_set("Asia/Hong_kong");

//folder url
$url = "C:/xampp/htdocs/WLCFileRepoRev/Data/";

$dbhost = 'localhost';
$dbuser= 'root';
$dbpass = '';
$dbname = 'Repository';

$conn = mysql_connect($dbhost,$dbuser,$dbpass);

mysql_select_db($dbname);
?>