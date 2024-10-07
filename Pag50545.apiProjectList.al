page 50545 apiProjectList
{
    APIGroup = 'sales';
    APIPublisher = 'NinjaTribe';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'apiProjectList';
    DelayedInsert = true;
    EntityName = 'projectList';
    EntitySetName = 'projectList';
    PageType = API;
    SourceTable = Project;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(projectID; Rec."Project ID")
                {
                    Caption = 'Project ID';
                }
                field(projectName; Rec."Project Name")
                {
                    Caption = 'Project Name';
                }
                field(bankNo; Rec."Bank No.")
                {
                    Caption = 'Bank No.';
                }
                field(bankAccountName; Rec."Bank Account Name")
                {
                    Caption = 'Bank Account Name';
                }
                field(projectType; Rec."Project Type")
                {
                    Caption = 'Project Type';
                }
                field(station; Rec.Station)
                {
                    Caption = 'Station';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(licenseToSellNo; Rec."License to Sell No.")
                {
                    Caption = 'License to Sell No.';
                }
                field(developmentPermitNo; Rec."Development Permit No.")
                {
                    Caption = 'Development Permit No.';
                }
                field(reservationFee; Rec."Reservation Fee")
                {
                    Caption = 'Reservation Fee';
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
