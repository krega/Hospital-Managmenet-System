/**
 * Created by BRITENET on 12.11.2019.
 */

public with sharing class HMS_TriggerException extends Exception{

    Schema.sObjectType objectType;
   public HMS_TriggerException(Schema.sObjectType type){
       objectType = type;
   }
    public override String getMessage(){
        return System.Label.HMS_TriggerException + '' + objectType;
    }
}