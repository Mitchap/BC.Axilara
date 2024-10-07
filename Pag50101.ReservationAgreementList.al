page 50101 "Reservation Agreement List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Reservation Agreement";
    SourceTableView = sorting("RA ID") order(descending);
    Caption = 'Reservation Agreement List';
    InsertAllowed = false; // Disable the "New" action
    DeleteAllowed = false; // Disable the "Delete" action

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnDrillDown()

                    begin
                        PAGE.Run(PAGE::"Reservation Agreement Card", Rec);
                    end;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger OnAssistEdit()
                    // begin
                    //     PAGE.Run(PAGE::"Penalty Computation", Rec);
                    // end;
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
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Client Name"; ClientName)
                {
                    ApplicationArea = All;
                    Caption = 'Client Name';
                    Editable = false;
                }
                field("Project Name"; ProjectName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        PAGE.Run(PAGE::"Customer Ledger Status", Rec); // Replace with the actual page name or ID
                    end;
                }

                // field("Property Name"; PropertyName)
                // {
                //     ApplicationArea = All;
                //     Editable = false;
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
                field("Total Selling Price"; Rec."Total Selling Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Dep. Bank Acct Code"; Rec."Dep. Bank Acct Code")
                {
                    ApplicationArea = All;
                }
                // Add additional fields you want to display in the list
            }
        }
    }

    actions
    {
        area(processing)
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
            // action(Delete)
            // {
            //     Caption = 'Delete';
            //     ApplicationArea = All;
            //     Visible = false;
            // }
            action(PrintReservationAgreementReport)
            {
                Caption = 'Print RA';
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process; // Adds the action to the Process group
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    COMMIT; // Commit any outstanding changes before running the report
                    Report.Run(50100, true, false); // Set RequestForm = false
                end;
            }

        }
    }

    // Optionally, add FactBoxes or other page parts here

    var
        CustomerRec: Record Customer;
        PropertyRec: Record Property;
        ProjectRec: Record Project;
        ClientName: Text[100];
        PropertyName: Text[100];
        ProjectName: Text[100];
        BankCodeName: Code[20];

    trigger OnAfterGetRecord()
    begin
        // Lookup Client Name based on Client No.
        if CustomerRec.Get(Rec."Client No.") then begin
            ClientName := CustomerRec.Name;
            Rec."Customer Name" := CustomerRec.Name;
        end else begin
            ClientName := ''; // No client found, set empty string
            Rec."Customer Name" := '';
        end;

        // Lookup Property Name based on Property ID.
        if PropertyRec.Get(Rec."Property ID") then begin
            PropertyName := PropertyRec."Property Name";
            Rec."Property Name" := PropertyRec."Property Name";
            Rec.Phase := PropertyRec.Phase;
            Rec.Block := PropertyRec.Block;
            Rec.Lot := PropertyRec.Lot;
        end else begin
            Rec."Property Name" := '';
            Rec.Phase := '';
            Rec.Block := '';
            Rec.Lot := '';
        end;

        if ProjectRec.Get(Rec."Project ID") then begin
            ProjectName := ProjectRec."Project Name";
            BankCodeName := ProjectRec."Bank No.";
            Rec."Project Name" := ProjectRec."Project Name";
            Rec."Dep. Bank Acct Code" := BankCodeName;
        end else begin
            ProjectName := '';
            Rec."Project Name" := '';
            Rec."Dep. Bank Acct Code" := '';
        end;
        Rec.Modify();
    end;
}
