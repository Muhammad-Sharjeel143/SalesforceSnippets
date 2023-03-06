trigger createopp on Account (after insert) {
    
    List<Opportunity> optyList=new List<Opportunity>();
   
    
    for(Account a:Trigger.new)
    {
        Opportunity opp=new Opportunity();
        opp.AccountId=a.id;
        opp.Name='Created from account';
        opp.StageName='Prospecting';
        opp.CloseDate=Date.toDay();
        optyList.add(opp);
    }
    insert optyList;
}