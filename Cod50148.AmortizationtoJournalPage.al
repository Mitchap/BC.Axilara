page 50148 "Amortization to Journal Page"
{
    trigger OnOpenPage()
    begin
        ProcessRAEntries();
        PAGE.RUN(39); // Open the General Journal (Page 39)
    end;

    procedure ProcessRAEntries()
    var
        RARec: Record "Reservation Agreement";
        RAPaymentRec: Record "RA Payment Schedule";
        ProjectRec: Record "Project";
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        CurrentDate: Date;
        FirstOfNextMonth: Date;
        FirstOfMonthAfterNext: Date;
        LastOfNextMonth: Date;
    begin
        CurrentDate := TODAY;
        //        FirstOfNextMonth := CALCDATE('<CM>+1D', CurrentDate);
        FirstOfNextMonth := DMY2DATE(1, 7, 2024); // Setting FirstOfNextMonth to July 1, 2024
        FirstOfMonthAfterNext := CALCDATE('<CM>+1D', FirstOfNextMonth);
        LastOfNextMonth := DMY2DATE(30, 9, 2024); // Setting FirstOfNextMonth to July 1, 2024
        //LastOfNextMonth := CALCDATE('-1D', FirstOfMonthAfterNext);
        RAPaymentRec.SetRange("Date Due", FirstOfNextMonth, LastOfNextMonth);
        if RAPaymentRec.FINDFIRST then begin
            repeat
                if RARec.GET(RAPaymentRec."RA ID") then
                    CreateGeneralJournalLine(RARec, RAPaymentRec);
            until RAPaymentRec.NEXT = 0;
        end;
    end;

    procedure CreateGeneralJournalLine(RARec: Record "Reservation Agreement"; RAPaymentRec: Record "RA Payment Schedule")
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        ProjectRec: Record "Project";
    begin
        // Get the default General Journal Template and Batch
        if not GenJnlTemplate.GET('GENERAL') then
            Error('General Journal Template not found');
        if not GenJnlBatch.GET('GENERAL', 'AMORTIZE') then
            Error('General Journal Batch not found');
        // Initialize the journal line
        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := GenJnlTemplate.Name;
        GenJnlLine."Journal Batch Name" := GenJnlBatch.Name;
        GenJnlLine."Posting Date" := RAPaymentRec."Date Due";
        GenJnlLine."Line No." := GetNextLineNo(GenJnlLine);
        GenJnlLine."RA ID" := RAPaymentRec."RA ID";
        GenJnlLine."System Payment ID" := RAPaymentRec."System Payment ID";
        GenJnlLine."Seq" := RAPaymentRec."Seq";
        GenJnlLine.Amount := -1 * RAPaymentRec."Amount";
        // Added fields
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := RARec."Client No.";
        //GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::Sale;
        //GenJnlLine."Gen. Bus. Posting Group" := 'DOMESTIC';
        //GenJnlLine."Gen. Prod. Posting Group" := 'SALES VAT';
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        // Set the Description: Client No., Bank Account Name, Check No.
        GenJnlLine."Description" :=
          RARec."Client No." + ' ' +
            RAPaymentRec."Check Number" + ' ' +
            StrSubstNo(RARec."Customer Name", 20);

        GenJnlLine."Bal. Account No." := RARec."Dep. Bank Acct Code";


        // Insert the journal line  
        GenJnlLine.INSERT(true);
        // Update RA Payment Schedule
        //RAPaymentRec."Journalized" := TRUE;   Kaye!!!! dont forget to uncomment
        RAPaymentRec.MODIFY;
    end;

    local procedure GetNextLineNo(GenJnlLine: Record "Gen. Journal Line"): Integer
    var
        MaxLineNo: Integer;
    begin
        GenJnlLine.SetRange("Journal Template Name", 'GENERAL');
        if GenJnlLine.FindLast then
            MaxLineNo := GenJnlLine."Line No.";
        exit(MaxLineNo + 10000);
    end;
}