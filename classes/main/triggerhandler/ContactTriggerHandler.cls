public class ContactTriggerHandler extends fflib_SObjectDomain {
  public ContactTriggerHandler(List<Opportunity> sObjectList) {
    // Domain classes are initialised with lists to enforce bulkification throughout
    super(sObjectList);
  }

  // public override void onBeforeInsert() {
  //   fflib_ISObjectUnitOfWork theUnitOfWork = Application.UnitOfWork.newInstance();
  //     List<Contact> contacts = new List<Contact>{
  //       new Contact(FirstName = 'Test', LastName = 'User1'),
  //       new Contact(FirstName = 'Test', LastName = 'User2')
  //   };
  //   insert contacts;

  //   Set<Id> contactIds = new Set<Id>();
  //   for (Contact contact : contacts) {
  //     contactIds.add(contact.Id);
  // }

  // IContacts instance = Contacts.newInstance(contactIds);
  //   theUnitOfWork.commitWork();
  // }

  public override void onBeforeUpdate(Map<Id, SObject> existingContactMap) {


  IContacts instance = Contacts.newInstance(existingContactMap.keySet());
    //theUnitOfWork.commitWork();
  }

  public class Constructor implements fflib_SObjectDomain.IConstructable {
    public fflib_SObjectDomain construct(List<SObject> sObjectList) {
      return new ContactTriggerHandler(sObjectList);
    }
  }
}