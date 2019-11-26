/**
 * Created by BRITENET on 14.11.2019.
 */

Global with sharing class HMS_WebServiceRespond {
    webService String responseId { get; set; }
    webService Boolean success { get; set; }
    webService String messageError { get; set; }

    public HMS_WebServiceRespond(String Id, Boolean isSuccess, String errString){
        responseId = Id;
        success = isSuccess;
        messageError = errString;
    }
}