/**
 * Created by BRITENET on 14.11.2019.
 */

public with sharing class HMS_HospitalWrapperSandraHospital {
    public class HDC_HospitalWrapper {
        public String hospitalCountry;
        public String hospitalEmail;
        public String responseId;
        public String hospitalName;
        private String[] hospitalCountry_type_info = new String[]{'hospitalCountry','http://soap.sforce.com/schemas/class/HDC_HospitalWrapper',null,'0','1','true'};
        private String[] hospitalEmail_type_info = new String[]{'hospitalEmail','http://soap.sforce.com/schemas/class/HDC_HospitalWrapper',null,'0','1','true'};
        private String[] responseId_type_info = new String[]{'responseId','http://soap.sforce.com/schemas/class/HDC_HospitalWrapper',null,'0','1','true'};
        private String[] hospitalName_type_info = new String[]{'hospitalName','http://soap.sforce.com/schemas/class/HDC_HospitalWrapper',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/HDC_HospitalWrapper','true','false'};
        private String[] field_order_type_info = new String[]{'hospitalCountry','hospitalEmail','responseId','hospitalName'};
    }

}