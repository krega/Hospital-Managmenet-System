public with sharing class HMS_LoginRestHandler {

        public static Boolean isTokenAvailable() {

            return ((String) Cache.Org.get('token') != null);
        }

        public static String getAccessTokenToEndpoint() {
            if (isTokenAvailable()) {
                System.debug('isavailable');
                return (String) Cache.Org.get('token');

            } else {
                System.debug('isnotavailable');
                return updateAccessToken();
            }
        }

        public static Boolean verifyEndpointAuthorization(Integer responseCode) {
            if (responseCode == 400 || responseCode == 401) {
                HMS_LoginRestHandler.updateAccessToken();
                return true;
            }return false;
        }

        public static String updateAccessToken() {
            System.debug('updateaccasToken');
            HMS_LoginResponseBodyWrapper loginResponse = getExternalServiceAccessToken();
            System.debug(loginResponse);
            String token = 'Bearer ' + loginResponse.access_token;
            Cache.Org.put('token', token, 28800);
            System.debug(token);
            return (String) Cache.Org.get('token');
        }

            public static HMS_LoginResponseBodyWrapper getExternalServiceAccessToken() {
            HttpRequest req = new HttpRequest();
            req.setMethod('POST');
            req.setEndpoint( HMS_Utils.getCustomSettingValue('loginUri'));
            req.setBody(buildLoginCredentialsUri());
        // HttpResponse response = authorizationCalloutResponse(req);
                System.debug(req);
             //    HMS_EventHandler.saveEvent(null, HMS_Utils.getCustomSettingValue('login'), req.getMethod(), req.getBody(), null, null, null, 1);
                System.debug('jestem');
                System.debug(req);
            HMS_LoginResponseBodyWrapper loginResponseBody = (HMS_LoginResponseBodyWrapper) JSON.deserialize(authorizationCalloutResponse(req), HMS_LoginResponseBodyWrapper.class);
                System.debug(loginResponseBody);
            return loginResponseBody;
        }

        public static String authorizationCalloutResponse(HttpRequest request) {
            Http http = new Http();
            HTTPResponse response = http.send(request);
            System.debug(request);
            return response.getBody();
        }

        public static String buildLoginCredentialsUri() {
            return 'grant_type=' +  HMS_Utils.getCustomSettingValue('grant_type')+
                    '&client_id=' + HMS_Utils.getCustomSettingValue('client_id')+
                    '&client_secret=' + HMS_Utils.getCustomSettingValue('client_secret')+
                    '&username=' +HMS_Utils.getCustomSettingValue('login')+
                    '&password=' + HMS_Utils.getCustomSettingValue('password');
        }

        public with sharing class HMS_LoginResponseBodyWrapper {
            public String access_token { get; set; }
            public String id { get; set; }

        }
    }
