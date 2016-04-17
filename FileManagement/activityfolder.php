<?php
include_once("../php/config.php");
include("../php/php_file_tree.php");
require('../dirLIST_files/config.php');
require('../dirLIST_files/functions.php');

$rename_action = FALSE;
    if($_POST['Submit'] == 'Submit')
    {

        $rename_action = TRUE;
        
        $folder = basename(base64_decode(trim($_POST['folder'])));

        $result = mysql_query("SELECT * FROM  fr_ins_subject  WHERE Subject = '".$folder."'");
        if(mysql_num_rows($result) > 0 )
        {
        $row = mysql_fetch_array($result);

        mysql_query("INSERT INTO fr_deadline(folder_id,date_deadline,time_deadline) VALUES('".$row['ID']."','".$_POST['date']."','".$_POST['time']."')");

        }
    }

?>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Folder Name: <?PHP echo basename(base64_decode($_GET['item_name'])); ?></title>

    
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
    <header>
        <h2> Set Date / Time Deadline</h2>
    </header> 
   <div class='form'>
        <form  id="contactform" action="" method='post' accept-charset='UTF-8'>
            <input name="folder" type="hidden" id="folder" value="<?PHP echo $_GET['item_name']; ?>" />

               <p class="contact"> <label for='date' >Set Date: </label></p>
                <input type="text" name="date" value="" required>
                <script type="text/javascript">
                    $(function(){
                        $('*[name=date]').appendDtpicker({
                            "dateOnly": true,
                            "futureOnly": true,
                            "dateFormat": "YYYY-MM-DD"
                        });
                    });
                </script>
                
                <p class="contact"> <label for='time' >Set Time: </label></p>
                <input type="text" name="time" value="" required>
                <script type="text/javascript">
                    $(function(){
                        $('*[name=time]').appendDtpicker({
                            "timeOnly": true,
                            "futureOnly": true,
                            "amPmInTimeList": true
                        });
                    });
                </script>
             
            <p class="contact"> </p>   
            <input class="buttom" type='submit' name='Submit' value='Submit' />
          
        </form>
    </div>
<?PHP 

} 
?>
</body>
</html>


<!--<script type='text/javascript' src='Javascript/scripts/gen_validatorv31.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_ajax.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_moveable_popup.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_form_submitter.js'></script>
<div id='fg_formActivity'>
    <div id="fg_container_header">
        <div id="fg_box_Title">Activity Folder</div>
        <div id="fg_box_Close"><a href="javascript:fg_hideform('fg_formActivity','fg_backgroundpopup');">Close(X)</a></div>
    </div>

    <div id="fg_form_InnerContainer">
    <form id='Folder' action='FileManagement/process_activityfolder.php' method='post' accept-charset='UTF-8'>
    <div class='container'>
        <label for='name' >Enter Activity folder name: </label><br/>
        <input type='text' name='file' id='name' value='' maxlength="50" /><br/>
        <input name="folder" type="hidden" id="folder" value="<?PHP echo $_GET['folder']; ?>" />
        <br/>
        <fieldset>
            <legend>Set Date/Time Deadline:</legend>
            <label for='name' >Set Date: </label><br/>
            <input type="text" name="date" value="" required>
            <script type="text/javascript">
                $(function(){
                    $('*[name=date]').appendDtpicker({
                        "dateOnly": true,
                        "futureOnly": true,
                        "dateFormat": "YYYY-MM-DD"
                    });
                });
            </script>
            <br/><br/>
            <label for='name' >Set Time: </label><br/>
            <input type="text" name="time" value="" required>
            <script type="text/javascript">
                $(function(){
                    $('*[name=time]').appendDtpicker({
                        "timeOnly": true,
                        "futureOnly": true,
                        "amPmInTimeList": true
                    });
                });
            </script>
            
        </fieldset>
    </div>
    <div class='container'>
        <input type='submit' name='Submit' value='Submit' />
        <a href="javascript:fg_hideform('fg_formActivity','fg_backgroundpopup');"> <input type='button' name='Submit' value='Close' /> </a>
    </div>
      <div class='container'>
       
    </div>
    </form>
    </div>
</div>

<div id='fg_backgroundpopup'></div>

<div id='fg_submit_success_message'>
 

        <a href="javascript:fg_hideform('fg_formActivity','fg_backgroundpopup');">Close this window</a>
</div>
-->

