trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    // Get the related opportunities for the accounts in this trigger
    
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new]);
    
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.
    
    for(Account a : Trigger.new) {
       
        // Check if the account already has a related opportunity.
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 1) {
            // If it doesn't, add a default opportunity
              Opportunity newOpp = new Opportunity();
                        newOpp.AccountId = a.Id;
                        newOpp.Name = a.Name;
                        newOpp.StageName = 'Closed Won';
                        newOpp.CloseDate = date.today();
                        oppList.add(newOpp);
        }           
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}