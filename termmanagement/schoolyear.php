<?php date_default_timezone_set("Asia/Hong_kong");

  if(isset($_POST['submit']))
  {
    $result = mysql_query("SELECT * FRom fr_sy");
    if(mysql_num_rows($result) == 0)
    {
        $SYstart =  date('Y');
        $SYend = $SYstart + 1;

        mysql_query("INSERT INTO fr_sy(SYstart,SYend) VALUES('".$SYstart."','".$SYend."')");
    }
    else
    {
      $result1 = mysql_query("SELECT * FROM fr_sy ORDER BY SYID DESC LIMIT 1");
      $row = mysql_fetch_array($result1);

      $SYstart = $row['SYend'];
      $SYend = $SYstart + 1;

      if($SYstart == date('Y'))
      {
        mysql_query("INSERT INTO fr_sy(SYstart,SYend) VALUES('".$SYstart."','".$SYend."')");
      }
      else
      {
         echo '<script> alert("Sorry you cant Generate School Year"); </script>';
      }
      
    }
   
   
  }

 /* if(isset($_POST['SchoolYear']))
  {

     mysql_query("INSERT INTO  fr_sy(SchoolYear) VALUES('".$_POST['sy']."')") or die("Error S.Y.:". mysql_error());
      

      /*
      $result = mysql_query("SELECT * FROM fr_staff WHERE uid = '".$_SESSION['uid']."'");
      $row = mysql_fetch_array($result);

      $foldername = $row['LastN'].', '.$row['FirstN'];
      

      $result2 = mysql_query("SELECT * FROM fr_path WHERE Folder_Name = '".$foldername."'");
      $row2 = mysql_fetch_array($result2);
      
      $Parent_F = $row2['pathID'];
      $path = $row2['pathName']."/".$_POST['sy'];

      mysql_query("INSERT INTO fr_path(pathName,Folder_Name,Parent_F) VALUES('".$path."','".$_POST['sy']."','".$Parent_F."')");

      mkdir ($path, 0700);

     echo '<script> window.location.href="Admin.php?SY=SY"; </script>';
  }
*/



  $result = mysql_query("SELECT * FROM fr_sy")               
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="UTF-8">
</head>
  <div class="container">   
    <div  class="form_2"> 
      <div id="second-container" class="pagination">
        <div class="my-navigation">
        <form method="post" action="<? $_SERVER['PHP_SELF'] ?>" name="form1">
          <div> 
          <!--<a href='javascript:fg_popup_form("fg_formSY","fg_form_InnerContainer","fg_backgroundpopup");'>
            <input class="buttom" type="button" name="sy" id="btnSubmit"  value="ADD S.Y."  >
          </a> -->
          
             <input class="buttom" type="submit" name="submit" id="btnSubmit"  value="Generate S.Y."  >
         
          <input class="buttom" type="button" name="enroll" id="btnSubmit"  value="EDIT" onClick="" > 
           </form>
          </div>
          <div style="float:right"> Search: <input id="form-control" type="text" style="width:300px;" /></div>
        </div>
        <table class="bordered sortable search-table table table-striped" >
          <thead>
            <tr>    
              <th class="group-false">School Year</th>
            </tr>
          </thead>
        <?php
          if(mysql_num_rows($result)> 0)
          {
            while($row = mysql_fetch_array($result))
            {
      
        ?>
            <tr>
              <td><?php echo $row['SYstart'].'-'.$row['SYend']; ?></td>
            </tr>        
        <?php
            }
         } 
        ?>
        </table>
      </div> 
    </div>      
  </div>
</html>

