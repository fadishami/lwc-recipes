public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WHERE Picture__c != NULL
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WHERE Name LIKE :key AND Picture__c != NULL
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, Name, Title, Phone, Email, Picture__c
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    // In order to demonstrate surfacing an error to LWC, this method always
    // throws a custom Apex exception, which is handled in the component.
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactError() {
        List<Contact> contactList = new List<Contact>();
        if (contactList.size() < 5) {
            throw new CustomException(
                'This is a custom Apex-generated error message.'
            );
        }
        return contactList;
    }

    public class CustomException extends Exception {
    }
}
