@IsTest
private class TEST_Cases {
    @TestSetup
    static void makeData() {

        ATK.prepare(Case.SObjectType, 10)
            .field(Case.Subject)
            .index('Case-{0000}')
            .field(Case.Status)
            .repeat('New', 'Closed')
            .save();
    }

    @IsTest
    static void testFFLIB() {
        ICases theseCases = Cases.newInstance(CasesSelector.newInstance().selectAll());
        ICases theseCases2 = Cases.newInstance(theseCases.getCasesMap().keySet());
        System.assertEquals(10, theseCases.getCases().size());
        System.assertEquals(10, theseCases.getCasesMap().size());
        System.assertEquals(10, theseCases2.getCases().size());
        System.assertEquals(10, theseCases2.getCasesMap().size());
    }

}