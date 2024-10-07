page 50122 "TS02 Status of Accounts"

{
    PageType = List;
    Caption = 'Transactions';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Reservation Agreement";
    SourceTableView = sorting("RA ID") order(descending);
    InsertAllowed = false; // Disable the "New" action
    DeleteAllowed = false; // Disable the "Delete" action


    layout
    {


        area(Content)
        {
            repeater(GroupName)
            {
                field("RA ID";
                Rec."RA ID")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Email Address"; EmailAddress)
                {
                    ApplicationArea = All;
                }

                // field("Property Name"; Rec."Property Name")
                // {
                //     ApplicationArea = All;
                // }
                field("Project"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Phase"; Rec.Phase)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Block"; Rec.Block)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Lot"; Rec."Lot")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Payment Term"; Rec."Payment Term")
                {
                    ApplicationArea = All;
                }
                field("Dep. Bank Acct Code"; Rec."Dep. Bank Acct Code")
                {
                    ApplicationArea = All;
                }
                field("Cash Total Amount Payable"; Rec."Cash Total Amount Payable")
                {
                    ApplicationArea = All;
                }
                field("Balance for Amortization"; Rec."Balance for Amortization")
                {
                    ApplicationArea = All;
                    Caption = 'INHF Total for Amortization';
                }
                field("Total Paid"; "TotalPaid")
                {
                    ApplicationArea = All;
                }
                field("Last Payment Date"; LastDatePaid)
                {
                    ApplicationArea = All;
                }
                field("Balance"; "BalanceAmount")
                {
                    ApplicationArea = All;
                    Caption = 'Ledger Balance';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {

        area(Processing)
        {
            action(EditRecord)
            {
                Caption = 'Edit RA';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Reservation Agreement Card", Rec);
                end;
            }
            action(CLSView)
            {
                Caption = 'CLS';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Customer Ledger Status", Rec);
                end;
            }
            action(CheckSubmit)
            {
                Caption = 'View Check Submission';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    CheckSubmissionPage: Page "Check Submission Payment Sched";
                    PaymentScheduleRec: Record "RA Payment Schedule";
                begin
                    PaymentScheduleRec.SetRange("RA ID", Rec."RA ID"); // Filter by RA ID
                    PAGE.Run(PAGE::"Check Submission Payment Sched", PaymentScheduleRec);
                end;
            }
            action(UpdateStatus)
            {
                ApplicationArea = All;
                Caption = 'Update Status';
                Promoted = true;
                PromotedCategory = Process;
                Image = Action;

                trigger OnAction()
                begin
                    Codeunit.Run(50109); // Run Codeunit 50109
                    Message('Status of Accounts Clasification DONE!');
                end;
            }

        }


    }

    var
        CustomerRec: Record Customer; // Variable for Customer table
        RAPayments: Record "RA Payment Schedule";
        EmailAddress: Text;
        TotalPaid: Decimal;
        BalanceAmount: Decimal;
        LastDatePaid: Date;



    trigger OnAfterGetRecord()
    begin
        // Check if customer record exists and set EmailAddress
        if CustomerRec.Get(Rec."Client No.") then
            EmailAddress := CustomerRec."E-Mail"
        else
            EmailAddress := ''; // Handle case where customer is not found

        TotalPaid := 0;
        BalanceAmount := 0;
        LastDatePaid := 0D;
        RAPayments.SetRange("RA ID", Rec."RA ID");
        RAPayments.SetFilter("Amount Paid", '>0');

        // Calculate the sum of Amount Paid for the current RA ID

        if (Rec."Payment Term" = "Payment Term Enum"::"Full Cash")
            or (Rec."Payment Term" = "Payment Term Enum"::"Split Cash") then begin
            RAPayments.SetFilter("Payment Type", '%1|%2', RAPayments."Payment Type"::"Reservation Fee", RAPayments."Payment Type"::"Down Payment");
            if RAPayments.FindSet() then
                repeat
                    TotalPaid += RAPayments."Amount Paid"; // Accumulate total
                    LastDatePaid := RAPayments."Date Paid";
                    BalanceAmount := Rec."Cash Total Amount Payable" - TotalPaid;
                until RAPayments.Next() = 0;
        end;


        if (Rec."Payment Term" = "Payment Term Enum"::"Full DP")
            or (Rec."Payment Term" = "Payment Term Enum"::"Split DP") then begin
            RAPayments.SetFilter("Payment Type", '%1|%2', RAPayments."Payment Type"::"Amortization", RAPayments."Payment Type"::"Payment");

            if RAPayments.FindSet() then
                repeat
                    TotalPaid += RAPayments."Amount Paid"; // Accumulate total
                    LastDatePaid := RAPayments."Date Paid";
                    BalanceAmount := RAPayments.Balance;
                until RAPayments.Next() = 0;
        end;

        //BalanceAmount := Rec."Balance for Amortization" - TotalPaid;
    end;

}