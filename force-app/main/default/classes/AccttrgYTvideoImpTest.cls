@isTest
public with sharing class AccttrgYTvideoImpTest {
    @isTest
    public static void updateRatingTest(){
        List<Account> accList = new List<Account>();
        //creating the data
         for(Integer i= 0; i<5; i++){
            Account acc = new Account ();
            acc.Name = 'test'+ i;
            acc.Industry = 'Media';
            accList.add(acc);
        }

        //adding them in list using DML
        Test.startTest();
        insert accList;
        Test.stopTest();

// Query the created Data

        List<Account> UpdatedAccountList = [SELECT Id , Rating FROM Account WHERE Id =: accList[0].id];
         //Assertfucntion
        System.assertEquals('Hot', UpdatedAccountList[0].Rating);
    }
}