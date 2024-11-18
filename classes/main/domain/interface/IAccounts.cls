public interface IAccounts extends fflib_ISObjects {
  List<Account> getAccounts();
  Map<ID, Account> getAccountsMap();
  Map<ID, List<Contact>> getAccountsContactsMap();
}