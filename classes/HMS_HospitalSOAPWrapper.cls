global with sharing class HMS_HospitalSOAPWrapper {
    webService String responseId { get; set; }
    webService String hospitalName { get; set; }
    webService String hospitalEmail { get; set; }
    webService String hospitalCountry { get; set; }
    webService String hospitalCity {get;set;}
    webService String hospitalStreet {get;set;}

    public HMS_HospitalSOAPWrapper (String id, String hospitalNames ,String hospitalEmails , String hospitalCounties ,String hospitalCities, String hospitalStreets){
        responseId = id;
        hospitalName = hospitalNames;
        hospitalEmail = hospitalEmails;
        hospitalCountry = hospitalCounties;
        hospitalCity= hospitalCities;
        hospitalStreet=hospitalStreets;
    }
    public HMS_HospitalSOAPWrapper(){}

}