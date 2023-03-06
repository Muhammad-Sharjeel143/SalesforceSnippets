public class AccountConCalculator {
	@future
    public static void Contactcount(List<id> accListId){
        List<Account> accList = [SELECT Id, (Select id from contacts ) from Account where Id IN: accListId];
        
        for(Account acc : accList){
            acc.Number_Of_Contacts__c = acc.contacts.size();
        }
        if(!accList.isEmpty()){
            update accList ;
        }
    }
}