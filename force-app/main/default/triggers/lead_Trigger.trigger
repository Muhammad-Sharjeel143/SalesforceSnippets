trigger lead_Trigger on Lead (after insert) {
    Map<id, lead> leadMap = Trigger.newMap;
    set<id> keys = leadMap.keySet();
	SMS_Example.sendMessage(keys);
}

//List<Contact> newcontact  = [select id from contact Where createdDate=yesterday];