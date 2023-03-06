public class LeadProcessor Implements Database.Batchable<sObject>, Database.stateful{
    Integer recordProcessed =0;
  	public Database.QueryLocator start(database.BatchableContext bc){
        return Database.getQueryLocator([SELECT id, LeadSource from Lead]);
        
  	 }
   public void execute(Database.BatchableContext bc, List<lead> leadquery){
      List<Lead> lead = new List<Lead>();
       For(Lead leads : leadquery){
           leads.LeadSource = 'DreamForce';
           
       }
       
       update leadquery;
       recordProcessed = recordProcessed + leadquery.size();
    }
   		public void finish(Database.BatchableContext bc){
        system.debug('Total record processed'  + recordProcessed);
   	 }

}