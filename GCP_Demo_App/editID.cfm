<cfscript>
function printMsg(string msg) {
    writeOutput(msg)
    writeOutput("<br>")
}
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
    if(isDefined("FORM.picture") AND FORM.picture NEQ ""){
        storageObj = getStorageHandle();   
        bucketObj = storageObj.bucket("cfsummitbucketdemo");
        srcFile1 = #FORM.picture#;
        key1 = "studentids/" & FORM.filename;	
        returnStruct = bucketObj.uploadfile(srcFile1, key1);
        imagelink = returnStruct.response.mediaLink;
    }
    else {
        imagelink = FORM.filename;
    }
}
function editStudent(uniqueID, firstName, lastName, age, year, imagelink){
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
    if(NOT isDefined("FORM.firstname") AND FORM.firstname == ""){
        errorText = errorText & "Please include first name.<br />";
    }
    if(NOT isDefined("FORM.lastname") AND FORM.lastname == ""){
        errorText = errorText & "Please include last name.<br />";
    }
    if(NOT isDefined("FORM.age") AND FORM.age == ""){
        errorText = errorText & "Please include age.<br />";
    }
    if(NOT isDefined("FORM.filename") AND FORM.filename == ""){
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

// create data record for editing
student = editStudent(#FORM.uniqueID#,#FORM.firstname#,#FORM.lastname#,#FORM.age#,#FORM.year#,imagelink);

// update data to firestore
uniqueIDvalue = FORM.uniqueID;
studentToUpdate = db.collection("student_ids").document(uniqueIDvalue);
studentToUpdate.update(student).get();

}
else {
    writeOutput(errorText);
}
// Add Pub/Sub for edit msg
messagingSvc = getCloudService(session.gcpCred, session.pubsubConfig);
// Create Topic
topic = messagingSvc.createTopic(session.topicName);
// Create Subscription
subscription = topic.subscribe(session.subName);
// Create snapshot
snapshotMetadata = {
		snapshotName: session.snapshotName,
		subscriptionName: session.subName
	}
snapshot = messagingSvc.createSnapshot(snapshotMetadata);

// Create data for log
loggingdata = "'UI':'" & #FORM.uniqueID# & "','FirstName': '" & #FORM.firstname# & "',LastName:'" & #FORM.lastname# & "','age':'" & #FORM.age# & "','year':'" & #FORM.year# & "','imagelink':'" & imagelink & "'";


messageMetadata = {
			data: loggingdata
	}
// Send Pub log on edit
	msgResponse = topic.publish(messageMetadata)
writeOutput("Edit has been logged with the following data:<br />");
pullMessageMetadata = {
    maxMessages: 100
}
pullMsgResponse = subscription.pullMessages(pullMessageMetadata)
ackIds = arrayNew(1);
for(message in pullMsgResponse.messages) {
    ackId = message.ackId
    ackIds.append(ackId)
    printMsg("<b>Ack Id: </b>" & ackId)
    printMsg("<b>Message Id: </b>" & message.messageId)
    printMsg("<b>Message data: </b>" & message.data)
    printMsg("<b>Message published time: </b>" & message.publishTime)
}
</cfscript>
<button type="button" class="btn btn-success" hx-get="ListStudents.cfm" hx-target="#viewport">BACK TO STUDENT LIST</button>