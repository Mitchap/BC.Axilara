page 50116 "Promo List"
{
    PageType = List;
    SourceTable = "Promo";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Promo ID"; Rec."Promo ID")
                {
                    ApplicationArea = All;
                }
                field("Project ID"; Rec."Project")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Promo Name")
                {
                    ApplicationArea = All;
                }
                field("Promo Description"; Rec."Promo Description")
                {
                    ApplicationArea = All;
                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = All;
                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = All;
                }
                field("Addt'l Discount %"; Rec."Additional Discount %")
                {
                    ApplicationArea = All;
                }
                field("Discount Type"; Rec."Discount Type")
                {
                    ApplicationArea = All;
                }
                field("Free Furniture"; Rec."Free Furniture")
                {
                    ApplicationArea = All;
                }
                field("Free Transfer of Title"; Rec."Free Transfer of Title")
                {
                    ApplicationArea = All;
                }
                field("No of PDCs"; Rec."Number of PDCs")
                {
                    ApplicationArea = All;
                }
                field("No. of Days"; Rec."Number of Days")
                {
                    ApplicationArea = All;
                }
                field("NSP Amount"; Rec."NSP Amount")
                {
                    ApplicationArea = All;
                }
                field("Percentage"; Rec."Percentage")
                {
                    ApplicationArea = All;
                }
                field("Promo Limit"; Rec."Promo Limit")
                {
                    ApplicationArea = All;
                }
                field("Promo Type"; Rec."Promo Type")
                {
                    ApplicationArea = All;
                }
                field("Status Reason"; Rec."Status Reason")
                {
                    ApplicationArea = All;
                }
                field("VAT Inclusive"; Rec."VAT Inclusive")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
