//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassHdcHospit {
    public class createHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public soapSforceComSchemasClassHdcHospit.HDC_responseIdWrapper getValue() {
            soapSforceComSchemasClassHdcHospit.createHospitalResponse_element response = (soapSforceComSchemasClassHdcHospit.createHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class getHospitalsResponse_elementFuture extends System.WebServiceCalloutFuture {
        public soapSforceComSchemasClassHdcHospit.HDC_HospitalWrapper[] getValue() {
            soapSforceComSchemasClassHdcHospit.getHospitalsResponse_element response = (soapSforceComSchemasClassHdcHospit.getHospitalsResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class updateHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public soapSforceComSchemasClassHdcHospit.HDC_responseIdWrapper getValue() {
            soapSforceComSchemasClassHdcHospit.updateHospitalResponse_element response = (soapSforceComSchemasClassHdcHospit.updateHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class deleteHospitalResponse_elementFuture extends System.WebServiceCalloutFuture {
        public soapSforceComSchemasClassHdcHospit.HDC_responseIdWrapper getValue() {
            soapSforceComSchemasClassHdcHospit.deleteHospitalResponse_element response = (soapSforceComSchemasClassHdcHospit.deleteHospitalResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncHDC_HospitalService {
        public String endpoint_x = 'https://eu29.salesforce.com/services/Soap/class/HDC_HospitalService';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassHdcHospit.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public soapSforceComSchemasClassHdcHospit.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassHdcHospit.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassHdcHospit.CallOptions_element CallOptions;
        public soapSforceComSchemasClassHdcHospit.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/HDC_HospitalService';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalService', 'soapSforceComSchemasClassHdcHospit', 'http://soap.sforce.com/schemas/class/HDC_responseIdWrapper', 'soapSforceComSchemasClassHdcHospit', 'http://soap.sforce.com/schemas/class/HDC_HospitalWrapper', 'soapSforceComSchemasClassHdcHospit'};
        public AsyncSoapSforceComSchemasClassHdcHospit.createHospitalResponse_elementFuture beginCreateHospital(System.Continuation continuation,String name,String email,String city,String street,String country) {
            soapSforceComSchemasClassHdcHospit.createHospital_element request_x = new soapSforceComSchemasClassHdcHospit.createHospital_element();
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            return (AsyncSoapSforceComSchemasClassHdcHospit.createHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassHdcHospit.createHospitalResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'createHospital',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'createHospitalResponse',
              'soapSforceComSchemasClassHdcHospit.createHospitalResponse_element'}
            );
        }
        public AsyncSoapSforceComSchemasClassHdcHospit.getHospitalsResponse_elementFuture beginGetHospitals(System.Continuation continuation,String name,String country,String email) {
            soapSforceComSchemasClassHdcHospit.getHospitals_element request_x = new soapSforceComSchemasClassHdcHospit.getHospitals_element();
            request_x.name = name;
            request_x.country = country;
            request_x.email = email;
            return (AsyncSoapSforceComSchemasClassHdcHospit.getHospitalsResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassHdcHospit.getHospitalsResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'getHospitals',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'getHospitalsResponse',
              'soapSforceComSchemasClassHdcHospit.getHospitalsResponse_element'}
            );
        }
        public AsyncSoapSforceComSchemasClassHdcHospit.updateHospitalResponse_elementFuture beginUpdateHospital(System.Continuation continuation,String id,String name,String email,String city,String street,String country) {
            soapSforceComSchemasClassHdcHospit.updateHospital_element request_x = new soapSforceComSchemasClassHdcHospit.updateHospital_element();
            request_x.id = id;
            request_x.name = name;
            request_x.email = email;
            request_x.city = city;
            request_x.street = street;
            request_x.country = country;
            return (AsyncSoapSforceComSchemasClassHdcHospit.updateHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassHdcHospit.updateHospitalResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'updateHospital',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'updateHospitalResponse',
              'soapSforceComSchemasClassHdcHospit.updateHospitalResponse_element'}
            );
        }
        public AsyncSoapSforceComSchemasClassHdcHospit.deleteHospitalResponse_elementFuture beginDeleteHospital(System.Continuation continuation,String id) {
            soapSforceComSchemasClassHdcHospit.deleteHospital_element request_x = new soapSforceComSchemasClassHdcHospit.deleteHospital_element();
            request_x.id = id;
            return (AsyncSoapSforceComSchemasClassHdcHospit.deleteHospitalResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassHdcHospit.deleteHospitalResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'deleteHospital',
              'http://soap.sforce.com/schemas/class/HDC_HospitalService',
              'deleteHospitalResponse',
              'soapSforceComSchemasClassHdcHospit.deleteHospitalResponse_element'}
            );
        }
    }
}