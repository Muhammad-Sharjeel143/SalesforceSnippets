public with sharing class PlatformEventTriggerhandler {
    public static void AccountPostalCode(List<Account_Postal_Event__e> eventrecord) {
        // String PostalCode;
        List<ID> IDlist = new List<ID>();
        // List<String> PostalList = new List<String>();
        
        for (Account_Postal_Event__e events : eventrecord) {
            if (events.Account_Postal_Code__c != null) {
                // IDlist.add(events.IDs__c);
            }
        }
         
        // if(IDlist.size()>50){
        //     makeBatches(IDlist);
        // } 
        // else if( IDlist.size() >= 1 || IDlist.size()< 50){
        //     updateContact(IDlist);
        // }
    }
    // public static void makeBatches(List<Id> IDlist){
    //     Integer counter = 0 ;
    //     List<Id> batchIdsTemp = new List<Id>();
    //     for (Id contactId : IDlist) {
    //         counter ++;
    //         batchIdsTemp.add(contactId); //50 insertion
    //         if (batchIdsTemp.size() == Limits.getLimitCallouts() || counter == IDlist.size()) {
    //             List<Id> batchIds = batchIdsTemp.clone();
    //             updateContact(batchIds); //callout on 50 insertion
    //             batchIdsTemp.clear();
    //         }
    //     }
    //     updateContact(batchIdsTemp);
    
@future (callout = true)
    public static void updateContact(List<ID> IDlist){
        List<Account> AccountList = [SELECT Id, BillingCity,BillingState, BillingPostalCode,BillingCountry FROM Account WHERE Id IN :IDlist];
        Endpoint_Url__mdt endpoint = [Select Id , Base_URL__c , Remaining_URL__c FROM Endpoint_Url__mdt];
        System.debug(endpoint.Base_URL__c);
        System.debug(endpoint.Remaining_URL__c);
        String postalCodeFromAccount;
        List<Account> insertionList = new List<Account>();
        for(Account newAccount : AccountList){ 
            postalCodeFromAccount = newAccount.BillingPostalCode;
            Http http = new Http();
            HttpRequest httpReq = new HttpRequest();
            String base_Url = Endpoint.Base_URL__c;
            String accountPostCode =postalCodeFromAccount;
            String remaining_url = Endpoint.Remaining_URL__c;
            String REQUEST_URL = base_Url + accountPostCode + remaining_url;     
            httpReq.setEndpoint(REQUEST_URL);
            httpReq.setHeader('Content-Type','application/json');
            httpReq.setMethod('GET');  
            HttpResponse response = http.send(httpReq);
            if(response.getStatusCode() == 200){
                system.debug(response.getBody());
                JSONParser httpdata = (JSONParser) JSON.deserialize(response.getBody(), JSONParser.Class);
                newAccount.BillingCity = httpdata.city;
                newAccount.BillingCountry = 'America'; 
                newAccount.BillingStreet = httpdata.state; 
                newAccount.BillingState = httpdata.state;
                insertionList.add(newAccount);   
            }
        }
        if(!insertionList.isEmpty()){
            update insertionList;    
        }
    }
}