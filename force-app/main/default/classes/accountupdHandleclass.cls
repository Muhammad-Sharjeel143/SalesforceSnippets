public with sharing class accountupdHandleclass {
    public void updateopStatus(List<Account> listAcc) {
        List<Opportunity> listOpp = [Select id, Name ,opportunity_Status__c, Account.Account_Status__c FROM Opportunity where AccountId =:listAcc];

        List<Opportunity> listop = new List<Opportunity>();
        Opportunity op = new Opportunity();
        for (Opportunity opp : listOpp) {
            op = new Opportunity();
            op.id =opp.Id;
            op.Opportunity_Status__c = opp.Account.Account_status__c;
            listOp.add(op);
        }   
        update listOp;
    }

    

}