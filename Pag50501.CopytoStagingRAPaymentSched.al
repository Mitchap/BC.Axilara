page 50501 "Copy RA Payment Schedule Page"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Copy RA Payment Schedule';

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Copy RA Payment Schedule to Staging';
                field(Info; InfoText)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Click the action to copy records';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // First action: Copy RA Payment Schedule to Staging
            action(CopyRAPaymentSchedule)
            {
                Caption = 'Copy Records to Staging';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Copy RA Payment Schedule records to the staging table';

                trigger OnAction()
                begin
                    // Call the copy procedure to move data to Staging
                    CopyRAPaymentScheduleToStaging();
                    Message('RA Payment Schedule records copied to Staging successfully.');
                end;
            }

            // Second action: Copy Staging records back to RA Payment Schedule
            action(CopyStagingRAPaymentSched)
            {
                Caption = 'Copy Staging to RA Payment Schedule';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Copy records from the Staging table back to RA Payment Schedule';

                trigger OnAction()
                begin
                    // Call the procedure to copy from Staging to RA Payment Schedule
                    CopyStagingToRAPaymentSchedule();
                    Message('Records copied from Staging to RA Payment Schedule successfully.');
                end;
            }
        }
    }

    var
        InfoText: Text[50]; // Declaring InfoText variable

    local procedure CopyRAPaymentScheduleToStaging()
    var
        RAPaymentScheduleRec: Record "RA Payment Schedule";
        StagingRAPaymentScheduleRec: Record "Staging RAPaymentSchedule";
    begin
        // First, clear all records in the StagingRAPaymentSchedule table
        if StagingRAPaymentScheduleRec.FindSet() then begin
            StagingRAPaymentScheduleRec.DeleteAll();
        end;

        // Loop through all records in the RA Payment Schedule table
        if RAPaymentScheduleRec.FindSet() then begin
            repeat
                // Clear the staging record to ensure it's ready for new data
                StagingRAPaymentScheduleRec.Init();

                // Transfer all matching fields from RA Payment Schedule to Staging RAPaymentSchedule
                StagingRAPaymentScheduleRec.TransferFields(RAPaymentScheduleRec);

                // Insert the new record into StagingRAPaymentSchedule
                StagingRAPaymentScheduleRec.Insert();
            until RAPaymentScheduleRec.Next() = 0;
        end;
    end;

    local procedure CopyStagingToRAPaymentSchedule()
    var
        RAPaymentScheduleRec: Record "RA Payment Schedule";
        StagingRAPaymentScheduleRec: Record "Staging RAPaymentSchedule";
    begin
        // First, clear all records in the RA Payment Schedule table (if needed)
        if RAPaymentScheduleRec.FindSet() then begin
            RAPaymentScheduleRec.DeleteAll();
        end;

        // Loop through all records in the Staging RAPaymentSchedule table
        if StagingRAPaymentScheduleRec.FindSet() then begin
            repeat
                // Clear the RA Payment Schedule record to ensure it's ready for new data
                RAPaymentScheduleRec.Init();

                // Transfer all matching fields from Staging to RA Payment Schedule
                RAPaymentScheduleRec.TransferFields(StagingRAPaymentScheduleRec);

                // Insert the new record into RA Payment Schedule
                RAPaymentScheduleRec.Insert();
            until StagingRAPaymentScheduleRec.Next() = 0;
        end;
    end;
}
