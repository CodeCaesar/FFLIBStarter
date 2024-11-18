public class CasesSelector extends fflib_SObjectSelector implements ICasesSelector {
  public static ICasesSelector newInstance() {
    return (ICasesSelector) Application.Selector.newInstance(Case.SObjectType);
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Case.Id,
      Case.AccountId,
      Case.CaseNumber,
      Case.Description,
      Case.Origin,
      Case.Reason,
      Case.ContactId,
      Case.Priority,
      Case.ProductId,
      Case.Status,
      Case.Type,
      Case.IsClosed
    };
  }

  public Schema.SObjectType getSObjectType() {
    return Case.SObjectType;
  }

  public List<Case> selectAll() {
    return (List<Case>) Database.query(newQueryFactory().toSOQL());
  }


}