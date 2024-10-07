page 50120 "In House Financing Details"
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

            field("INHF Discount Amount"; Rec."INHF Discount Amount")
            {
                ApplicationArea = All;
                Caption = 'Less: Discount';
            }
            field("INHF NSP without VAT"; Rec."INHF NSP without VAT")
            {
                ApplicationArea = All;
                Caption = 'NSP without VAT';
            }
            field("INHF 12% VAT"; Rec."INHF 12% VAT")
            {
                ApplicationArea = All;
                Caption = '12% VAT';
            }
            field("INHF NSP with VAT"; Rec."INHF NSP with VAT")
            {
                ApplicationArea = All;
                Caption = 'NSP with VAT';
            }
            field("INHF Downpayment Percent"; Rec."INHF Downpayment Percent")
            {
                ApplicationArea = All;
                Caption = 'Downpayment Percent';
                //Visible = Rec."INHF Downpayment Percent" <> 0;
            }
            field("INHF Downpayment"; Rec."INHF Downpayment")
            {
                ApplicationArea = All;
                Caption = 'Downpayment';
            }
            field("INHF Less Reservation Fee"; Rec."INHF Less Reservation Fee")
            {
                ApplicationArea = All;
                Caption = 'Less Reservation Fee';
            }
            field("Total Downpayment"; Rec."INHF Total Downpayment")
            {
                ApplicationArea = All;
                Caption = 'Total Downpayment';
            }
            // field("Downpayment Due Date"; Rec."INHF Downpayment Due Date")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Downpayment Due Date';
            // }
            field("Balance for Amortization"; Rec."Balance for Amortization")
            {
                ApplicationArea = All;
            }

        }
    }



}
