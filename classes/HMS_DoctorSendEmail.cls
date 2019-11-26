/**
 * Created by BRITENET on 08.11.2019.
 */

public with sharing class HMS_DoctorSendEmail {
    public String emailBody { get; set; }
    private HMS_Doctor__c doctorEmail { get; set; }
    public String emailSubject { get; set; }
    public String emailAddress { get; set; }
    public Boolean displayPopupEmail { get; set; }

    public HMS_DoctorSendEmail(ApexPages.standardController controller) {
        doctorEmail = (HMS_Doctor__c) controller.getRecord();
        emailBody = '';
        emailSubject = '';
        emailAddress = 'kamil.rega@britenet.com.pl';

    }
    public void showPopupEmail() {
        displayPopupEmail = true;
    }
    public void closePopupEmail() {
        displayPopupEmail = false;

    }
    public PageReference redirectPopup() {
        displayPopupEmail = false;
        return null;

    }
    public void SendEmail() {

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[]{
                'kamil.regoc@gmail.com'
        };
        message.optOutPolicy = 'FILTER';
        message.subject = emailSubject;
        message.plainTextBody = emailBody;
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>{
                message
        };
        try {
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

        } catch (Exception ex) {
            Apexpages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.FATAL, System.Label.HMS_Limit_Is_Reached));
        }

        clearEmailFields();
    }
    public void clearEmailFields() {
        closePopupEmail();
        emailBody = '';
        emailSubject = '';
    }

}