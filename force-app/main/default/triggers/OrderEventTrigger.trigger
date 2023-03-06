trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> taskList = new List<Task>();
    for(Order_Event__e event : Trigger.new){
        if(event.Has_Shipped__c == true){
            Task newtask = new Task();
            newtask.Priority = 'Medium';
            newtask.Subject = 'Follow up on shipped order 105';
            newtask.OwnerId = userinfo.getUserId();
            taskList.add(newtask);
        }
    }
    insert taskList;
}