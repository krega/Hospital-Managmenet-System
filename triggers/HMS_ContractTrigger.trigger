/**
 * Created by BRITENET on 12.11.2019.
 */

trigger HMS_ContractTrigger on HMS_Contract__c (before insert, before update) {
    HMS_TriggerFactory.createHandler(HMS_Contract__c.getSObjectType());
}