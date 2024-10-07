report 50103 "Penalty Computation"
{
    ApplicationArea = All;
    Caption = 'Penalty Computation';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = PenaltyComputation;
    dataset
    {
        dataitem(ReservationAgreement; "Reservation Agreement")
        {
            RequestFilterFields = "RA ID";
            column(RAID; "RA ID")
            {
            }
            column(Status; Status)
            {
            }
            column(ClientNo; "Client No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(PropertyName; "Property Name")
            {
            }
            column(TotalPenalty; TPenalty)
            {
            }
            column(TotalBalance; TBalance)
            {
            }
            column(ComputationDate; Today)
            {
            }
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
                column("MPenalty"; MPenalty) { }
                column("MBalance"; MBalance) { }
                column("Mcount"; "Mcount") { }

                trigger OnAfterGetRecord()
                begin
                    // Filter for penalty records only
                    if not ("ForPenalty") then
                        CurrReport.Skip
                    else
                        Mcount += 1;
                    MRefAmt := MBalance;
                    if (Mcount = 1) then
                        MRefAmt := Amount;
                    MPenalty := MRefAmt * 0.03;
                    MBalance += MPenalty + Amount;
                    TPenalty += MPenalty;
                    TBalance := MBalance;
                end;

            }
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
            area(Processing)
            {
            }
        }
    }
    rendering
    {
        layout(PenaltyComputation)
        {
            Type = RDLC; // The type of report you want to use, RCLC, Excel or Word. 
            LayoutFile = 'Report/PenaltyComputation.rdl'; // The name of the rdl report file that will be created once package is created. 
        }

    }


    var
        MPenalty: Decimal;
        TPenalty: Decimal;
        Mdate: Date;
        MRefAmt: Decimal;
        MBalance: Decimal;
        TBalance: Decimal;
        Mcount: Integer;


    trigger OnPreReport()

    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture)
    end;


    var
        CompanyInfo: Record "Company Information";
        CLSTitle: Label 'Customer Ledger Report';
}
