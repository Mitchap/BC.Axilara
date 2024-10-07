table 50109 "Promo"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Promo ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Promo ID';
        }
        field(2; "Project"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project';
            TableRelation = "Project";
        }
        field(3; "Promo Name"; Text[100])
        {
            Caption = 'Promo Name';
        }
        field(4; "Promo Description"; Text[100])
        {
            Caption = 'Promo Description';
        }
        field(5; "Valid From"; Date)
        {
            Caption = 'Valid From';
        }
        field(6; "Valid To"; Date)
        {
            Caption = 'Valid To';
        }
        field(7; "Additional Discount %"; Decimal)
        {
            Caption = 'Additional Discount %';
        }
        field(8; "Discount Type"; Text[50])
        {
            Caption = 'Discount Type';
            //OptionMembers = "PDC","Full Cash","Spot DP";
        }
        field(9; "Free Furniture"; Text[50])
        {
            Caption = 'Free Furniture';
        }
        field(10; "Free Transfer of Title"; Text[100])
        {
            Caption = 'Free Transfer of Title';
        }
        field(11; "Number of PDCs"; Integer)
        {
            Caption = 'Number of PDCs';
        }
        field(12; "Number of Days"; Integer)
        {
            Caption = 'Number of Days';
        }
        field(13; "NSP Amount"; Decimal)
        {
            Caption = 'NSP Amount';
        }
        field(14; "Percentage"; Decimal)
        {
            Caption = 'Percentage';
        }
        field(15; "Promo Limit"; Integer)
        {
            Caption = 'Promo Limit';
        }
        field(16; "Promo Type"; Text[100])
        {
            Caption = 'Promo Type';
            //OptionMembers = "Additional Discount","No. Day Promo","Free Furniture","Free Transfer of Title","VAT Inclusive"; // Example options
        }
        field(17; "Status Reason"; Text[50])
        {
            Caption = 'Status Reason';
        }
        field(18; "VAT Inclusive"; Text[50])
        {
            Caption = 'VAT Inclusive';
        }
    }

    keys
    {
        key(PK; "Promo ID")
        {
            Clustered = true;
        }
    }
}
