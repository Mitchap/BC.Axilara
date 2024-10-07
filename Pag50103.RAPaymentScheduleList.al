page 50103 "RA Payment Schedule List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "RA Payment Schedule";
    SourceTableView = sorting("System Payment ID") order(descending);

    Caption = 'RA Payment Schedule List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("System Payment ID"; Rec."System Payment ID")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("RA ID"; Rec."RA ID")
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
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Date Due"; Rec."Date Due")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                // field("REF#"; Rec."REF#")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                // field("OR#"; Rec."OR#")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                // field("Penalty"; Rec."Penalty")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }

                // field("Principal"; Rec."Principal")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                // field("Interest"; Rec."Interest")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;

                // }
                // field("Balance"; Rec."Balance")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                // field("SE Principal"; Rec."SE Principal")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                // field("SE Interest"; Rec."SE Interest")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;

                // }
                // field("SE Balance"; Rec."SE Balance")
                // {
                //     ApplicationArea = All;
                //     StyleExpr = IsOverdueStyle;
                // }
                field("Remarks"; Rec."Remarks")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Check Date"; Rec."Check Date")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Check Number"; Rec."Check Number")
                {
                    ApplicationArea = All;
                }
                field("Check Status"; Rec."Check Status")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("BC Confirmation Date"; Rec."BC Confirmation Date")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                    Editable = false;
                }
                field("Journalized"; Rec."Journalized")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
            }
        }
    }

    // Variable to store the conditional style
    var
        IsOverdueStyle: Text[20];

    trigger OnAfterGetRecord()
    begin
        // Calculate overdue based on DateDue and AmountPaid
        if (Rec."Date Due" < Today) and (Rec."Amount Paid" = 0) then
            IsOverdueStyle := 'Attention' // Red row for overdue payments
        else
            IsOverdueStyle := '';
    end;
}
