public  class InsertBatchContact  Implements Database.Batchable<sObject>, Database.AllowsCallouts{
   public String query = 'Select Id, MailingCountry,MailingCity,MailingStreet,MailingState,MailingPostalCode FROM Contact where createdDate=today ';
    public Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator(query); // query passing the batch record
    }
    public void execute( Database.BatchableContext bc, List<Contact> records ){
        
        List<contact> InsertcontList = new List<contact>();
        String postalCode;
        Endpoint_Url__mdt endpoint =[SELECT id, Base_URL__c,Remaining_URL__c FROM Endpoint_Url__mdt];
        
        for (contact newcont : records) {
            postalCode = newcont.MailingPostalCode;
            HttpResponse response =  BatchCallouts.CalloutsFromBatch(postalCode, endpoint);
            
            system.debug('******response '+response.getStatusCode());
            system.debug('******response '+response.getBody());
            
            if(response.getStatusCode() == 200){
                JSONParser httpdata = (JSONParser) JSON.deserialize(response.getBody(), JSONParser.Class);
                newcont.MailingCity = httpdata.city;
                newcont.MailingCountry = 'America'; 
                newcont.MailingStreet = httpdata.state;
                newcont.MailingState = httpdata.state;
                InsertcontList.add(newcont);
            }
        }   
        if(!InsertcontList.isEmpty()){
            update InsertcontList;    
        }
    }
    public void finish(Database.BatchableContext bc){
       
        }
}