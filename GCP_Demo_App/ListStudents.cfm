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
function listStudents(){
    getFirestoreHandle();
    db = getCloudService(gcpCred, config);
    collectionArray = db.collection("student_ids").runQuery().get();
    
    for(student in collectionArray.getDocuments()){
        writeOutput("<tr>");
        writeOutput("<td><img style='width: 75px; border-radius: 3px; border: solid 1px grey;' src='" & student.getData().imagelink & "' /></td>");
        writeOutput("<td>" & student.getData().firstName & " " & student.getData().lastName & "</td>");
        writeOutput("<td>" & student.getData().age & "</td>");
        writeOutput("<td>" & student.getData().year & "</td>");
        writeOutput("<td><form name='aform' id='aform'><input type='hidden' name='uniqueID' value='" & student.getData().uniqueID & "' /><button hx-post='editStudent.cfm' hx-target='##viewport'>EDIT</button></form></td>");
        writeOutput("<td><form name='aform' id='aform'><input type='hidden' name='uniqueID' value='" & student.getData().uniqueID & "' /><button hx-post='viewID.cfm' hx-target='##viewport'>VIEW ID</button></form></td>")
    }
}

</cfscript>
<table class="table table-compact" id="studenttable">
    <thead>
    <tr>
        <th>Picture</th>
        <th>Student Name</th>
        <th>Year</th>
        <th>Age</th>
        <th>Edit</th>
        <th>View</th>
    </tr>
    </thead>
    <tbody>
    <cfscript>
        listStudents();
    </cfscript>
    </tbody>
</table>

<script>
    table = new DataTable('#studenttable');
</script>