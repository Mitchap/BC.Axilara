report 50100 "RA Report"
{
    ApplicationArea = All;
    Caption = 'RA Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = RAReport;

    dataset
    {
        dataitem(ReservationAgreement; "Reservation Agreement")
        {
            RequestFilterFields = "Status";

            column(RAID; "RA ID") { }
            column(Status; Status) { }
            column(ClientNo; "Client No.") { }
            column(CustomerName; "Customer Name") { }
            column(ProjectID; "Project ID") { }
            column(ProjectName; "Project Name") { }
            column(PropertyID; "Property ID") { }
            column(PropertyName; "Property Name") { }
            column("Area"; "Area") { }
            column(PricePerSqm; "Price/Sqm") { }
            column(TotalSellingPrice; "Total Selling Price") { }
            column(ReservationFeeDate; "Reservation Fee Date") { }
            column(ReservationFee; "Reservation Fee") { }
            column(PaymentTerm; "Payment Term") { }
            column(DepBankAcctCode; "Dep. Bank Acct Code") { }
            column(CashTotalSellingPrice; "Cash Total Selling Price") { }
            column(CashDiscountAmount; "Cash Discount Amount") { }
            column(CashNSPWithoutVAT; "Cash NSP without VAT") { }
            column(Cash12VAT; "Cash 12% VAT") { }
            column(CashNSPWithVAT; "Cash NSP with VAT") { }
            column(CashLessReservationFee; "Cash Less Reservation Fee") { }
            column(CashRetentionFee; "Cash Retention Fee") { }
            column(CashTotalAmountPayable; "Cash Total Amount Payable") { }

            column(INHFTotalSellingPrice; "INHF Total Selling Price") { }
            column(INHFDiscountAmount; "INHF Discount Amount") { }
            column(INHFNSPWithoutVAT; "INHF NSP without VAT") { }
            column(INHF12VAT; "INHF 12% VAT") { }
            column(INHFNSPWithVAT; "INHF NSP with VAT") { }
            column(INHFDownpaymentPercent; "INHF Downpayment Percent") { }
            column(INHFDownpayment; "INHF Downpayment") { }
            column(INHFLessReservationFee; "INHF Less Reservation Fee") { }
            column(INHFTotalDownpayment; "INHF Total Downpayment") { }
            column(INHFDownpaymentDueDate; "INHF Downpayment Due Date") { }
            column(BalanceForAmortization; "Balance for Amortization") { }
            column(InterestRateAt7Annum; "Interest Rate at 7% Annum") { }
            column(NumberOfYears; "Number of Years") { }
            column(MonthlyAmortization; "Monthly Amortization") { }
            column(MonthlyAmortizationDueDate; "Monthly Amortization Due Date") { }
            column(SplitType; "Split Type") { }
            column(NoOfSplits; "No. of Splits") { }
            column(SplitPaymentAmount; "Split Payment Amount") { }
            column(SplitStartDate; "Split Start Date") { }
            column(SplitEndDate; "Split End Date") { }
            column(PMCode; "PC Code") { }
            column(SMCode; "SM Code") { }
            column(SDCode; "SD Code") { }
            column(TLCode; "TL Code") { }
            column(SSD1Code; "SSD1 Code") { }
            column(SSD2Code; "SSD2 Code") { }
            column(PMName; "PC Name") { }
            column(SMName; "SM Name") { }
            column(SDName; "SD Name") { }
            column(TLName; "TL Name") { }
            column(SSD1Name; "SSD1 Name") { }
            column(SSD2Name; "SSD2 Name") { }
            column(DateToday; SystemCreatedAt) { }
        }

        dataitem(RA_Payment_Schedule; "RA Payment Schedule")
        {
            column(Total_Amount_Paid; "Amount Paid") { }
            column(Balance; "Balance") { }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(Preview)
                {
                    ApplicationArea = All;
                    Caption = 'Preview';
                }

                action(Print)
                {
                    ApplicationArea = All;
                    Caption = 'Print';
                }
            }
        }
    }

    rendering
    {
        layout(RAReport)
        {
            Type = RDLC;
            LayoutFile = 'Report/RAReport.rdl';
        }
    }
}