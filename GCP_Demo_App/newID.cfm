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
    db = getCloudService(gcpCred, config);
    return db;
}
function getStorageHandle(){
    gcpCred  = {
        "projectId" : "gcpcoldfusion",
        "credentialJsonFilePath" : "C:\ProjectFortuna\cfusion\wwwroot\GCPdemo\gcpcoldfusion-c70a0cbf1caa.json"
    };
    gcpConf  = {
        "alias" : "conf",
        "serviceName" : "STORAGE"
    }; 
    storage = getCloudService(gcpCred, gcpConf);
    return storage;
}
function uploadPicture(){
    storageObj = getStorageHandle();   
	bucketObj = storageObj.bucket("cfsummitbucketdemo");
	srcFile1 = #FORM.picture#;
	key1 = "studentids/" & FORM.filename;	
	returnStruct = bucketObj.uploadfile(srcFile1, key1);
	//writeDump(bucketObj.getObjectDetails(key1)); 
    imagelink = returnStruct.response.mediaLink;
}
function createStudent(uniqueID, firstName, lastName, age, year, imagelink){
    student = ${
        "uniqueID": uniqueID,
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "year": year,
        "imagelink": imagelink
    }
    return student;
}

function checkFormValues(){
    errorText="";
    if(NOT isDefined(FORM.firstname) AND FORM.firstname == ""){
        errorText = errorText & "Please include first name.<br />";
    }
    if(NOT isDefined(FORM.lastname) AND FORM.lastname == ""){
        errorText = errorText & "Please include last name.<br />";
    }
    if(NOT isDefined(FORM.age) AND FORM.age == ""){
        errorText = errorText & "Please include age.<br />";
    }
    if(NOT isDefined(FORM.filename) AND FORM.filename == ""){
        errorText = errorText & "Please include picture.<br />";
    }
    if (errorText == ""){
        return true;
    }
    else {
        return false;
    }
}
validForm = checkFormValues(); // Check for blank form submit.
if(validForm){
uploadPicture();

// initialize
db = getFirestoreHandle();

// create data record
uniqueID = CreateUUID();
student = createStudent(uniqueID, #FORM.firstname#,#FORM.lastname#,#FORM.age#,#FORM.year#,imagelink);

// add data to firestore
students = db.collection("student_ids");
bulk = db.batch()
.set(students.document("#uniqueID#"), student)
.commit();
writeOutput("Record created for student " & #FORM.firstname#);
}
else {
    writeOutput(errorText);
}

</cfscript>
<cflocation url="ListStudents.cfm" addToken="no" />