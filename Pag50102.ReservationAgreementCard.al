page 50102 "Reservation Agreement Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Reservation Agreement";
    Caption = 'Reservation Agreement Card';

    layout
    {
        area(content)
        {
            group("General")
            {
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;
                    Editable = false; // Typically, primary keys are not editable
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Client Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                }
                field("Property Name"; Rec."Property Name")
                {
                    ApplicationArea = All;
                }
                field("Lot Number"; Rec."Area")
                {
                    ApplicationArea = All;
                }
                field("Price/Sqm"; Rec."Price/Sqm")
                {
                    ApplicationArea = All;
                }
                field("Total Selling Price"; Rec."Total Selling Price")
                {
                    ApplicationArea = All;
                }
            }

            group("Reservation")
            {
                field("Reservation Fee Date"; Rec."Reservation Fee Date")
                {
                    ApplicationArea = All;
                    Caption = 'Reservation Fee Date';
                }
                field("Reservation Fee"; Rec."Reservation Fee")
                {
                    ApplicationArea = All;
                }
                field("Payment Term"; Rec."Payment Term")
                {
                    ApplicationArea = All;
                }
                field("Dep. Bank Acct Code"; Rec."Dep. Bank Acct Code")
                {
                    ApplicationArea = All;
                }
            }
            group("Cash")
            {
                field("Cash Total Selling Price"; Rec."Cash Total Selling Price")
                {
                    ApplicationArea = All;
                    Caption = 'Total Selling Price';
                }
                field("Cash Discount Amount"; Rec."Cash Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Less: Discount';
                }
                field("Cash NSP without VAT"; Rec."Cash NSP without VAT")
                {
                    ApplicationArea = All;
                    Caption = 'NSP without VAT';
                }
                field("Cash 12% VAT"; Rec."Cash 12% VAT")
                {
                    ApplicationArea = All;
                    Caption = '12% VAT';
                }
                field("Cash NSP with VAT"; Rec."Cash NSP with VAT")
                {
                    ApplicationArea = All;
                    Caption = 'NSP with VAT';
                }
                field("Cash Less Reservation Fee"; Rec."Cash Less Reservation Fee")
                {
                    ApplicationArea = All;
                    Caption = 'Less Reservation Fee';
                }
                field("Cash Retention Fee"; Rec."Cash Retention Fee")
                {
                    ApplicationArea = All;
                    Caption = 'Retention Fee';
                }
                field("Cash Total Amount Payable"; Rec."Cash Total Amount Payable")
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount Payable';
                }
            }
            group("In House Assisted Financing")
            {
                field("INHF Total Selling Price"; Rec."INHF Total Selling Price")
                {
                    ApplicationArea = All;
                    Caption = 'Total Selling Price';
                }
                field("INHF Discount Amount"; Rec."INHF Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Less: Discount';
                }
                field("INHF NSP without VAT"; Rec."INHF NSP without VAT")
                {
                    ApplicationArea = All;
                    Caption = 'NSP without VAT';
                }
                field("INHF 12% VAT"; Rec."INHF 12% VAT")
                {
                    ApplicationArea = All;
                    Caption = '12% VAT';
                }
                field("INHF NSP with VAT"; Rec."INHF NSP with VAT")
                {
                    ApplicationArea = All;
                    Caption = 'NSP with VAT';
                }
                field("INHF Downpayment Percent"; Rec."INHF Downpayment Percent")
                {
                    ApplicationArea = All;
                    Caption = 'Downpayment Percent';
                }
                field("INHF Downpayment"; Rec."INHF Downpayment")
                {
                    ApplicationArea = All;
                    Caption = 'Downpayment';
                }
                field("INHF Less Reservation Fee"; Rec."INHF Less Reservation Fee")
                {
                    ApplicationArea = All;
                    Caption = 'INHF Less Reservation Fee';
                }
                field("Total Downpayment"; Rec."INHF Total Downpayment")
                {
                    ApplicationArea = All;
                    Caption = 'Total Downpayment';
                }
                field("Downpayment Due Date"; Rec."INHF Downpayment Due Date")
                {
                    ApplicationArea = All;
                    Caption = 'Downpayment Due Date';
                }
                field("Balance for Amortization"; Rec."Balance for Amortization")
                {
                    ApplicationArea = All;
                }
                field("Interest Rate at 7% Annum"; Rec."Interest Rate at 7% Annum")
                {
                    ApplicationArea = All;
                }
                field("Number of Years"; Rec."Number of Years")
                {
                    ApplicationArea = All;
                }
                field("Monthly Amortization"; Rec."Monthly Amortization")
                {
                    ApplicationArea = All;
                }
                field("Monthly Amortization Due Date"; Rec."Monthly Amortization Due Date")
                {
                    ApplicationArea = All;
                }
            }
            group("Split")
            {
                field("Split Type"; Rec."Split Type")
                {
                    ApplicationArea = All;
                }
                field("No. of Splits"; Rec."No. of Splits")
                {
                    ApplicationArea = All;
                }
                field("Split Payment Amount"; Rec."Split Payment Amount")
                {
                    ApplicationArea = All;
                }
            }
            group("Seller Agents Information")
            {
                field("PC Code"; Rec."PC Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."PC Code") then begin
                            Rec."PC Name" := VendorRec."Name";
                        end else begin
                            Rec."PC Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("PC Name"; Rec."PC Name")
                {
                    ApplicationArea = All;
                    Caption = 'PM Full Name';
                    Editable = false;
                }
                field("SM Code"; Rec."SM Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."SM Code") then begin
                            Rec."SM Name" := VendorRec."Name";
                        end else begin
                            Rec."SM Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("SM Name"; Rec."SM Name")
                {
                    ApplicationArea = All;
                    Caption = 'SM Full Name';
                    Editable = false;
                }
                field("SD Code"; Rec."SD Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."SD Code") then begin
                            Rec."SD Name" := VendorRec."Name";
                        end else begin
                            Rec."SD Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("SD Name"; Rec."SD Name")
                {
                    ApplicationArea = All;
                    Caption = 'SD Full Name';
                    Editable = false;
                }
                field("TL Code"; Rec."TL Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."TL Code") then begin
                            Rec."TL Name" := VendorRec."Name";
                        end else begin
                            Rec."TL Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("TL Name"; Rec."TL Name")
                {
                    ApplicationArea = All;
                    Caption = 'TL Full Name';
                    Editable = false;
                }
                field("SSD1 Code"; Rec."SSD1 Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."SSD1 Code") then begin
                            Rec."SSD1 Name" := VendorRec."Name";
                        end else begin
                            Rec."SSD1 Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("SS01 Name"; Rec."SSD1 Name")
                {
                    ApplicationArea = All;
                    Caption = 'SS01 Full Name';
                    Editable = false;
                }
                field("SSD2 Code"; Rec."SSD2 Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if VendorRec.Get(Rec."SSD2 Code") then begin
                            Rec."SSD2 Name" := VendorRec."Name";
                        end else begin
                            Rec."SSD2 Name" := '';
                        end; // Assuming a function to get the name
                        CurrPage.Update(); // Refresh the page to reflect the updated field
                    end;
                }
                field("SSD2 Name"; Rec."SSD2 Name")
                {
                    ApplicationArea = All;
                    Caption = 'SSD2 Full Name';
                    Editable = false;

                }




            }
        }
    }
    var
        CustomerRec: Record Customer;
        PropertyRec: Record Property;
        ProjectRec: Record Project;
        ClientName: Text[100];
        PropertyName: Text[100];
        ProjectName: Text[100];
        VendorRec: Record Vendor;
        PMName: Text[100];
        SMName: Text[100];
        SDName: Text[100];
        TLMName: Text[100];
        SSD1Name: Text[100];
        SSD2Name: Text[100];


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
        end else begin
            PropertyName := '';
            Rec."Property Name" := '';
        end;

        if ProjectRec.Get(Rec."Project ID") then begin
            ProjectName := ProjectRec."Project Name";
            Rec."Project Name" := ProjectRec."Project Name";
        end else begin
            ProjectName := '';
            Rec."Project Name" := '';
        end;

        if VendorRec.Get(Rec."PC Code") then begin
            Rec."PC Name" := VendorRec."Name";
        end else begin
            Rec."PC Name" := '';
        end;

        if VendorRec.Get(Rec."SM Code") then begin
            Rec."SM Name" := VendorRec."Name";
        end else begin
            Rec."SM Name" := '';
        end;

        if VendorRec.Get(Rec."SD Code") then begin
            Rec."SD Name" := VendorRec."Name";
        end else begin
            Rec."SD Name" := '';
        end;

        if VendorRec.Get(Rec."SSD1 Code") then begin
            Rec."SSD1 Name" := VendorRec."Name";
        end else begin
            Rec."SSD1 Name" := '';
        end;

        if VendorRec.Get(Rec."SSD2 Code") then begin
            Rec."SSD2 Name" := VendorRec."Name";
        end else begin
            Rec."SSD2 Name" := '';
        end;
        Rec.Modify();
        CurrPage.Update();

    end;

    //actions
    //{
    //area(processing)
    //{
    //           action("Post Agreement")
    //           {
    //               Caption = 'Post Agreement';
    //               Image = Post;

    //               trigger OnAction()
    //               begin
    //                   // Insert logic to post the reservation agreement
    //               end;
    //          }
    //}
    //}

    //    trigger OnOpenPage()
    //    begin
    // Add any business logic you need when the page opens
    //    end;

    //    trigger OnClosePage()
    //    begin
    //        // Add any business logic you need when the page closes
    //    end;
}
