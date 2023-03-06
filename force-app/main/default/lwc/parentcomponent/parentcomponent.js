import { LightningElement , wire} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getContacts from '@salesforce/apex/ContactController.getContacts';
export default class Parentcomponent extends LightningElement {
    wiredContactList;
    @wire(getContacts)
    wiredcontacts(result) {
        this.wiredContactList  = result;
      if (result.data) {
        this.contacts = result.data;
        // console.log("the result is : " + this.contacts.length);
        // this.error = undefined;
      } else {
        this.error = result.error;
      }
    }

    insertHandler(){
      return refreshApex(this.wiredContactList);
    }
}