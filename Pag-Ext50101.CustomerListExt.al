pageextension 50101 "Customer List Ext" extends "Customer List"
{
    layout
    {
        // Remove fields
        modify("Responsibility Center") { Visible = false; }
        modify("Location Code") { Visible = false; }
        addafter("Name")
        { field("E-Mail"; Rec."E-Mail") { ApplicationArea = All; } }
    }
}

