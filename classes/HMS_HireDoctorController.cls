public with sharing class HMS_HireDoctorController {
    public ApexPages.StandardController ctrl;
    public HMS_Hospital__c searchItem { get; set; }
    public HospitalEntry[] hospitals { get; set; }
    public HospitalEntry selectedHospital { get; set; }
    public Boolean displayPopup { get; set; }
    public Boolean isSuccess { get; set; }

    public HMS_HireDoctorController(ApexPages.StandardController controller) {
        ctrl = controller;
        searchItem = new HMS_Hospital__c();
        hospitals = new HospitalEntry[]{
        };
    }
    public PageReference SaveAspdf() {
        PageReference page =
                new PageReference('https://c.eu29.visual.force.com/apex/DoctorAsPDFPage?id=' + ApexPages.currentPage().getParameters().get('id') + '&sfdc.override=1');
        System.debug('page' + page);
        page.setRedirect(false);
        return page;
    }
    public void closePopup() {
        displayPopup = false;
        if (hospitals != null) {
            hospitals.clear();
        }
        if (searchItem != null) {
            searchItem.clear();
        }
        if (selectedHospital != null) {
            selectedHospital.contract = null;
        }
    }
    private String createQuery() {
        System.debug('createquery' + searchItem);
        String query = 'SELECT Name, City__c ,Country__c FROM HMS_Hospital__c WHERE ';
        query += 'Name LIKE \'%' + searchItem.Name + '%\' ';
        if (String.isNotBlank(searchItem.City__c)) {
            query += 'City__c LIKE \'%' + searchItem.City__c + '%\' ';
        }
        if (String.isNotBlank(searchItem.Country__c)) {
            query += 'Country__c LIKE \'%' + searchItem.Country__c + '%\' ';
        }

        return query;
    }

    public void searchDoctors() {
        for (HMS_Hospital__c hospital : Database.query(createQuery())) {
            hospitals.add(new HospitalEntry(this, hospital));
        }
    }
    public void clearSearch() {
        searchItem.clear();
        hospitals.clear();
        selectedHospital.cancelHiring();
    }
    public class HospitalEntry {
        private HMS_HireDoctorController parent;
        public HMS_Hospital__c record { get; set; }
        public HMS_Contract__c contract { get; set; }

        public HospitalEntry(HMS_HireDoctorController parent, HMS_Hospital__c record) {
            this.record = record;
            this.parent = parent;
            parent.isSuccess = false;
        }

        public void selectHospital() {
            parent.selectedHospital = this;
            contract = new HMS_Contract__c(
                    HMS_Hospital__c = record.Id,
                    HMS_Doctor__c = parent.ctrl.getId(),
                    StartDate__c = Date.today(),
                    EndDate__c = Date.today() + 10
            );
        }

        public void saveNewContract() {
            try {
                insert contract;
                System.debug(contract);
                parent.isSuccess = true;
            } catch (Exception ex) {
                System.debug(ex);
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
            }
            if (parent.isSuccess) {
                cancelHiring();
            }
        }
        public void cancelHiring() {
            parent.closePopup();
            record.clear();
            contract = null;
        }
    }
}