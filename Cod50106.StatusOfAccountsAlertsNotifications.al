codeunit 50106 "Overdue Alert Email"
{
    SingleInstance = false;
    Subtype = Normal;

    procedure TriggerAlert(Notification: Notification)
    var
        ReservationAgreement: Record "Reservation Agreement";
        Customer: Record Customer;
        EmailMessage: Codeunit "Email Message";
        EmailToAddress: Text[100];
        EmailSubject: Text[250];
        EmailBody: Text[1024];
        RAStatus: Enum "RA Status Enum";
    begin
        // Extract Reservation Agreement data from Notification
        ReservationAgreement.Get(Notification.GetData('ReservationAgreementID'));

        // Fetch customer email address
        if Customer.Get(ReservationAgreement."Client No.") then
            EmailToAddress := Customer."E-Mail"
        else
            Error('Customer email not found.');

        // Ensure email address is present
        if EmailToAddress = '' then
            Error('Email address for customer %1 is not available.', ReservationAgreement."Customer Name");

        // Check if the account is overdue based on the Status field
        if ReservationAgreement.Status = RAStatus::"Over Due" then begin
            // Set up email subject and body using fields from the Reservation Agreement
            EmailSubject := 'Overdue Account Notification for Customer ' + ReservationAgreement."Customer Name";
            EmailBody := 'Dear ' + ReservationAgreement."Customer Name" + ',' + '\n\n' +
                         'This is a reminder that your account for the property ' +
                         ReservationAgreement."Property Name" + ' is currently overdue.' + '\n' +
                         'Please make the payment at your earliest convenience to avoid further actions.' + '\n\n' +
                         'Status: ' + Format(ReservationAgreement.Status) + '\n' +
                         'Payment Term: ' + Format(ReservationAgreement."Payment Term") + '\n\n' +
                         'Thank you.' + '\n\n' +
                         'Best regards,' + '\n' +
                         'Your Company Name';

            // Create and send the email message
            EmailMessage.Create(EmailToAddress, EmailSubject, EmailBody, false);

            // Log the alert
            Message('Overdue alert triggered for customer %1 regarding property %2. Email sent to %3.',
                ReservationAgreement."Customer Name",
                ReservationAgreement."Property Name",
                EmailToAddress);
        end else begin
            Message('The account is not overdue. No alert triggered for customer %1.', ReservationAgreement."Customer Name");
        end;
    end;
}
