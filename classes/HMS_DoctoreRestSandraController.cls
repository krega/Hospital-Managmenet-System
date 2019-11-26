public with sharing class HMS_DoctoreRestSandraController {
    public HMS_DoctorRequestBodyWrapper item { get; set; }
    public HMS_DoctorSandrasSearchItem searchItem { get; set; }
    public List<HMS_DoctorResponseWrapper> doctorWrapper { get; set; }
    public HMS_WebServiceRespond message { get; set; }
    public List<SelectOption> countries { get; set; }
    public Id doctorId { get; set; }
    public Integer index { get; set; }

    public HMS_DoctoreRestSandraController() {
        searchItem = new HMS_DoctorSandrasSearchItem();
        item = new HMS_DoctorRequestBodyWrapper();
        doctorWrapper = new List<HMS_DoctorResponseWrapper>();
        countries= getItems();

    }
    public List<SelectOption> getItems() {
        return  HMS_CountriesRestHandler.getCountriesSelectOptions();
    }

    public void searchDoctor() {
        doctorWrapper = HMS_DoctoreRestSandraControllerHandler.getDoctor(searchItem.firstName, searchItem.lastName, searchItem.email, searchItem.country);
    }

    public void addDoctor() {
        message = HMS_DoctoreRestSandraControllerHandler.saveNewDoctor(item);
        if(message.messageError == null && message.messageError == ''){
            clearNewDoctor();
        }

    }

    public void editDoctor() {
        item.id = doctorId;
        message = HMS_DoctoreRestSandraControllerHandler.editDoctor(item);
       if(message.messageError != null && message.messageError != ''){
           fillFieldToUpdate();

       }
        else {
            doctorWrapper = HMS_DoctoreRestSandraControllerHandler.getDoctor(item.firstName, item.lastName, item.email, item.country);
            clearNewDoctor();
        }
    }

    public void deleteDoctor() {
        item.id = doctorId;
        message = HMS_DoctoreRestSandraControllerHandler.deleteDoctor(item.id, item.externalId);
        doctorWrapper = HMS_DoctoreRestSandraControllerHandler.getDoctor(item.firstName, item.lastName, item.email, item.country);
    }

    public void clearMessage() {
        message = null;
    }

    public void fillFieldToUpdate() {
        item = new HMS_DoctorRequestBodyWrapper();
        item.country = doctorWrapper[index].doctorCountry;
        item.email = doctorWrapper[index].doctorEmail;
        item.firstName = doctorWrapper[index].doctorFirstName ;
        item.lastName = doctorWrapper[index].doctorLastName;
    }

    public PageReference clearField() {
        doctorWrapper.clear();
        searchItem.lastName = '';
        searchItem.firstName = '';
        searchItem.email = '';
        searchItem.country = '';
        return null;
    }

    public void clearNewDoctor() {
        doctorId = null;
        item = new HMS_DoctorRequestBodyWrapper();
    }

}