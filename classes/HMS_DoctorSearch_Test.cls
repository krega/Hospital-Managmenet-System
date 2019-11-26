@IsTest
private class HMS_DoctorSearch_Test {
    @TestSetup
    private static void setup(){
        List<HMS_Doctor__c> doctors = new List<HMS_Doctor__c>();
        for(Integer i = 0; i < 10; i++)
        {
            doctors.add(new HMS_Doctor__c(Name = String.valueOf(i), LastName__c = String.valueOf(i), Country__c = 'Pl',
                    Street__c =String.valueOf(i), Email__c = 'Klos@gmail.com'));
        }
        insert doctors;
    }
    @IsTest
    private static void shouldCreateQueryReturnInvalidQueryWhenFieldsAreNull() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c ', result);
    }

    @IsTest
    private static void shouldCreateQueryReturnLastNameInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.LastName__c = 'm';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE LastName__c LIKE \'m%\' ORDER BY NAME DESC', result);
    }

    @IsTest
    private static void shouldCreateQueryReturnLastNameAndNameInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.LastName__c = 'kow';
        controller.searchItem.Name = 'Mich';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE LastName__c LIKE \'kow%\' AND Name LIKE \'Mich%\' ORDER BY NAME DESC', result);
    }

    @IsTest
    private static void shouldCreateQueryReturnLastNameAndCountryInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.LastName__c = 'kow';
        controller.searchItem.Country__c = 'PL';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE LastName__c LIKE \'kow%\' AND Country__c LIKE\'PL%\' ORDER BY NAME DESC', result);
    }

    @IsTest
    private static void shouldCreateQueryReturnLastNameAndCountryAndNameInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.LastName__c = 'kow';
        controller.searchItem.Country__c = 'PL';
        controller.searchItem.Name = 'Kamil';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE LastName__c LIKE \'kow%\' AND Name LIKE \'Kamil%\' AND Country__c LIKE\'PL%\' ORDER BY NAME DESC', result);
    }
    @IsTest
    private static void shouldCreateQueryReturnEmailInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.Email__c = 'metez@gmail.com';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE AND Email__c LIKE\'metez@gmail.com\' ORDER BY NAME DESC', result);
    }

    @IsTest
    private static void shouldCreateQueryReturnCountryInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.Country__c = 'PL';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE AND Country__c LIKE\'PL%\' ORDER BY NAME DESC', result);
    }
    @IsTest
    private static void shouldCreateQueryReturnNameInQuery() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchItem.Name = 'michal';

        Test.startTest();
        String result = controller.createQuery();
        Test.stopTest();

        System.assertEquals('SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c WHERE AND Name LIKE \'michal%\' ORDER BY NAME DESC', result);
    }
    @IsTest
    private static void shouldReturnNameWhenSortByName() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();


        Test.startTest();
        controller.sortByName();
        Test.stopTest();

        System.assertEquals('Name', controller.sortByColumn);
    }

    @IsTest
    private static void shouldReturnWrongValue() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.sortByColumn = 'obbbb';

        Test.startTest();
        controller.sortByName();
        Test.stopTest();

        System.assertEquals('Name', controller.sortByColumn);
    }
    @IsTest
    private static void shouldReturnSortByEmail() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.sortByColumn = 'Email__c';

        Test.startTest();
        controller.sortByEmail();
        Test.stopTest();

        System.assertEquals('Email__c', controller.sortByColumn);
    }
    @IsTest
    private static void shouldReturnSortByCountry() {
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.sortByColumn = 'Country__c';

        Test.startTest();
        controller.sortByCountry();
        Test.stopTest();

        System.assertEquals('Country__c', controller.sortByColumn);
    }

    @IsTest
    private static void shouldExportCSV(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();

        PageReference page = controller.exportToCSV();

        System.assertEquals(page.getUrl(),'/apex/HMS_CSVSearchDoctorsSearch');
    }

    @IsTest
    private static void shouldExportExcel(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();

        PageReference page = controller.SaveAsExcel();

        System.assertEquals(page.getUrl(),'/apex/XlsSearchDoctorsSearch');
    }

    @IsTest
    private static void shouldRefreshPage(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        PageReference pageRef = Page.HMS_SearchDoctorPage;
        Test.setCurrentPage(pageRef);

        PageReference page = controller.reset();

        System.assertEquals(page.getUrl(), pageRef.getUrl());
    }

    @IsTest
    private static void shouldExportToJson(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();

        PageReference page = controller.exportToJson();

        System.assertEquals(page.getUrl(),'/apex/HMS_JsonGeneratorDoctorSearchPage');
    }

    @IsTest
    private static void shouldSortListByWhenOrderIsEqualDesc(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();


        Test.startTest();
        controller.sortListBy();
        Test.stopTest();

        System.assertEquals('ASC',  controller.order);
    }
    @IsTest
    private static void shouldSortListByWhenOrderIsEqualASC(){
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.order = 'ASC';

        Test.startTest();
        controller.sortListBy();
        Test.stopTest();

        System.assertEquals('DESC',  controller.order);
    }

    @IsTest
    private static void shouldGoToNextSetValue(){
        List<HMS_Doctor__c> doctors = [SELECT Id,Email__c,Country__c,Name,LastName__c FROM HMS_Doctor__c];
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchDoctor();

        System.assertEquals('0', controller.paginatedDoctors[0].Name);

        Test.startTest();
        controller.next();
        Test.stopTest();

        System.assertEquals('5', controller.paginatedDoctors[0].Name);
    }
    @IsTest
    private static void shouldGoToPreviousSetValue(){
        List<HMS_Doctor__c> doctors = [SELECT Id,Email__c,Country__c,Name,LastName__c FROM HMS_Doctor__c];
        HMS_DoctorSearchController controller = new HMS_DoctorSearchController();
        controller.searchDoctor();
        controller.next();

        System.assertEquals('5', controller.paginatedDoctors[0].Name);

        Test.startTest();
        controller.previous();
        Test.stopTest();

        System.assertEquals('0', controller.paginatedDoctors[0].Name);
    }
}