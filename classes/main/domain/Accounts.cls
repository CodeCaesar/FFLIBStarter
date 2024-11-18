public class Accounts extends fflib_SObjects implements IAccounts {
  public static IAccounts newInstance(List<Account> recordList) {
    return (IAccounts) Application.Domain.newInstance(recordList);
  }

  public static IAccounts newInstance(Set<Id> recordIdSet) {
    return (IAccounts) Application.Domain.newInstance(recordIdSet);
  }

  public Accounts(List<Account> sObjectList) {
    super(sObjectList, Schema.Account.SObjectType);
  }

  public List<Account> getAccounts() {
    return (List<Account>) getRecords();
  }

  public Map<ID, Account> getAccountsMap() {
    return new Map<ID, Account>(getAccounts());
  }

  public Map<ID, List<Contact>> getAccountsContactsMap() {
    Map<ID, List<Contact>> accountsContactsMap = new Map<ID, List<Contact>>();
    for (Account thisAccount : getAccounts()) {
      for (Contact thisContact : thisAccount.Contacts) {
        if (accountsContactsMap.get(thisAccount.ID) == null) {
          accountsContactsMap.put(
            thisAccount.ID,
            new List<Contact>{ thisContact }
          );
        } else {
          accountsContactsMap.get(thisAccount.ID).add(thisContact);
        }
      }
    }
    return accountsContactsMap;
  }



  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Accounts((List<SObject>) objectList);
    }
  }
}