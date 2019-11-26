/**
 * Created by BRITENET on 22.11.2019.
 */

public with sharing class HMS_EventHandler {

    public static HttpRequest getRequest(String requestBody) {
            HttpRequest request = new HttpRequest();
            request.setMethod('POST');
            request.setEndpoint(HMS_Utils.getCustomSettingValue('EventEndpoint'));
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            if (requestBody != null) {
                request.setBody(requestBody);
            }
            return request;
        }

        public static HttpResponse saveEventCallout(HMS_EventLoggerWrapper eventLoggerWrapper) {
            HttpRequest request = getRequest(eventLoggerWrapper.serializeObject());
            HttpResponse response = new Http().send(request);
            return response;
        }

        public static void saveEvent( String parentId, String endpointUrl, String method, String requestBody, Integer responseStatusCode, String responseStatus, String responseBody){
            HMS_EventLoggerWrapper eventLoggerWrapper = new HMS_EventLoggerWrapper(Date.today(), parentId, endpointUrl, method, requestBody, responseStatusCode, responseStatus, responseBody);
            saveEventCallout(eventLoggerWrapper);
        }
}
