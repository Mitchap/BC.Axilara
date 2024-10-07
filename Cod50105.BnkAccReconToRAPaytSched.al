codeunit 50105 "Bank Recon Post Handler"
{
    [EventSubscriber(ObjectType::Table, 271, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyBankAccLedgerEntry(var Rec: Record "Bank Account Ledger Entry")
    var
        BnkAcctLedgEntryExt: Record "Bnk Acct Ledg Entry Ext";
        RAPaymentSchedule: Record "RA Payment Schedule";
    begin
        // Check if the Bank Account Ledger Entry is closed (Rec.Open is false)
        if not Rec.Open then begin
            // Get the Entry No. from the Bank Account Ledger Entry and find it in the Bnk Acct Ledg Entry Ext table
            BnkAcctLedgEntryExt.SetRange(BnkAcctLedgEntryExt."Bank Ledg Entry ID", Rec."Entry No.");
            if BnkAcctLedgEntryExt.FindFirst then begin
                // Found the related record, now retrieve the System Payment ID
                // Get the System Payment ID from the Bnk Acct Ledg Entry Ext table
                if RAPaymentSchedule.Get(BnkAcctLedgEntryExt."System Payment ID") then begin
                    // Update the RA Payment Schedule with Posting Date and Amount Paid from the Bank Account Ledger Entry
                    RAPaymentSchedule."Date Paid" := Rec."Posting Date";
                    RAPaymentSchedule."Amount Paid" := Rec."Amount";
                    RAPaymentSchedule."Check Status" := RAPaymentSchedule."Check Status"::Cleared;
                    RAPaymentSchedule.Modify(); // Save the changes to the RA Payment Schedule record
                end;
            end;
        end;
    end;
}
