/**
 * Created by BRITENET on 11.11.2019.
 */


trigger HMS_CheckOverlackingContracts on HMS_Contract__c (before insert, before update) {/*
Id[] doctors = HMS_ContractCheckPeriodHelper.getDoctors(trigger.new);
Id[] hospitals = HMS_ContractCheckPeriodHelper.getHospitals(trigger.new);
List<HMS_Contract__c> contracts = [SELECT HMS_Doctor__c, HMS_Hospital__c, StartDate__c,EndDate__c, Name FROM HMS_Contract__c WHERE HMS_Doctor__c in :doctors AND HMS_Hospital__c in:hospitals];
HMS_ContractCheckPeriodHelper.isConflictInNewContracts(trigger.new, contracts);
*/
}