page 50115 "Project Card"
{
    ApplicationArea = All;
    Caption = 'Project Card';
    PageType = Card;
    SourceTable = Project;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Project ID"; Rec."Project ID")
                {
                    ToolTip = 'Specifies the value of the Project ID field.', Comment = '%';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ToolTip = 'Specifies the value of the Project Name field.', Comment = '%';
                }
                field("Bank No."; Rec."Bank No.")
                {
                    ToolTip = 'Specifies the value of the Bank No. field.', Comment = '%';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Bank Account Name field.', Comment = '%';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ToolTip = 'Specifies the value of the Project Type field.', Comment = '%';
                }
                field(Station; Rec.Station)
                {
                    ToolTip = 'Specifies the value of the Station field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("License to Sell No."; Rec."License to Sell No.")
                {
                    ToolTip = 'Specifies the value of the License to Sell No. field.', Comment = '%';
                }
                field("Development Permit No."; Rec."Development Permit No.")
                {
                    ToolTip = 'Specifies the value of the Development Permit No. field.', Comment = '%';
                }
                field("Reservation Fee"; Rec."Reservation Fee")
                {
                    ToolTip = 'Specifies the value of the Reservation Fee field.', Comment = '%';
                }
            }
        }
    }
}
