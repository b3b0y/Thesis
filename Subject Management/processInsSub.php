<?php date_default_timezone_set("Asia/Hong_kong");
  session_start();

  include_once("../php/config.php");

    $day = array();

    $result = mysql_query("SELECT * FROM fr_path WHERE pathID = 1");
    $row = mysql_fetch_array($result);
    $row['pathName'];

    $result1 = mysql_query("SELECT fr_user.*,position.*,fr_staff.* FROM fr_staff,fr_user,position WHERE fr_staff.uid = fr_user.UserID AND  position.UserLvl = fr_user.UserLvl AND fr_user.UserID = '".$_SESSION['inst']."'");
    $row1 = mysql_fetch_array($result1);
    $row1['Position'];

    $name = $row1['LastN'].", ".$row1['FirstN'];
    
    $result2 = mysql_query("SELECT * From fr_path WHERE Folder_Name = '".$name."'");
    $row2 = mysql_fetch_array($result2);


  $ItemCnt = count($_POST['subject']);
  for($i=0; $i < $ItemCnt; $i++) 
  {
    $path = $row['pathName']."/".$row1['Position']."/".$row1['LastN'].", ".$row1['FirstN'];
    
    $date = date ("d/m/y");
    $time = date ("H:i:s");

   
    
    if(!file_exists($path."/".$_POST['sy'][$i])) 
    {
        if(mkdir($path."/".$_POST['sy'][$i], 0700, true))
        {

          mysql_query("INSERT INTO fr_path (pathName,Folder_Name,Parent_F) VALUES('".$path."/".$_POST['sy'][$i]."','".$_POST['sy'][$i]."','".$row2['pathID']."')");

        }
    }

    $sypathid = mysql_query("SELECT * From fr_path WHERE Folder_Name = '".$_POST['sy'][$i]."'");
    $rowpathid = mysql_fetch_array($sypathid);

    if(!file_exists($path."/".$_POST['sy'][$i]."/".$_POST['sem'][$i])) 
    {
        if(mkdir($path."/".$_POST['sy'][$i]."/".$_POST['sem'][$i], 0700, true))
        {

           mysql_query("INSERT INTO fr_path (pathName,Folder_Name,Parent_F) VALUES('".$path."/".$_POST['sy'][$i]."/".$_POST['sem'][$i]."','".$_POST['sem'][$i]."','".$rowpathid['pathID']."')");
        }
    }

    $path .= "/".$_POST['sy'][$i]."/".$_POST['sem'][$i]."/".$_POST['subject'][$i];


    $sempathid = mysql_query("SELECT * From fr_path WHERE Folder_Name = '".$_POST['sem'][$i]."'");
    $rowsempathid = mysql_fetch_array($sempathid);
   
    //if(mysql_query("INSERT INTO fr_ins_subject(uid,Subject,Description,SubPath,Folder_Owner,Parent_F,Date_Created,Time_Created) VALUES('".$_SESSION['inst']."','".$_POST['Subject'][$i+1]."','".$_POST['desc'][$i+1]."','".$path."','".$_SESSION['uid']."','".$row2['pathID']."','".$date."','".$time."')") or die("Error:". mysql_error()))
    if(mysql_query("INSERT INTO fr_ins_subject(uid,Subject,SubPath,Folder_Owner,Parent_F,Date_Created,Time_Created) VALUES('".$_SESSION['inst']."','".$_POST['subject'][$i]."','".$path."','".$_SESSION['uid']."','".$rowsempathid['pathID']."','".$date."','".$time."')") or die("Error:". mysql_error()))
    {
     
        mysql_query("UPDATE fr_subject SET status = 'ASSIGNED' WHERE SubCode = '".$_POST['subject'][$i]."'");
        mkdir ($path, 0700);
    }
    
  }
  echo '<script> alert("Successfully Load"); window.location.href="../Admin.php?viewall=Subject"; </script>';

?>