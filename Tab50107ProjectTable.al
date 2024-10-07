table 50107 "Project"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project ID';
            NotBlank = true;
        }

        field(2; "Project Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Name';
        }

        field(3; "Bank No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
            Caption = 'Bank No.';
        }

        field(4; "Bank Account Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Bank Account".Name WHERE("No." = field("Bank No.")));
            Editable = false;
            Caption = 'Bank Account Name';
        }

        field(5; "Project Type"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Type';
        }
        field(6; "Station"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Station';
        }
        field(7; "Status"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(8; "License to Sell No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'License to Sell No.';
        }
        field(9; "Development Permit No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Development Permit No.';
        }
        field(10; "Reservation Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Reservation Fee';
        }
    }

    keys
    {
        key(PK; "Project ID")
        {
            Clustered = true;
        }
    }
}
