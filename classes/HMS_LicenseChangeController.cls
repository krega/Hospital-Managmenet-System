public with sharing class HMS_LicenseChangeController {
    public User user { get; set; }
    public Boolean isLicenseNumberEnabled{get;set;}
    public Boolean isMapEnabled{get;set;}

    public HMS_LicenseChangeController(ApexPages.standardController controller) {
        isLicenseNumberEnabled = HMS_Utils.isCSEnabled('Doctor_License_Number_Enabled');
        isMapEnabled = !HMS_Utils.isCSEnabled('Doctor_License_Number_Enabled');

    }
    public void changeUserCountry(){
        user = HMS_Utils.getCurrentUser();
        user.Country = (User.Country == System.Label.HMS_User_Country_PL)?System.Label.HMS_User_Country_NL:System.Label.HMS_User_Country_PL;
        update user;
    }


}