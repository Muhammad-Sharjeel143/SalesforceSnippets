public with sharing class AccwithOppupdateHandle {
    public static void updateRelatedOpp(List<Account> newAccount, Map<id, Account> oldMap) {
        Map<id,Account> updatedPhones = new Map<Id,Account>();

        //filtering the account where phone is updated 
        for (Account acc: newAccount){
            if (oldMap!= null && acc.Phone!=oldMap.get(acc.id).phone){
                 updatedPHones.put(acc.id, acc); 
            }
        }
        List<Opportunity> relatedOpportunity = [SELECT id,AccountId, TrackingNumber__c from Opportunity where AccountId in :updatedPhones.keySet()];
        List <Opportunity> finalOpp = new List<Opportunity>();
        if(relatedOpportunity.size()>0){
           for (Opportunity o :relatedOpportunity)
            {
                if(updatedPhones.containsKey(o.AccountId))
                {
                    
                    o.TrackingNumber__c = updatedPhones.get(o.AccountId).Phone;
                     
                }
            }
        }
        update relatedOpportunity;
    }
}