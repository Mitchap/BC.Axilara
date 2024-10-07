page 50106 "Property Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Property";
    Caption = 'Property Card';

    layout
    {
        area(content)
        {
            group("General Information")
            {
                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;
                    Editable = false; // Typically, primary keys should not be editable after creation
                }
                field("Project"; Rec."Project Name")
                {
                    ApplicationArea = All;
                }
                field("Phase"; Rec."Phase")
                {
                    ApplicationArea = All;
                }
                field("Block"; Rec."Block")
                {
                    ApplicationArea = All;
                }
                field("Lot"; Rec."Lot")
                {
                    ApplicationArea = All;
                }
                field("Area (sqm)"; Rec."Area (sqm)")
                {
                    ApplicationArea = All;
                }
                field("Lot Status"; Rec."Lot Status")
                {
                    ApplicationArea = All;
                }
                field("Lot Type"; Rec."Lot Type")
                {
                    ApplicationArea = All;
                }
            }

            group("Financial Information")
            {
                field("Price /sqm"; Rec."Price /sqm")
                {
                    ApplicationArea = All;
                }
                field("TSP"; Rec."TSP")
                {
                    ApplicationArea = All;
                    Caption = 'Total Selling Price';
                }
                field("NSP"; Rec."NSP")
                {
                    ApplicationArea = All;
                    Caption = 'Net Selling Price';
                }
                field("AR Balance"; Rec."AR Balance")
                {
                    ApplicationArea = All;
                    Caption = 'Accounts Receivable Balance';
                }
                field("MA"; Rec."MA")
                {
                    ApplicationArea = All;
                    Caption = 'Monthly Amortization';
                }
            }

            group("Client Information")
            {
                field("Client #"; Rec."Client #")
                {
                    ApplicationArea = All;
                    TableRelation = Customer."No."; // Ensure this relates correctly to your Customer table
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                    Editable = false; // This is typically calculated and should not be manually editable
                }
                field("Status of Accounts"; Rec."Status of Accounts")
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
            action("Post Property")
            {
                Caption = 'Post Property';
                Image = Post;

                trigger OnAction()
                begin
                    // Insert logic to post the property record
                end;
            }
        }

        area(navigation)
        {
            action("Back to List")
            {
                Caption = 'Back to List';
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
        // Add any business logic to execute when the page opens
    end;

    trigger OnClosePage()
    begin
        // Add any business logic to execute when the page closes
    end;
}
