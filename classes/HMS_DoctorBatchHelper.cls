public with sharing class HMS_DoctorBatchHelper {
    public static List<HMS_EventLogger__c> checkEventLoggers(List<HMS_EventLogger__c> eventLoggers) {
        List<HMS_EventLogger__c> newEventLoggers = new List<HMS_EventLogger__c>();
        for (HMS_EventLogger__c eventLogger : eventLoggers) {
            if (eventLogger.Attempts__c == 3 && eventLogger.IsSuccess__c == false) {
                newEventLoggers.add(eventLogger);
            }
        }
        return newEventLoggers;
    }
    public static void setRequest(HMS_EventLogger__c eventLogger, String sessionId){
        eventLogger.Attempts__c += 1;
        HttpRequest request = new HttpRequest();
        request.setMethod(eventLogger.Method__c);
        request.setEndpoint(eventLogger.EndPointUrl__c);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', sessionId);
        request.setBody(eventLogger.RequestBody__c);
        HttpResponse response = new Http().send(request);
        eventLogger.ResponseBody__c = response.getBody();
        eventLogger.ResponseStatus__c = response.getStatus();
        eventLogger.ResponseStatusCode__c = response.getStatusCode();
    }
    public static String buildEmailMessage(List<HMS_EventLogger__c> eventLoggers){
        String emailBody = System.Label.HMS_EmailBody + '\n';
        for(HMS_EventLogger__c eventLogger : eventLoggers){
            emailBody += System.Label.HMS_Object_ID_Rest + System.Label.HMS_colon +eventLogger.ParentId__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Method_Rest + System.Label.HMS_colon + eventLogger.Method__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Endpoint_rest   +  System.Label.HMS_colon + eventLogger.EndPointUrl__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Request_Rest  + System.Label.HMS_colon + eventLogger.RequestBody__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Body_Rest  + System.Label.HMS_colon +  eventLogger.ResponseBody__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Status_Rest + System.Label.HMS_colon +  eventLogger.ResponseStatus__c + '; ';
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Status_Code_Rest  + System.Label.HMS_colon + eventLogger.ResponseStatus__c + '; ';
            emailBody += '\n';
        }
        return emailBody;
    }

}