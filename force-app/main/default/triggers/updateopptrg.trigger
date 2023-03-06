trigger updateopptrg on Account (after update) {
    
    Accounttrghandle acc= new Accounttrghandle();
    acc.updateopStatus(trigger.New);
}