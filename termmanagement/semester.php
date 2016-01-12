<?php

  if(isset($_POST['Submit']))
  {

     mysql_query("INSERT INTO  fr_semester(Semester,SYID) VALUES('".$_POST['sem']."','".$_POST['sy']."')") or die("Error Semester:". mysql_error());
    

  /*  
       $result = mysql_query("SELECT sy.* FROM fr_sy as sy WHERE sy.SYID = '".$_POST['sy']."'");
       $row = mysql_fetch_array($result);
        $sy = $row['SchoolYear'];

      $result2 = mysql_query("SELECT * FROM fr_path WHERE Folder_Name = '".$sy."'");
      $row2 = mysql_fetch_array($result2);
      
      $Parent_F = $row2['pathID'];
       $path = $row2['pathName']."/".$sy."_".$_POST['sem'];

      mysql_query("INSERT INTO fr_path(pathName,Folder_Name,Parent_F) VALUES('".$path."','".$sy."_".$_POST['sem']."','".$Parent_F."')");

      mkdir ($path, 0700);
*/
      echo '<script> window.location.href="Admin.php?Sem=Semester"; </script>';
  }

  $result = mysql_query("SELECT sem.*,sy.* FROM fr_semester as sem , fr_sy as sy WHERE sem.SYID = sy.SYID")               
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
          <div> 
          <a href='javascript:fg_popup_form("fg_formSem","fg_form_InnerContainer","fg_backgroundpopup");'>
            <input class="buttom" type="button" name="CSV" id="btnSubmit"  value="ADD SEMESTER"  >
          </a> 
          <input class="buttom" type="button" name="enroll" id="btnSubmit"  value="EDIT" onClick="" > </div>
          <div style="float:right"> Search: <input id="form-control" type="text" style="width:300px;" /></div>
        </div>
        <table class="bordered sortable search-table table table-striped" >
          <thead>
            <tr>    
              <th class="group-word">Semester</th>
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
        
              <td><?php echo $row['Semester']; ?></td>
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

