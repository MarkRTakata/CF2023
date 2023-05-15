<cfscript>
    function getFirestoreHandle(){
            gcpCred = {
            projectId : "PROJECT_ID",
            credentialJsonFilePath : "PATH_TO_CREDENTIALS"
        };
            
        config = {
            "alias" = "test",
            "serviceName" = "FIRESTORE"
        };
        db = getCloudService(gcpCred, config);
        return db;
    }
    

    function createStudent(firstName, lastName, age, gender, email, entryYear){
        student = ${
            "firstName": firstName,
            "lastName": lastName,
            "age": age,
            "gender": gender,
            "email": email,
            "entryYear": entryYear
        }
        return student;
    }
</cfscript>