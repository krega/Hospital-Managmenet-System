global class HMS_DoctorBatch implements Database.Batchable<sObject>, Database.Stateful,Database.AllowsCallouts {

    global List<HMS_EventLogger__c> eventLoggers { get; set; }
    global String[] email = new String[]{
            UserInfo.getUserEmail()
    };
    global Database.QueryLocator start(Database.BatchableContext batchableContext) {
        String query = 'SELECT Id, ParentId__c, EndPointUrl__c, RequestBody__c, ResponseBody__c, ResponseStatus__c, ResponseStatusCode__c, Method__c, Attempts__c, IsSuccess__c FROM HMS_EventLogger__c ';
        query += 'WHERE Attempts__c < 3 AND IsSuccess__c = FALSE';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext batchableContext, List<SObject> scope) {
        String sessionId   =HMS_LoginRestHandler.getAccessTokenToEndpoint();
        for (HMS_EventLogger__c eventLogger : (List<HMS_EventLogger__c>)scope) {
            HMS_DoctorBatchHelper.setRequest( eventLogger,   sessionId);
        }
        update scope;
        eventLoggers = (List<HMS_EventLogger__c>)scope;
    }

    global void finish(Database.BatchableContext batchableContext) {
        eventLoggers = HMS_DoctorBatchHelper.checkEventLoggers(eventLoggers);
        if(!eventLoggers.isEmpty()){
      /*  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(email);
        mail.setSenderDisplayName(System.Label.HMS_Email_Author);
        mail.setSubject(System.Label.HMS_EmailSubjectDoctorBatch);
        mail.setPlainTextBody(HMS_DoctorBatchHelper.buildEmailMessage(eventLoggers));
        Messaging.sendEmail(new Messaging.SingleEmailMessage [] {mail});*/
            System.debug(eventLoggers);
            eventLoggers.clear();
        }
    }
}

