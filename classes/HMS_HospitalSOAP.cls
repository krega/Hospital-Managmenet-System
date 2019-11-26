global with sharing class HMS_HospitalSOAP {

    webservice static List<HMS_HospitalSOAPWrapper> getHospitals(String name, String Country, String email) {
        List <HMS_Hospital__c> hospList = Database.query(HMS_HospitalSOAPHelper.generateQuery(name, Country, email));
        List<HMS_HospitalSOAPWrapper> hospitalWrappers = HMS_HospitalSOAPHelper.convertHospitalsToHospitalWrappers(hospList);
        System.debug(hospitalWrappers);
        return hospitalWrappers;
    }

    webservice static HMS_WebServiceRespond createHospital(String name, String email, String city, String street, String country) {
        try {
            return  HMS_HospitalSOAPHelper.upsertHospital(null, name,email,city,street,country);
        } catch (Exception e) {
            return new HMS_WebServiceRespond('',false, e.getMessage());
        }
    }

    webservice static HMS_WebServiceRespond updateHospital(Id id, String name, String email, String city, String street, String country) {
        try {
            return  HMS_HospitalSOAPHelper.upsertHospital(id,name,email,city,street,country);
            }
         catch (Exception e) {
            return  new HMS_WebServiceRespond(String.valueOf(id),false,e.getMessage());
        }

    }
    webservice static HMS_WebServiceRespond deleteHospital(Id id) {
        HMS_Hospital__c hospital = new HMS_Hospital__c(Id = id);
        try {
            Database.DeleteResult result = Database.delete(hospital);
            return  new HMS_WebServiceRespond(String.valueOf(id), result.isSuccess(),result.isSuccess() ? '' : result.getErrors()[0].getMessage());
        } catch (Exception e) {
            return  new HMS_WebServiceRespond(String.valueOf(id), false,e.getMessage());
        }
    }
}