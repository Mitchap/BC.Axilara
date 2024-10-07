page 50500 "Amort. to General Journal"
{
    trigger OnOpenPage()
    begin
        ProcessRAEntries();
        PAGE.RUN(39);
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
        FirstOfNextMonth := DMY2DATE(1, 7, 2024);
        FirstOfMonthAfterNext := CALCDATE('<CM>+1D', FirstOfNextMonth);
        LastOfNextMonth := DMY2DATE(31, 7, 2024);

        // Delete existing records in the General Journal
        DeleteExistingJournalLines();

        // Set range for Date Due
        RAPaymentRec.SetRange("Date Due", FirstOfNextMonth, LastOfNextMonth);

        // Filter for Payment Type = Amortization and Amount = 0
        RAPaymentRec.SetRange("Payment Type", RAPaymentRec."Payment Type"::Amortization);
        RAPaymentRec.SetFilter("Amount", '<>0');

        // Find the first record that meets the criteria
        if RAPaymentRec.FINDFIRST then begin
            repeat
                // Check if the corresponding Reservation Agreement exists
                if RARec.GET(RAPaymentRec."RA ID") then
                    // Create a General Journal Line if the conditions are met
                    CreateGeneralJournalLine(RARec, RAPaymentRec);
            until RAPaymentRec.NEXT = 0;
        end;
    end;


    procedure DeleteExistingJournalLines()
    var
        GenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine.SetRange("Journal Template Name", 'GENERAL');
        GenJnlLine.SetRange("Journal Batch Name", 'AMORTIZE');

        // Delete all existing lines for the specified template and batch
        if GenJnlLine.FINDFIRST then
            repeat
                GenJnlLine.DELETE(true);
            until GenJnlLine.NEXT = 0;
    end;

    procedure CreateGeneralJournalLine(RARec: Record "Reservation Agreement"; RAPaymentRec: Record "RA Payment Schedule")
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
    begin
        if not RAPaymentRec.Journalized then
            if not GenJnlTemplate.GET('GENERAL') then
                Error('General Journal Template not found');
        if not GenJnlBatch.GET('GENERAL', 'AMORTIZE') then
            Error('General Journal Batch not found');

        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := GenJnlTemplate.Name;
        GenJnlLine."Journal Batch Name" := GenJnlBatch.Name;
        GenJnlLine."Posting Date" := RAPaymentRec."Date Due";
        GenJnlLine."Line No." := GetNextLineNo(GenJnlLine);
        GenJnlLine."RA ID" := RAPaymentRec."RA ID";
        GenJnlLine."System Payment ID" := RAPaymentRec."System Payment ID";
        GenJnlLine."Seq" := RAPaymentRec."Seq";
        GenJnlLine.Amount := ROUND(-1 * RAPaymentRec."Amount", 0.01);
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := RARec."Client No.";
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        GenJnlLine."Description" := RARec."Client No." + ' ' + RAPaymentRec."Check Number" + ' ' + StrSubstNo(RARec."Customer Name", 20);
        GenJnlLine."Bal. Account No." := RARec."Dep. Bank Acct Code";
        GenJnlLine."Document No." := GetNextDocumentNo(GenJnlLine);
        // GenJnlLine."Created By" := USERID; // Store the current user ID

        GenJnlLine.INSERT(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        IsAllowed: Boolean;
        GenJnlLine: Record "Gen. Journal Line";
    begin
        // Use the current record for the check
        IsAllowed := CheckUserAccess(GenJnlLine);
        if not IsAllowed then
            Error('You are not allowed to edit this record.');

        exit(IsAllowed); // Return true if access is allowed
    end;

    local procedure CheckUserAccess(var GenJnlLine: Record "Gen. Journal Line"): Boolean
    var
        CurrentUserId: Code[50];
    begin
        CurrentUserId := USERID; // Get the current user ID
        // exit(CurrentUserId = GenJnlLine."Created By"); // Check if the current user is the creator
    end;

    local procedure GetNextLineNo(GenJnlLine: Record "Gen. Journal Line"): Integer
    var
        MaxLineNo: Integer;
    begin
        GenJnlLine.SetRange("Journal Template Name", 'GENERAL');
        GenJnlLine.SetRange("Journal Batch Name", 'AMORTIZE');

        if GenJnlLine.FindLast then
            MaxLineNo := GenJnlLine."Line No."
        else
            MaxLineNo := 0;

        exit(MaxLineNo + 10000);
    end;

    local procedure GetNextDocumentNo(GenJnlLine: Record "Gen. Journal Line"): Code[20]
    var
        DocNoGLN: Code[20];
        NoSeriesMgt: Codeunit "No. Series";
    begin
        DocNoGLN := NoSeriesMgt.GetNextNo('GJNL-GEN', 0D, true);
        exit(DocNoGLN);
    end;

    procedure IncrementDocumentNo(var CurrentDocNo: Code[20]): Code[20]
    var
        Prefix: Text[10];
        NumericPart: Text[10];
        NewNumericPart: Integer;
        NewDocNo: Code[20];
    begin
        NewDocNo := '';

        Prefix := CopyStr(CurrentDocNo, 1, 3);
        NumericPart := CopyStr(CurrentDocNo, 4, 9);

        if not Evaluate(NewNumericPart, NumericPart) then
            Error('The numeric part is not a valid integer.');
        NewNumericPart += 1;
        NumericPart := Format(NewNumericPart, 0, 0);

        if StrLen(NumericPart) < 7 then
            NumericPart := PadLeft(NumericPart, '0', 7);
        NewDocNo := Prefix + NumericPart;
        exit(NewDocNo);
    end;

    local procedure PadLeft(Value: Text[10]; Char: Text[1]; TotalLength: Integer): Text[10]
    var
        PaddedValue: Text[10];
    begin
        PaddedValue := Value;
        while StrLen(PaddedValue) < TotalLength do
            PaddedValue := Char + PaddedValue;

        exit(PaddedValue);
    end;

}
