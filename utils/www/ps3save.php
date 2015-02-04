<?php
session_start();
@include("../ps3load.php");

if (isset($_GET['tag'])) {
	$hash = $_GET['tag'];
	$_SESSION['hash']=$hash;
	exit(0);
}

//Other
//controller settings
$c[1][0] = $_POST['c1_0'];
$c[1][1] = $_POST['c1_1'];
$c[1][2] = $_POST['c1_2'];
$c[2][0] = $_POST['c2_0'];
$c[2][1] = $_POST['c2_1'];
$c[2][2] = $_POST['c2_2'];
//ESC Min/Max
$c[0][0] = $_POST['c0_0'];
$c[0][1] = $_POST['c0_1'];

for ($i=0;$i<count($c);$i++) {                    
    for ($j=0;$j<count($c[$i]);$j++)       
	if (is_numeric($c[$i][$j])==FALSE) {
		echo $i." ".$j." ".$c[$i][$j]."\n";
		die("Variable incorrect. Will NOT save.");
		exit(0);
	} 
}

$handle = fopen($config_path."ps3.config", "w");
for ($i=0;$i<count($c);$i++) {                    
    for ($j=0;$j<count($c[$i]);$j++)       
        fprintf($handle,"%s\t",$c[$i][$j]);
    fprintf($handle,"\n");
}                                   
                                    
fclose($handle); 

shell_exec("killall ps3controller");

header('Location: '.$_SERVER['HTTP_REFERER'] . '#' . $_SESSION['hash']);
?>
