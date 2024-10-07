page 50548 "API Reservation Agreement"
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiReservationAgreement';
    DelayedInsert = true;
    EntityName = 'reservationAgreement';
    EntitySetName = 'reservationAgreements';
    PageType = API;
    SourceTable = "Reservation Agreement";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(raID; Rec."RA ID")
                {
                    Caption = 'RA ID';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(clientNo; Rec."Client No.")
                {
                    Caption = 'Client No.';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Client Name';
                }
                field(projectID; Rec."Project ID")
                {
                    Caption = 'Project ID';
                }
                field(propertyID; Rec."Property ID")
                {
                    Caption = 'Property ID';
                }
                field(projectName; Rec."Project Name")
                {
                    Caption = 'Project Name';
                }
                field(propertyName; Rec."Property Name")
                {
                    Caption = 'Property Name';
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                }
                field(priceSqm; Rec."Price/Sqm")
                {
                    Caption = 'Price/Sqm';
                }
                field(totalSellingPrice; Rec."Total Selling Price")
                {
                    Caption = 'Total Selling Price';
                }
                field(reservationFeeDate; Rec."Reservation Fee Date")
                {
                    Caption = 'Reservation Fee Date';
                }
                field(reservationFee; Rec."Reservation Fee")
                {
                    Caption = 'Reservation Fee';
                }
                field(paymentTerm; Rec."Payment Term")
                {
                    Caption = 'Payment Term';
                }
                field(depBankAcctCode; Rec."Dep. Bank Acct Code")
                {
                    Caption = 'Dep. Bank Acct Code';
                }
                field(cashTotalSellingPrice; Rec."Cash Total Selling Price")
                {
                    Caption = 'Cash Total Selling Price';
                }
                field(cashDiscountAmount; Rec."Cash Discount Amount")
                {
                    Caption = 'Cash Discount Amount';
                }
                field(cashNSPWithoutVAT; Rec."Cash NSP without VAT")
                {
                    Caption = 'Cash NSP without VAT';
                }
                field(cash12VAT; Rec."Cash 12% VAT")
                {
                    Caption = 'Cash 12% VAT';
                }
                field(cashNSPWithVAT; Rec."Cash NSP with VAT")
                {
                    Caption = 'Cash NSP with VAT';
                }
                field(cashLessReservationFee; Rec."Cash Less Reservation Fee")
                {
                    Caption = 'Cash Less Reservation Fee';
                }
                field(cashRetentionFee; Rec."Cash Retention Fee")
                {
                    Caption = 'Cash Retention Fee';
                }
                field(cashTotalAmountPayable; Rec."Cash Total Amount Payable")
                {
                    Caption = 'Cash Total Amount Payable';
                }
                field(inhfTotalSellingPrice; Rec."INHF Total Selling Price")
                {
                    Caption = 'INHF Total Selling Price';
                }
                field(inhfDiscountAmount; Rec."INHF Discount Amount")
                {
                    Caption = 'INHF Discount Amount';
                }
                field(inhfNSPWithoutVAT; Rec."INHF NSP without VAT")
                {
                    Caption = 'INHF NSP without VAT';
                }
                field(inhf12VAT; Rec."INHF 12% VAT")
                {
                    Caption = 'INHF 12% VAT';
                }
                field(inhfNSPWithVAT; Rec."INHF NSP with VAT")
                {
                    Caption = 'INHF NSP with VAT';
                }
                field(inhfDownpaymentPercent; Rec."INHF Downpayment Percent")
                {
                    Caption = 'INHF Downpayment Percent';
                }
                field(inhfDownpayment; Rec."INHF Downpayment")
                {
                    Caption = 'INHF Downpayment';
                }
                field(inhfLessReservationFee; Rec."INHF Less Reservation Fee")
                {
                    Caption = 'INHF Less Reservation Fee';
                }
                field(inhfTotalDownpayment; Rec."INHF Total Downpayment")
                {
                    Caption = 'INHF Total Downpayment';
                }
                field(inhfDownpaymentDueDate; Rec."INHF Downpayment Due Date")
                {
                    Caption = 'INHF Downpayment Due Date';
                }
                field(balanceForAmortization; Rec."Balance for Amortization")
                {
                    Caption = 'Balance for Amortization';
                }
                field(interestRateAt7Annum; Rec."Interest Rate at 7% Annum")
                {
                    Caption = 'Interest Rate at 7% Annum';
                }
                field(numberOfYears; Rec."Number of Years")
                {
                    Caption = 'Number of Years';
                }
                field(monthlyAmortization; Rec."Monthly Amortization")
                {
                    Caption = 'Monthly Amortization';
                }
                field(monthlyAmortizationDueDate; Rec."Monthly Amortization Due Date")
                {
                    Caption = 'Monthly Amortization Due Date';
                }
                field(splitType; Rec."Split Type")
                {
                    Caption = 'Split Type';
                }
                field(noOfSplits; Rec."No. of Splits")
                {
                    Caption = 'No. of Splits';
                }
                field(splitPaymentAmount; Rec."Split Payment Amount")
                {
                    Caption = 'Split Payment Amount';
                }
                field(splitStartDate; Rec."Split Start Date")
                {
                    Caption = 'Split Payment Amount';
                }
                field(splitEndDate; Rec."Split End Date")
                {
                    Caption = 'Split Payment Amount';
                }
                field(pcCode; Rec."PC Code")
                {
                    Caption = 'PC Code';
                }
                field(smCode; Rec."SM Code")
                {
                    Caption = 'SM Code';
                }
                field(sdCode; Rec."SD Code")
                {
                    Caption = 'SD Code';
                }
                field(tlCode; Rec."TL Code")
                {
                    Caption = 'TL Code';
                }
                field(ssd1Code; Rec."SSD1 Code")
                {
                    Caption = 'SSD1 Code';
                }
                field(ssd2Code; Rec."SSD2 Code")
                {
                    Caption = 'SSD2 Code';
                }
                field(pcName; Rec."PC Name")
                {
                    Caption = 'PC Name';
                }
                field(smName; Rec."SM Name")
                {
                    Caption = 'SM Name';
                }
                field(sdName; Rec."SD Name")
                {
                    Caption = 'SD Name';
                }
                field(tlName; Rec."TL Name")
                {
                    Caption = 'TL Name';
                }
                field(ssd1Name; Rec."SSD1 Name")
                {
                    Caption = 'SSD1 Name';
                }
                field(ssd2Name; Rec."SSD2 Name")
                {
                    Caption = 'SSD2 Name';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
