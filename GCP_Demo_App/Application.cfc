component {
	this.name = "gcp-demo-app";
	this.sessionManagement = true;
	void function onRequestStart(){
		session.pubsubConfig = {
					serviceName: "PUBSUB"
		}
	session.gcpCred = {
		alias: "GCPCred",
		vendorName: "GCP",
		projectId: "gcpcoldfusion",
		credentialJSONFilePath: "PATH_TO_CREDENTIALS_FOR_GCP_SERVICE_ACCOUNT"
	};
	session.topicName = "StudentLogTopic#CreateUUID()#"
	session.subName = "StudentLogSubscription#CreateUUID()#"
	session.snapshotName = "StudentLogSnapshot#CreateUUID()#"
}
}