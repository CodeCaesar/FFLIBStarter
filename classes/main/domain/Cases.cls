public class Cases extends fflib_SObjects implements ICases {
 
  public static ICases newInstance(List<Case> recordList) {
    return (ICases) Application.Domain.newInstance(recordList);
  }

  public static ICases newInstance(Set<Id> recordIdSet) {
    return (ICases) Application.Domain.newInstance(recordIdSet);
  }

  public Cases(List<Case> sObjectList) {
    super(sObjectList, Schema.Case.SObjectType);
  }

  public List<Case> getCases() {
    return (List<Case>) getRecords();
  }
  public Map<ID, Case> getCasesMap() {
    return new Map<ID, Case>(getCases());
  }
  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Cases((List<SObject>) objectList);
    }
  }
}