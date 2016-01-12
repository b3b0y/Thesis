<?PHP date_default_timezone_set("Asia/Hong_kong");
session_start();
include_once("../php/config.php");
require('../dirLIST_files/config.php');
require('../dirLIST_files/functions.php');


$rename_action = FALSE;
if($_POST['Submit'] == 'Submit')
{


    $folder = basename(base64_decode($_POST['folder']));
 

    $result = mysql_query("SELECT * FROM  fr_ins_subject WHERE uid = '".$_SESSION['uid']."' AND Subject = '".$folder."'");
    if(mysql_num_rows($result) > 0)
    {
        $date = date ("y/m/d");
        $time = date ("H:i:s");

        $row = mysql_fetch_array($result);

        echo $row['ID'];
        
        $result2 = mysql_query("SELECT * FROM  fr_ins_subject WHERE ID = '".$row['Parent_F']."'");
        $row2 = mysql_fetch_array($result2);

        $result = mysql_query("SELECT * FROM  fr_stud_subject WHERE subID = '".$row['Parent_F']."'");
        if(mysql_num_rows($result) > 0)
        {
            while ($row3 = mysql_fetch_array($result)) 
            {
                mysql_query("INSERT INTO fr_share_folder(studID,Sub_Name,Folder_Name,subID,Folder_Owner,Date_Created,Time_Created,upload,download) VALUES('".$row3['studID']."','".$row2['Subject']."-".$folder."','".$folder."','".$row['ID']."','".$_SESSION['uid']."','".$date."','".$time."','".$_POST['upload']."','".$_POST['download']."') ON DUPLICATE KEY UPDATE studID = '".$row3['studID']."',Sub_Name = '".$row2['Subject']."-".$folder."',Folder_Name = '".$folder."',subID = '".$row['ID']."',Folder_Owner = '".$_SESSION['uid']."',upload = '".$_POST['upload']."', download='".$_POST['download']."'") or die ("wew". mysql_error());
            }
             $rename_action = TRUE;
        }
        
       
    }

}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Folder Name: <?PHP echo basename(base64_decode($_GET['item_name'])); ?></title>

    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../css/jquery.simple-dtpicker.css" rel="stylesheet" type="text/css"  />

    <script type="text/javascript" src="../Javascript/jQuery v1.7.js"></script>
    <script type="text/javascript" src="../Javascript/jquery.simple-dtpicker.js"></script>


    <script type="text/javascript">
    function close_window()
    {
        window.opener.location.reload();
        window.close();
    }

    function onload_events()
    {
        <?PHP if($rename_action == TRUE) echo 'close_window();'; ?>
        document.getElementById('new_name').focus();    
        
    }
    </script>

</head>

<body onload="onload_events();">
<?PHP if(!$rename_action) { ?>
        <form id='Folder' action='' method='post' accept-charset='UTF-8'>
           <input name="folder" type="hidden" id="folder" value="<?PHP echo $_GET['item_name']; ?>" />
            <fieldset>
                <legend>Select Permission </legend>
                <div class="wish_payment_type">
                    <input class="check_boxes required" id="wish_payment_type_1" type='checkbox' name='upload' value='1'/> Upload 
                    <br/>
                    <br/>
                    <input class="check_boxes required" id="wish_payment_type_2" type='checkbox' name='download' value='1'/> Download

                </div>
            </fieldset>        
            
            <br/>
            <input type='submit' name='Submit' value='Submit' />
            <a href="javascript:fg_hideform('fg_formshare','fg_backgroundpopup');"> <input type='button' name='Submit' value='Close' /> </a>
        </form>
<?PHP 

} 
?>
</body>
</html>



<!--

<script type='text/javascript' src='Javascript/scripts/gen_validatorv31.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_ajax.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_moveable_popup.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_form_submitter.js'></script>

<div id='fg_formshare'>
    <div id="fg_container_header">
        <div id="fg_box_Title">Share <?PHP echo basename(base64_decode($_GET['item_name'])); ?> </div>
        <div id="fg_box_Close"><a href="javascript:fg_hideform('fg_formshare','fg_backgroundpopup');">Close(X)</a></div>
    </div>

    <div id="fg_form_InnerContainer">
        <form id='Folder' action='' method='post' accept-charset='UTF-8'>
           <input name="folder" type="hidden" id="folder" value="<?PHP echo $_GET['item_name']; ?>" />
            <fieldset>
                <legend>Select Permission </legend>
                <div class="wish_payment_type">
                    <input class="check_boxes required" id="wish_payment_type_1" type='checkbox' name='upload' value='1'/> Upload 
                    <br/>
                    <br/>
                    <input class="check_boxes required" id="wish_payment_type_2" type='checkbox' name='download' value='1'/> Download

                </div>
            </fieldset>        
            
            <br/>
            <input type='submit' name='Submit' value='Submit' />
            <a href="javascript:fg_hideform('fg_formshare','fg_backgroundpopup');"> <input type='button' name='Submit' value='Close' /> </a>
        </form>
    </div>
</div>



<div id='fg_backgroundpopup'></div>

<div id='fg_submit_success_message'>
 

        <a href="javascript:fg_hideform('fg_formshare','fg_backgroundpopup');">Close this window</a>
</div>
-->