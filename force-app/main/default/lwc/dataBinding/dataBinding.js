import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    //(i) Data Binding with the help of property
    // greeting = 'Sharjeel';
    // handlechange(event){
    //     this.greeting = event.target.value;
    // }

// (ii) Data Binding with the help of Getter Property
    firstName='';
    lastName='';

    handlechange(event){
        const field = event.target.name;
        if(field === 'fname'){
            this.firstName = event.target.value;
        }else if(field === 'lname'){
            this.lastName = event.target.value;
        }
    }
    get uppercasedFullName(){
        return  `${this.firstName} ${this.lastName}`.toUpperCase();
    }
}