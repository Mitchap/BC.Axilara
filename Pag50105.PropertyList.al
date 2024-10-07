page 50105 "Property List"
{
    ApplicationArea = All;
    Caption = 'Property List';
    PageType = List;
    SourceTable = Property;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Property ID"; Rec."Property ID")
                {
                    ToolTip = 'Specifies the value of the Property ID field.', Comment = '%';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ToolTip = 'Specifies the value of the Project ID field.', Comment = '%';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ToolTip = 'Specifies the value of the Project Name field.', Comment = '%';
                }
                field("Property Name"; Rec."Property Name")
                {
                    ToolTip = 'Specifies the value of the Property Name field.', Comment = '%';
                }
                field(Phase; Rec.Phase)
                {
                    ToolTip = 'Specifies the value of the Phase field.', Comment = '%';
                }
                field(Block; Rec.Block)
                {
                    ToolTip = 'Specifies the value of the Block field.', Comment = '%';
                }
                field(Lot; Rec.Lot)
                {
                    ToolTip = 'Specifies the value of the Lot field.', Comment = '%';
                }
                field("Area (sqm)"; Rec."Area (sqm)")
                {
                    ToolTip = 'Specifies the value of the Area (sqm) field.', Comment = '%';
                }
                field("Lot Status"; Rec."Lot Status")
                {
                    ToolTip = 'Specifies the value of the Lot Status field.', Comment = '%';
                }
                field("Lot Type"; Rec."Lot Type")
                {
                    ToolTip = 'Specifies the value of the Lot Type field.', Comment = '%';
                }
                field("Price /sqm"; Rec."Price /sqm")
                {
                    ToolTip = 'Specifies the value of the Price/sqm field.', Comment = '%';
                }
                field(TSP; Rec.TSP)
                {
                    ToolTip = 'Specifies the value of the Total Selling Price field.', Comment = '%';
                }
                field(NSP; Rec.NSP)
                {
                    ToolTip = 'Specifies the value of the Net Selling Price field.', Comment = '%';
                }
                field("Client #"; Rec."Client #")
                {
                    ToolTip = 'Specifies the value of the Client # field.', Comment = '%';
                }
                field("Client Name"; Rec."Client Name")
                {
                    ToolTip = 'Specifies the value of the Client Name field.', Comment = '%';
                }
                field("AR Balance"; Rec."AR Balance")
                {
                    ToolTip = 'Specifies the value of the Accounts Receivable Balance field.', Comment = '%';
                }
                field(MA; Rec.MA)
                {
                    ToolTip = 'Specifies the value of the Monthly Amortization field.', Comment = '%';
                }
                field("Status of Accounts"; Rec."Status of Accounts")
                {
                    ToolTip = 'Specifies the value of the Status of Accounts field.', Comment = '%';
                }
                field("Inventory Status"; Rec."Inventory Status")
                {
                    ToolTip = 'Specifies the value of the Inventory Status field.', Comment = '%';
                }
                field("Availability Status"; Rec."Availability Status")
                {
                    ToolTip = 'Specifies the value of the Availability Status field.', Comment = '%';
                }
                field("Approved Area"; Rec."Approved Area")
                {
                    ToolTip = 'Specifies the value of the Approved Area field.', Comment = '%';
                }
                field("Approved Block"; Rec."Approved Block")
                {
                    ToolTip = 'Specifies the value of the Approved Block field.', Comment = '%';
                }
                field("Approved Lot"; Rec."Approved Lot")
                {
                    ToolTip = 'Specifies the value of the Approved Lot field.', Comment = '%';
                }
                field("Plan No."; Rec."Plan No.")
                {
                    ToolTip = 'Specifies the value of the Plan No. field.', Comment = '%';
                }
            }
        }
    }
}
