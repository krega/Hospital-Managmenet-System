@RestResource(urlMapping = '/Event/*')
global with sharing class   HMS_EventLoggerService {

    @HttpPost

    global static void logEvent(String parentId, String endpointUrl, String method, String requestBody, Integer responseStatusCode, String responseStatus, String responseBody, Integer attemps){
        HMS_EventLogger__c eventLogger = new HMS_EventLogger__c(Name = method + ' ' + String.valueOf(Date.today()),EventDate__c = Date.today(), ParentId__c = parentId, EndPointUrl__c = endpointUrl, Method__c = method, RequestBody__c = requestBody, ResponseStatus__c = responseStatus, ResponseStatusCode__c = responseStatusCode, ResponseBody__c = responseBody, Attempts__c = attemps);
        Database.insert(eventLogger);
    }
}


