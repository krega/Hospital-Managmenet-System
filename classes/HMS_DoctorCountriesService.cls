/**
 * Created by BRITENET on 19.11.2019.
 */
@RestResource(urlMapping='/Countries/*')
global class HMS_DoctorCountriesService {
    @HttpGet
    global static List<String> doGet(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        Schema.DescribeFieldResult picklistDescribe = HMS_Doctor__c.fields.Country__c.getDescribe();
        Schema.sObjectField picklistField = picklistDescribe.getSObjectField();
        List<PicklistEntry> picklistEntriesList = picklistField.getDescribe().getPicklistValues();
        List<String> countriesLabelValueList = new List<String>();
        countriesLabelValueList.add('None');
        for(PicklistEntry entry: picklistEntriesList){
            countriesLabelValueList.add(entry.label);
        }
        return countriesLabelValueList;
    }
}