public with sharing class DailyOppProcessor implements Schedulable {
 
    public void execute(SchedulableContext cxt){
        List<Opportunity> ListOpp = [Select Id , LeadSource from Opportunity 
                                    Where LeadSource= 'null' Limit 200 ];

        for (Opportunity opp : ListOpp) {
            opp.LeadSource = 'Web';
        }
        if (!ListOpp.isEmpty()) {
            update ListOpp;
        }
    }
}