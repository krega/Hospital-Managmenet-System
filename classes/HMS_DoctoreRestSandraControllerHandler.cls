public with sharing class HMS_DoctoreRestSandraControllerHandler {

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

  public static String getEndpoint( String params) {
      if (params != null) {
            return HMS_Utils.getCustomSettingValue('endpoint') + '?' + params;
        }
        return HMS_Utils.getCustomSettingValue('endpoint');
    }

    public static String serializeMapToString(Map<String, String> paramsMap) {
        String output;
        for (String parameterValue : paramsMap.keySet()) {
            output = output + '&' + parameterValue + '=' + paramsMap.get(parameterValue);
        }
        return output;
    }

    public static String getSerializedParametersMap(String firstName, String lastName, String email, String country) {
        Map<String, String> paramsMap = new Map<String, String>();
        paramsMap.put('firstName', firstName);
        paramsMap.put('lastName', lastName);
        paramsMap.put('country', country);
        return serializeMapToString(paramsMap);
    }

    public static String buildPostRequestBody(HMS_DoctorRequestBodyWrapper doctor) {
        return doctor.getSerializedObjectPOST();
    }

    public static List<HMS_DoctorResponseWrapper> getDoctorsResponseWrappers(String responseBody) {
        List<HMS_DoctorWrapper> doctors = (List<HMS_DoctorWrapper>) JSON.deserialize(responseBody, List<HMS_DoctorWrapper>.class);
        List <HMS_DoctorResponseWrapper> doctorWrappers = convertToDoctorsResponseWrappers(doctors);
        return doctorWrappers;
    }

    public static List<HMS_DoctorResponseWrapper> convertToDoctorsResponseWrappers(List<HMS_DoctorWrapper> doctors) {
        List <HMS_DoctorResponseWrapper> doctorWrappers = new List <HMS_DoctorResponseWrapper>();
        for (HMS_DoctorWrapper doctor : doctors) {
            HMS_DoctorResponseWrapper doctorsResponseWrapper = new HMS_DoctorResponseWrapper(doctor.doctorId, doctor.doctorFirstName, doctor.doctorLastName, doctor.doctorCountry, doctor.doctorEmail);
            doctorWrappers.add(doctorsResponseWrapper);
        }
        return doctorWrappers;
    }

    public static HMS_WebServiceRespond saveNewDoctor( HMS_DoctorRequestBodyWrapper operationItem) {
        HttpResponse response = saveNewDoctorCallout(operationItem);
        return (HMS_WebServiceRespond) JSON.deserialize(response.getBody(), HMS_WebServiceRespond.class);
    }

    public static HttpResponse saveNewDoctorCallout( HMS_DoctorRequestBodyWrapper operationItem) {
        HttpRequest request = getRequest('POST',  null, buildPostRequestBody(operationItem));
        HttpResponse response = new Http().send(request);
        HMS_EventHandler.saveEvent(operationItem.id, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);

        if (HMS_LoginRestHandler.verifyEndpointAuthorization(response.getStatusCode() )) {
            request = getRequest('POST',  null,
                    buildPostRequestBody(operationItem));
            response = new Http().send(request);
            HMS_EventHandler.saveEvent(operationItem.id, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);
        }
        return response;
    }

    public static String buildPutRequestBody(HMS_DoctorRequestBodyWrapper doctor) {
        return doctor.getSerializedObjectPUT();
    }

    public static HMS_WebServiceRespond editDoctor( HMS_DoctorRequestBodyWrapper operationItem) {
        HttpResponse response = editDoctorCallout( operationItem);
        return (HMS_WebServiceRespond) JSON.deserialize(response.getBody(), HMS_WebServiceRespond.class);
    }

    public static HttpResponse editDoctorCallout( HMS_DoctorRequestBodyWrapper operationItem) {
        HttpRequest request = getRequest('PUT',  null, buildPutRequestBody(operationItem));
        HttpResponse response = new Http().send(request);
        HMS_EventHandler.saveEvent(operationItem.id, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);

        if (HMS_LoginRestHandler.verifyEndpointAuthorization(response.getStatusCode())) {
            request = getRequest('PUT',  null,
                    buildPutRequestBody(operationItem));
            response = new Http().send(request);
            HMS_EventHandler.saveEvent(operationItem.id, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);

        }
        return response;
    }
    public static List<HMS_DoctorResponseWrapper>   getDoctorCallout( String parameters) {
        HttpRequest request = getRequest('GET', parameters, null);
        HttpResponse response = new Http().send(request);
        HMS_EventHandler.saveEvent(null, getEndpoint(parameters), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);
        if (!HMS_LoginRestHandler.verifyEndpointAuthorization(response.getStatusCode() )) {
            request = getRequest('GET', parameters, null);
            response = new Http().send(request);
            HMS_EventHandler.saveEvent(null, getEndpoint(parameters), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);
        }
        if (response.getStatusCode() == 200) {
            return getDoctorsResponseWrappers(response.getBody());
        }
        return null;
    }

    public static List<HMS_DoctorResponseWrapper> getDoctor( String firstName, String lastName, String email, String country) {
        String parameters = getSerializedParametersMap(firstName, lastName, email, country);
        List<HMS_DoctorResponseWrapper> response = getDoctorCallout( parameters);
        return response;
    }

    public static HttpResponse deleteDoctorCallout( String doctorId, String externalId) {
        String isExternalId = (String.isBlank(externalId))?'':externalId;
        HttpRequest request = getRequest('DELETE',   'id=' + doctorId + '&externalId=' + isExternalId, null);
        HttpResponse response = new Http().send(request);
        HMS_EventHandler.saveEvent(doctorId, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(),response.getBody(), 1);

        if (HMS_LoginRestHandler.verifyEndpointAuthorization(response.getStatusCode() )) {
            request = getRequest('DELETE',   'id=' + doctorId + '&externalId=' + isExternalId, null);
            response = new Http().send(request);

            HMS_EventHandler.saveEvent(doctorId, getEndpoint(null), request.getMethod(), request.getBody(), response.getStatusCode(), response.getStatus(), response.getBody(), 1);

        }
        return response;
    }

    public static HMS_WebServiceRespond deleteDoctor( String doctorId, String externalId) {
        HttpResponse response = deleteDoctorCallout( doctorId, externalId);
        return (HMS_WebServiceRespond) JSON.deserialize(response.getBody(), HMS_WebServiceRespond.class);
    }

}