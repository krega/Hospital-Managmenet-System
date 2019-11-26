@RestResource(urlMapping = '/Event/*')
global with sharing class   HMS_EventLoggerService {

    @HttpPost
    global static void logEvent(Date eventDate, String parentId, String endpointUrl, String method, String requestBody, Integer responseStatusCode, String responseStatus, String responseBody) {
        HMS_EventLogger__c eventLogger = new HMS_EventLogger__c(Name = method+ ' ' + String.valueOf(eventDate) ,EventDate__c = eventDate, ParentId__c = parentId, EndPointUrl__c = endpointUrl, Method__c = method, RequestBody__c = requestBody,	ResponseStatusCode__c = responseStatusCode,	ResponseStatus__c=responseStatus, ResponseBody__c = responseBody);
        Database.insert(eventLogger);
    }
}

