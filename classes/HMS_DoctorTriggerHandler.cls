/**
 * Created by BRITENET on 21.11.2019.
 */

public with sharing class HMS_DoctorTriggerHandler implements HMS_ITrigger{

    public List<HMS_DoctorRequestBodyWrapper> convertToFormDoctors(List<HMS_Doctor__c> doctors){
        List<HMS_DoctorRequestBodyWrapper> doctorFormSandras = new List<HMS_DoctorRequestBodyWrapper>();
        for (HMS_Doctor__c doctor : doctors){
            HMS_DoctorRequestBodyWrapper doc = new HMS_DoctorRequestBodyWrapper(doctor.id, doctor.Name, doctor.LastName__c, doctor.Email__c, doctor.Country__c, doctor.Street__c, doctor.City__c, doctor.ExternalDoctorId__c);
            doctorFormSandras.add(doc);
        }
        return doctorFormSandras;
    }

    public Boolean checkAllExternalIdsNull(List<HMS_Doctor__c> doctors){
        for(HMS_Doctor__c doctor : doctors){
            if(!String.isBlank(doctor.ExternalDoctorId__c)){
                return false;
            }
        }
        return true;
    }

    public List<HMS_DoctorRequestBodyWrapper> setExternalId(List<HMS_DoctorRequestBodyWrapper> doctors){
        for(HMS_DoctorRequestBodyWrapper doctor : doctors){
            doctor.externalId = doctor.id;
        }
        return doctors;
    }

    public void beforeInsertOrUpdate(List<SObject> newSObjects){

    }

    public void afterInsert(List<SObject> newSObjects) {
        if(checkAllExternalIdsNull(newSObjects)){
            List<HMS_DoctorRequestBodyWrapper> doctorsToInsert = convertToFormDoctors(newSObjects);
            doctorsToInsert = setExternalId(doctorsToInsert);
            System.enqueueJob(new HMS_CalloutInsert(doctorsToInsert, 'POST'));
        }
    }

    public void afterUpdate(List<SObject> newSObjects){
        if(checkAllExternalIdsNull(newSObjects)){
            List<HMS_DoctorRequestBodyWrapper> doctorsToInsert = convertToFormDoctors(newSObjects);
            doctorsToInsert = setExternalId(doctorsToInsert);
            System.enqueueJob(new HMS_CalloutInsert(doctorsToInsert, 'PUT'));
        }
    }


    public void afterDelete(List<SObject> oldSObjects) {
        if (checkAllExternalIdsNull(oldSObjects)) {
        List<HMS_DoctorRequestBodyWrapper> doctorsToInsert = convertToFormDoctors(oldSObjects);
        doctorsToInsert = setExternalId(doctorsToInsert);
        System.enqueueJob(new HMS_CalloutInsert(doctorsToInsert, 'DELETE'));
    }
}

    public void beforeInsert(List<SObject> newSObjects){

    }
    public void beforeUpdate(List<SObject> newSObjects){

    }
    public void beforeDelete(List<SObject> newSObjects){

    }
}