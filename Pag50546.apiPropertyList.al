page 50546 apiPropertyList
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiPropertyList';
    DelayedInsert = true;
    EntityName = 'propertyList';
    EntitySetName = 'propertyLists';
    PageType = API;
    SourceTable = Property;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(propertyID; Rec."Property ID")
                {
                    Caption = 'Property ID';
                }
                field(projectID; Rec."Project ID")
                {
                    Caption = 'Project ID';
                }
                field(projectName; Rec."Project Name")
                {
                    Caption = 'Project Name';
                }
                field(propertyName; Rec."Property Name")
                {
                    Caption = 'Property Name';
                }
                field(phase; Rec.Phase)
                {
                    Caption = 'Phase';
                }
                field(block; Rec.Block)
                {
                    Caption = 'Block';
                }
                field(lot; Rec.Lot)
                {
                    Caption = 'Lot';
                }
                field(areaSqm; Rec."Area (sqm)")
                {
                    Caption = 'Area (sqm)';
                }
                field(lotStatus; Rec."Lot Status")
                {
                    Caption = 'Lot Status';
                }
                field(lotType; Rec."Lot Type")
                {
                    Caption = 'Lot Type';
                }
                field(priceSqm; Rec."Price /sqm")
                {
                    Caption = 'Price/sqm';
                }
                field(tsp; Rec.TSP)
                {
                    Caption = 'Total Selling Price';
                }
                field(client; Rec."Client #")
                {
                    Caption = 'Client #';
                }
                field(clientName; Rec."Client Name")
                {
                    Caption = 'Client Name';
                }
                field(nsp; Rec.NSP)
                {
                    Caption = 'Net Selling Price';
                }
                field(arBalance; Rec."AR Balance")
                {
                    Caption = 'Accounts Receivable Balance';
                }
                field(ma; Rec.MA)
                {
                    Caption = 'Monthly Amortization';
                }
                field(statusOfAccounts; Rec."Status of Accounts")
                {
                    Caption = 'Status of Accounts';
                }
                field(inventoryStatus; Rec."Inventory Status")
                {
                    Caption = 'Inventory Status';
                }
                field(availabilityStatus; Rec."Availability Status")
                {
                    Caption = 'Availability Status';
                }
                field(approvedArea; Rec."Approved Area")
                {
                    Caption = 'Approved Area';
                }
                field(approvedBlock; Rec."Approved Block")
                {
                    Caption = 'Approved Block';
                }
                field(approvedLot; Rec."Approved Lot")
                {
                    Caption = 'Approved Lot';
                }
                field(planNo; Rec."Plan No.")
                {
                    Caption = 'Plan No.';
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
