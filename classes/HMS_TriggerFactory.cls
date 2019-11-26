/**
 * Created by BRITENET on 12.11.2019.
 */

public with sharing class HMS_TriggerFactory {
    public static void createHandler(Schema.sObjectType soType) {
        HMS_ITrigger handler = getHandler(soType);
        if (handler == null) {
            throw new HMS_TriggerException(soType);
        }

        if (!HMS_Utils.isTriggerDisabled(soType)) {
            execute(handler);
        }

    }

    private static void execute(HMS_ITrigger handler) {
    /*    if (Trigger.isBefore)
        {
            handler.bulkBefore();
            if (Trigger.isDelete) {
                handler.beforeDelete(trigger.old,trigger.oldMap);
            }
            else if (Trigger.isInsert) {
                handler.beforeInsert(trigger.new);
            }
            else if (Trigger.isUpdate)
            {
                handler.beforeUpdate(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
            }
        }
        else
        {
            handler.bulkAfter();
            if (Trigger.isDelete) {
                handler.afterDelete(trigger.old,trigger.oldMap);
            }
            else if (Trigger.isInsert) {
                handler.afterInsert(trigger.new,trigger.newMap);
            }
            else if (Trigger.isUpdate) {
                handler.afterUpdate(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
            }
        }

        handler.andFinally();*/
    }

    public static HMS_ITrigger getHandler(Schema.sObjectType soType) {
        if (soType == HMS_Contract__c.sObjectType) {
            return new HMS_ContractTriggerHandler();
        }
        return null;
    }
}