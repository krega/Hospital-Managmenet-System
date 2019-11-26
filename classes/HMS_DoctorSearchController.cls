public with sharing class HMS_DoctorSearchController {
    public List<HMS_Doctor__c> doctors { get; set; }
    public HMS_Doctor__c searchItem { get; set; }
    public String csvBody { get; set; }
    public String searchJson { get; set; }
    public List<HMS_Doctor__c> paginatedDoctors {
        get {
            if (setController != null) {
                paginatedDoctors = setController.getRecords();
            }
            return paginatedDoctors;
        }
        set;
    }
    public ApexPages.StandardSetController setController { get; set; }
    public String order { get; set; }
    public String sortByColumn { get; set; }
    private static final Integer PAGINATION = 5;
    private static final String DEFAULT_COLUMN = 'NAME';
    private static final String DEFAULT_ORDER = 'DESC';
    public HMS_DoctorSearchController() {
        doctors = new List<HMS_Doctor__c>();
        searchItem = new HMS_Doctor__c();
        sortByColumn = DEFAULT_COLUMN;
        order = DEFAULT_ORDER;
    }
    public String createQuery() {
        String query = 'SELECT Id, Name, Country__c, Email__c, LastName__c from HMS_Doctor__c ';
        if (searchItem.LastName__c != null || searchItem.Country__c != null || searchItem.Name != null || searchItem.Email__c != null) {
            query += 'WHERE ' ;
            if (String.isNotBlank(searchItem.LastName__c)) {
                query += 'LastName__c LIKE \'' + searchItem.LastName__c + '%\' ';
            }
            if (String.isNotBlank(searchItem.Name)) {
                query += 'AND ' ;
                query += 'Name LIKE \'' + searchItem.Name + '%\' ';
            }

            if (String.isNotBlank(searchItem.Country__c)) {
                query += 'AND ' ;
                query += 'Country__c LIKE\'' + searchItem.Country__c + '%\' ';
            }
            if (String.isNotBlank(searchItem.Email__c)) {
                query += 'AND ' ;
                query += 'Email__c LIKE\'' + searchItem.Email__c + '\' ';
            }
            query += 'ORDER BY ' + sortByColumn + ' ' + order;

        }
        System.debug(query);
        return query;
    }
    public void executePagination() {
        setController = new ApexPages.StandardSetController(doctors);
        setController.setPageSize(PAGINATION);
    }
    public void sortByName() {
        sortByColumn = 'Name';
        if (order == 'ASC') {
            order = 'DESC';

        } else If (order == 'DESC') {
            order = 'ASC';
        }
        searchDoctor();
    }
    public void sortByEmail() {
        sortByColumn = 'Email__c';
        if (order == 'ASC') {
            order = 'DESC';

        } else If (order == 'DESC') {
            order = 'ASC';
        }
        searchDoctor();
    }
    public void sortByCountry() {
        sortByColumn = 'Country__c';
        if (order == 'ASC') {
            order = 'DESC';

        } else If (order == 'DESC') {
            order = 'ASC';
        }
        searchDoctor();
    }
    public PageReference searchDoctor() {
        doctors = Database.query(createQuery());
        csvBody = getCsvString();
        searchJson = jsongenerator();
        executePagination();
        return null;
    }
    public void next() {
        setController.next();
    }

    public void previous() {
        setController.previous();
    }

    public PageReference sortListBy() {
        if (order == 'ASC') {
            order = 'DESC';
        } else {
            order = 'ASC';
        }
        searchDoctor();
        return null;
    }

    public PageReference reset() {
        PageReference newpage = new PageReference(System.currentPageReference().getURL());
        newpage.setRedirect(true);
        return newpage;
    }
    public PageReference SaveAsExcel() {
        PageReference pr = new PageReference('/apex/HMS_XlsSearchDoctorsSearch');
        return pr;
    }
    public PageReference exportToCSV() {
        PageReference page = new PageReference('/apex/HMS_DoctorsCSVSearchSearch');
        page.setRedirect(false);
        return page;
    }
    private String getCsvString() {
        String csvrows = '';
        csvrows += '"Full name"' + ';' + '"Email"' + ';' + '"Country"' + '\r\n';
        for (HMS_Doctor__c doctor : doctors) {
            csvrows += '\"' + doctor.Name + ' ' + doctor.LastName__c + '\"' + ';' + '\"' + doctor.Email__c + '\"' + ';' + '\"' + doctor.Country__c + '\"' + '\r\n';
        }
        return csvrows;
    }
    private String jsongenerator() {
        JSONGenerator gen = JSON.createGenerator(true);
        for (HMS_Doctor__c doctor : doctors) {
            gen.writeStartObject();
            gen.writeStringField('id', doctor.id);
            gen.writeStringField('Full name', doctor.Name + ' ' + doctor.LastName__c);
            gen.writeStringField('Email', doctor.Email__c);
            gen.writeStringField('Country', doctor.Country__c);
            gen.writeEndObject();
        }
        String jsonString = gen.getAsString();
        return jsonstring;
    }
    public PageReference exportToJson() {
        PageReference page = new PageReference('/apex/HMS_DoctorJsonGeneratorSearchPage');
        page.setRedirect(false);
        System.debug(page);
        return page;
    }
}