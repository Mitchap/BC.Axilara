table 50102 "RA Payment Schedule"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "System Payment ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'System Payment ID';
            NotBlank = true;
            Editable = true;
        }

        field(2; "Record ID"; GUID)
        {
            DataClassification = ToBeClassified;
            Caption = 'Record ID';
            NotBlank = true;
            Editable = false;
        }

        field(3; "Opportunity"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity';
        }

        field(4; "RA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'RA ID';
            TableRelation = "Reservation Agreement"."RA ID";
        }

        field(5; "Seq"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sequence';
        }

        field(6; "Payment Type"; Enum "Payment Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Type';
        }

        field(7; "Date Due"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Due';
        }

        field(8; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }

        field(9; "Amount Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount Paid';
        }

        field(10; "Date Paid"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Paid';
        }

        field(11; "REF No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'REF No.';
        }

        field(12; "OR No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'OR No.';
        }

        field(13; "Penalty"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Penalty';
        }

        field(14; "Principal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Principal';
        }

        field(15; "Interest"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Interest';
        }

        field(16; "Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Balance';
        }
        field(17; "SE Principal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'SE Principal';
        }

        field(18; "SE Interest"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'SE Interest';
        }

        field(19; "SE Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'SE Balance';
        }

        field(20; "Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Remarks';
        }

        field(21; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Check Date';
        }

        field(22; "Check Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Check Number';
        }

        field(23; "Check Status"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Check Status';
            OptionMembers = " ","Pending","Bounce","Cleared";
        }

        field(24; "Payment Status"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Status';
            OptionMembers = " ","Paid","Pending","Due";
        }
        field(25; "Journalized"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Journalized';
        }
        field(26; "Payment Method"; Enum "Payment Method")
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Method';
        }

        field(27; "BC Confirmation Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'BC Confirmation Date';
        }
        field(28; "Client No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Client No.';
        }
        field(29; "Opportunity ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Opportunity ID';
        }
        field(30; "Dep. Bank Acct Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Dep. Bank Acct Code';
        }
        field(31; "ForPenalty"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'ForPenalty';
        }
    }

    keys
    {
        key(PK; "System Payment ID")
        {
            Clustered = true;
        }
        key(RAIDKey; "RA ID")
        {
            Clustered = false;
        }
        key(DateDueKey; "Date Due")
        {
            Clustered = false;
        }
        key(DatePaidKey; "Date Paid")
        {
            Clustered = false;
        }
        // You can also create a composite key (if required)
    }

    // trigger OnInsert()
    // var
    //     NoSeriesMgt: Codeunit "No. Series";
    // begin
    //     // Assign the next number from the series to the primary key field
    //     Rec."System Payment ID" := NoSeriesMgt.GetNextNo('RA_SYS_PAYT', 0D, true);
    // end;

}
