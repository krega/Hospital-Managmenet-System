

public with sharing class HMS_DoctorServiceHelper {

    public static List<HMS_DoctorServiceWrapper> convertDoctorsToDoctorsServiceWrapper(List<HMS_Doctor__c> doctors){
            List<HMS_DoctorServiceWrapper> doctorsWrappers = new List<HMS_DoctorServiceWrapper>();
            for(HMS_Doctor__c doctor : doctors){
                HMS_DoctorServiceWrapper doctorsResponseWrapper = new HMS_DoctorServiceWrapper(doctor.Id, doctor.Name, doctor.LastName__c, doctor.Country__c, doctor.Email__c);
                doctorsWrappers.add(doctorsResponseWrapper);
            }
            return doctorsWrappers;
        }

        public static HMS_WebServiceRespond upsertDoctor(String id, String firstName, String lastName, String email, String country, String street, String city, String externalId){
            HMS_Doctor__c doctor;
            if(!String.isBlank(externalId)){
                List<HMS_Doctor__c> doctors = [SELECT Id, Name, 	LastName__c, Email__c,Country__c,Street__c,City__c, ExternalDoctorId__c
                FROM HMS_Doctor__C WHERE ExternalDoctorId__c= : externalId ];
                if(doctors.isEmpty()){
                    doctor = new HMS_Doctor__c(Name = firstName, LastName__c = lastName, Email__c = email, Country__c = country, Street__c = street, City__c = city, ExternalDoctorId__c = externalId);
                }else {
                    doctor = doctors[0];
                    doctor.Name = firstName;
                    doctor.LastName__c = lastName;
                    doctor.Email__c = email;
                    doctor.Country__c = country;
                    doctor.Street__c = street;
                    doctor.City__c = city;

                }
            }
            else{
              doctor = new HMS_Doctor__c(Id = id, Name = firstName, LastName__c = lastName, Email__c = email, Country__c = country, Street__c = street, City__c = city, ExternalDoctorId__c = externalId);
            }

            System.debug(doctor.Id);
            Database.UpsertResult result = Database.upsert(doctor);
            System.debug(doctor.id);
            HMS_WebServiceRespond webServiceResponse = new HMS_WebServiceRespond(doctor.id, result.success, result.success ? '': result.getErrors()[0].getMessage());
            return webServiceResponse;
        }

    }