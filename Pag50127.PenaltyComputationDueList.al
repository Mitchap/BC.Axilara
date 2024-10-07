page 50127 "Penalty Computation Due List"
{
    ApplicationArea = All;
    Caption = 'Penalty Computation Due List';
    PageType = ListPart;
    SourceTable = "RA Payment Schedule";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)

            {
                field("System Payment ID"; Rec."System Payment ID")
                {
                    ToolTip = 'Specifies the value of the System Payment ID field.', Comment = '%';
                    Editable = false;
                }
                field(Seq; Rec.Seq)
                {
                    ToolTip = 'Specifies the value of the Sequence field.', Comment = '%';
                    Editable = false;
                }
                field("Date Due"; Rec."Date Due")
                {
                    ToolTip = 'Specifies the value of the Date Due field.', Comment = '%';
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                    Editable = false;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                    Editable = false;
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ToolTip = 'Specifies the value of the Date Paid field.', Comment = '%';
                    Editable = false;
                }
                field("REF No."; Rec."REF No.")
                {
                    ToolTip = 'Specifies the value of the REF# field.', Comment = '%';
                    Editable = false;
                }
                field("OR No."; Rec."OR No.")
                {
                    ToolTip = 'Specifies the value of the OR Number field.', Comment = '%';
                    Editable = false;
                }
                field(Penalty; Rec.Penalty)
                {
                    ToolTip = 'Specifies the value of the Penalty field.', Comment = '%';
                    Editable = false;
                }
                field(Principal; Rec.Principal)
                {
                    ToolTip = 'Specifies the value of the Principal field.', Comment = '%';
                    Editable = false;
                }
                field(Interest; Rec.Interest)
                {
                    ToolTip = 'Specifies the value of the Interest field.', Comment = '%';
                    Editable = false;
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.', Comment = '%';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Dummy1: Decimal;
        Dummy2: Decimal;
    begin
        GetTotalPenalty(Rec."RA ID", Dummy1, Dummy2);
        // Rec.FindLast();
        // Rec.Penalty := MPenalty;
        // Rec.Modify();
    end;

    var
        // MPenalty: Decimal;
        // MPenalty2: Decimal;
        MarkedRecords: Boolean;
        MPenalty: Decimal;
        TPenalty: Decimal;
        Mdate: Date;
        MRefAmt: Decimal;
        MBalance: Decimal;
        TBalance: Decimal;
        Mcount: Integer;
        TableFix: Record "RA Payment Schedule";

    procedure GetTotalPenalty(RAID: Code[20]; var TPenalty: Decimal; var UnpaidAmount: Decimal)
    //: Decimal
    begin
        // Get the current "RA ID"
        // Message(RAID);
        MPenalty := 0;
        TableFix.SetFilter(ForPenalty, '%1', true);
        if TableFix.FindSet() then
            repeat
                //TableFix."Check Status" := TableFix."Check Status"::Cleared;
                TableFix.ForPenalty := false;
                TableFix.Modify();
            until TableFix.Next(1) = 0;

        // Set filters for the current RA ID, Amortization, and "Date Due" < Today
        Rec.SetRange("RA ID", RAID);
        Rec.SetRange("Payment Type", Rec."Payment Type"::Amortization);
        Rec.SetFilter("Date Due", '<%1', Today);

        // Sort by "Date Due" in descending order
        Rec.SetCurrentKey("Date Due");

        // Clear any previous marks
        Rec.MarkedOnly(false);
        MarkedRecords := false;

        // Process the records in reverse order and mark them until the first payment is found
        if Rec.FindLast() then begin
            repeat
                // Mark the record if "Amount Paid" is 0
                if Rec."Amount Paid" = 0 then begin
                    Rec.Mark(true);
                    MarkedRecords := true;
                    // MPenalty := MPenalty + ((MPenalty + Rec."Amount") * 0.03);
                    // UnpaidAmount := UnpaidAmount + Rec.Amount;
                    Rec.ForPenalty := true;
                    Rec.Modify()
                end
                else begin
                    // Once a payment is found, stop marking further records
                    break;
                end;
            until Rec.Next(-1) = 0; // Navigate through records normally

        end;

        // Message(Format(MPenalty));
        // Only display marked records
        if MarkedRecords then
            Rec.MarkedOnly(true);
        Rec.SetCurrentKey("Date Due");
        Mcount := 1;
        if rec.FindSet() then
            repeat
                if Mcount = 1 then
                    MRefAmt := Rec.Amount
                else
                    MRefAmt := MBalance;
                Mcount += 1;
                MPenalty := MRefAmt * 0.03;
                MBalance += MPenalty + Rec.Amount;
                TPenalty += MPenalty;
                UnpaidAmount := MBalance;
            until rec.Next(1) = 0;


        //exit(MPenalty); // Return the total penalty
    end;
}

