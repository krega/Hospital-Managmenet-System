/**
 * Created by BRITENET on 14.11.2019.
 */

public with sharing class AsyncHMS_HospitalServiceSandraHospital {
    public class createHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse getValue() {
            HMS_HospitalServiceSandraHospital.createHospitalResponse_element response = (HMS_HospitalServiceSandraHospital.createHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class getHospitalsResponse_elementFuture extends System.WebServiceCalloutFuture {
        public HMS_HospitalWrapperSandraHospital.HDC_HospitalWrapper[] getValue() {
            HMS_HospitalServiceSandraHospital.getHospitalsResponse_element response = (HMS_HospitalServiceSandraHospital.getHospitalsResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class updateHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse getValue() {
            HMS_HospitalServiceSandraHospital.updateHospitalResponse_element response = (HMS_HospitalServiceSandraHospital.updateHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class deleteHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public HMS_WebServiceResponseSandraHospital.HDC_WebServiceResponse getValue() {
            HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element response = (HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncHDC_HospitalService {
        public String endpoint_x = 'https://eu29.salesforce.com/services/Soap/class/HDC_HospitalService';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
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
        public AsyncHMS_HospitalServiceSandraHospital.createHospitalResponse_elementFuture beginCreateHospital(System.Continuation continuation,String name,String email,String city,String street,String country) {
            HMS_HospitalServiceSandraHospital.createHospital_element request_x = new HMS_HospitalServiceSandraHospital.createHospital_element();
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            return (AsyncHMS_HospitalServiceSandraHospital.createHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncHMS_HospitalServiceSandraHospital.createHospitalResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'createHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'createHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.createHospitalResponse_element'}
            );
        }
        public AsyncHMS_HospitalServiceSandraHospital.getHospitalsResponse_elementFuture beginGetHospitals(System.Continuation continuation,String name,String country,String email) {
            HMS_HospitalServiceSandraHospital.getHospitals_element request_x = new HMS_HospitalServiceSandraHospital.getHospitals_element();
            request_x.name = name;
            request_x.country = country;
            request_x.email = email;
            return (AsyncHMS_HospitalServiceSandraHospital.getHospitalsResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncHMS_HospitalServiceSandraHospital.getHospitalsResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'getHospitals',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'getHospitalsResponse',
                            'HMS_HospitalServiceSandraHospital.getHospitalsResponse_element'}
            );
        }
        public AsyncHMS_HospitalServiceSandraHospital.updateHospitalResponse_elementFuture beginUpdateHospital(System.Continuation continuation,String id,String name,String email,String city,String street,String country) {
            HMS_HospitalServiceSandraHospital.updateHospital_element request_x = new HMS_HospitalServiceSandraHospital.updateHospital_element();
            request_x.id = id;
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            return (AsyncHMS_HospitalServiceSandraHospital.updateHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncHMS_HospitalServiceSandraHospital.updateHospitalResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'updateHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'updateHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.updateHospitalResponse_element'}
            );
        }
        public AsyncHMS_HospitalServiceSandraHospital.deleteHospitalResponse_elementFuture beginDeleteHospital(System.Continuation continuation,String id) {
            HMS_HospitalServiceSandraHospital.deleteHospital_element request_x = new HMS_HospitalServiceSandraHospital.deleteHospital_element();
            request_x.id = id;
            return (AsyncHMS_HospitalServiceSandraHospital.deleteHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
                    this,
                    request_x,
                    AsyncHMS_HospitalServiceSandraHospital.deleteHospitalResponse_elementFuture.class,
                    continuation,
                    new String[]{endpoint_x,
                            '',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'deleteHospital',
                            'http://soap.sforce.com/schemas/class/HDC_HospitalService',
                            'deleteHospitalResponse',
                            'HMS_HospitalServiceSandraHospital.deleteHospitalResponse_element'}
            );
        }
    }

}