/**
 * Created by BRITENET on 17.11.2019.
 */
global class HMS_DoctorServiceWrapper {
    public String doctorId;
    public String doctorFirstName;
    public String doctorLastName;
    public String doctorCountry;
    public String doctorEmail;

    public HMS_DoctorServiceWrapper(String id, String firstName, String lastName, String country, String email){
        doctorId = id;
        doctorFirstName = firstName;
        doctorLastName = lastName;
        doctorCountry = country;
        doctorEmail = email;
    }

}