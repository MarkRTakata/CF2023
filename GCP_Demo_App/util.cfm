<cfscript>
    function getFirestoreHandle(){
            gcpCred = {
            projectId : "gcpcoldfusion",
            credentialJsonFilePath : "PATH_TO_LOCAL_GCP_SERVICE_CREDENTIALS"
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
