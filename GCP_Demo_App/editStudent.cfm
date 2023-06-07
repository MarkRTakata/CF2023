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
</cfscript>
<script type="text/javascript">
    function PassFileName()
        {
            document.getElementById("filename").value=document.getElementById("picture").files[0].name;
        }
    </script>
<form name="editStudent" id="editStudent" hx-encoding="multipart/form-data">
<input type="hidden" id="filename" value="<cfoutput>#variables.imageLink#</cfoutput>" size="100" name="filename" />
<input type="hidden" id="uniqueID" name="uniqueID" value="<cfoutput>#FORM.uniqueID#</cfoutput>" />
    <label for="firstname">First Name</label><br />
    <input type="text" value="<cfoutput>#variables.firstName#</cfoutput>" name="firstname" id="firstname" class="form-control" />
    <br />
    <label for="lastname">Last Name</label><br />
    <input type="text" value="<cfoutput>#variables.lastName#</cfoutput>" name="lastname" id="lastname" class="form-control" />
    <br />
    <label for="email">Age</label><br />
    <input type="number" value="<cfoutput>#variables.age#</cfoutput>" name="age" id="age" class="form-control" />
    <br />
    <label for="year">Year</label><br />
    <select name="year" id="year" class="form-control">
        <option value="Freshman" <cfif variables.year EQ "Freshman"> selected</cfif>>Freshman</option>
        <option value="Sophmore" <cfif variables.year EQ "Sophmore"> selected</cfif>>Sophmore</option>
        <option value="Junior" <cfif variables.year EQ "Junior"> selected</cfif>>Junior</option>
        <option value="Senior" <cfif variables.year EQ "Senior"> selected</cfif>>Senior</option>
    </select>
    <br />
    <label for="year">Choose New Photo (leave blank to keep current image)</label><br />
    <input type="file" name="picture" id="picture" onchange="PassFileName()" />
    <br /><br />
    <img src="<cfoutput>#variables.imageLink#</cfoutput>" style="width: 75px;" /><br />
    <span style="font-size: 10px">(current photo)</span>
    <br /><br />
    <button type="button" hx-post="editID.cfm" hx-target="#viewport" class="btn btn-success btn-sm" name="getcountbtn" id="getcountbtn">Save ID</button>
    
</form>