table 50105 "Seller Agents Commission"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "SAC ID"; Code[20])
        {
            Caption = 'SAC ID';
            DataClassification = ToBeClassified;
        }

        field(2; "RA ID"; Code[20])
        {
            Caption = 'RA ID';
            DataClassification = ToBeClassified;
            TableRelation = "Reservation Agreement"."RA ID";  // Links to Reservation Agreement table
        }
        field(3; "Customer Name"; Text[100])
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Name WHERE("No." = field("RA ID")));
            Editable = false;
            Caption = 'Client Name';
        }
        field(4; "Seller Agent"; Text[100])
        {
            Caption = 'Seller Agent';
            DataClassification = ToBeClassified;
            // No TableRelation for now
        }
        field(5; "Commission Rate ID"; Code[20])
        {
            Caption = 'Commission Rate ID';
            DataClassification = ToBeClassified;
            TableRelation = "Commission Rates Setup"."Commission Rate ID";  // Links to Commission Rates Setup table
        }
        field(6; "Property Type"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Property Type';
            OptionMembers = " ","Lot","Condo","Golf Compound";
        }
        field(7; "Seller Category"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seller Category';
            OptionMembers = " ","Property Consultant","Sales Manager","Sales Director","Team Leader","Senior Sales Director 1","Senior Sales Director 2";
        }
        field(8; "Commission Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Commission Rate (%)';
        }
        field(9; "NSP"; Decimal)
        {
            Caption = 'NSP';
            DataClassification = ToBeClassified;
        }
        field(10; "Net Commission"; Decimal)
        {
            Caption = 'Net Commission';
            DataClassification = ToBeClassified;
        }
        field(11; "Balance Commission"; Decimal)
        {
            Caption = 'Balance Commission';
            DataClassification = ToBeClassified;
        }
        field(12; "Collection Paid"; Decimal)
        {
            Caption = 'Collection Paid';
            DataClassification = ToBeClassified;
        }
        field(13; "Monthly Commission"; Decimal)
        {
            Caption = 'Monthly Commission';
            DataClassification = ToBeClassified;
        }
        field(14; "Date Processed"; Date)
        {
            Caption = 'Date Processed';
            DataClassification = ToBeClassified;
        }
        field(15; "Date Paid"; Date)
        {
            Caption = 'Date Paid';
            DataClassification = ToBeClassified;
        }
        field(16; "Status"; Enum "Remarks Enum")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
    }
}
