/**
 * Created by BRITENET on 21.11.2019.
 */

public with sharing class HMS_CalloutInsert implements Queueable,Database.AllowsCallouts{

    public List<HMS_DoctorRequestBodyWrapper> doctors;
    public String method;

    public HMS_CalloutInsert(List<HMS_DoctorRequestBodyWrapper> doctors, String method){
        this.doctors = doctors;
        this.method = method;
    }

    public void execute(QueueableContext context){
        if(method.equals('POST')){
            for(HMS_DoctorRequestBodyWrapper doctor: doctors) {
                HMS_WebServiceRespond webServiceResponse = HMS_DoctoreRestSandraControllerHandler.saveNewDoctor(doctor);
                if (webServiceResponse.success) {
                    HMS_Utils.disableTrigger(HMS_Doctor__c.sObjectType);
                }
            }
        }else if(method.equals('PUT')){
            for(HMS_DoctorRequestBodyWrapper doctor: doctors) {
                HMS_WebServiceRespond webServiceResponse = HMS_DoctoreRestSandraControllerHandler.editDoctor(doctor);
                if (webServiceResponse.success) {
                     HMS_Utils.disableTrigger(HMS_Doctor__c.sObjectType);
                }
            }
        }else if(method.equals('DELETE')){
            for(HMS_DoctorRequestBodyWrapper doctor: doctors) {
                HMS_WebServiceRespond webServiceResponse = HMS_DoctoreRestSandraControllerHandler.deleteDoctor(doctor.id, doctor.externalId);
                if (webServiceResponse.success) {
                   HMS_Utils.disableTrigger(HMS_Doctor__c.sObjectType);
                }
            }
        }
    }
}