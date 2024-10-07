report 50102 "Customer Ledger Report CASH"
{
    UsageCategory = ReportsAndAnalysis; // will appear under the Reports section in Business Central. 
    ApplicationArea = All;
    DefaultRenderingLayout = CustLedgerReport; // this is the default layout that will be use in generating a report

    dataset
    {
        dataitem(ReservationAgreement; "Reservation Agreement") // Use the table where data is stored
        {

            //Allows user to filter a report based on its RA ID, Client Number, and Client Name
            RequestFilterFields = "RA ID", "Client No.", "Customer Name";

            //DataItemTableView = SORTING("RA ID");

            //These are not included in the Reservation Agreement Table dataitem 
            column(CLSTitle; CLSTitle) { } //The Title you want to appear in the header of your report
            column(CompanyName; CompanyName) { } // Your Company Name set in Business Central
            column(CompanyPic; CompanyInfo.Picture) { } // The Default logo in business central to change the logo you need to set it in the Report Builder, make sure to use a jpeg file. 
            column(DateToday; SystemCreatedAt) { } // Date Today also displayed at the header of the report. 

            // These are the fields that will be used in displaying data in the reports from the Reservation Agreement Table 
            // It is used in displaying the data in Reservation Agreement Details
            column(RA_ID; "RA ID") { }
            column(ClientName; "Customer Name") { }
            column(Property_Name; "Property Name") { }
            column(Status; "Status") { }
            column(ClientNo; "Client No.") { }
            column(Total_Selling_Price; "INHF Total Selling Price") { }
            column("Discount"; "INHF Discount Amount") { }
            column("NSP_Without_VAT"; "INHF NSP without VAT") { }
            column("VAT_12"; "INHF 12% VAT") { }
            column("Area"; "Area") { }
            column("NSP_With_VAT"; "INHF NSP with VAT") { }
            column("Downpayment_Percent"; "INHF Downpayment Percent") { }
            column("Downpayment"; "INHF Downpayment") { }
            column("Less_Reservation_Fee"; "INHF Less Reservation Fee") { }
            column("Total_Downpayment"; "INHF Total Downpayment") { }
            column("Downpayment_Due_Date"; "INHF Downpayment Due Date") { }
            column("Payment_Term"; "Payment Term") { }
            column("Balance_for_Amortization"; "Balance for Amortization") { }
            column("TSP"; "Total Selling Price") { }
            column("Reservation_Fee"; "Reservation Fee") { }

            //THIS IS THE CASH FIELDS
            column("Cash_Total_Selling_Price"; "Cash Total Selling Price") { }

            column("Cash_Discoun_Amount"; "Cash Discount Amount") { }

            column("Cash_NSP_without_VAT"; "Cash NSP without VAT") { }

            column("Cash_12_VAT"; "Cash 12% VAT") { }

            column("Cash_NSP_with_VAT"; "Cash NSP with VAT") { }

            column("Cash_Less_Reservation_Fee"; "Cash Less Reservation Fee") { }

            column("Cash_Retention_Fee"; "Cash Retention Fee") { }

            column("Cash_Total_Amount_Payable"; "Cash Total Amount Payable") { }

            // column("Cash_Promo_Discount"; "Promo Discount") { }

            // column("Cash_Total_Discount"; "Total Discount") { }




            //created additional dataitem for the RA Payment Schedule Table
            dataitem(PaymentSchedule; "RA Payment Schedule")
            {
                //With this DataItemLink, the report would find matching records in the RA Payment Schedule table where the "Property ID" in Reservation Agreement Table equals the "Reservation ID" in RA Payment Schedule. Preventing the report from duplication.
                DataItemLink = "RA ID" = field("RA ID");

                //PrintOnlyIfDetail = TRUE;
                // These are the fields used in displaying the data in Payment List and Amortization Schedule Table, these are found in the RA Payment Schedule Table. 
                column("Payment_Type"; "Payment Type") { }
                column("Sequence"; "Seq") { }
                column("Date_Due"; "Date Due") { }
                column("Amount"; "Amount") { }
                column("Date_Paid"; "Date Paid") { }
                column("Amount_Paid"; "Amount Paid") { }
                column("REF"; "REF No.") { }
                column("OR_Number"; "OR No.") { }
                column("Penalty"; "Penalty") { }
                column("Principal"; "Principal") { }
                column("Interest"; "Interest") { }
                column("Balance"; "Balance") { }
                column("SE_Principal"; "SE Principal") { }
                column("SE_Interest"; "SE Interest") { }
                column("SE_Balance"; "SE Balance") { }
                column("Remarks"; "Remarks") { }
                column("Check_Date"; "Check Date") { }
                column("Check_Number"; "Check Number") { }
                column("Check_Status"; "Check Status") { }
                column("Payment_Status"; "Payment Status") { }
                column("Journalized"; "Journalized") { }
                column("Payment_Method"; "Payment Method") { }
                column("BC_Confirmation_Date"; "BC Confirmation Date") { }

            }
        }



    }

    requestpage
    {
        // AboutTitle = 'Customer Ledger Report';
        // AboutText = 'View customer payment details and outstanding balances.';

        layout
        {
            area(Content)
            { }
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
        layout(CustLedgerReport)
        {
            Type = RDLC; // The type of report you want to use, RCLC, Excel or Word. 
            LayoutFile = 'Report/CustomerLedgerReportCASH.rdl'; // The name of the rdl report file that will be created once package is created. 
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture)
    end;

    var
        CompanyInfo: Record "Company Information";
        CLSTitle: Label 'Customer Ledger Report'; // The label or the title you want to display in the header of your report. 
}
