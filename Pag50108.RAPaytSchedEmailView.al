page 50108 RAPaytSchedEmailView
{
    ApplicationArea = All;
    Caption = 'RAPaytSchedEmailView';
    PageType = Card;
    SourceTable = "RA Payment Schedule";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.', Comment = '%';
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
                group(Details)
                {
                    Caption = 'Details';

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
                    field("Dep. Bank Acct Code"; Rec."Dep. Bank Acct Code")
                    {
                        ToolTip = 'Specifies the value of the Check Status field.', Comment = '%';
                    }

                    field("Check Status"; Rec."Check Status")
                    {
                        ToolTip = 'Specifies the value of the Check Status field.', Comment = '%';
                    }
                    field("Payment Status"; Rec."Payment Status")
                    {
                        ToolTip = 'Specifies the value of the Payment Status field.', Comment = '%';
                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Back to List")
            {
                Caption = 'Back to List';
                ApplicationArea = All;
                RunObject = page "RA Payment Schedule List"; // Link to the List Page if needed
            }
        }
    }
}
