/**
 * Created by BRITENET on 19.11.2019.
 */

global  class HMS_DoctorWrapper {
    global String doctorId { get; set; }
    global String doctorFirstName{ get; set; }
    global String doctorLastName{ get; set; }
    global String doctorCountry{ get; set; }
    global String doctorEmail{ get; set; }

    global HMS_DoctorWrapper(String id, String firstName, String lastName, String country, String email){
        doctorId = id;
        doctorFirstName = firstName;
        doctorLastName = lastName;
        doctorCountry = country;
        doctorEmail = email;
    }
}