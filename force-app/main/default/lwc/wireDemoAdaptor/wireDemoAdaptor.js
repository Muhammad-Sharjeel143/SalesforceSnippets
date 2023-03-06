import { LightningElement, api,wire } from 'lwc';
//importing the funcitonalities from uiRecordApi
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
//Referencing the field 

// import Name_Field from '@salesforce/schema/Account.Name';
// import Phone_Field from '@salesforce/schema/Account.Phone';

export default class WireDemoAdaptor extends LightningElement {

    @api recordId;

    // @wire(getRecord, {recordId: '$recordId', fields: [Name_Field, Phone_Field]})
    @wire(getRecord, {recordId: '$recordId', fields: [Account.Name, Account.Phone]})
     record;

     get Name(){
        // return this.record.data ? getFieldValue(this.record.data, Name_Field) : '';

        return this.record.data.fields.Name.value;
     }
     get Phone(){
        // return this.record.data ? getFieldValue(this.record.data, Phone_Field) : '';
        return this.record.data.fields.Name.value;
     }


}