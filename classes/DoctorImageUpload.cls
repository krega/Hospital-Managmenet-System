/**
 * Created by BRITENET on 28.10.2019.
 */

public with sharing class DoctorImageUpload {
    public Attachment attachment { get; set; }
    public HMS_Doctor__c doctorWithImage {get; set;}
    public Boolean hasAttachment {get; set;}
    public DoctorImageUpload(ApexPages.standardController controller){
        doctorWithImage = (HMS_Doctor__c) controller.getRecord();
        hasAttachment=false;
        setLastAttachment();
    }

    public void setLastAttachment() {
        List<Attachment> attachments = [
                SELECT Id,Name,Parent.Name
                FROM Attachment
                WHERE ParentId = :doctorWithImage.Id
                ORDER BY LastModifiedDate DESC
                LIMIT 1
        ];
        if (!attachments.isEmpty() && attachments != null) {
            attachment = attachments[0];
            hasAttachment = true;
        }else{
            hasAttachment=false;
        }
    }

    public void deleteImages() {
        List<Attachment> attachmentsToDelete = getAllAttachedPhotos();
        System.debug('Jest do usuniecia attachmentow: '+attachmentsToDelete.size());
        try {
            if (String.isNotBlank(attachment.Id)) {
                System.debug('USUWAM attachmnet. : ');
                delete attachmentsToDelete;
                attachment = new Attachment();
                hasAttachment=false;
            }
        } catch (DmlException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error uploading image'));
        }
        setLastAttachment();
    }

    private List<Attachment> getAllAttachedPhotos() {
        List<Attachment> attachments = [
                SELECT Id,Name
                FROM Attachment
                WHERE ParentId = :doctorWithImage.Id
        ];
        return attachments;
    }

    public void clearPictureDialog() {
    }

    @RemoteAction
    public static PageReference saveImage(String name, String contentType, String data, String parent) {
        Attachment attachedPhoto = new Attachment(Name = name, OwnerId = UserInfo.getUserId(), contentType = contentType, Body = EncodingUtil.base64Decode(data), ParentId = parent);
        Database.insert(attachedPhoto, true);
        return null;

    }



}