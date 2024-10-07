table 50108 "RA Promo List"
{
    Caption = 'RA Promo List';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "RA Promo List"; Code[20])
        {
            Caption = 'RA Promo List';
        }
        field(2; Lead; Code[20])
        {
            Caption = 'Lead';
        }
        field(3; Name; Text[20])
        {
            Caption = 'Name';
        }
        field(4; Opportunity; Code[20])
        {
            Caption = 'Opportunity';
        }
        field(5; "Promo ID"; Code[20])
        {
            Caption = 'Promo ID';
        }
        field(6; "RA ID"; Code[20])
        {
            Caption = 'RA ID';
        }
        field(7; "Status Reason"; Text[100])
        {
            Caption = 'Status Reason';
        }
        field(8; Status; Text[20])
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "RA Promo List")
        {
            Clustered = true;
        }
    }
}
