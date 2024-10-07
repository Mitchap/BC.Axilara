codeunit 50101 "Update Bnk Acct Ledg Entry Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGenJnlLine', '', false, false)]
    local procedure OnAfterPostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line")
    var
        BankAccLedgerEntry: Record "Bank Account Ledger Entry";
        BnkAcctLedgEntryExt: Record "Bnk Acct Ledg Entry Ext";
        NewBALEEID: Integer;
    begin
        // Check if the transaction involves a Bank Account
        if (GenJournalLine."Account Type" = GenJournalLine."Account Type"::"Bank Account") then
        //or (GenJournalLine."Bal. Account Type" = GenJournalLine."Bal. Account Type"::"Bank Account") then 
        begin
            // Find the Bank Account Ledger Entry by searching for the last inserted Entry No.
            if BankAccLedgerEntry.FindLast then begin
                // Find the last BALEE ID in the Bnk Acct Ledg Entry Ext table
                if BnkAcctLedgEntryExt.FindLast then
                    NewBALEEID := BnkAcctLedgEntryExt."BALEE ID" + 1 // Increment based on last record
                else
                    NewBALEEID := 1; // If no records exist, start at 1

                // Insert a new record in the Bnk Acct Ledg Entry Ext table
                BnkAcctLedgEntryExt.Init();
                BnkAcctLedgEntryExt."BALEE ID" := NewBALEEID; // Set the incremented BALEE ID
                BnkAcctLedgEntryExt."Bank Ledg Entry ID" := BankAccLedgerEntry."Entry No.";
                BnkAcctLedgEntryExt."RA ID" := GenJournalLine."RA ID"; // Assuming RA ID exists in GenJournalLine
                BnkAcctLedgEntryExt."System Payment ID" := GenJournalLine."System Payment ID"; // Assuming System Payment ID exists in GenJournalLine
                BnkAcctLedgEntryExt."Seq" := GenJournalLine."Seq"; // Assuming Seq exists in GenJournalLine
                BnkAcctLedgEntryExt."Status" := BnkAcctLedgEntryExt.Status::Open; // Set status to Open or appropriate status
                BnkAcctLedgEntryExt.Insert(); // Insert the new record
                //BnkAcctLedgEntryExt.Modify()
            end;
        end;
    end;
}
