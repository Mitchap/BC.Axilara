page 50126 "Penalty Computation"
{
    ApplicationArea = All;
    Caption = 'Penalty Computation';
    PageType = Document;
    SourceTable = "Reservation Agreement";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Customer Details';

                field("RA ID";
                Rec."RA ID")
                {
                    Editable = false;
                }
                field("Client No."; Rec."Client No.")
                {
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field(Penalty; MPenalty)
                {
                    Editable = false;
                }
                field(UnpaidAmortization; MunPaid)
                {
                    Editable = false;
                    Caption = 'Unpaid Amortization';
                }
                field(CompDate; Today)
                {
                    Editable = false;
                    Caption = 'Computation Date';
                }
            }

            part(RAPayments; "Penalty Computation Due List")
            {
                Caption = 'Past Due List';
                SubPageLink = "RA ID" = field("RA ID");
                ApplicationArea = All;
                Visible = (Rec."Payment Term" = "Payment Term Enum"::"Full DP")
                        or (Rec."Payment Term" = "Payment Term Enum"::"Split DP");
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(Apply)
            {
                Caption = 'Apply';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                var
                    PaymentSched: Record "RA Payment Schedule"; // Your record variable
                begin
                    begin
                        if Confirm('Apply Penalty? Do you want to proceed?') then begin
                            // User clicked Yes

                            // Add your logic here to apply the penalty

                            begin
                                // Set multiple conditions
                                PaymentSched.SetRange("RA ID", Rec."RA ID"); // First condition
                                PaymentSched.SetRange("Payment Type", "Payment Type"::"Amortization");
                                PaymentSched.SetFilter("Date Due", '<%1', Today);
                                PaymentSched.SetCurrentKey("Date Due");

                                // Now find the set records
                                if PaymentSched.FindLast() then
                                    PaymentSched.Penalty := MPenalty;
                                PaymentSched.Modify();
                                CurrPage.Update();
                                Message('Penalty has been Applied.');
                            end;
                        end
                        else begin
                            // User clicked No
                            Message('Penalty apply operation canceled.');
                        end;
                    end;
                end;
            }
            action(UnApply)
            {
                Caption = 'UnApply';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PaymentSched: Record "RA Payment Schedule"; // Your record variable

                begin
                    begin
                        if Confirm('Unapply Penalty? Do you want to proceed?') then begin
                            // User clicked Yes

                            // Add your logic here to unapply the penalty
                            begin
                                // Set multiple conditions
                                PaymentSched.SetRange("RA ID", Rec."RA ID"); // First condition
                                PaymentSched.SetRange("Payment Type", "Payment Type"::"Amortization");
                                PaymentSched.SetFilter("Date Due", '<%1', Today);
                                PaymentSched.SetCurrentKey("Date Due");

                                // Now find the set records
                                if PaymentSched.FindLast() then
                                    PaymentSched.Penalty := 0;
                                PaymentSched.Modify();
                                CurrPage.Update();
                                Message('Penalty has been unapplied.');
                            end;
                        end
                        else begin
                            // User clicked No
                            Message('Penalty unapply operation canceled.');
                        end;
                    end;
                end;
            }
            action(Print)
            {
                Caption = 'Print';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    //Rec.CopyFilters(Rec);
                    Report.Run(50103, true, false, Rec);
                end;
            }
        }
    }
    var
        MPenalty: Decimal;
        MUnPaid: Decimal;
        PenaltyPage: Page "Penalty Computation Due List"; // Reference to the ListPart

    trigger OnOpenPage()
    begin
        Rec.SetRange("RA ID", Rec."RA ID");
        PenaltyPage.GetTotalPenalty(Rec."RA ID", MPenalty, MUnPaid)
    end;
}

