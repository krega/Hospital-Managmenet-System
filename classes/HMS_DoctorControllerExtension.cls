public with sharing class HMS_DoctorControllerExtension {
    private final HMS_Doctor__c doctor { get; set; }
    public List<ContractWrapper> contractsDoctor {
        get {

            contractsDoctor = getDoctorsContract();
            return contractsDoctor;
        }
        set;
    }

    public HMS_DoctorControllerExtension(ApexPages.StandardController doctor) {
        this.doctor = (HMS_Doctor__c) doctor.getRecord();
        contractsDoctor = new List<ContractWrapper>();
    }
    public List<ContractWrapper> getDoctorsContract() {
        List<ContractWrapper> contWrap = new List<ContractWrapper>();
        for (HMS_Contract__c contract : [
                SELECT
                        HMS_Doctor__r.Name, HMS_Doctor__r.LastName__c, EndDate__c, StartDate__c, HMS_Hospital__r.Name
                FROM HMS_Contract__c
                WHERE HMS_Doctor__c = :doctor.Id
        ]) {
            contWrap.add(new ContractWrapper(contract));
        }
        return contWrap;
    }

    public class ContractWrapper {
        public HMS_Contract__c contract { get; set; }
        public Boolean disabled { get; set; }

        public ContractWrapper(HMS_Contract__c contract) {
            this.contract = contract ;
            disabled = false;
        }

        public void checkDate() {
            if (contract.EndDate__c != null) {
                if (contract.EndDate__c <= System.today()) {
                    disabled = true ;
                }
            }
            if (contract.EndDate__c != null) {
                if (contract.EndDate__c >= System.today() && contract.StartDate__c <= System.today()) {
                    contract.EndDate__c = System.today() ;
                    update contract;
                }
            }
            if (contract.EndDate__c != null) {
                if (contract.StartDate__c >= System.today() && contract.EndDate__c > System.today()) {
                    Database.delete(contract);
                }
            }
            if (contract.EndDate__c == null && contract.StartDate__c > System.today()) {
                Database.delete(contract);
            }
            if (contract.EndDate__c == null && contract.StartDate__c <= System.today()) {
                contract.EndDate__c = System.today();
                update contract;
            }
        }
    }
}