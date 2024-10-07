table 50106 "Commission Rates Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Commission Rate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Commission Rate ID';
            NotBlank = true;
        }
        field(2; "Property Type"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Property Type';
            OptionMembers = " ","Lot","Condo","Golf Compound";
        }
        field(3; "Seller Category"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seller Category';
            OptionMembers = " ","Property Consultant","Sales Manager","Sales Director","Team Leader","Senior Sales Director 1","Senior Sales Director 2";
        }
        field(4; "Commission Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Commission Rate (%)';
        }
        field(5; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Effective Date';
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'End Date';
        }
        field(7; "Incremental NSP Threshold"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Incremental NSP Threshold';
        }
        field(8; "Incremental Commission Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Incremental Commission Rate (%)';
        }
        field(9; "Remarks"; Enum "Remarks Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(PK; "Commission Rate ID")
        {
            Clustered = true;
        }
    }

    /*trigger OnInsert()
    begin
        if "Effective Date" > "End Date" then
            Error('End Date must be later than the Effective Date.');
    end;*/
}
