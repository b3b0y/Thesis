<?PHP date_default_timezone_set("Asia/Hong_kong");


include_once("../php/config.php");
require('../dirLIST_files/config.php');
require('../dirLIST_files/functions.php');

 $folder = basename(base64_decode($_POST['folder']));
 

$result = mysql_query("SELECT * FROM  fr_ins_subject WHERE uid = '".$_SESSION['uid']."' AND Subject = '".$folder."'");
if(mysql_num_rows($result) > 0)
{
	$date = date ("y/m/d");
	$time = date ("H:i:s");

	$row = mysql_fetch_array($result);
	
	$result = mysql_query("SELECT * FROM  fr_stud_subject WHERE subID = '".$row['ID']."'");
	if(mysql_num_rows($result) > 0)
	{
		while ($row1 = mysql_fetch_array($result)) 
		{
			mysql_query("INSERT INTO fr_share_folder(studID,Sub_Name,Folder_Name,subID,Folder_Owner,Date_Created,Time_Created,upload,download) VALUES('".$row1['studID']."','".$folder."-".$file_name."','".$file_name."','".$row['ID']."','".$_SESSION['uid']."','".$date."','".$time."','".$_POST['upload']."','".$_POST['download']."') ON DUPLICATE KEY UPDATE studID = '".$row1['studID']."',Sub_Name = '".$folder."-".$file_name."',Folder_Name = '".$file_name."',subID = '".$row['ID']."',Folder_Owner = '".$_SESSION['uid']."',upload = '".$_POST['upload']."', download='".$_POST['download']."'") or die ("wew". mysql_error());
		}
	}
	
}
else
{
	$result = mysql_query("SELECT * FROM  fr_activityfolder WHERE uid = '".$_SESSION['uid']."' AND folder_name = '".$folder."'");
	if(mysql_num_rows($result) > 0)
	{
		$date = date ("y/m/d");
		$time = date ("H:i:s");

		$row = mysql_fetch_array($result);
		
		$result2 = mysql_query("SELECT * FROM  fr_ins_subject WHERE ID = '".$row['parent_folder']."'");
		$row2 = mysql_fetch_array($result2);

	

		$result3 = mysql_query("SELECT * FROM  fr_stud_subject WHERE subID = '".$row2['ID']."'");
		if(mysql_num_rows($result3) > 0)
		{

			while ($row3 = mysql_fetch_array($result3)) 
			{
				mysql_query("INSERT INTO fr_share_folder(studID,Sub_Name,Folder_Name,subID,Folder_Owner,Date_Created,Time_Created,upload,download) VALUES('".$row3['studID']."','".$row2['Subject']."-".$folder."','".$folder."','".$row2['ID']."','".$_SESSION['uid']."','".$date."','".$time."','".$_POST['upload']."','".$_POST['download']."') ON DUPLICATE KEY UPDATE studID = '".$row3['studID']."',Sub_Name = '".$row2['Subject']."-".$folder."',Folder_Name = '".$folder."',subID = '".$row2['ID']."',Folder_Owner = '".$_SESSION['uid']."',upload = '".$_POST['upload']."', download='".$_POST['download']."'") or die ("wew". mysql_error());
			}
		}
		
	}
}


header("Location: ../index.php?folder=".$_POST['folder']);
exit;

?>