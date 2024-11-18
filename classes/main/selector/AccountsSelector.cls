public class AccountsSelector extends fflib_SObjectSelector implements IAccountsSelector {
  public static IAccountsSelector newInstance() {
    return (IAccountsSelector) Application.Selector.newInstance(
      Account.SObjectType
    );
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Account.Id,
      Account.BillingAddress,
      Account.BillingStreet,
      Account.BillingCity,
      Account.BillingState,
      Account.BillingPostalCode,
      Account.BillingCountry,
      Account.BillingStreet,
      Account.ShippingAddress,
      Account.ShippingStreet,
      Account.ShippingCity,
      Account.ShippingState,
      Account.ShippingPostalCode,
      Account.ShippingCountry,
      Account.ShippingStreet,
      Account.Name,
      Account.Description,
      Account.Phone
    };
  }

  public Schema.SObjectType getSObjectType() {
    return Account.SObjectType;
  }

  public List<Account> selectAll() {
    return (List<Account>) Database.query(newQueryFactory().toSOQL());
  }

  public List<Account> selectWithContacts(Set<ID> accountIDSet) {
    ContactsSelector contactSelect = new ContactsSelector();
    fflib_QueryFactory accountQueryFactory = newQueryFactory();
    accountQueryFactory.setCondition('id in: accountIDSet');
    contactSelect.addQueryFactorySubselect(accountQueryFactory);
    return Database.query(accountQueryFactory.toSOQL());
  }
}