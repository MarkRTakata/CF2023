<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student ID Manager</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,100;1,300&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="style.css" />    
</head>
<body hx-trigger="load" hx-get="ListStudents.cfm" hx-target="#viewport">
    <h1>Student ID Manager</h1>
    <button type="button" hx-get="AddStudent.cfm" hx-target="#viewport" id="nav-btn-add" class="btn btn-default" name="nav-btn-add">ADD STUDENT</button>
    <button type="button" hx-get="ListStudents.cfm" hx-target="#viewport" id="nav-btn-list" class="btn btn-default" name="nav-btn-list">LIST STUDENTS</button>
    <div class="main">
        <div id="viewport"></div>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://unpkg.com/htmx.org@1.8.5"></script>
<script src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
</html>