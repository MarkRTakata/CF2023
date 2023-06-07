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
    function createStudent(firstName, lastName, email, year, imagelink){
        student = ${
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "year": year,
            "year": imagelink
        }
        return student;
    }
</cfscript>