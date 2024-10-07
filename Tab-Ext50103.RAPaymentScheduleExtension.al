tableextension 50103 "RA Payment Schedule Extension" extends "RA Payment Schedule"
{
    fields
    {
        field(50100; "Customer Name"; Text[100])
        {
            // Lookup Customer Name from Reservation Agreement table using RA ID
            Caption = 'Customer Name';
            // Create a FlowField to fetch the Customer Name from the Reservation Agreement table
            FieldClass = FlowField;
            CalcFormula = Lookup("Reservation Agreement"."Customer Name" WHERE("RA ID" = FIELD("RA ID")));
            Editable = false; // Make sure the field is not editable
        }
    }
}