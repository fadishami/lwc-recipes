import { LightningElement, wire } from 'lwc';
import getContactError from '@salesforce/apex/ContactController.getContactError';

export default class ApexWireError extends LightningElement {
    @wire(getContactError) contact;
}
