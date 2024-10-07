pageextension 50100 "GenJournalLinePageExt" extends "General Journal"
{
    layout
    {
        // Remove the Currency and Gen. Posting Type fields
        modify("Currency Code")
        {
            Visible = false;
        }

        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("EU 3-Party Trade")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Posting Type")
        {
            Visible = false;
        }

        modify("Bal. Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Deferral Code")
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        modify("VAT Reporting Date")
        {
            Visible = false;
        }
        //addafter("Bal. Account No.")
        addbefore("Posting Date")
        {
            field("RA ID"; Rec."RA ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the RA ID.';
            }
            field("System Payment ID"; Rec."System Payment ID")
            {
                ApplicationArea = All;
            }
            field("Sequence"; Rec."Seq")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        modify("&Line")
        {
            Visible = false;
        }
        modify("Page")
        {
            Visible = false;
        }
        modify(IncomingDocument)
        {
            Visible = false;
        }
    }

}
