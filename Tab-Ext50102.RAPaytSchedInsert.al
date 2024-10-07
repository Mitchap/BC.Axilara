tableextension 50102 "RA Payment Schedule Ext" extends "RA Payment Schedule"
{
    trigger OnAfterInsert()
    var
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        EmailRecipientType: Enum "Email Recipient Type";
        EmailMsg: Text;
        EmailSubject: Text;
        SenderEmail: Text;
    begin
        COMMIT;
        // Define sender email (replace this with a valid sender email)
        SenderEmail := 'ninjatribe.admin@camayacoast.com';

        // Use case to handle different Payment Types
        case Rec."Payment Type" of
            Rec."Payment Type"::"Reservation Fee":
                begin
                    EmailSubject := 'New Reservation Fee Scheduled';
                    // Create the email message for Reservation Fee
                    EmailMsg := StrSubstNo(
                        'Dear Team,%1%2A new Reservation Fee payment is scheduled.%1Date Due: %3%1Amount: %4%1Client No: %6%1System Payment ID: <a href="https://businesscentral.dynamics.com/camayacoast_dev?page=50108&filter=%27System%20Payment%20ID%27%20IS%20%27%5%27">%5</a>%1%1Thank you!',
                        '<br>', '<br>',
                        Format("Date Due", 0, 9),           // Format Date Due (9 for Date)
                        Format("Amount", 0, 2),             // Format Amount (2 for Decimal)
                        "System Payment ID",                // System Payment ID
                        "Client No."                        // Add Client No
                    );
                    EmailMessage.Create(SenderEmail, EmailSubject, EmailMsg, true);

                    // Add recipients with proper recipient type
                    EmailMessage.AddRecipient(EmailRecipientType::"To", 'info@axilara.com');
                    // EmailMessage.AddRecipient(EmailRecipientType::"To", 'vkayechastine@gmail.com');

                    // Send the email
                    Email.Send(EmailMessage);// Handle other cases if needed
                end;

            Rec."Payment Type"::Amortization:
                begin
                    if Rec.Seq = 1 then
                        EmailSubject := 'New Amortization Payment Scheduled';
                    // Create the email message for Amortization
                    EmailMsg := StrSubstNo(
                        'Dear Team,%1%2An Amortization payment is scheduled.%1Date Due: %3%1Amount: %4%1Client No: %6%1System Payment ID: <a href="https://businesscentral.dynamics.com/camayacoast_dev?page=50108&filter=%27System%20Payment%20ID%27%20IS%20%27%5%27">%5</a>%1%1Thank you!',
                        '<br>', '<br>',
                        Format("Date Due", 0, 9),           // Format Date Due (9 for Date)
                        Format("Amount", 0, 2),             // Format Amount (2 for Decimal)
                        "System Payment ID",                // System Payment ID
                        "Client No."                        // Add Client No
                    );
                    EmailMessage.Create(SenderEmail, EmailSubject, EmailMsg, true);

                    // Add recipients with proper recipient type
                    EmailMessage.AddRecipient(EmailRecipientType::"To", 'info@axilara.com');
                    EmailMessage.AddRecipient(EmailRecipientType::"To", 'vkayechastine@gmail.com');

                    // Send the email
                    Email.Send(EmailMessage);// Handle other cases if needed
                end;

            Rec."Payment Type"::"Down Payment":
                begin
                    if Rec.Seq = 1 then
                        EmailSubject := 'New Down Payment Scheduled';
                    // Create the email message for Down Payment
                    EmailMsg := StrSubstNo(
                        'Dear Team,%1%2A Down Payment is scheduled.%1Date Due: %3%1Amount: %4%1Client No: %6%1System Payment ID: <a href="https://businesscentral.dynamics.com/camayacoast_dev?page=50108&filter=%27System%20Payment%20ID%27%20IS%20%27%5%27">%5</a>%1%1Thank you!',
                        '<br>', '<br>',
                        Format("Date Due", 0, 9),           // Format Date Due (9 for Date)
                        Format("Amount", 0, 2),             // Format Amount (2 for Decimal)
                        "System Payment ID",                // System Payment ID
                        "Client No."                        // Add Client No
                    );
                    EmailMessage.Create(SenderEmail, EmailSubject, EmailMsg, true);

                    // Add recipients with proper recipient type
                    EmailMessage.AddRecipient(EmailRecipientType::"To", 'info@axilara.com');
                    EmailMessage.AddRecipient(EmailRecipientType::"To", 'vkayechastine@gmail.com');

                    // Send the email
                    Email.Send(EmailMessage);// Handle other cases if needed
                end;

            else
        // Create an email message object with sender, subject, and body

        end;
    end;
}



// tableextension 50102 "RA Payment Schedule Ext" extends "RA Payment Schedule"
// {
//     trigger OnAfterInsert()
//     var
//         Email: Codeunit "Email";
//         EmailMessage: Codeunit "Email Message";
//         EmailRecipientType: Enum "Email Recipient Type";
//         EmailMsg: Text;
//         EmailSubject: Text;
//         SenderEmail: Text;
//     begin
//         COMMIT;
//         // Define sender email (replace this with a valid sender email)
//         SenderEmail := 'ninjatribe.admin@camayacoast.com';

//         // Check if Payment Type is 'Reservation Fee' (using enum comparison)
//         // if Rec.Seq = 0 then begin
//         if Rec."Payment Type" = Rec."Payment Type"::"Reservation Fee" then begin
//             // Create the email message
//             EmailSubject := 'New Reservation Fee Scheduled';
//             // Retrieve the Payment Type caption (enum value)
//             EmailMsg := StrSubstNo(
//     'Dear Team,%1%2A new Reservation Fee payment is scheduled.%1Date Due: %3%1Amount: %4%1Client No: %6%1System Payment ID: <a href="https://businesscentral.dynamics.com/camayacoast_dev?page=50108&filter=%27System%20Payment%20ID%27%20IS%20%27%5%27">%5</a>%1%1Thank you!',
//     '<br>', '<br>',
//     Format("Date Due", 0, 9),           // Format Date Due (9 for Date)
//     Format("Amount", 0, 2),             // Format Amount (2 for Decimal)
//     "System Payment ID",                // Format the System Payment ID
//     "Client No."                         // Add Client No
// );


//             // Create an email message object with sender, subject, and body
//             EmailMessage.Create(SenderEmail, EmailSubject, EmailMsg, true);

//             // Add recipients with proper recipient type
//             EmailMessage.AddRecipient(EmailRecipientType::"To", 'info@axilara.com');
//             EmailMessage.AddRecipient(EmailRecipientType::"To", 'vkayechastine@gmail.com');

//             // Send the email
//             Email.Send(EmailMessage);
//         end;
//     end;
// }
