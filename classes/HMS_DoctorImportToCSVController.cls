public with sharing class HMS_DoctorImportToCSVController {
    public string csvAsString { get; set; }
    public String[] csvFileLines { get; set; }
    public List<DoctorEntry> docList { get; set; }
    public Boolean importButton{get;set;}

    public HMS_DoctorImportToCSVController() {
        csvFileLines = new String[]{
        };
        docList = New List<DoctorEntry>();
        importButton = true;
    }
    public void importCSVFile() {
        if (importButton) {
            try {
                csvFileLines = csvAsString.split('\n');
                for (Integer i = 0; i < csvFileLines.size(); i++) {
                    HMS_Doctor__c doctor = new HMS_Doctor__c();
                    string[] csvRecordData = csvFileLines[i].split(';');
                    string[] trimscv = csvRecordData[0].split(',');
                    for (Integer j = 0; i < trimscv.size(); j++) {
                        doctor.Name = trimscv[0];
                        doctor.LastName__c = trimscv[1];
                        doctor.Country__c = trimscv[2];
                        doctor.City__c = trimscv[3];
                        doctor.Phone__c = trimscv[4];
                        doctor.Email__c = trimscv[5];
                        docList.add(new DoctorEntry(doctor));
                        break;
                    }
                }
            } catch (Exception e) {
                ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR, Label.HMS_Error_Import);
                ApexPages.addMessage(errorMessage);
            }
        }
    }

    public PageReference importDoctors() {
        for (DoctorEntry doc : docList) {
            if (doc.check) {
                try {
                    upsert doc.doctor;
                    doc.status = Label.HMS_Succes;
                } catch (Exception e) {
                    ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO, e.getMessage());
                    ApexPages.addMessage(msg);
                    doc.status += Label.HMS_Failed + new ApexPages.Message(ApexPages.Severity.INFO, e.getMessage());
                }
            }
        }

        return null;
    }

    public PageReference checkAll() {
        for (DoctorEntry doc : docList) {
            doc.check = true;
        }
        return null;
    }
    public PageReference reverse() {
        for (DoctorEntry doc : docList) {
            doc.check = !doc.check;
        }
        return null;
    }
    public PageReference deselect(){
        for (DoctorEntry doc : docList) {
            doc.check = False;
        }
        return null;
    }
    public PageReference downloadtamplateCSV() {
        PageReference page = new PageReference('/apex/HMS_DownloadStaticResourcesforImportDoctor');
        page.setRedirect(false);
        return page;
    }

    public class DoctorEntry {
        private HMS_DoctorImportToCSVController parent;
        public HMS_Doctor__c doctor { get; set; }
        public Boolean check { get; set; }
        public String status { get; set; }

        public DoctorEntry() {
            doctor = new HMS_Doctor__c();
            check = False;
        }
        public DoctorEntry(HMS_Doctor__c record) {
            doctor = record;
            check = False;
            status = ' ';
        }
    }


}