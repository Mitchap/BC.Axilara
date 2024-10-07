page 50124 "Bnk Acct Ledg Entry Ext List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Bnk Acct Ledg Entry Ext"; // Refers to your custom table
    Caption = 'Bank Account Ledger Entry Ext';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BALEE ID"; Rec."BALEE ID")
                {
                    ApplicationArea = All;
                    Caption = 'BALEE ID';
                }
                field("Bank Ledg Entry ID"; Rec."Bank Ledg Entry ID")
                {
                    ApplicationArea = All;
                    Caption = 'Bank Ledger Entry ID';
                }
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;
                    Caption = 'RA ID';
                }
                field("System Payment ID"; Rec."System Payment ID")
                {
                    ApplicationArea = All;
                    Caption = 'System Payment ID';
                }
                field("Seq"; Rec."Seq")
                {
                    ApplicationArea = All;
                    Caption = 'Sequence';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RefreshPage)
            {
                ApplicationArea = All;
                Caption = 'Refresh';
                Image = Refresh;

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }
}
