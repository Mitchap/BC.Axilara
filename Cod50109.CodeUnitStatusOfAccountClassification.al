codeunit 50109 "Status of Accounts Classify"
{
    Access = Public;
    trigger OnRun()
    var
        ReservationAgreementRec: Record "Reservation Agreement";
        RAPaymentScheduleRec: Record "RA Payment Schedule";
        LastRAPaymentScheduleRec: Record "RA Payment Schedule";
    begin
        // Step 1: Start - Initiate the classification process
        // You can either set this to run periodically with job queues or trigger based on an event.
        // Step 2: Retrieve Account Data
        if ReservationAgreementRec.FindSet() then begin
            repeat
                // Step 3: Filter for payments that are not zero (Amount Paid <> 0)
                RAPaymentScheduleRec.SetRange("RA ID", ReservationAgreementRec."RA ID");
                RAPaymentScheduleRec.SetFilter("Amount Paid", '<> 0'); // Filter records where some payment was made
                // Step 4: Sort records by "Date Due" in descending order to find the latest record
                RAPaymentScheduleRec.SetCurrentKey("Date Due");
                //LastRAPaymentScheduleRec := RAPaymentScheduleRec;
                if RAPaymentScheduleRec.FindLast() then begin
                    // Apply Automated Rules for the last payment record
                    ApplyClassificationRules(ReservationAgreementRec, RAPaymentScheduleRec);

                    // Update Account Status based on the last record
                    UpdateAccountStatus(ReservationAgreementRec);
                end;
            until ReservationAgreementRec.Next() = 0;
        end;
        // Step 6: Review and Verify - This would likely be a manual review process outside AL
    end;

    procedure ApplyClassificationRules(var RARec: Record "Reservation Agreement"; var RAPayRec: Record "RA Payment Schedule")
    var
        DaysOverdue: Integer;
        TotalAmountPaid: Decimal;

    begin

        if (RARec."Payment Term" = "Payment Term Enum"::"Full Cash")
                 or (RARec."Payment Term" = "Payment Term Enum"::"Split Cash") then
            RAPayRec.CalcSums("Amount Paid");
        TotalAmountPaid := RAPayRec."Amount Paid";
        if TotalAmountPaid = 0.95 * RARec."Cash NSP with VAT" then
            RARec."Status" := "RA Status Enum"::"Retention Balance"
        else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Cash Total Amount Payable" then
            RARec."Status" := "RA Status Enum"::"Fully Paid"
        else
            RARec."Status" := "RA Status Enum"::"with Outstanding Balance";


        // Calculate days overdue
        if (RARec."Payment Term" = "Payment Term Enum"::"Full DP")
                        or (RARec."Payment Term" = "Payment Term Enum"::"Split DP") then
            if RAPayRec."Date Due" <> 0D then begin
                DaysOverdue := WorkDate() - RAPayRec."Date Due";

                if DaysOverdue > 365 then begin
                    RAPayRec.SetFilter("Payment Type", '%1|%2', RAPayRec."Payment Type"::Amortization, RAPayRec."Payment Type"::Payment);
                    RAPayRec.CalcSums("Amount Paid");
                    TotalAmountPaid := RAPayRec."Amount Paid";
                    if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
                        RARec."Status" := "RA Status Enum"::"Retention Balance"
                    else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
                        RARec."Status" := "RA Status Enum"::"Fully Paid"
                    else
                        RARec."Status" := "RA Status Enum"::"In Default"
                end
                else begin
                    if DaysOverdue > 90 then begin
                        RAPayRec.CalcSums("Amount Paid");
                        TotalAmountPaid := RAPayRec."Amount Paid";
                        if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
                            RARec."Status" := "RA Status Enum"::"Retention Balance"
                        else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
                            RARec."Status" := "RA Status Enum"::"Fully Paid"
                        else
                            RARec."Status" := "RA Status Enum"::"Over Due"
                    end
                    else begin
                        if DaysOverdue > 30 then begin
                            RAPayRec.CalcSums("Amount Paid");
                            TotalAmountPaid := RAPayRec."Amount Paid";
                            if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
                                RARec."Status" := "RA Status Enum"::"Retention Balance"
                            else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
                                RARec."Status" := "RA Status Enum"::"Fully Paid"
                            else
                                RARec."Status" := "RA Status Enum"::"Past Due"
                        end

                        else begin
                            RARec."Status" := "RA Status Enum"::Current // or another appropriate status
                        end
                    end;                                                                // Add more conditions as per your business rules
                    // if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
                    //     RARec."Status" := "RA Status Enum"::"Fully Paid"
                    // else
                    //     RARec."Status" := "RA Status Enum"::"     "
                end;


            end

    end;



    procedure UpdateAccountStatus(var RARec: Record "Reservation Agreement")
    begin
        RARec.Modify();
    end;
}

