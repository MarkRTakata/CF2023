<cfinclude template="util.cfm">
<cfscript>
    db = getFirestoreHandle();

    // create some data to add to firestore
    patrik = createStudent("patrik","viera",22,"male","patrik@uni.com",2020);
    kate = createStudent("kate","abdo",23,"female","kate@uni.com",2019);
    preethi = createStudent("preethi","sharma",20,"female","preet@uni.com",2021);

    // add data to firestore
    students = db.collection("students_demo");
    bulk = db.batch()
    .set(students.document("patrik"), patrik)
    .set(students.document("kate"), kate)
    .set(students.document("preethi"), preethi)
    .commit();

    fileHandle = fileOpen(ExpandPath("./results.txt"), "write");

    // Async way of querying for students who joined after 2020
    bulk
    .then(response => {
        results = students.whereGreaterThan("entryYear", 2020).runQuery().get();
        fileappend(fileHandle, serialize(results.getDocuments(),"json"));
        fileClose(fileHandle);    
    })
    .error(ex => {
        fileappend(fileHandle,ex.getMessage());
        fileClose(fileHandle);
    })

    // Sync querying
    results = students.whereEqualTo("gender", "male").runQuery().get().getDocuments();
    writeDump(serialize(results,"json"));
</cfscript>