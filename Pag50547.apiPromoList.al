page 50547 apiPromoList
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiPromoList';
    DelayedInsert = true;
    EntityName = 'promoList';
    EntitySetName = 'promoLists';
    PageType = API;
    SourceTable = Promo;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(promoID; Rec."Promo ID")
                {
                    Caption = 'Promo ID';
                }
                field(project; Rec.Project)
                {
                    Caption = 'Project';
                }
                field(name; Rec."Promo Name")
                {
                    Caption = 'Promo Name';
                }
                field(promoDescription; Rec."Promo Description")
                {
                    Caption = 'Promo Description';
                }
                field(validFrom; Rec."Valid From")
                {
                    Caption = 'Valid From';
                }
                field(validTo; Rec."Valid To")
                {
                    Caption = 'Valid To';
                }
                field(addtLDiscount; Rec."Additional Discount %")
                {
                    Caption = 'Additional Discount %';
                }
                field(discountType; Rec."Discount Type")
                {
                    Caption = 'Discount Type';
                }
                field(freeFurniture; Rec."Free Furniture")
                {
                    Caption = 'Free Furniture';
                }
                field(freeTransferOfTitle; Rec."Free Transfer of Title")
                {
                    Caption = 'Free Transfer of Title';
                }
                field(noOfPDCs; Rec."Number of PDCs")
                {
                    Caption = 'No of PDCs';
                }
                field(noOfDays; Rec."Number of Days")
                {
                    Caption = 'No. of Days';
                }
                field(nspAmount; Rec."NSP Amount")
                {
                    Caption = 'NSP Amount';
                }
                field(percentage; Rec.Percentage)
                {
                    Caption = 'Percentage';
                }
                field(promoLimit; Rec."Promo Limit")
                {
                    Caption = 'Promo Limit';
                }
                field(promoType; Rec."Promo Type")
                {
                    Caption = 'Promo Type';
                }
                field(statusReason; Rec."Status Reason")
                {
                    Caption = 'Status Reason';
                }
                field(vatInclusive; Rec."VAT Inclusive")
                {
                    Caption = 'VAT Inclusive';
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
