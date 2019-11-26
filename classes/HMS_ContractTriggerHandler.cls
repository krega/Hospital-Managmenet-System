/**
 * Created by BRITENET on 12.11.2019.
 */

public with sharing class HMS_ContractTriggerHandler implements HMS_ITrigger {

    public void bulkBefore() {}
    public void bulkAfter() {}
    public void beforeInsert(List<SObject> newlstObj) {
        Id[] doctors = HMS_ContractCheckPeriodHelper.getDoctors(trigger.new);
        Id[] hospitals = HMS_ContractCheckPeriodHelper.getHospitals(trigger.new);
        List<HMS_Contract__c> contracts = [SELECT HMS_Doctor__c, HMS_Hospital__c, StartDate__c,EndDate__c, Name FROM HMS_Contract__c WHERE HMS_Doctor__c in :doctors AND HMS_Hospital__c in:hospitals];
        HMS_ContractCheckPeriodHelper.isConflictInNewContracts(trigger.new, contracts);
    }
    public void beforeUpdate(List<SObject> newlstObj, List<SObject> oldlstObj, Map<Id, SObject> newMapObj, Map<Id, SObject> oldMapObj) {
        Id[] doctors = HMS_ContractCheckPeriodHelper.getDoctors(trigger.new);
        Id[] hospitals = HMS_ContractCheckPeriodHelper.getHospitals(trigger.new);
        List<HMS_Contract__c> contracts = [SELECT HMS_Doctor__c, HMS_Hospital__c, StartDate__c,EndDate__c, Name FROM HMS_Contract__c WHERE HMS_Doctor__c in :doctors AND HMS_Hospital__c in:hospitals];
        HMS_ContractCheckPeriodHelper.isConflictInNewContracts(trigger.new, contracts);
    }

   public void beforeInsertOrUpdate(List<SObject> newSObjects){}
    public void afterInsert(List<SObject> newSObjects){}
    public void afterUpdate(List<SObject> newSObjects){}
    public void afterDelete(List<SObject> newSObjects){}
    public void beforeUpdate(List<SObject> newSObjects){}
    public void beforeDelete(List<SObject> newSObjects){}

}