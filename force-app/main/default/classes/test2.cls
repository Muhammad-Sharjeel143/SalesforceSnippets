@isTest
public with sharing class test2 {
      @isTest
    public static void updateopStatusTest(){
// created no of account and added into the list
        List<Account> AccountList = new List<Account>();
        for (Integer i = 0; i<5; i++) {
            Account acc = new Account();
            acc.Name  = 'DemoTest'+i;
            acc.Account_Status__c ='New';
            AccountList.add(acc);
        }
        Test.startTest();
        insert AccountList;
        
//created no of related opportunity associated with account through id's 
//
       List<Opportunity> oppList = new List<Opportunity>();
        
      for(Account acc: AccountList){
            Opportunity opp = new Opportunity();
           opp.AccountId  = acc.Id;
            opp.Name= acc.Name;
            opp.StageName= 'prospecting';
            opp.opportunity_Status__c = acc.Account_Status__c;
            opp.CloseDate = System.today();
            oppList.add(opp);
       }
        
     
        insert oppList;
        
       
        for(Account  acc : AccountList) {
            acc.Account_Status__c ='open';  
        }
        
        update AccountList;
        
     //   system.debug(AccountList);
		  Test.stopTest();
         List<Opportunity> updatedopp = [SELECT id, opportunity_Status__c FROM Opportunity WHERE id =: oppList[0].Id];
     ///   if(updatedopp!=null && updatedopp.opportunity_Status__c){
       //     system.debug('opportunity is updated');
      //  }
        System.assertEquals('open', updatedopp[0].opportunity_Status__c);
        
    }
}