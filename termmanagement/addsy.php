
<script type='text/javascript' src='Javascript/scripts/gen_validatorv31.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_ajax.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_moveable_popup.js'></script>
<script type='text/javascript' src='Javascript/scripts/fg_form_submitter.js'></script>

<div id='fg_formSY'>
    <div id="fg_container_header">
        <div id="fg_box_Title">School Year</div>
        <div id="fg_box_Close"><a href="javascript:fg_hideform('fg_formSY','fg_backgroundpopup');">Close(X)</a></div>
    </div>

    <div id="fg_form_InnerContainer">

        <form id='Folder' action="Admin.php?SY=SY" method="post" enctype="multipart/form-data" name="form1" id="form1">
            <div class='container'>
                <p class="contact"><label ></label></p> 
                <p class="contact"><label for="sy">School Year  <font style="color:red"> *</font></label></p> 
                <input id="sy" name="sy" type="text" value="" placeholder="School Year" Required>
                <p style="font-style: italic;font-size:100%;">format: 1991 - 1992</p> 

                <!--
                <p class="contact"><label for="date">Start Date <font style="color:red"> *</font></label></p> 
                <input type="date" id="date" name="date" tabindex="" required="" value="" >  
                -->
            </div>

                <input class="buttom"  type='submit' name='SchoolYear' value='Submit' />
                <a href="javascript:fg_hideform('fg_formSY','fg_backgroundpopup');"> <input class="buttom"  type='button' name='Submit' value='Close' /> </a>
            </div>
        </form>

    </div>
</div>

<div id='fg_backgroundpopup'></div>

<div id='fg_submit_success_message'>
 

        <a href="javascript:fg_hideform('fg_formSY','fg_backgroundpopup');">Close this window</a>
</div>
