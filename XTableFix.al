page 50554 "Table Fix Program"

{

    trigger OnOpenPage()
    var

        TableFix: Record "RA Payment Schedule";

    begin

        //TableFix.SetFilter("Amount Paid", '<>%1', 0);
        TableFix.SetFilter(ForPenalty, '%1', true);
        if TableFix.FindSet() then
            repeat
                //TableFix."Check Status" := TableFix."Check Status"::Cleared;
                TableFix.ForPenalty := false;
                TableFix.Modify();
            until TableFix.Next(1) = 0;

        Message('DONE');
    end;
}

