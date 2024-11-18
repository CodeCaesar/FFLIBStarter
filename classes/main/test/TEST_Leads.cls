@IsTest
public class TEST_Leads {
  public static String CRON_EXP = '0 0 0 15 3 ? 2042';
  @TestSetup
  static void makeData() {
    ATK.prepare(Lead.SObjectType, 10)
      .field(Lead.LastName)
      .index('Name-{0000}')
      .field(Lead.Company)
      .index('Name-{0000}')
      .save();
  }
  @IsTest
  static void testFFLIB() {
      ILeads theseLeads = Leads.newInstance(LeadsSelector.newInstance().selectAll());
      ILeads theseLeads2 = Leads.newInstance(theseLeads.getLeadsMap().keySet());
      System.assertEquals(10, theseLeads.getLeads().size());
      System.assertEquals(10, theseLeads.getLeadsMap().size());
      System.assertEquals(10, theseLeads2.getLeads().size());
      System.assertEquals(10, theseLeads2.getLeadsMap().size());
  }

}