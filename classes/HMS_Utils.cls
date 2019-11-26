public with sharing class HMS_Utils {
    private static Set<SObjectType> disabledTriggers = new Set<SObjectType>();
    public static Boolean isSettingEnabledForCurrentUser(String settingName, String Country) {
        return isSettingEnabledForCurrentUser(SettingName, Country);
    }

    public static Boolean isSettingEnabled(String settingName, String Country) {
        HMS_Setting__c csItem = HMS_Setting__c.getInstance(settingName);
        if (csItem == null) {
            return false;
        }
        return csItem.Value__c.contains(Country);
    }

    public static User getCurrentUser() {
        return getUser(UserInfo.getUserId());
    }

    public static User getUser(String UserId) {
        List<User> usersList = [SELECT Id, Country FROM User WHERE Id = :UserId];
        if (usersList == null) {
            return null;
        } else {
            return usersList[0];
        }
    }
    public static Boolean isCSEnabled(String csName) {
        return isCSEnabledForUserCountry(csName, getCurrentUser().Country);
    }
    public static String getCustomSettingValue(String settingName){
        return HMS_Setting__c.getInstance(settingName).Value__c;
    }

    public static Boolean isCSEnabledForUserCountry(String csName, String country) {
        HMS_Setting__c csItem = HMS_Setting__c.getInstance(csName);
        if (csItem == null) {
            return false;
        }
        List<String> countryList = csItem.Value__c.split(',');
        Set<String> countrySet = new Set<String>(countryList);
        for (String countryAbbr : countrySet) {
            if (country.equals(countryAbbr)) {
                return true;
            }
        }
        return false;
    }
    public static Boolean isTriggerDisabled(Schema.sObjectType soType) {
        map<String, Schema.SObjectField> customSettingFields = Schema.SObjectType.HMS_TriggerException__c.fields.getMap();
        for (String customSettingField : customSettingFields.keySet()) {
            if (String.valueOf(customSettingField).equalsIgnoreCase(String.valueOf(soType)) || disabledTriggers.contains(soType)) {
                return getTriggerCustomSettingValue(String.valueOf(customSettingField));
            }
        }
        return true;
    }

    public static Boolean getTriggerCustomSettingValue(String fieldName) {
        HMS_TriggerException__c csItem = HMS_TriggerException__c.getInstance(UserInfo.getUserId());
        return (Boolean) csItem.get(fieldName) ;
    }


      /* public static Boolean isTriggerDisabled(Schema.sObjectType soType) {
     //  Schema.DescribeFieldResult field = getSuitableField(soType);
           HMS_TriggerException__c teItem = HMS_TriggerException__c.getInstance();
        return (Boolean) teItem.get(field.getName()) || disabledTriggers.contains(soType);

    }*/

    public static void disableTrigger(SObjectType objType) {
        disabledTriggers.add(objType);
    }

    public static void enableTrigger(SObjectType objType) {
        disabledTriggers.remove(objType);
    }


}