
public with sharing class HMS_EventLoggerWrapper {

        public String parentId { get; set; }
        public String endpointUrl { get; set; }
        public String requestBody { get; set; }
        public String responseBody { get; set; }
        public String method { get; set; }
        public Integer responseStatusCode { get; set; }
        public String responseStatus { get; set; }
        public Integer attemps { get; set; }

        public HMS_EventLoggerWrapper(String parentId, String endpointUrl, String method, String requestBody, Integer responseStatusCode, String responseStatus, String responseBody, Integer attemps) {
            this.parentId = parentId;
            this.endpointUrl = endpointUrl;
            this.requestBody = requestBody;
            this.responseBody = responseBody;
            this.method = method;
            this.responseStatus = responseStatus;
            this.responseStatusCode = responseStatusCode;
            this.attemps = attemps;
        }

        public String serializeObject() {
            return JSON.serialize(this);
        }
    }


