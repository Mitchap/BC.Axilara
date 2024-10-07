page 50119 "Reservation Agreement Details"
{
    PageType = CardPart;
    SourceTable = "Reservation Agreement";
    ApplicationArea = All;
    //UsageCategory = Tasks;
    Caption = ' ';

    layout
    {
        area(content)
        {
            // field("Property ID"; Rec."Property ID")
            // {
            //     ApplicationArea = All;
            // }
            //field("Property Name"; Rec."Property Name")
            //{
            //    ApplicationArea = All;
            //}

            field("Area"; Rec."Area")
            {
                ApplicationArea = All;
            }
            field("Total Selling Price"; Rec."Total Selling Price")
            {
                ApplicationArea = All;
            }

            field("Cash Discount Amount"; Rec."Cash Discount Amount")
            {
                ApplicationArea = All;
                Caption = 'Less: Discount';
            }
            field("Cash NSP without VAT"; Rec."Cash NSP without VAT")
            {
                ApplicationArea = All;
                Caption = 'NSP without VAT';
            }
            field("Cash 12% VAT"; Rec."Cash 12% VAT")
            {
                ApplicationArea = All;
                Caption = '12% VAT';
            }
            field("Cash NSP with VAT"; Rec."Cash NSP with VAT")
            {
                ApplicationArea = All;
                Caption = 'NSP with VAT';
            }
            field("Cash Less Reservation Fee"; Rec."Cash Less Reservation Fee")
            {
                ApplicationArea = All;
                Caption = 'Less Reservation Fee';
            }
            field("Cash Retention Fee"; Rec."Cash Retention Fee")
            {
                ApplicationArea = All;
                Caption = 'Cash Retention Fee';
            }
            field("Cash Total Amount Payable"; Rec."Cash Total Amount Payable")
            {
                ApplicationArea = All;
                Caption = 'Total Amount Payable';
            }
        }
    }
}
