page 50109 "Seller Agents Commission List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Seller Agents Commission";
    Caption = 'Seller Agents Commission List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("SAC ID"; Rec."SAC ID")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()

                    begin
                        PAGE.Run(PAGE::"Seller Agents Commission Card", Rec);
                    end;
                }
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;
                }
                field("Client Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Seller Agent"; Rec."Seller Agent")
                {
                    ApplicationArea = All;
                }
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
                field("NSP"; Rec."NSP")
                {
                    ApplicationArea = All;
                }
                field("Net Commission"; Rec."Net Commission")
                {
                    ApplicationArea = All;
                }
                field("Balance Commission"; Rec."Balance Commission")
                {
                    ApplicationArea = All;
                }
                field("Collection Paid"; Rec."Collection Paid")
                {
                    ApplicationArea = All;
                }
                field("Monthly Commission"; Rec."Monthly Commission")
                {
                    ApplicationArea = All;
                }
                field("Date Processed"; Rec."Date Processed")
                {
                    ApplicationArea = All;
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Edit)
            {
                ApplicationArea = All;
                RunObject = Page "Seller Agents Commission Card";
            }
        }
    }
}
