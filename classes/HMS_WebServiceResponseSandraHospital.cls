/**
 * Created by BRITENET on 14.11.2019.
 */

public with sharing class HMS_WebServiceResponseSandraHospital {
    public class HDC_WebServiceResponse {
        public String responseId;
        public String messageError;
        public Boolean success;
        private String[] responseId_type_info = new String[]{'responseId','http://soap.sforce.com/schemas/class/HDC_WebServiceResponse',null,'0','1','true'};
        private String[] messageError_type_info = new String[]{'messageError','http://soap.sforce.com/schemas/class/HDC_WebServiceResponse',null,'0','1','true'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/schemas/class/HDC_WebServiceResponse',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_WebServiceResponse','true','false'};
        private String[] field_order_type_info = new String[]{'responseId','messageError','success'};
    }

}