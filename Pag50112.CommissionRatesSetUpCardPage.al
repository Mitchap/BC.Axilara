page 50112 "Commission Rates Setup Card"
{
    PageType = Card;
    SourceTable = "Commission Rates Setup";
    ApplicationArea = All;
    Caption = 'Commission Rates Setup Card';

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General';

                field("Commission Rate ID"; Rec."Commission Rate ID")
                {
                    ApplicationArea = All;
                }
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                }
                field("Seller Category"; Rec."Seller Category")
                {
                    ApplicationArea = All;
                }
                field("Commission Rate"; Rec."Commission Rate")
                {
                    ApplicationArea = All;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }

            group(IncrementalRates)
            {
                Caption = 'Incremental Rates';
                field("Incremental NSP Threshold"; Rec."Incremental NSP Threshold")
                {
                    ApplicationArea = All;
                }
                field("Incremental Commission Rate"; Rec."Incremental Commission Rate")
                {
                    ApplicationArea = All;
                }
            }

            group(RemarksGroup) // Provide a name for the group, e.g., RemarksGroup
            {
                Caption = 'Remarks';
                field(Remarks; Rec.Remarks)
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
            action(SaveAndClose)
            {
                Caption = 'Save and Close';
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SaveRecord();
                    CurrPage.Close();
                end;
            }
        }
    }
}
