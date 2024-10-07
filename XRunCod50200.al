page 50555 "Code Unit Run"

{

    // //Access = Public;

    trigger OnOpenPage()
    var
        InsertRAPayment: Codeunit "Test Insert RA Payment";
    begin
        Codeunit.Run(50200);
        // Example usage of the InsertRAPaymentSchedule procedure
        InsertRAPayment.InsertRAPaymentSchedule('0XX0000004', Today(), 35000.00, "Payment Type"::"Reservation Fee", '00000076');

        Message('DONE');  // This will trigger Codeunit 50100 when the page is opened
    end;
}

