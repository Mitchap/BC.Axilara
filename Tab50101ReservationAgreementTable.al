table 50101 "Reservation Agreement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "RA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'RA ID';
            NotBlank = true;
            Editable = true; // Set to false if RA ID should not be edited once created
        }
        field(2; "Status"; Enum "RA Status Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(3; "Client No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            Caption = 'Client No.';
        }
        field(4; "Customer Name"; Text[100])
        {
            //DataClassification = ToBeClassified;
            DataClassification = ToBeClassified;
            //            Editable = false;
            Caption = 'Client Name';
        }
        field(5; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Project."Project ID";
            Caption = 'Project ID';
        }
        field(6; "Property ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Property."Property ID";
            Caption = 'Property ID';
        }
        field(7; "Project Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Name';
        }
        field(8; "Property Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Property Name';
        }
        field(9; "Phase"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phase';
        }
        field(10; "Block"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Block';
        }
        field(11; "Lot"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lot';
        }

        field(12; "Area"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Area';
        }
        field(13; "Price/Sqm"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Price/Sqm';
        }
        field(14; "Total Selling Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Selling Price';
        }
        field(15; "Reservation Fee Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Reservation Fee Date';
        }
        field(16; "Reservation Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Reservation Fee';
        }
        field(17; "Payment Term"; Enum "Payment Term Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Term';
        }
        field(18; "Dep. Bank Acct Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."Bank Account No.";
            Caption = 'Dep. Bank Acct Code';
        }
        field(19; "Cash Total Selling Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Total Selling Price';
        }
        field(20; "Cash Discount Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Discount Amount';
        }
        field(21; "Cash NSP without VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash NSP without VAT';
        }
        field(22; "Cash 12% VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash 12% VAT';
        }
        field(23; "Cash NSP with VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash NSP with VAT';
        }
        field(24; "Cash Less Reservation Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Less Reservation Fee';
        }
        field(25; "Cash Retention Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Retention Fee';
        }
        field(26; "Cash Total Amount Payable"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Total Amount Payable';
        }
        field(27; "INHF Total Selling Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Total Selling Price';
        }
        field(28; "INHF Discount Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Discount Amount';
        }
        field(29; "INHF NSP without VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF NSP without VAT';
        }
        field(30; "INHF 12% VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF 12% VAT';
        }
        field(31; "INHF NSP with VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF NSP with VAT';
        }
        field(32; "INHF Downpayment Percent"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Downpayment Percent';
        }
        field(33; "INHF Downpayment"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Downpayment';
        }
        field(34; "INHF Less Reservation Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Less Reservation Fee';
        }
        field(35; "INHF Total Downpayment"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Total Downpayment';
        }
        field(36; "INHF Downpayment Due Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'INHF Downpayment Due Date';
        }

        field(37; "Balance for Amortization"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Balance for Amortization';
        }
        field(38; "Interest Rate at 7% Annum"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10; // Forces the field to always display 10 decimal places
            Caption = 'Interest Rate at 7% Annum';
        }
        field(39; "Number of Years"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Number of Years';
        }
        field(40; "Monthly Amortization"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Monthly Amortization';
        }
        field(41; "Monthly Amortization Due Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Monthly Amortization Due Date';
        }
        field(42; "Split Type"; Enum "Split Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Split Type';
        }
        field(43; "No. of Splits"; Enum "Split Count Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'No. of Splits';
        }
        field(44; "Split Payment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Split Payment Amount';
        }
        field(45; "Split Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Split Payment Amount';
        }
        field(46; "Split End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Split Payment Amount';
        }
        field(47; "PC Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'PC Code';
        }
        field(48; "SM Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'SM Code';
        }
        field(49; "SD Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'SD Code';
        }
        field(50; "TL Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'TL Code';
        }
        field(51; "SSD1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'SSD1 Code';
        }
        field(52; "SSD2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            Caption = 'SSD2 Code';
        }
        field(53; "PC Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'PC Name';
        }
        field(54; "SM Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SM Name';
        }
        field(55; "SD Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SD Name';
        }
        field(56; "TL Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TL Name';
        }
        field(57; "SSD1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SSD1 Name';
        }
        field(58; "SSD2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SSD2 Name';
        }
        // field(56; "RA BAlance"; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'RA Balance';
        // }
    }


    keys
    {
        key(PK; "RA ID")
        {
            Clustered = true;
        }

        key(AK; "Client No.")
        {
            Clustered = false;
        }
    }

    trigger OnInsert()
    begin
        // Add any business logic you need on record insert here.
    end;

    trigger OnModify()
    begin
        // Add any business logic you need on record modify here.
    end;

    trigger OnDelete()
    begin
        // Add any business logic you need on record delete here.
    end;
}
