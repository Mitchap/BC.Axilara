codeunit 50200 "Test Insert RA Payment"
{
    Subtype = Normal;

    procedure InsertRAPaymentSchedule(PaymentID: Code[20]; DateDue: Date; Amount: Decimal; PaymentType: Enum "Payment Type"; ClientNo: Code[20])
    var
        RecRAPaymentSchedule: Record "RA Payment Schedule";
    begin
        // Initialize a new record
        RecRAPaymentSchedule.Init();

        // Set the fields with the provided parameters
        RecRAPaymentSchedule."System Payment ID" := PaymentID;  // Set your Payment ID
        RecRAPaymentSchedule."Date Due" := DateDue;      // Set the Date Due
        RecRAPaymentSchedule.Amount := Amount;           // Set the Amount
        RecRAPaymentSchedule."Client No." := ClientNo;
        RecRAPaymentSchedule."Payment Type" := PaymentType; // Set the Payment Type (Payment Term)

        // Insert the record into the table
        RecRAPaymentSchedule.Insert(true);
    end;
}
