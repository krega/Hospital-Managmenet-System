public with sharing class HMS_DoctorBatchHelper {

    public static HttpResponse sendRequest(HMS_EventLogger__c eventLogger, String sessionId) {
        HttpRequest request = new HttpRequest();
        request.setMethod(eventLogger.Method__c);
        request.setEndpoint(eventLogger.EndPointUrl__c);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', sessionId);
        request.setBody(eventLogger.RequestBody__c);
        HttpResponse response = new Http().send(request);
        return response;
    }

    public static List<HMS_EventLogger__c> checkEventLoggers(List<HMS_EventLogger__c> eventLoggers) {
        if (eventLoggers != null && !eventLoggers.isEmpty()) {
            List<HMS_EventLogger__c> newEventLoggers = new List<HMS_EventLogger__c>();
            for (HMS_EventLogger__c eventLogger : eventLoggers) {
                if (eventLogger.Attempts__c == 3 && eventLogger.IsSuccess__c == false) {
                    newEventLoggers.add(eventLogger);
                }
            }
            return newEventLoggers;
        } else {
            return null;
        }
    }

    public static List<HMS_EventLogger__c> getErrorLogs() {
        List<HMS_EventLogger__c> eventLoggers = [SELECT Id, ParentId__c, EndPointUrl__c, RequestBody__c, ResponseBody__c, ResponseStatus__c, ResponseStatusCode__c, Method__c, Attempts__c, IsSuccess__c FROM HMS_EventLogger__c WHERE Attempts__c < 3 AND IsSuccess__c = FALSE];
        return eventLoggers;
    }

    public static List<HMS_EventLogger__c> getSuccessOrInvalidatedLogs() {
        List<HMS_EventLogger__c> eventLoggers = [SELECT Id, ParentId__c, EndPointUrl__c, RequestBody__c, ResponseBody__c, ResponseStatus__c, ResponseStatusCode__c, Method__c, Attempts__c, IsSuccess__c FROM HMS_EventLogger__c WHERE Attempts__c >= 3 OR IsSuccess__c = TRUE];
        return eventLoggers;
    }

    public static Boolean compareProperty(String first, String second) {
        if (first == null && second == null) {
            return true;
        } else if (first != null && second != null) {
            return first.equals(second);
        } else return false;
    }

    public static String buildEmailMessage(List<HMS_EventLogger__c> eventLoggers) {
        String emailBody = System.Label.HMS_EmailBody + '\n';
        for (HMS_EventLogger__c eventLogger : eventLoggers) {
            emailBody += System.Label.HMS_Object_ID_Rest + System.Label.HMS_colon + eventLogger.ParentId__c + System.Label.HMS_semicolon ;
            emailBody += '\n';
            emailBody += System.Label.HMS_Method_Rest + System.Label.HMS_colon + eventLogger.Method__c + System.Label.HMS_semicolon;
            emailBody += '\n';
            emailBody += System.Label.HMS_Endpoint_rest + System.Label.HMS_colon + eventLogger.EndPointUrl__c + System.Label.HMS_semicolon;
            emailBody += '\n';
            emailBody += System.Label.HMS_Request_Rest + System.Label.HMS_colon + eventLogger.RequestBody__c + System.Label.HMS_semicolon;
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Body_Rest + System.Label.HMS_colon + eventLogger.ResponseBody__c + System.Label.HMS_semicolon;
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Status_Rest + System.Label.HMS_colon + eventLogger.ResponseStatus__c + System.Label.HMS_semicolon;
            emailBody += '\n';
            emailBody += System.Label.HMS_Response_Status_Code_Rest + System.Label.HMS_colon + eventLogger.ResponseStatus__c + System.Label.HMS_semicolon;
            emailBody += '\n';
        }
        return emailBody;
    }

    public static Boolean compareEventLogger(HMS_EventLogger__c error, HMS_EventLogger__c invalid) {
        return compareProperty(error.ParentId__c, invalid.ParentId__c) &&
                compareProperty(error.EndPointUrl__c, invalid.EndPointUrl__c) &&
                compareProperty(error.RequestBody__c, invalid.RequestBody__c) &&
                compareProperty(error.Method__c, invalid.Method__c);
    }

    public static List<HMS_EventLogger__c> getRepeats(List<HMS_EventLogger__c> errors, List<HMS_EventLogger__c> invalids) {
        List<HMS_EventLogger__c> eventLoggers = new List<HMS_EventLogger__c>();
        if (errors != null && invalids != null) {
            for (HMS_EventLogger__c error : errors) {
                for (HMS_EventLogger__c invalid : invalids) {
                    if (compareEventLogger(error, invalid) && !eventLoggers.contains(error)) {
                        eventLoggers.add(error);
                    }
                }
            }
            return eventLoggers;
        }
        return null;
    }

    public static void clearOldRecords() {
        List<HMS_EventLogger__c> eventLoggers = getRepeats(getErrorLogs(), getSuccessOrInvalidatedLogs());
        delete eventLoggers;
    }
}





