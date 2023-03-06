public with sharing class accountTriggerHandler {
    public static void InsertRating(List<Account> accList) {
        for(Account acc : accList){
            if (acc.Industry!=null && acc.Industry=='Media') {
                acc.Rating='Hot';
            }
        }

    }
    public static void AccountRelatedOpp(List<Account> acclist ){

        List<Opportunity> oppToBeInserted = new List<Opportunity>();

        for(Account acc : acclist){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name  = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = date.today();
            oppToBeInserted.add(opp);
        }
        if(!oppToBeInserted.isEmpty()){
            insert oppToBeInserted;
        }
    }

    //Method for phone update then update message in description:
    public static void phoneupdateDescription(List<Account> newList , Map<id,Account> oldMap){

        for (Account Acc : newList) {
            if (oldMap!=null && Acc.Phone!= oldMap.get(Acc.Id).phone) {
                 Acc.Description= 'Phone is updated';
            }
        }        
    }
    // public static void  phoneupdupdatePhoneRelatedOppateopp(List<Account> accList, Map<Id, Account> oldMap){
    
    //     List<Opportunity> OppList = new List<Opportunity>();
    //     Map<Id,Account> AccIdToAccountMap = new Map<Id, Account>();

    //     for (Account  acc : accList) {
    //         if (oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone) {
    //             AccIdToAccountMap.put(acc.Id, acc);
    //         }


    //     for (Opportunity opp : [SELECT  id , Phone__c FROM Opportunity WHERE AccountId =: AccIdToAccountMap.keySet()]) {
            
    //         Opportunity oppor = new Opportunity();
    //             if (AccIdToAccountMap.containsKey(opp.AccountId)) {
    //                 oppor.Id = opp.Id;
    //                 oppor.Phone__c = AccIdToAccountMap.get(opp.AccountId).phone;
    //                 OppList.add(oppor);
    //             }
    //                 if (!OppList.isEmpty()) {
    //                 insert OppList;
    //             }
    //         }
    //     }
    // } 
    
}
    //     Map<id, Account> AccMap = new Map<id, Accoun> (); .
    //     List<Opportunity> updatephoneOpp  = new List<Opportunity>();

    //     for (Account acc : accList){
    //         if(oldMap!= null && acc.phone!=oldMap.get(id.Account).phone){
    //             AccMap.put(acc.Id, acc);
    //         }
    //     }

    //     optylist = [SELECT Id , Name FROM Opportunity WHERE AccountId IN : AccMap.keySet()];

    //     for(Opportunity opp : optyList){
            
    //     }
    // }