// var
//     ReservationAgreementRec: Record "Reservation Agreement";
//     RAPaymentScheduleRec: Record "RA Payment Schedule";
//     LastRAPaymentScheduleRec: Record "RA Payment Schedule";
// begin
//     // Step 1: Start - Initiate the classification process
//     // You can either set this to run periodically with job queues or trigger based on an event.
//     // Step 2: Retrieve Account Data
//     if ReservationAgreementRec.FindSet() then begin
//         repeat
//             // Step 3: Filter for payments that are not zero (Amount Paid <> 0)
//             RAPaymentScheduleRec.SetRange("RA ID", ReservationAgreementRec."RA ID");
//             RAPaymentScheduleRec.SetFilter("Amount Paid", '<> 0'); // Filter records where some payment was made
//             // Step 4: Sort records by "Date Due" in descending order to find the latest record
//             //RAPaymentScheduleRec.SetCurrentKey("Date Due");
//             //LastRAPaymentScheduleRec := RAPaymentScheduleRec;
//             if RAPaymentScheduleRec.FindLast() then begin
//                 // Apply Automated Rules for the last payment record
//                 ApplyClassificationRules(ReservationAgreementRec, RAPaymentScheduleRec);

//                 // Update Account Status based on the last record
//                 UpdateAccountStatus(ReservationAgreementRec);
//                 Message(RAPaymentScheduleRec."RA ID");
//             end;
//         until ReservationAgreementRec.Next() = 0;
//     end;
//     // Step 6: Review and Verify - This would likely be a manual review process outside AL
// end;

// procedure ApplyClassificationRules(var RARec: Record "Reservation Agreement"; var RAPayRec: Record "RA Payment Schedule")
// var
//     DaysOverdue: Integer;
//     TotalAmountPaid: Decimal;

// begin
//     // Calculate days overdue
//     if (RARec."Payment Term" = "Payment Term Enum"::"Full DP")
//                     or (RARec."Payment Term" = "Payment Term Enum"::"Split DP") then
//         if RAPayRec."Date Due" <> 0D then begin
//             DaysOverdue := WorkDate() - RAPayRec."Date Due";
//             //Message('The payment is %1 days overdue.', DaysOverdue);
//             // Sample rules to classify accounts based on payment patterns
//             //                if RAPayRec."Amount Paid" = 0 then begin
//             //                    RARec."Status" := "RA Status Enum"::"     "
//             //               end
//             //
//             //                else begin
//             if DaysOverdue > 365 then begin
//                 RAPayRec.CalcSums("Amount Paid");
//                 TotalAmountPaid := RAPayRec."Amount Paid";
//                 if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
//                     RARec."Status" := "RA Status Enum"::"Retention Balance"
//                 else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Cash Total Amount Payable" then
//                     RARec."Status" := "RA Status Enum"::"Fully Paid"
//                 else
//                     RARec."Status" := "RA Status Enum"::"In Default"
//             end
//             else begin
//                 if DaysOverdue > 90 then begin
//                     RAPayRec.CalcSums("Amount Paid");
//                     TotalAmountPaid := RAPayRec."Amount Paid";
//                     if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
//                         RARec."Status" := "RA Status Enum"::"Retention Balance"
//                     else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
//                         RARec."Status" := "RA Status Enum"::"Fully Paid"
//                     else
//                         RARec."Status" := "RA Status Enum"::"Over Due"
//                 end
//                 else begin
//                     if DaysOverdue > 30 then begin
//                         RAPayRec.CalcSums("Amount Paid");
//                         TotalAmountPaid := RAPayRec."Amount Paid";
//                         if TotalAmountPaid = 0.95 * RARec."INHF NSP with VAT" then
//                             RARec."Status" := "RA Status Enum"::"Retention Balance"
//                         else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
//                             RARec."Status" := "RA Status Enum"::"Fully Paid"
//                         else
//                             RARec."Status" := "RA Status Enum"::"Past Due"
//                     end

//                     else begin
//                         RARec."Status" := "RA Status Enum"::Current // or another appropriate status
//                     end
//                 end;                                                                // Add more conditions as per your business rules
//                 if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Balance for Amortization" then
//                     RARec."Status" := "RA Status Enum"::"Fully Paid"
//                 else
//                     RARec."Status" := "RA Status Enum"::"     "
//             end;
//         end

//         else begin
//             RAPayRec.CalcSums("Amount Paid");
//             TotalAmountPaid := RAPayRec."Amount Paid";
//             if TotalAmountPaid = 0.95 * RARec."Cash NSP with VAT" then
//                 RARec."Status" := "RA Status Enum"::"Retention Balance"
//             else if TotalAmountPaid - RARec."Reservation Fee" >= RARec."Cash Total Amount Payable" then
//                 RARec."Status" := "RA Status Enum"::"Fully Paid"
//             else
//                 RARec."Status" := "RA Status Enum"::"with Outstanding Balance"
//         end;

// end;


// procedure UpdateAccountStatus(var RARec: Record "Reservation Agreement")
// begin
//     RARec.Modify();
// end;
