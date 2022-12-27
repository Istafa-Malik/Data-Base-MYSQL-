<html>
<head>
<title>Registration Form</title>
</head>
<body>
<?php if (isset($_GET['form_submitted'])){
//this code is executed when the form is submitted
?>
<?php }
else { ?>
<h2>Theme Park Registration Form</h2>
<form action="registration.php" method="GET">
Park Code:
<input type="text" name="park_code">
<br>
<br> 
Park Name:
<input type="text" name="park_name">
<br><br>
Park City
<input type="text" name="park_city">
<br>
<br>
Park Country
<input type="text" name="park_country">
<br>
<br>
<input type="hidden" name="form_submitted" value="1" />
<input type="submit" value="Submit">
</form>
<?php } ?>
</body>
</html>