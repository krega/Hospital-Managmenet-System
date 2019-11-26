/**
 * Created by BRITENET on 18.11.2019.
 */

public class HMS_HospitalSandraControllerHelper {
    public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse hospital { get; set; }
    public List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper> getHospitals { get; set; }
    public HMS_HospitalServiceSandraHospital sandraHospital { get; set; }
    public HMS_HospitalServiceSandraHospital.HDC_HospitalService hospitalService { get; set; }


    public HMS_HospitalSandraControllerHelper() {
        hospital = new HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse();
        getHospitals = new List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper>();
        sandraHospital = new HMS_HospitalServiceSandraHospital();
        hospitalService = new HMS_HospitalServiceSandraHospital.HDC_HospitalService();
    }

    public static void login() {
        HMS_HospitalServiceSandraHospital.SessionHeader_element header = new HMS_HospitalServiceSandraHospital.SessionHeader_element();
        LoginCredential__c credential = LoginCredential__c.getInstance('KamilOrg');
        partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
        try {
            partnerSoapSforceCom.LoginResult loginResult = sp.login(credential.login__c, credential.password__c);
            Cache.Session.put('token', loginResult.sessionId, 28800);
        }
        catch(Exception e){
            e.getMessage();
        }
    }

    public static void isAccessTokenAvailable() {
        if (Cache.Session.get('token') == null) {
            login();
        }
    }
    public static  HMS_HospitalServiceSandraHospital.HDC_HospitalService attachAccessToken(HMS_HospitalServiceSandraHospital.HDC_HospitalService service) {
        HMS_HospitalServiceSandraHospital.SessionHeader_element header = new HMS_HospitalServiceSandraHospital.SessionHeader_element();
        header.sessionId = (String)Cache.Session.get('token');
        service.sessionHeader = header;
        return service;
    }
    public static String callEditHospital(String id, String name, String email, String city, String street, String country) {
        String repond = '';
        HMS_HospitalServiceSandraHospital.HDC_HospitalService hospitalService = new HMS_HospitalServiceSandraHospital.HDC_HospitalService();
        try {
            HMS_HospitalSandraControllerHelper.isAccessTokenAvailable();
            hospitalService =  attachAccessToken(hospitalService);
            return repond = hospitalService.updateHospital(id, name, email, city, street, country).messageError;
        } catch (Exception e) {
            return repond = e.getMessage();
        }
    }
    public static List<HMS_HospitalSOAPWrapper> callSearch(String name, String country, String email) {
        String respond = '';
        try {
            List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper> getHospitals = new List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper>();

            HMS_HospitalServiceSandraHospital.HDC_HospitalService hospitalService = new HMS_HospitalServiceSandraHospital.HDC_HospitalService();
            HMS_HospitalSandraControllerHelper.isAccessTokenAvailable();
            hospitalService =  attachAccessToken(hospitalService);
            getHospitals = hospitalService.getHospitals(name, country, email);
            return HMS_HospitalSandraControllerHelper.convertToWrapper(getHospitals);
        } catch (Exception e) {
            respond = e.getMessage();
            return null;
        }
    }
    public static List<HMS_HospitalSOAPWrapper> convertToWrapper(List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper> getHospitals) {
        List<HMS_HospitalSOAPWrapper> hosWrapper = new List<HMS_HospitalSOAPWrapper>();
        for (HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper hospital : getHospitals) {
            HMS_HospitalSOAPWrapper wrap = new HMS_HospitalSOAPWrapper();
           /* wrap.responseId = hospital.responseId;*/
            wrap.hospitalCountry = hospital.hospitalCountry;
            wrap.hospitalEmail = hospital.hospitalEmail;
            wrap.hospitalname = hospital.hospitalname;
            hosWrapper.add(wrap);
        }
        return hosWrapper;
    }
    public static String callCreateHospital(String name, String email, String city, String street, String country) {
        String repond = '';
        HMS_HospitalServiceSandraHospital.HDC_HospitalService hospitalService = new HMS_HospitalServiceSandraHospital.HDC_HospitalService();
        try {
            HMS_HospitalSandraControllerHelper.isAccessTokenAvailable();
            hospitalService =  attachAccessToken(hospitalService);
            return repond = hospitalService.createHospital(name, email, city, street, country).messageError;
        } catch (Exception e) {
            return repond = e.getMessage();
        }
    }
    public static String callDeleteHospital(Id responseId) {
        String repond = '';
        HMS_HospitalServiceSandraHospital.HDC_HospitalService hospitalService = new HMS_HospitalServiceSandraHospital.HDC_HospitalService();
        try {
            HMS_HospitalSandraControllerHelper.isAccessTokenAvailable();
            hospitalService =  attachAccessToken(hospitalService);
          return  repond = hospitalService.deleteHospital(responseId).messageError;

        } catch (Exception e) {
            return repond = e.getMessage();

        }

    }

}