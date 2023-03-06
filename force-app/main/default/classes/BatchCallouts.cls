public with sharing class BatchCallouts {
  // HttpResponse response = http.send(request);
    public static  HttpResponse CalloutsFromBatch(String postalcode, Endpoint_Url__mdt endpointurl){
      // Endpoint_Url__mdt endpoint =[SELECT id, Base_URL__c,Remaining_URL__c FROM Endpoint_Url__mdt];
        Http http = new Http();
        HttpRequest request = new HttpRequest();
          //    String base_Url = 'https://www.zipcodeapi.com/rest/DemoOnly00xXsbRiIBcjYZdk4nSNSbDE4ja0XwPXLw2CLDVNZloXukb1wIJeLDLu/info.json/';
        String base_Url = endpointurl.Base_URL__c;
        String contactpostalCode = postalcode;
        String unit_URL  = endpointurl.Remaining_URL__c;
            //  String unit_URL  = '/degrees';
        String Request_URL = base_Url + contactpostalCode + unit_URL;
        request.setEndpoint(Request_URL);
        request.setHeader('Content-Type','application/json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response;
    }
}
