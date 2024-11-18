@IsTest
public class TEST_Opportunities {
  @TestSetup
  static void makeData() {
    ATK.prepare(Opportunity.SObjectType, 10)
      .field(Opportunity.Name)
      .index('Opportunity-{0000}')
      .field(Opportunity.StageName)
      .repeat('Prospecting')
      .field(Opportunity.CloseDate)
      .repeat(Date.today().addDays(30))
      .save();

  }
  @IsTest
  static void testFFLIB() {
      IOpportunities theseOpportunities = Opportunities.newInstance(OpportunitiesSelector.newInstance().selectAll());
      IOpportunities theseOpportunities2 = Opportunities.newInstance(theseOpportunities.getOpportunitiesMap().keySet());
      System.assertEquals(10, theseOpportunities.getOpportunities().size());
      System.assertEquals(10, theseOpportunities.getOpportunitiesMap().size());
      System.assertEquals(10, theseOpportunities2.getOpportunities().size());
      System.assertEquals(10, theseOpportunities2.getOpportunitiesMap().size());
  }

}