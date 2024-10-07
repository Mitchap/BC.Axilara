page 50125 "Check Submission Payment Sched"
{
    ApplicationArea = All;
    Caption = 'Check Submission Payment Sched';
    PageType = List;
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
                field("RA ID"; Rec."RA ID")
                {
                    ToolTip = 'Specifies the value of the RA ID field.', Comment = '%';
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the RA ID field.', Comment = '%';
                    Editable = false;
                }
                field(Seq; Rec.Seq)
                {
                    ToolTip = 'Specifies the value of the Sequence field.', Comment = '%';
                    Editable = false;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
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
                field("Date Paid"; Rec."Date Paid")
                {
                    ToolTip = 'Specifies the value of the Date Paid field.', Comment = '%';
                    Editable = false;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                    Editable = false;
                }

                field("REF No."; Rec."REF No.")
                {
                    ToolTip = 'Specifies the value of the REF# field.', Comment = '%';
                }
                field("OR No."; Rec."OR No.")
                {
                    ToolTip = 'Specifies the value of the OR Number field.', Comment = '%';
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
                field("Payment Method"; Rec."Payment Method")
                {
                    ToolTip = 'Specifies the value of the Payment Method field.', Comment = '%';
                }
            }
        }
    }

    // trigger OnOpenPage()

    //     // actions
    //     // {
    //     // }

}
