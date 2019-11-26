/**
 * Created by BRITENET on 21.11.2019.
 */

public with sharing class HMS_DoctorTriggerException extends Exception {
    Schema.sObjectType objectType;

    public HMS_DoctorTriggerException(Schema.sObjectType type){
        objectType = type;
    }

    public override string getMessage(){
        return System.Label.HMS_TriggerException + ' ' + objectType;
    }
}