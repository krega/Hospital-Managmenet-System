
public with sharing class HMS_CountriesRestHandler {

    public static String getEndpoint(String params) {
        if (params != null) {
            return HMS_Utils.getCustomSettingValue('countries') + '?' + params;
        }
        return HMS_Utils.getCustomSettingValue('countries');
    }

    public static HttpRequest getRequest(String method, String endpointParams, String requestBody) {
        HttpRequest request = new HttpRequest();
        request.setMethod(method);
        request.setEndpoint(getEndpoint(endpointParams));
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Authorization', HMS_LoginRestHandler.getAccessTokenToEndpoint());
        if (requestBody != null) {
            request.setBody(requestBody);
        }
        return request;
    }

    public static List<String> getListOfCountriesStrings() {
        HttpRequest request = getRequest('GET',  null, null);
        HttpResponse response = new Http().send(request);


        HMS_EventHandler.saveEvent(null, getEndpoint(null),request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);

        if (!HMS_LoginRestHandler.verifyEndpointAuthorization(response.getStatusCode())) {
            response = new Http().send(request);
            HMS_EventHandler.saveEvent(null, getEndpoint(null),request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);
        }
        if (response.getStatusCode() == 200) {
            Cache.Org.put('countries', (List<String>) JSON.deserialize(response.getBody(),List<String>.class));
            return (List<String>) Cache.Org.get('countries');
        }
        return null;
    }

    public static List<SelectOption> getCountriesSelectOptions(){
        List<String> countries = new List<String>();
        if( Cache.Org.get('countries') == null){
            countries= getListOfCountriesStrings();
        } else {
            countries=  (List<String>)Cache.Org.get('countries');
        }
        List<SelectOption> options = new List<SelectOption>();
        for(String country : countries){
            options.add(new SelectOption(country, country));
        }
        return options;
    }
}