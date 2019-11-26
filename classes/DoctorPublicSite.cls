/**
 * Created by BRITENET on 26.10.2019.
 */

public with sharing class DoctorPublicSite {

    public final HMS_Doctor__c doctor { get; set; }

    public List <HMS_Doctor__c> listOfRandomDoctors { get; set; }
    private Integer amountOfDoctors;
    public DoctorPublicSite(ApexPages.StandardController doctor) {
        this.doctor = (HMS_Doctor__c) doctor.getRecord();
        listOfRandomDoctors = new List<HMS_Doctor__c>();
        amountOfDoctors = getNumberOfDoctors();
        Integer randomNumber = RandDoc(amountOfDoctors);
        listOfRandomDoctors = getDoctors(randomNumber);

    }

    private Integer RandDoc(Integer amountOfDoctors) {
        Integer randomNumber = 0;
        do {
            randomNumber = Integer.valueOf((Math.random() * amountOfDoctors));
            System.debug(randomNumber);
        } while (randomNumber < 5);
        System.debug(randomNumber);
        return randomNumber;
    }

    private Integer getNumberOfDoctors() {
        List <AggregateResult> numberOfDoctors = [SELECT COUNT(Id) amount FROM HMS_Doctor__c];
        Integer doc = (Integer) numberOfDoctors[0].get('amount');

        return doc;
    }
    public List <HMS_Doctor__c> getDoctors(Integer rand) {
        List <HMS_Doctor__c> doctors = [
                SELECT Name, LastName__c, Email__c
                FROM HMS_Doctor__c
                Order By Name
                LIMIT 5
                OFFSET :rand
        ];

        return doctors;
    }

}