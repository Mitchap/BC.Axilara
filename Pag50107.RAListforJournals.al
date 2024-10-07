page 50107 "RAList for Journals"
{
    ApplicationArea = All;
    Caption = 'RAList for Journals';
    PageType = List;
    SourceTable = "Reservation Agreement";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("RA ID"; Rec."RA ID")
                {
                    ToolTip = 'Specifies the value of the RA ID field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Client Name field.', Comment = '%';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ToolTip = 'Specifies the value of the Project Name field.', Comment = '%';
                }
            }
        }
    }
}
