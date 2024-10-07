page 50121 "CLS Amortization List"
{
    PageType = List;
    SourceTable = "RA Payment Schedule";
    ApplicationArea = All;
    Caption = ' ';
    InsertAllowed = false; // Disable the "New" action
    DeleteAllowed = false; // Disable the "Delete" action
    Editable = false; // Set the page as non-editable by default    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Seq"; Rec."Seq")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                    Caption = 'Seq';
                }

                field("Date Due"; Rec."Date Due")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }

                field("Amount Due"; Rec."Amount")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                    Caption = 'Amount Due';
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = true;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = true;
                }
                field("Remarks"; Rec."Remarks")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = true;
                }
                field("REF#"; Rec."REF No.")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("OR Number"; Rec."OR No.")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Penalty"; Rec."Penalty")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = true;
                }
                field("Principal"; Rec."Principal")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Interest"; Rec."Interest")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Balance"; Rec."Balance")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("SE Principal"; Rec."SE Principal")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("SE Interest"; Rec."SE Interest")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("SE Balance"; Rec."SE Balance")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("OpenAmortization")
            {
                Caption = 'Open Amortization List';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"CLS Amortization List", Rec); // Replace with the actual page name or ID
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        //Rec.SetCurrentKey("Date Due"); // Set the index to sort by "Date Due" field in ascending order
        Rec.SetFilter("Payment Type", '%1|%2|%3', Rec."Payment Type"::Amortization, Rec."Payment Type"::Payment, Rec."Payment Type"::Adjustment);
    end;

    var
        IsOverdueStyle: Text[20];
        ReservationAgreement: Record "Reservation Agreement";
        PreviousRec: Record "RA Payment Schedule";
        MRec: Integer;
        MRAID: Code[20];

    trigger OnAfterGetRecord()
    begin
        // Automating Overdue Style based on Date Due and Amount Paid
        if (Rec."Date Due" < Today) and (Rec."Amount Paid" = 0) then
            IsOverdueStyle := 'Attention' // Red row for overdue payments
        else
            IsOverdueStyle := '';

        // Automated Calculation for Principal, Interest, and Balance
        CalculateSEAmounts();
        CalculatePrincipalInterestBalance();
    end;

    // Procedure to calculate Principal, Interest, and Balance fields

    local procedure CalculateSEAmounts()
    var
        PreviousBalance: Decimal;
        Interest: Decimal;
        Principal: Decimal;
        Balance: Decimal;
        InterestRate: Decimal;
    begin
        InterestRate := 0.07 / 12; // 7% yearly interest rate divided by 12 months

        // Fetch the previous record by sorting with "Date Due"
        PreviousRec.Reset();
        PreviousRec.SetRange("RA ID", Rec."RA ID");
        PreviousRec.SetFilter("Date Due", '<%1', Rec."Date Due"); // Get records with Date Due earlier than current record
        PreviousRec.SetFilter("Payment Type", '%1|%2|%3', Rec."Payment Type"::Amortization, Rec."Payment Type"::Payment, Rec."Payment Type"::Adjustment);
        if PreviousRec.FindLast() then begin
            PreviousBalance := PreviousRec."SE Balance"; // Set the previous balance to the last known balance before the current record
        end else begin
            // No previous record, so use the "Balance for Amortization" from Reservation Agreement
            if ReservationAgreement.Get(Rec."RA ID") then
                PreviousBalance := ReservationAgreement."Balance for Amortization"
            else
                Error('Reservation Agreement not found.');
        end;

        // // Interest calculation based on the previous balance
        // if Rec."Amount Paid" = 0 then begin
        //     Interest := PreviousBalance * InterestRate;
        //     Principal := 0;
        //     Balance := PreviousBalance;
        //     Rec."Interest" := Interest;
        //     Rec."Principal" := Principal;
        //     Rec."Balance" := Balance;
        //     Rec.Modify();

        //     // If Date Due is greater than the current date, adjust the computation
        //     if Rec."Date Due" > Today then begin
        //         Interest := 0;
        //         Principal := 0;
        //         Balance := 0;
        //         Rec."Interest" := Interest;
        //         Rec."Principal" := Principal;
        //         Rec."Balance" := Balance;
        //         Rec.Modify();
        //     end;
        // end else begin
        //     // Amount Paid is not 0, process based on Payment Type
        case Rec."Payment Type" of
            Rec."Payment Type"::Amortization:
                begin
                    Interest := PreviousBalance * InterestRate;
                    Principal := Rec.Amount - Interest;
                    Balance := PreviousBalance - Principal;
                end;
            Rec."Payment Type"::Payment:
                begin
                    Interest := 0;
                    Principal := 0;
                    Balance := PreviousBalance;
                end;
            Rec."Payment Type"::Adjustment:
                begin
                    Interest := 0;
                    Principal := 0;
                    Balance := PreviousBalance;
                end;
        end;

        // Update the current record with calculated values
        Rec."SE Interest" := Interest;
        Rec."SE Principal" := Principal;
        Rec."SE Balance" := Balance;
        Rec.Modify();
    end;


    local procedure CalculatePrincipalInterestBalance()
    var
        PreviousBalance: Decimal;
        Interest: Decimal;
        Principal: Decimal;
        Balance: Decimal;
        InterestRate: Decimal;
    begin
        InterestRate := 0.07 / 12; // 7% yearly interest rate divided by 12 months

        // Fetch the previous record by sorting with "Date Due"
        PreviousRec.Reset();
        PreviousRec.SetRange("RA ID", Rec."RA ID");
        PreviousRec.SetFilter("Date Due", '<%1', Rec."Date Due"); // Get records with Date Due earlier than current record
        PreviousRec.SetFilter("Payment Type", '%1|%2|%3', Rec."Payment Type"::Amortization, Rec."Payment Type"::Payment, Rec."Payment Type"::Adjustment);
        if PreviousRec.FindLast() then begin
            PreviousBalance := PreviousRec."Balance"; // Set the previous balance to the last known balance before the current record
        end else begin
            // No previous record, so use the "Balance for Amortization" from Reservation Agreement
            if ReservationAgreement.Get(Rec."RA ID") then
                PreviousBalance := ReservationAgreement."Balance for Amortization"
            else
                Error('Reservation Agreement not found.');
        end;

        // Interest calculation based on the previous balance
        if Rec."Amount Paid" = 0 then begin
            Interest := PreviousBalance * InterestRate;
            Principal := 0;
            Balance := PreviousBalance;
            Rec."Interest" := Interest;
            Rec."Principal" := Principal;
            Rec."Balance" := Balance;
            Rec.Modify();

            // If Date Due is greater than the current date, adjust the computation
            if Rec."Date Due" > Today then begin
                Interest := 0;
                Principal := 0;
                Balance := 0;
                Rec."Interest" := Interest;
                Rec."Principal" := Principal;
                Rec."Balance" := Balance;
                Rec.Modify();
            end;
        end else begin
            // Amount Paid is not 0, process based on Payment Type
            case Rec."Payment Type" of
                Rec."Payment Type"::Amortization:
                    begin
                        Interest := PreviousBalance * InterestRate;
                        Principal := Rec."Amount Paid" - Interest;
                        Balance := PreviousBalance - Principal;
                    end;
                Rec."Payment Type"::Payment:
                    begin
                        Interest := 0;
                        Principal := Rec."Amount Paid";
                        Balance := PreviousBalance - Principal;
                    end;
                Rec."Payment Type"::Adjustment:
                    begin
                        Interest := 0;
                        Principal := 0;
                        Balance := PreviousBalance - Rec."Amount Paid";
                    end;
            end;

            // Update the current record with calculated values
            Rec."Interest" := Interest;
            Rec."Principal" := Principal;
            Rec."Balance" := Balance;
            Rec.Modify();
        end;
    end;

}