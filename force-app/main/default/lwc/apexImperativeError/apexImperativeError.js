import { LightningElement } from 'lwc';
import getContactError from '@salesforce/apex/ContactController.getContactError';

export default class ApexImperativeError extends LightningElement {
    contact;
    error;

    handleButtonClick() {
        getContactError()
            .then((result) => {
                this.contact = result;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.contact = undefined;
            });
    }
}
