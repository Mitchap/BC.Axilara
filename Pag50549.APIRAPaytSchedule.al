page 50549 "API RA Payt Schedule"
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiRAPaytSchedule';
    DelayedInsert = true;
    EntityName = 'raPaymentSchedule';
    EntitySetName = 'raPaymentSchedules';
    PageType = API;
    SourceTable = "RA Payment Schedule";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemPaymentID; Rec."System Payment ID")
                {
                    Caption = 'System Payment ID';
                }
                field("recordID"; Rec."Record ID")
                {
                    Caption = 'Record ID';
                }
                field(opportunity; Rec.Opportunity)
                {
                    Caption = 'Opportunity';
                }
                field(raID; Rec."RA ID")
                {
                    Caption = 'RA ID';
                }
                field(seq; Rec.Seq)
                {
                    Caption = 'Sequence';
                }
                field(paymentType; Rec."Payment Type")
                {
                    Caption = 'Payment Type';
                }
                field(dateDue; Rec."Date Due")
                {
                    Caption = 'Date Due';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountPaid; Rec."Amount Paid")
                {
                    Caption = 'Amount Paid';
                }
                field(datePaid; Rec."Date Paid")
                {
                    Caption = 'Date Paid';
                }
                field(ref; Rec."REF No.")
                {
                    Caption = 'REF No.';
                }
                field("or"; Rec."OR No.")
                {
                    Caption = 'OR Number';
                }
                field(penalty; Rec.Penalty)
                {
                    Caption = 'Penalty';
                }
                field(principal; Rec.Principal)
                {
                    Caption = 'Principal';
                }
                field(interest; Rec.Interest)
                {
                    Caption = 'Interest';
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                }
                field(sePrincipal; Rec."SE Principal")
                {
                    Caption = 'SE Principal';
                }
                field(seInterest; Rec."SE Interest")
                {
                    Caption = 'SE Interest';
                }
                field(seBalance; Rec."SE Balance")
                {
                    Caption = 'SE Balance';
                }
                field(remarks; Rec.Remarks)
                {
                    Caption = 'Remarks';
                }
                field(checkDate; Rec."Check Date")
                {
                    Caption = 'Check Date';
                }
                field(checkNumber; Rec."Check Number")
                {
                    Caption = 'Check Number';
                }
                field(checkStatus; Rec."Check Status")
                {
                    Caption = 'Check Status';
                }
                field(paymentStatus; Rec."Payment Status")
                {
                    Caption = 'Payment Status';
                }
                field(journalized; Rec.Journalized)
                {
                    Caption = 'Journalized';
                }
                field(paymentMethod; Rec."Payment Method")
                {
                    Caption = 'Payment Method';
                }
                field(bcConfirmationDate; Rec."BC Confirmation Date")
                {
                    Caption = 'BC Confirmation Date';
                }
                field(clientNo; Rec."Client No.")
                {
                    Caption = 'Client No.';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
