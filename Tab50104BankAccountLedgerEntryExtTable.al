table 50104 "Bnk Acct Ledg Entry Ext"
{
    DataClassification = ToBeClassified;

    fields
    {
        //index field
        field(1; "BALEE ID"; Integer)
        {
            Caption = 'BALEE ID';
            DataClassification = ToBeClassified;
        }
        // Bank Ledger Entry ID, linked to Bank Account Ledger Entry (Table 271) Entry No.
        field(2; "Bank Ledg Entry ID"; Integer)
        {
            Caption = 'Bank Ledger Entry ID';
            DataClassification = ToBeClassified;

            // Table relation to Bank Account Ledger Entry (Table 271) on Entry No.
            TableRelation = "Bank Account Ledger Entry"."Entry No.";
        }

        // RA ID field
        field(3; "RA ID"; Text[50])
        {
            Caption = 'RA ID';
            DataClassification = ToBeClassified;
        }

        // System Payment ID field
        field(4; "System Payment ID"; Text[50])
        {
            Caption = 'System Payment ID';
            DataClassification = ToBeClassified;
        }

        // Sequence field (Seq)
        field(5; "Seq"; Integer)
        {
            Caption = 'Sequence';
            DataClassification = ToBeClassified;
        }

        // Status field
        field(6; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;

            OptionMembers = "Open","Closed","Canceled"; // Example options, you can customize
        }
    }

    keys
    {
        key(PK; "BALEE ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Automatically increment Bank Ledg Entry ID by finding the last entry and adding 1
        IncrementBALEEID();
    end;

    local procedure IncrementBALEEID()
    var
        LastBALEEExt: Record "Bnk Acct Ledg Entry Ext";
    begin
        // Check if there are existing records and find the last inserted BALEE ID
        if LastBALEEExt.FindLast then begin
            // Increment BALEE ID by 1 based on the last record
            "BALEE ID" := LastBALEEExt."BALEE ID" + 1;
        end else begin
            // If no records exist, start with ID 1
            "BALEE ID" := 1;
        end;
    end;
}
