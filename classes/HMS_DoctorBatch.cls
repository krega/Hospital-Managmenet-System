global class HMS_DoctorBatch implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {

    global List<HMS_EventLogger__c> eventLoggers { get; set; }
    global String[] email = new String[]{
            UserInfo.getUserEmail()
    };

    global Database.QueryLocator start(Database.BatchableContext batchableContext) {
        HMS_DoctorBatchHelper.clearOldRecords();
        String query = 'SELECT Id, ParentId__c, EndPointUrl__c, RequestBody__c, ResponseBody__c, ResponseStatus__c, ResponseStatusCode__c, Method__c, Attempts__c, IsSuccess__c FROM HMS_EventLogger__c';
        query += ' WHERE Attempts__c < 3 AND IsSuccess__c = FALSE';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext batchableContext, List<HMS_EventLogger__c> scope) {
        String sessionId = HMS_LoginRestHandler.getAccessTokenToEndpoint();
        for (HMS_EventLogger__c eventLogger : scope) {
            HttpResponse response = HMS_DoctorBatchHelper.sendRequest(eventLogger, sessionId);
            eventLogger.Attempts__c += 1;
            eventLogger.ResponseBody__c = response.getBody();
            eventLogger.ResponseStatus__c = response.getStatus();
            eventLogger.ResponseStatusCode__c = response.getStatusCode();
            HMS_EventHandler.saveEvent(eventLogger.ParentId__c, eventLogger.EndPointUrl__c, eventLogger.Method__c, eventLogger.RequestBody__c, response.getStatusCode(), response.getStatus(), response.getBody(), (Integer) eventLogger.Attempts__c);
        }
        eventLoggers = scope;
    }

    global void finish(Database.BatchableContext batchableContext) {
        eventLoggers = HMS_DoctorBatchHelper.checkEventLoggers(eventLoggers);
        if (!eventLoggers.isEmpty()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(email);
            mail.setSenderDisplayName(System.Label.HMS_Email_Author);
            mail.setSubject(System.Label.HMS_EmailSubjectDoctorBatch);
            mail.setPlainTextBody(HMS_DoctorBatchHelper.buildEmailMessage(eventLoggers));
            Messaging.sendEmail(new Messaging.SingleEmailMessage [] {mail});
        }
    }
}






