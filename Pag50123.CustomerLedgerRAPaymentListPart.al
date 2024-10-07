page 50123 "Payment List"
{
    PageType = ListPart;
    SourceTable = "RA Payment Schedule";
    ApplicationArea = All;
    Caption = ' ';

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
                    Caption = 'Type';
                }

                field("Date Due"; Rec."Date Due")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
                field("Amount Due"; Rec."Amount")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }

                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }

                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                    StyleExpr = IsOverdueStyle;
                }
            }

            group(TotalGroup)
            {
                Caption = ' ';
                field(TotalAmountDue; TotalAmountDue)
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount Due';
                    Editable = false;
                }

                field(TotalAmountPaid; TotalAmountPaid)
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount Paid';
                    Editable = false;
                }
            }
        }
    }

    var
        IsOverdueStyle: Text[20];
        TotalAmountDue: Decimal;
        TotalAmountPaid: Decimal;
        PaymentRec: Record "RA Payment Schedule";

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Payment Type", '%1|%2|%3', Rec."Payment Type"::"Reservation Fee", Rec."Payment Type"::"Down Payment", Rec."Payment Type"::"Fees");
        // Apply filters to include only "Reservation Fee" and "Down Payment" payment types
    end;

    trigger OnAfterGetRecord()
    begin
        if (Rec."Date Due" < Today) and (Rec."Amount Paid" = 0) then
            IsOverdueStyle := 'Attention' // Red row for overdue payments
        else
            IsOverdueStyle := '';


        TotalAmountDue := 0;
        TotalAmountPaid := 0;
        PaymentRec.SetRange("RA ID", Rec."RA ID");
        PaymentRec.SetFilter("Payment Type", '%1|%2', Rec."Payment Type"::"Reservation Fee", Rec."Payment Type"::"Down Payment");

        // Find all records matching the RA ID and filtered payment types, and accumulate totals
        if PaymentRec.FindSet() then begin
            repeat
                TotalAmountDue += PaymentRec."Amount";
                TotalAmountPaid += PaymentRec."Amount Paid";
            until PaymentRec.Next() = 0;
        end;
    end;
}
