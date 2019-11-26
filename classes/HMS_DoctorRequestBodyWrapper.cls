/**
 * Created by BRITENET on 19.11.2019.
 */

public with sharing class HMS_DoctorRequestBodyWrapper {
        public String id { get; set; }
        public String firstName { get; set; }
        public String lastName { get; set; }
        public String email { get; set; }
        public String country { get; set; }
        public String street { get; set; }
        public String city { get; set; }
        public String externalId{get;set;}
        public HMS_DoctorRequestBodyWrapper(){

        }
    public HMS_DoctorRequestBodyWrapper(String id, String firstName, String lastName, String email, String country, String street, String city,String externalId ){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.country = country;
        this.street = street;
        this.city = city;
        this.externalId = externalId;
    }

    public String getSerializedObjectPUT(){
        return JSON.serialize(this);
    }

    public String getSerializedObjectPOST(){
        HMS_Helper helper = new HMS_Helper(firstName, lastName, email, country, street, city ,externalId);
        return JSON.serialize(helper);
    }

    public class HMS_Helper{
        public String firstName { get; set; }
        public String lastName { get; set; }
        public String email { get; set; }
        public String country { get; set; }
        public String street { get; set; }
        public String city { get; set; }
        public String externalId{get;set;}

        public HMS_Helper(String firstName, String lastName, String email, String country, String street, String city, String externalId){
            this.firstName = firstName;
            this.country = country;
            this.street = street;
            this.lastName = lastName;
            this.email = email;
            this.city = city;
            this.externalId = externalId;
        }
    }
}
