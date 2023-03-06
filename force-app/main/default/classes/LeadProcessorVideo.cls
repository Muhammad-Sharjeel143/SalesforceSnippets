public with sharing class LeadProcessorVideo implements Database.Batchable<sObject> { 
    public Integer recordcount = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id, Name from Opportunity]);

    }
    public void execute(Database.BatchableContext bc, List<Opportunity> opp){
        for (Opportunity  op : opp) {
            op.LeadSource ='web';
        }
        update opp;
        recordcount = recordcount + opp.size(); 
       }
    public void finish(Database.BatchableContext bc){
        system.debug('total record debug:' + recordcount);
    }
    }