/**
 * Created by BRITENET on 14.11.2019.
 */

public with sharing class HMS_HospitalServiceSandraHospital {
   public HDC_HospitalService entryHDC_HospitalService {get;set;}
   public  HMS_HospitalServiceSandraHospital (){
        entryHDC_HospitalService = new HDC_HospitalService();
    }


    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class address {
        public String city;
        public String country;
        public String countryCode;
        public String geocodeAccuracy;
        public String postalCode;
        public String state;
        public String stateCode;
        public String street;
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] countryCode_type_info = new String[]{'countryCode','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] geocodeAccuracy_type_info = new String[]{'geocodeAccuracy','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] postalCode_type_info = new String[]{'postalCode','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] stateCode_type_info = new String[]{'stateCode','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] street_type_info = new String[]{'street','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'city','country','countryCode','geocodeAccuracy','postalCode','state','stateCode','street'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class DebuggingHeader_element {
        public HMS_HospitalServiceSandraHospital.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class createHospital_element {
        public String name;
        public String email;
        public String city;
        public String street;
        public String country;
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] email_type_info = new String[]{'email','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] street_type_info = new String[]{'street','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'name','email','city','street','country'};
    }
    public class updateHospital_element {
        public String id;
        public String name;
        public String email;
        public String city;
        public String street;
        public String country;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] email_type_info = new String[]{'email','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] street_type_info = new String[]{'street','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'id','name','email','city','street','country'};
    }
    public class getHospitalsResponse_element {
        public HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class createHospitalResponse_element {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class updateHospitalResponse_element {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class deleteHospital_element {
        public String id;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'id'};
    }
    public class deleteHospitalResponse_element {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class location {
        public Double latitude;
        public Double longitude;
        private String[] latitude_type_info = new String[]{'latitude','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] longitude_type_info = new String[]{'longitude','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'latitude','longitude'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class getHospitals_element {
        public String name;
        public String country;
        public String email;
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] email_type_info = new String[]{'email','http://soap.sforce.com/schemas/class/HDC_HospitalService',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService','true','false'};
        private String[] field_order_type_info = new String[]{'name','country','email'};
    }
    public class HDC_HospitalService {
        public String endpoint_x = 'https://eu29.salesforce.com/services/Soap/class/HDC_HospitalService';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public HMS_HospitalServiceSandraHospital.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public HMS_HospitalServiceSandraHospital.DebuggingInfo_element DebuggingInfo;
        public HMS_HospitalServiceSandraHospital.SessionHeader_element SessionHeader;
        public HMS_HospitalServiceSandraHospital.CallOptions_element CallOptions;
        public HMS_HospitalServiceSandraHospital.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService', 'HMS_HospitalServiceSandraHospital', 'http://soap.sforce.com/schemas/class/HDC_WebServiceResponse', 'HMS_WebServiceResponseSandraHospital', 'http://soap.sforce.com/schemas/class/HDC_HospitalWrapper', 'HMS_HospitalWrapperSandraHospital'};
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse createHospital(String name,String email,String city,String street,String country) {
            HMS_HospitalServiceSandraHospital.createHospital_element request_x = new HMS_HospitalServiceSandraHospital.createHospital_element();
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            HMS_HospitalServiceSandraHospital.createHospitalResponse_element response_x;
            Map<String, HMS_HospitalServiceSandraHospital.createHospitalResponse_element> response_map_x = new Map<String, HMS_HospitalServiceSandraHospital.createHospitalResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'createHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'createHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.createHospitalResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper[] getHospitals(String name,String country,String email) {
            HMS_HospitalServiceSandraHospital.getHospitals_element request_x = new HMS_HospitalServiceSandraHospital.getHospitals_element();
            request_x.name = name;
            request_x.country = country;
            request_x.email = email;
            HMS_HospitalServiceSandraHospital.getHospitalsResponse_element response_x;
            Map<String, HMS_HospitalServiceSandraHospital.getHospitalsResponse_element> response_map_x = new Map<String, HMS_HospitalServiceSandraHospital.getHospitalsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'getHospitals',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'getHospitalsResponse',
                            'HMS_HospitalServiceSandraHospital.getHospitalsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse updateHospital(String id,String name,String email,String city,String street,String country) {
            HMS_HospitalServiceSandraHospital.updateHospital_element request_x = new HMS_HospitalServiceSandraHospital.updateHospital_element();
            request_x.id = id;
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            HMS_HospitalServiceSandraHospital.updateHospitalResponse_element response_x;
            Map<String, HMS_HospitalServiceSandraHospital.updateHospitalResponse_element> response_map_x = new Map<String, HMS_HospitalServiceSandraHospital.updateHospitalResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'updateHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'updateHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.updateHospitalResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse deleteHospital(String id) {
            HMS_HospitalServiceSandraHospital.deleteHospital_element request_x = new HMS_HospitalServiceSandraHospital.deleteHospital_element();
            request_x.id = id;
            HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element response_x;
            Map<String, HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element> response_map_x = new Map<String, HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                    this,
                    request_x,
                    response_map_x,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'deleteHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'deleteHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }

}