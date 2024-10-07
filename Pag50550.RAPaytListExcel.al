page 50550 "RA Payt List Excel"
{
    ApplicationArea = All;
    Caption = 'RA Payt List Excel';
    PageType = List;
    SourceTable = "RA Payment Schedule";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("System Payment ID"; Rec."System Payment ID")
                {
                    ToolTip = 'Specifies the value of the System Payment ID field.', Comment = '%';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ToolTip = 'Specifies the value of the Record ID field.', Comment = '%';
                }
                field(Opportunity; Rec.Opportunity)
                {
                    ToolTip = 'Specifies the value of the Opportunity field.', Comment = '%';
                }
                field("RA ID"; Rec."RA ID")
                {
                    ToolTip = 'Specifies the value of the RA ID field.', Comment = '%';
                }
                field(Seq; Rec.Seq)
                {
                    ToolTip = 'Specifies the value of the Sequence field.', Comment = '%';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
                }
                field("Date Due"; Rec."Date Due")
                {
                    ToolTip = 'Specifies the value of the Date Due field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ToolTip = 'Specifies the value of the Date Paid field.', Comment = '%';
                }
                field("REF No."; Rec."REF No.")
                {
                    ToolTip = 'Specifies the value of the REF# field.', Comment = '%';
                }
                field("OR No."; Rec."OR No.")
                {
                    ToolTip = 'Specifies the value of the OR Number field.', Comment = '%';
                }
                field(Penalty; Rec.Penalty)
                {
                    ToolTip = 'Specifies the value of the Penalty field.', Comment = '%';
                }
                field(Principal; Rec.Principal)
                {
                    ToolTip = 'Specifies the value of the Principal field.', Comment = '%';
                }
                field(Interest; Rec.Interest)
                {
                    ToolTip = 'Specifies the value of the Interest field.', Comment = '%';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.', Comment = '%';
                }
                field("SE Principal"; Rec."SE Principal")
                {
                    ToolTip = 'Specifies the value of the SE Principal field.', Comment = '%';
                }
                field("SE Interest"; Rec."SE Interest")
                {
                    ToolTip = 'Specifies the value of the SE Interest field.', Comment = '%';
                }
                field("SE Balance"; Rec."SE Balance")
                {
                    ToolTip = 'Specifies the value of the SE Balance field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.', Comment = '%';
                }
                field("Check Date"; Rec."Check Date")
                {
                    ToolTip = 'Specifies the value of the Check Date field.', Comment = '%';
                }
                field("Check Number"; Rec."Check Number")
                {
                    ToolTip = 'Specifies the value of the Check Number field.', Comment = '%';
                }
                field("Check Status"; Rec."Check Status")
                {
                    ToolTip = 'Specifies the value of the Check Status field.', Comment = '%';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ToolTip = 'Specifies the value of the Payment Status field.', Comment = '%';
                }
                field(Journalized; Rec.Journalized)
                {
                    ToolTip = 'Specifies the value of the Journalized field.', Comment = '%';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ToolTip = 'Specifies the value of the Payment Method field.', Comment = '%';
                }
                field("BC Confirmation Date"; Rec."BC Confirmation Date")
                {
                    ToolTip = 'Specifies the value of the BC Confirmation Date field.', Comment = '%';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.', Comment = '%';
                }
                // field("Opportunity ID"; Rec."Opportunity ID")
                // {
                //     ToolTip = 'Specifies the value of the Opportunity ID field.', Comment = '%';
                // }
                // field(ForPenalty; Rec.ForPenalty)
                // {
                //     ToolTip = 'Specifies the value of the ForPenalty field.', Comment = '%';
                // }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }
}
