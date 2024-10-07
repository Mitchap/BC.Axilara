page 50111 "Commission Rates Setup List"
{
    PageType = List;
    SourceTable = "Commission Rates Setup";
    ApplicationArea = All;
    Caption = 'Commission Rates Setup List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Incremental NSP Threshold"; Rec."Incremental NSP Threshold")
                {
                    ApplicationArea = All;
                }
                field("Incremental Commission Rate"; Rec."Incremental Commission Rate")
                {
                    ApplicationArea = All;
                }
                field("Remarks"; Rec."Remarks")
                {
                    ApplicationArea = All;
                    // The Remarks field will display as a dropdown with options "Processing" and "Approved"
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(NewRecord)
            {
                Caption = 'New';
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Commission Rates Setup Card", Rec);
                end;
            }
            action(EditRecord)
            {
                Caption = 'Edit';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Commission Rates Setup Card", Rec);
                end;
            }
            action(OverrideDelete)
            {
                Caption = 'Delete';
                ApplicationArea = All;
                Visible = false;
            }
        }
    }
}
