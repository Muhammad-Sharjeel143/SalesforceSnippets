import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Contact  from '@salesforce/schema/Contact';
import FirstName  from '@salesforce/schema/Contact.FirstName';
import LastName  from '@salesforce/schema/Contact.LastName';
import Email  from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';

import { refreshApex } from '@salesforce/apex';

export default class ContactCreator extends LightningElement {
    ObjectApiName = Contact;
    fields = [FirstName, LastName, Email];

    // @wire(getContacts)
    // contacts;
    
    
    handlesuccess(event){

        const toastEvent = new ShowToastEvent({
            title: "contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });

        console.log("string" + event.detail.id);
        this.dispatchEvent(toastEvent);
        // this.dispatchEvent(new CustomEvent('insertlist'));
        // return refreshApex(this.contacts);
    }
}

// 