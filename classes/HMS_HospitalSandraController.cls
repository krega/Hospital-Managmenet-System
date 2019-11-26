public with sharing class HMS_HospitalSandraController {
    public List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper> getHospitals { get; set; }
    public List<HMS_HospitalSOAPWrapper> hosWrapper { get; set; }
    public HMS_HospitalSandasOperationItem item { get; set; }
    public HMS_HospitalSandrasSearchItem searchItem { get; set; }
    public Id responseId { get; set; }
    public String message { get; set; }
    public Boolean isVisible { get; set; }
    public Boolean isSuccess { get; set; }
    public Integer index { get; set; }

    public HMS_HospitalSandraController() {
        getHospitals = new List <HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper>();
        hosWrapper = new list<HMS_HospitalSOAPWrapper>();
        message = null;
        isSuccess = false;
        searchItem = new HMS_HospitalSandrasSearchItem();
        item = new HMS_HospitalSandasOperationItem();
    }


    private void isErrVisible() {
        if (message != null) {
            isVisible = true;
        }
    }
    public void clearMessage() {
        message = null;
        isVisible = false;
    }

    public void createSandraHospital() {
        try {
            message = HMS_HospitalSandraControllerHelper.callCreateHospital(item.newHospitalName, item.newHospitalEmail, item.newHospitalCity, item.newHospitalStreet, item.newHospitalCountry);
            clearNewHospital();
            isErrVisible();
            isSuccess = true;
        } catch (Exception e) {
            message = e.getMessage();
            isErrVisible();
        }
    }
    public void searchHospital() {
        try {
            hosWrapper = HMS_HospitalSandraControllerHelper.callSearch(searchItem.nameHospitalSearch, searchItem.countryHospitalSearch, searchItem.emailHospitalSearch);
        } catch (Exception e) {
            message = e.getMessage();
        }
    }

    public void updateHospital() {
        try {
            HMS_HospitalSandraControllerHelper.isAccessTokenAvailable();
            message = HMS_HospitalSandraControllerHelper.callEditHospital(responseId, item.newHospitalName, item.newHospitalEmail, item.newHospitalCity, item.newHospitalStreet, item.newHospitalCountry);
            isErrVisible();
            if (message == null && message == '') {
                isSuccess = true;
            }
            isSuccess = false;
        } catch (Exception e) {
            message = e.getMessage();
            isErrVisible();
        }
    }
    public void deleteHospital() {
        try {

            message = HMS_HospitalSandraControllerHelper.callDeleteHospital(responseId);
            isErrVisible();
        } catch (Exception e) {
            message = e.getMessage();
            isErrVisible();
        }

    }
    public void clearNewHospital() {
        item = null;
    }
    public void fillFieldToUpdate() {
        item.newHospitalCountry = hosWrapper[index].hospitalCountry;
        item.newHospitalEmail = hosWrapper[index].hospitalEmail;
        item.newHospitalName = hosWrapper[index].hospitalName ;
    }

    public PageReference clearField() {
        hosWrapper.clear();
        searchItem = null;
        return null;
    }

}