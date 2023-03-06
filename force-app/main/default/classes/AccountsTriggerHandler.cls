public with sharing class AccountsTriggerHandler {
    // function for create related opportunity with account 
    public static void createRelatedOpp(List<Account> accList) {
        List<Opportunity> oppList = new List<Opportunity>();

        for(Account acc: accList){
            Opportunity newOpp = new Opportunity();
            newOpp.AccountId = acc.Id;
            newOpp.Name = acc.Name;
            newOpp.StageName = 'Closed Won';
            newOpp.CloseDate = date.today();
            oppList.add(newOpp);
        }
       if(oppList != null){
        insert oppList;
       }
    }
    //Function for opportunity updation
    public void updateopStatus(List<Account> listAcc) {
        List<Opportunity> listOpp = [Select id, Name, opportunity_Status__c, Account.Name, Account.Account_Status__c 
            FROM Opportunity where AccountId =:listAcc];

        List<Opportunity> listop = new List<Opportunity>();
        Opportunity op = new Opportunity();
        for (Opportunity opp : listOpp) {
            op = new Opportunity();
            op.id =opp.Id;
            op.Name = opp.Account.Name;
            op.Opportunity_Status__c = opp.Account.Account_status__c;
            listOp.add(op);                                                           
        }   
        update listOp;
    }
}