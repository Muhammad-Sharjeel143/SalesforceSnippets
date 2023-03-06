import { LightningElement, wire , api, track} from 'lwc';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import  getContacts  from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import { fetchAccounts } from './fetchAccounts';

const Columns = [
    {label: 'FirstName' , fieldName: FirstName.fieldApiName, type: 'text', editable:true},
    {label: 'LastName' , fieldName: LastName.fieldApiName, type: 'text', editable:true},
    {label: 'Email' , fieldName: Email.fieldApiName, type: 'text'}
]
export default class ContactList extends LightningElement {
    @api recordId;
    columns  = Columns;
    selectedRecord;
   
    // @wire(getContacts)
    // contacts;
    @track isLoading = false;
    @track refreshFlag = false;
    //using wired property:

    // @wire(getContacts, { refreshFlag: '$refreshFlag' })
    // contacts;

    //using wired funciton
    contacts;
    error;
    wiredContactList;
    // @wire(getContacts )
    @wire(getContacts, {refreshFlag : "$refreshFlag"} )
    wiredcontacts(result) {
        this.wiredContactList  = result;
      if (result.data) {
        this.contacts = result.data;
        console.log("the result is : " + this.contacts.length);
        // this.error = undefined;
      } else {
        this.error = result.error;
      }
    }


    refreshData() {
        // Set the refresh flag to true to trigger a refresh of the data
        // if(this.refreshFlag  ){
        //     // this.handleIsLoading(true);
        //     this.refreshFlag = false;
        //     // this.handleIsLoading(false);
            
        // }else{
        //     // this.handleIsLoading(true);
        //     this.refreshFlag = true;
        //     // this.handleIsLoading(false);
        // }  
        
        //  this.refreshFlag = !this.refreshflag;
    // return refreshApex(this.wiredContactList);
    }
    // handleIsLoading(spinnerValue){
    //     this.isLoading = spinnerValue;
    // }
  
    // handleSelection(event){
    //     if(event.detail.selectedRows.length > 0){
    //             this.selectedRecord = event.detail.selectedRows[0].Id;
    //     }
    // }
    // deleteContact(){
    //     this.handleIsLoading(true);
    //     deleteRecord(this.selectedRecord)
    //         .then(()=>{
    //         refreshApex(this.wiredContactList);
    //             const toastEvent = new ShowToastEvent({
    //                 title: 'Contact Deleted',
    //                 message: 'The Contact is succesfully deleted.',
    //                 variant: 'success'
    //             });
    //             this.dispatchEvent(toastEvent);
    //             this.handleIsLoading(false);

    //         })
    //         .catch(error =>{
    //         })
    // }

}    
    // get errors() {
    //     return (this.contacts.error) ?
    //         reduceErrors(this.contacts.error) : [];
    // }
