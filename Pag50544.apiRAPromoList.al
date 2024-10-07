page 50544 apiRAPromoList
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiRAPromoList';
    DelayedInsert = true;
    EntityName = 'raPromoList';
    EntitySetName = 'raPromoLists';
    PageType = API;
    SourceTable = "RA Promo List";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(raPromoList; Rec."RA Promo List")
                {
                    Caption = 'RA Promo List';
                }
                field(lead; Rec.Lead)
                {
                    Caption = 'Lead';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(opportunity; Rec.Opportunity)
                {
                    Caption = 'Opportunity';
                }
                field(promoID; Rec."Promo ID")
                {
                    Caption = 'Promo ID';
                }
                field(raID; Rec."RA ID")
                {
                    Caption = 'RA ID';
                }
                field(statusReason; Rec."Status Reason")
                {
                    Caption = 'Status Reason';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
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
