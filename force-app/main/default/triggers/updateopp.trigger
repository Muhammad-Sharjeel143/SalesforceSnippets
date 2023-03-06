trigger updateopp on Account (after update) {
    
    List<Opportunity> optyList=new List<Opportunity>();
   
    
    for(Account a:Trigger.new)
    {
        Opportunity opp=new Opportunity();
        opp.AccountId=a.id;
        opp.Name='Created from account';
        opp.StageName='Qualification';
        opp.CloseDate=Date.toDay();
        optyList.add(opp);
    }
    update optyList;
}