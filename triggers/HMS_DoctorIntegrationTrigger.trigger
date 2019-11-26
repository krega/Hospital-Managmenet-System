/**
 * Created by BRITENET on 21.11.2019.
 */

trigger HMS_DoctorIntegrationTrigger on HMS_Doctor__c (after insert, after update, after delete) {
    HMS_DoctorTriggerFactory.createHandler(HMS_Doctor__c.sObjectType);
}