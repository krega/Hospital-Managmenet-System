/**
 * Created by BRITENET on 13.11.2019.
 */

public with sharing class HMS_HospitalSOAPHelper {
    public static String generateQuery(String name, String country, String email) {
        String query = 'SELECT Name, Country__c, Email__c FROM HMS_Hospital__c WHERE Name LIKE  \'%' + name + '%\'';
        query += String.isBlank(email) ? '' : 'AND Email__c LIKE \'%' + email + '%\'';
        query += String.isBlank(country) ? '' : 'AND Country__c LIKE \'%' + country + '%\'';
        System.debug(query);
        return query;
    }

    public static List <HMS_HospitalSOAPWrapper> convertHospitalsToHospitalWrappers(List<HMS_Hospital__c> hospitals){
        List <HMS_HospitalSOAPWrapper> hospitalWrappers = new List <HMS_HospitalSOAPWrapper>();
        for(HMS_Hospital__c hospital : hospitals){
            HMS_HospitalSOAPWrapper hospitalWrapper = new HMS_HospitalSOAPWrapper(String.valueOf(hospital.Id), hospital.Name, hospital.Email__c,hospital.Country__c,'','');
            hospitalWrappers.add(hospitalWrapper);
        }
        return hospitalWrappers;
    }

    public static HMS_WebServiceRespond upsertHospital(Id id, String name, String email, String city, String street, String country) {
        HMS_Hospital__c hospital = new HMS_Hospital__c(Id = id ,Name = name, Email__c = email, City__c = city, Street__c = street, Country__c = country);
        try {
            Database.upsert(hospital);
            return new HMS_WebServiceRespond(hospital.Id,true,'');
        } catch (DmlException e) {
            return new HMS_WebServiceRespond(String.valueOf(id),false,e.getMessage());
        }
    }
}