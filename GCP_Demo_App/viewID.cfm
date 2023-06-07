
<cfscript>
function getFirestoreHandle(){
        gcpCred = {
        projectId : "gcpcoldfusion",
        credentialJsonFilePath : "C:\ProjectFortuna\cfusion\wwwroot\GCP-Demo-App\gcpcoldfusion-c70a0cbf1caa.json"
    };
    config = {
        "alias" = "test",
        "serviceName" = "FIRESTORE"
    };
}
function getStudentInfo(){
    getFirestoreHandle();
    db = getCloudService(gcpCred, config);
    studentRef = db.getAll([db.document("student_ids/#FORM.uniqueID#")]).get();
    cfloop(array="#studentRef#", item="itm")
        {
            cfloop(collection = "#itm.getData()#",item = "key")
            {
                variables[key] = itm.getData()[key];
            }
    }
}
getStudentInfo();
headercolor = "000000";
switch(year){
    case "Freshman":
        headercolor = "ff0000";
        break;
    case "Sophmore":
        headercolor = "FFA500";
        break;
    case "Junior": 
        headercolor = "00254d";
        break;
    case "Senior":
        headercolor = "3b8132";
        break;
    default:
        headercolor = "000000";
        break;
}
</cfscript>
<cfhtmltopdf destination="id#firstname#_#lastname#.pdf" overwrite="yes">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,100;1,300&display=swap" rel="stylesheet">

<cfoutput>
<div style="position: relative; width: 200px;  border: solid 1px black; border-radius: 15px 15px 15px 15px; background-color: ##666; text-align: center; color: white;">
    <div style="border-radius: 15px 15px 15px 15px; width: 100%; height: 100px; overflow: hidden; background-image: url(#imageLink#); background-size: 200px; background-position: center center; background-size: cover;">
        &nbsp;
    </div>
    <div style="border-top: solid 1px white; border-bottom: solid 1px white; font-size: 20px; font-weight: 300; width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: ###headercolor#;">#firstName# &nbsp; #lastName#</div>
    Age: #age#
    <br />
    Year: #year#
    <div style="border-top: solid 1px white; background: rgb(246,248,249);
background: -moz-linear-gradient(top,  rgba(246,248,249,1) 0%, rgba(229,235,238,1) 28%, rgba(215,222,227,1) 68%, rgba(245,247,249,1) 100%);
background: -webkit-linear-gradient(top,  rgba(246,248,249,1) 0%,rgba(229,235,238,1) 28%,rgba(215,222,227,1) 68%,rgba(245,247,249,1) 100%);
background: linear-gradient(to bottom,  rgba(246,248,249,1) 0%,rgba(229,235,238,1) 28%,rgba(215,222,227,1) 68%,rgba(245,247,249,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='##f6f8f9', endColorstr='##f5f7f9',GradientType=0 );
 font-size: 15px; color: red; border-radius: 0px 0px 15px 15px; padding-top: 80px; padding-bottom: 20px; font-family: 'Great Vibes', cursive; width: 100%; text-align: center;">
        Adobe State University
    </div>
    <div style="position: absolute; top: 5px; left: 10px;color: black; font-weight: bold; font-face: arial; font-size: 20px; text-shadow: 0px 0px 2px rgba(255,255,255,1);">2023</div>
<div>
</cfoutput>
</cfhtmltopdf>
<cfoutput><a href="id#firstname#_#lastname#.pdf" target="_blank">VIEW PDF ID</a></cfoutput>
<br /><br />
<button id="backbtn" name="backbtn" hx-get="ListStudents.cfm" hx-target="#viewport">Back to Student ID List</button>
<br /><br />
<cfoutput>
<div style="position: relative; width: 200px;  border: solid 1px black; border-radius: 15px 15px 15px 15px; background-color: ##666; text-align: center; color: white;">
    <div style="border-radius: 15px 15px 15px 15px; width: 100%; height: 100px; overflow: hidden; background-image: url(#imageLink#); background-size: 200px; background-position: center center; background-size: cover;">
        &nbsp;
    </div>
    <div style="border-top: solid 1px white; border-bottom: solid 1px white; font-size: 20px; font-weight: 300; width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: ###headercolor#;">#firstName# &nbsp; #lastName#</div>
    Age: #age#
    <br />
    Year: #year#
    <div style="border-top: solid 1px white; background: rgb(246,248,249);
background: -moz-linear-gradient(top,  rgba(246,248,249,1) 0%, rgba(229,235,238,1) 28%, rgba(215,222,227,1) 68%, rgba(245,247,249,1) 100%);
background: -webkit-linear-gradient(top,  rgba(246,248,249,1) 0%,rgba(229,235,238,1) 28%,rgba(215,222,227,1) 68%,rgba(245,247,249,1) 100%);
background: linear-gradient(to bottom,  rgba(246,248,249,1) 0%,rgba(229,235,238,1) 28%,rgba(215,222,227,1) 68%,rgba(245,247,249,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='##f6f8f9', endColorstr='##f5f7f9',GradientType=0 );
 font-size: 15px; color: red; border-radius: 0px 0px 15px 15px; padding-top: 80px; padding-bottom: 20px; font-family: 'Great Vibes', cursive; width: 100%; text-align: center;">
        Adobe State University
    </div>
    <div style="position: absolute; top: 5px; left: 10px;color: black; font-weight: bold; font-face: arial; font-size: 20px; text-shadow: 0px 0px 2px rgba(255,255,255,1);">2023</div>
<div>
</cfoutput>