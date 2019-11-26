/**
 * Created by BRITENET on 07.11.2019.
 */

public with sharing class HMS_PaginationDoctors {
        public HMS_Doctor__c doctor { get; set; }
        public List<HMS_Doctor__c> querieddoctors { get; set; }
        public List<HMS_Doctor__c> paginateddoc {
            get {
                if (setController != null) {
                    paginateddoc = setController.getRecords();
                }
                return paginateddoc;
            }
            set;
        }

        public ApexPages.StandardSetController setController { get; set; }
        private static final Integer PAGINATION = 5;

        public HMS_PaginationDoctors() {

            doctor = new HMS_Doctor__c();
            querieddoctors = new List<HMS_Doctor__c>();
            createQueryASC();
            executePagination();
        }

        private List<HMS_Doctor__c> createQueryASC() {
            String query = 'SELECT Name, LastName__c FROM HMS_Doctor__c ORDER BY Name ASC';
            querieddoctors = Database.query(query) ;
            return querieddoctors;
        }

        private List<HMS_Doctor__c> createQueryDESC() {
            String query = 'SELECT Name, LastName__c FROM HMS_Doctor__c ORDER BY Name DESC';
            querieddoctors = Database.query(query) ;
            return querieddoctors;
        }
        public void executePagination() {
            setController = new ApexPages.StandardSetController(querieddoctors);
            setController.setPageSize(PAGINATION);
        }

        public PageReference searchDoctorASC() {
            createQueryASC();
            executePagination();
            return null;
        }

        public PageReference searchDoctorDESC() {
            createQueryDESC();
            executePagination();
            return null;
        }
        public void next() {

            setController.next();
        }

        public void previous() {

            setController.previous();
        }


    }