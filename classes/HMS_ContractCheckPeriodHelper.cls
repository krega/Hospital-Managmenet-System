public with sharing class HMS_ContractCheckPeriodHelper {
        public static List<Id> getDoctors(List<HMS_Contract__c> contracts) {
            Set<Id> setID = new Set<Id>();
            for (HMS_Contract__c con : contracts) {
                setID.add(con.HMS_Doctor__c);
            } 
            List<HMS_Doctor__c> doctors = [SELECT Id FROM HMS_Doctor__c WHERE Id IN :setID];
            List<Id> docIds = new List<Id>();
            for (HMS_Doctor__c doctor : doctors) {
                docIds.add(doctor.Id);
            }
            return docIds;
        }
        public static List <Id> getHospitals(List<HMS_Contract__c> contracts) {
            Set<Id> setID = new Set<Id>();
            for (HMS_Contract__c con : contracts) {
                setID.add(con.HMS_Hospital__c);
            }
            List<HMS_Hospital__c> hospitals = [SELECT Id FROM HMS_Hospital__c WHERE Id IN :setID];
            List<Id> hosIds = new List<Id>();
            for (HMS_Hospital__c hos : hospitals) {
                hosIds.add(hos.Id);
            }
            return hosIds;
        }
        private static Boolean checkIfConflict(HMS_Contract__c newContract, HMS_Contract__c contract) {
            return (isContractStartDuringDifferentContract(newContract, contract)
                    && isNewContractEndsDuringDifferentContract(newContract, contract)
                    && isAnotherContractInNewContract(newContract, contract)
                    && isImposeToAnother(newContract, contract)
                    && isPermanentContract(newContract, contract)
                    && isPermanentImposeToAnother(newContract, contract)
                    &&isPermanentImposeToOldPermanent(newContract, contract));
        }

        private static Boolean isConflictWithEachContract(HMS_Contract__c newContract, List<HMS_Contract__c> contracts) {

            for (HMS_Contract__c contract : contracts) {
                if (!checkIfConflict(newContract, contract)) {
                    return false;
                }
            }
            return true;
        }
        private static Boolean isPermanentContract(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (contract.EndDate__c == null && newContract.EndDate__c >= contract.StartDate__c) {
                return false;
            }
            return true;

        }
        private static String createErrorString(List<HMS_Contract__c> contracts) {
            String errorMessage = '';
            for (HMS_Contract__c contract : contracts) {
                errorMessage += System.Label.HMS_conflict_found + ' ' + System.Label.HMS_witHMS_withh + ' ' + contract.Name + '\n';
            }
            return errorMessage;
        }

        public static Boolean isContractStartDuringDifferentContract(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (newContract.StartDate__c <= contract.EndDate__c && newContract.EndDate__c >= contract.EndDate__c) {
                return false;
            }
            return true;
        }


        public static Boolean isNewContractEndsDuringDifferentContract(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (newContract.EndDate__c >= contract.StartDate__c && newContract.StartDate__c <= contract.StartDate__c) {
                return false;
            }
            return true;
        }
        public static Boolean isAnotherContractInNewContract(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (newContract.StartDate__c >= contract.StartDate__c && newContract.EndDate__c <= contract.EndDate__c) {
                return false;
            }
            return true;
        }
        public static Boolean isPermanentImposeToAnother(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (newContract.EndDate__c == null && newContract.StartDate__c <= contract.EndDate__c) {
                return false;
            }
            return true;
        }

        public static Boolean isPermanentImposeToOldPermanent(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (contract.EndDate__c == null && newContract.EndDate__c == null) {
                return false;
            }
            return true;
        }
        public static Boolean isImposeToAnother(HMS_Contract__c newContract, HMS_Contract__c contract) {
            if(newContract.Id == contract.Id){
                return true;
            }
            if (newContract.StartDate__c <= contract.StartDate__c && newContract.EndDate__c >= contract.EndDate__c) {
                return false;
            }
            return true;
        }


        public static void isConflictInNewContracts(List<HMS_Contract__c> newContracts, List <HMS_Contract__c> contracts) {
            for (HMS_Contract__c newContract : newContracts) {
                if (!HMS_ContractCheckPeriodHelper.isConflictWithEachContract(newContract, contracts)) {
                    newContract.addError(HMS_ContractCheckPeriodHelper.createErrorString(contracts));
                }
            }
        } 


    }