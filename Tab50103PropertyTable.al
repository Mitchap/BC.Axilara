table 50103 "Property"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Property ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Property ID';
            Editable = true;
        }

        field(2; "Project ID"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Project;
            Caption = 'Project ID';
        }
        field(3; "Project Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Project."Project Name" WHERE("Project ID" = field("Project ID")));
            Editable = false;
            Caption = 'Project Name';
        }
        field(4; "Property Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Property Name';
        }
        field(5; "Phase"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phase';
        }
        field(6; "Block"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Block';
        }
        field(7; "Lot"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lot';
        }
        field(8; "Area (sqm)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Area (sqm)';
        }
        field(9; "Lot Status"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lot Status';
        }
        field(10; "Lot Type"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Lot Type';
        }
        field(11; "Price /sqm"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Price/sqm';
        }
        field(12; "TSP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Selling Price';
        }
        field(13; "Client #"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            Caption = 'Client #';
        }
        field(14; "Client Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Client #")));
            //Editable = false;
            Caption = 'Client Name';
        }
        field(15; "NSP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Net Selling Price';
        }
        field(16; "AR Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Accounts Receivable Balance';
        }
        field(17; "MA"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Monthly Amortization';
        }
        field(18; "Status of Accounts"; Enum "RA Status Enum")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status of Accounts';
        }
        field(19; "Inventory Status"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inventory Status';
        }
        field(20; "Availability Status"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Availability Status';
        }
        field(21; "Approved Area"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Approved Area';
        }
        field(22; "Approved Block"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Approved Block';
        }
        field(23; "Approved Lot"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Approved Lot';
        }
        field(24; "Plan No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Plan No.';
        }
    }

    keys
    {
        key(PK; "Property ID")
        {
            Clustered = true;
        }
    }
}
