/**
 * Created by BRITENET on 21.11.2019.
 */

public with sharing class HMS_DoctorTriggerFactory {
    public static void createHandler(Schema.sObjectType soType){
        HMS_ITrigger handler = getHandler(soType);
        if(handler == null){
            throw new HMS_DoctorTriggerException(soType);
        }
        if(!HMS_Utils.isTriggerDisabled(soType)){
            execute(handler);
        }
    }

    private static void execute(HMS_ITrigger handler){
        if(Trigger.isBefore) {
            if (Trigger.isInsert || Trigger.isUpdate) {
                handler.beforeInsertOrUpdate(Trigger.new);
            }
            if(Trigger.isInsert){
                handler.beforeInsert(Trigger.new);
            }
            if(Trigger.isDelete){
                handler.afterDelete(Trigger.old);
            }
            if(Trigger.isUndelete){

            }
        }
        else {
            if (Trigger.isInsert) {
                handler.afterInsert(Trigger.new);
            }
            if (Trigger.isUpdate) {
                handler.afterUpdate(Trigger.new);
            }
            if(Trigger.isDelete){
                handler.afterDelete(Trigger.old);
            }
            if(Trigger.isUndelete){

            }
        }
    }

    public static HMS_ITrigger getHandler(Schema.sObjectType soType){
        if(soType == HMS_Doctor__c.sObjectType){
            return new HMS_DoctorTriggerHandler();
        }
        return null;
    }
}
