/**
 * Created by BRITENET on 17.11.2019.
 */
@RestResource(urlMapping = '/Doctors/*')
global with sharing class HMS_DoctorRestService {

    @HttpGet
    global static List<HMS_DoctorServiceWrapper> getDoctors(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        Map<String,String> parameters = request.params;
        Map<String, Schema.SObjectField> objectsTypes = Schema.getGlobalDescribe().get('HMS_Doctor__c').getDescribe().fields.getMap();
        String query = 'SELECT LastName__c, Name, Country__c, Email__c FROM HMS_Doctor__c  WHERE ';
        Set<String> queryParameters = new Set<String>();
        for (String field : objectsTypes.keySet()){
            for (String param : parameters.keySet()){
                if(objectsTypes.get(field).getDescribe().label.toLowerCase().contains(param.toLowerCase())){
                    if (objectsTypes.get(field).getDescribe().getType() == DisplayType.STRING || objectsTypes.get(field).getDescribe().getType() == DisplayType.EMAIL || objectsTypes.get(field).getDescribe().getType() == DisplayType.URL) {
                        queryParameters.add(objectsTypes.get(field).getDescribe().name+' LIKE \''+parameters.get(param)+'%\'');
                    }else if(objectsTypes.get(field).getDescribe().getType() == DisplayType.PHONE){
                        queryParameters.add(objectsTypes.get(field).getDescribe().name+' LIKE \'+'+parameters.get(param).trim()+'%\'');
                    }
                    else{
                        queryParameters.add(objectsTypes.get(field).getDescribe().name+' = \''+parameters.get(param)+'\'');
                    }
                }
            }
        }
        query += String.join((Iterable<String>)queryParameters,' AND ');
        List<HMS_Doctor__c> doctors = Database.query(query);
        System.debug(Database.query(query));
        List<HMS_DoctorServiceWrapper> doctorsResponseWrappers = HMS_DoctorServiceHelper.convertDoctorsToDoctorsServiceWrapper(doctors);
        return doctorsResponseWrappers;
    }

    @HttpPost
    global static HMS_WebServiceRespond createDoctor(String firstName, String lastName, String email, String country, String street, String city,String externalId) {
        try {
            HMS_WebServiceRespond webServiceResponse = HMS_DoctorServiceHelper.upsertDoctor(null, firstName, lastName, email, country, street, city,  externalId);
            return webServiceResponse;
        } catch (Exception e) {
            HMS_WebServiceRespond webServiceResponse = new HMS_WebServiceRespond(null, false, e.getMessage());
            return webServiceResponse;
        }
    }


    @HttpPut
    global static HMS_WebServiceRespond updateDoctor(String id, String firstName, String lastName, String email, String country, String street, String city,String externalId) {
        try {
            HMS_WebServiceRespond webServiceResponse = HMS_DoctorServiceHelper.upsertDoctor(id, firstName, lastName, email, country, street, city, externalId);
            return webServiceResponse;
        } catch (Exception e) {
            HMS_WebServiceRespond webServiceResponse = new HMS_WebServiceRespond(null, false, e.getMessage());
            return webServiceResponse;
        }
    }


    @HttpDelete
    global static HMS_WebServiceRespond deleteDoctor() {
        RestRequest request = RestContext.request;
        String doctorId = request.params.get('id');
        String externalId = request.params.get('externalId');
        if (String.isBlank(doctorId)) {
            return null;
        } else {
            try {
                HMS_Doctor__c doctor;
                if(String.isBlank(externalId) ){
                  doctor = new HMS_Doctor__c(Id = doctorId);
                    System.debug(doctor);
                }
                else{
                    doctor = [SELECT Id from HMS_Doctor__c WHERE ExternalDoctorId__c= :externalId];
                    if(doctor == null){
                        doctor = new HMS_Doctor__c(Id = doctorId);
                    }
                }

                Database.DeleteResult result = Database.delete(doctor);
                HMS_WebServiceRespond webServiceResponse = new HMS_WebServiceRespond(doctorId, result.isSuccess(), result.isSuccess() ? '' : result.getErrors()[0].getMessage());
                return webServiceResponse;
            } catch (Exception e) {
                HMS_WebServiceRespond webServiceResponse = new HMS_WebServiceRespond(null, false, e.getMessage());
                return webServiceResponse;
            }
        }
    }


}