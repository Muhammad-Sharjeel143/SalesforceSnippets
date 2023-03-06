public class SMS_Example {
    @future(callout = true)
    Public static void sendMessage(set<id> leadids){
        List<Lead> leads = [Select id, Mobile__c, FirstName from Lead Where id in : leadids];
        for(Lead l : leads){
            Http http = new http();
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://api.txtlocal.com/send/?';
            endpoint = endpoint + 'apikey=NzM1MTU3NTk0MjU1MzY2ZDUzN2E0NjY0NDg2ZDc3NmU=';
            endpoint = endpoint + '&numbers='+ '44'+ l.Mobile__c;
            endpoint = endpoint +  '&sender=TXTLCL';
            endpoint = endpoint + '&message='+l.firstName+ 'your inquiry is received';
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            system.debug(response.getStatus());
        }
    }
}