tableextension 50100 "Gen. Journal Line Extension" extends "Gen. Journal Line"
{
    fields
    {
        field(200; "RA ID"; Code[20])
        {
            Caption = 'RA ID';
            DataClassification = ToBeClassified;
            TableRelation = "Reservation Agreement"."RA ID";
        }
        field(201; "System Payment ID"; Code[20])
        {
            Caption = 'System Payment ID';
            DataClassification = ToBeClassified;
            TableRelation = "RA Payment Schedule"."System Payment ID";
        }
        field(202; "Seq"; Integer)
        {
            Caption = 'Sequence';
            DataClassification = ToBeClassified;
        }
    }
}
