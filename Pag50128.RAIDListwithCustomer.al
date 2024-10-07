page 50128 "RA ID List with Customer"
{
    ApplicationArea = All;
    Caption = 'RA ID List with Customer';
    PageType = List;
    SourceTable = "Reservation Agreement";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("RA ID"; Rec."RA ID")
                {
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
            }
        }
    }
}
