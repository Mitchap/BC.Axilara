pageextension 50102 "Seller Agents List" extends "Vendor List"
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
