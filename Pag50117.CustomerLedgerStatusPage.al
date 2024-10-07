page 50117 "Customer Ledger Status"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Reservation Agreement";
    Caption = 'Customer Ledger Status';
    InsertAllowed = false; // Disable the "New" action
    DeleteAllowed = false; // Disable the "Delete" action
    //CardPageId = "Customer Ledger Status Card";

    layout
    {
        area(content)
        {
            grid(ItemDetailGrid)
            {
                group("Customer Details")
                {

                    //field("Client #"; Rec."Client No.")
                    //{
                    //    ApplicationArea = All;
                    //}
                    field("Customer Name"; Rec."Customer Name")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        StyleExpr = 'Strong';
                    }
                    field("Property"; Rec."Property Name")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        StyleExpr = 'Strong';
                    }
                    field("Status"; Rec."Status")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        StyleExpr = 'Strong';
                    }

                    group("Payment List")
                    {
                        part(""; "Payment List")
                        {
                            SubPageLink = "RA ID" = field("RA ID");
                            ApplicationArea = All;
                        }

                    }
                }
                group("Reservation Agreement Details")
                {
                    field("Payment Term"; Rec."Payment Term")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        StyleExpr = 'Strong';
                    }
                    part(ReservationAgreementDetails; "Reservation Agreement Details")
                    {
                        SubPageLink = "RA ID" = field("RA ID");
                        ApplicationArea = All;
                        Visible = (Rec."Payment Term" = "Payment Term Enum"::"Full Cash")
                        or (Rec."Payment Term" = "Payment Term Enum"::"Split Cash");
                    }

                    part(InHouseFinancingDetails; "In House Financing Details")
                    {
                        SubPageLink = "RA ID" = field("RA ID");
                        ApplicationArea = All;
                        Visible = (Rec."Payment Term" = "Payment Term Enum"::"Full DP")
                        or (Rec."Payment Term" = "Payment Term Enum"::"Split DP");
                    }
                }
            }

            group("Amortization Schedule")
            {
                part(RAPayments; "RA Payment Part")
                {
                    SubPageLink = "RA ID" = field("RA ID");
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(PrintCustomerLedgerStatusReport)
            {
                Caption = 'Print CLS';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Print;

                trigger OnAction()
                var

                    RARec: Record "Reservation Agreement";

                begin
                    //Rec.Modify();
                    RARec.CopyFilters(Rec);

                    if (Rec."Payment Term" = "Payment Term Enum"::"Full Cash") or
        (Rec."Payment Term" = "Payment Term Enum"::"Split Cash") then
                        Report.Run(50102, true, false, RARec);
                    if (Rec."Payment Term" = "Payment Term Enum"::"Full DP") or
                        (Rec."Payment Term" = "Payment Term Enum"::"Split DP") then
                        Report.Run(50101, true, false, RARec);
                end;
            }
            action(PenaltyComputation)
            {
                Caption = 'Penalty Computation';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()

                var
                    PaymentStatus: Enum "RA Status Enum";

                begin

                    PaymentStatus := Rec.Status;
                    if (PaymentStatus = PaymentStatus::"Past Due") or (PaymentStatus = PaymentStatus::"Over Due")
                    or (PaymentStatus = PaymentStatus::"In Default") then
                        PAGE.Run(PAGE::"Penalty Computation", Rec)
                    else
                        Message('Account is not Past Due');
                end;

            }
        }
    }
    var
        PaymentTermEnum: Enum "Payment Term Enum";

    local procedure ShowReservationDetails(): Boolean
    begin
        if Rec."Payment Term" = PaymentTermEnum::"Full Cash" then
            exit(true);
        if Rec."Payment Term" = PaymentTermEnum::"Split Cash" then
            exit(true)
        else
            exit(false);
    end;

    local procedure ShowFinancingDetails(): Boolean
    begin
        if Rec."Payment Term" <> PaymentTermEnum::"Full DP" then
            exit(true);
        if Rec."Payment Term" <> PaymentTermEnum::"Split DP" then
            exit(true)
        else
            exit(false);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange("RA ID", Rec."RA ID");
    end;
}