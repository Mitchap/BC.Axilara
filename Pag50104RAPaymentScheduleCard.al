page 50104 "RA Payment Schedule Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "RA Payment Schedule";
    Caption = 'RA Payment Schedule Card';

    layout
    {
        area(content)
        {
            group("General")
            {
                field("System Payment ID"; Rec."System Payment ID")
                {
                    ApplicationArea = All;
                    Editable = false; // Typically, the primary key is not editable
                }
                //field("Record ID"; Rec."Record ID")
                //{
                //   ApplicationArea = All;
                //    Editable = false; // Typically, internal fields are not editable
                //}
                //field("Opportunity"; Rec."Opportunity")
                //{
                //    ApplicationArea = All;
                //}
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;
                }
                field("Seq"; Rec."Seq")
                {
                    ApplicationArea = All;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                }
                field("Date Due"; Rec."Date Due")
                {
                    ApplicationArea = All;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = All;
                }
                field("REF#"; Rec."REF No.")
                {
                    ApplicationArea = All;
                }
                field("OR#"; Rec."OR No.")
                {
                    ApplicationArea = All;
                }
                field("Penalty"; Rec."Penalty")
                {
                    ApplicationArea = All;
                }
                field("Principal"; Rec."Principal")
                {
                    ApplicationArea = All;
                }
                field("Interest"; Rec."Interest")
                {
                    ApplicationArea = All;
                }
                field("Balance"; Rec."Balance")
                {
                    ApplicationArea = All;
                }
                field("Remarks"; Rec."Remarks")
                {
                    ApplicationArea = All;
                }
                field("Check Date"; Rec."Check Date")
                {
                    ApplicationArea = All;
                }
                field("Check Number"; Rec."Check Number")
                {
                    ApplicationArea = All;
                }
                field("Check Status"; Rec."Check Status")
                {
                    ApplicationArea = All;
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = All;
                }
                field("Journalized"; Rec."Journalized")
                {
                    ApplicationArea = All;
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                }
                field("BC Confirmation Date"; Rec."BC Confirmation Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Payment")
            {
                Caption = 'Post Payment';
                Image = Post;

                trigger OnAction()
                begin
                    // Add logic to post the payment schedule
                end;
            }
        }

        area(navigation)
        {
            action("Back")
            {
                Caption = 'Back';
                //Image = Back;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Add any business logic you need when the page opens
    end;

    trigger OnClosePage()
    begin
        // Add any business logic you need when the page closes
    end;
}
