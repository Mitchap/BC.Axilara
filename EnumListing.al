enum 50108 "Payment Type"
{
    Extensible = false;
    Caption = 'Payment Type';


    value(0; None)
    {
        Caption = ' ';
    }
    value(1; "Reservation Fee")
    {
        Caption = 'Reservation Fee';
    }
    value(2; "Cash")
    {
        Caption = 'Cash';
    }
    value(3; "Down Payment")
    {
        Caption = 'Down Payment';
    }
    value(4; "Amortization")
    {
        Caption = 'Amortization';
    }
    value(5; "Retention")
    {
        Caption = 'Retention';
    }

    value(6; "Principal")
    {
        Caption = 'Principal';
    }
    value(7; "Penalties")
    {
        Caption = 'Penalties';
    }
    value(8; "Interest")
    {
        Caption = 'Interest';
    }
    value(9; "Title Fees")
    {
        Caption = 'Title Fees';
    }
    value(10; "Payment")
    {
        Caption = 'Payment';
    }
    value(11; "Adjustment")
    {
        Caption = 'Adjustment';
    }
    value(12; "Fees")
    {
        Caption = 'Fees';
    }
    value(13; "Other Fees")
    {
        Caption = 'Other Fees';
    }
}


enum 50109 "Payment Method"
{
    Extensible = false;
    Caption = 'Payment Type';

    value(0; None)
    {
        Caption = ' ';
    }
    value(1; "w/ Issued Check ")
    {
        Caption = 'w/ Issued Check';
    }
    value(2; "Direct Deposit")
    {
        Caption = 'Direct Deposit';
    }
    value(3; "Cash Payment")
    {
        Caption = 'Cash Payment';
    }
    value(4; "POS Terminal")
    {
        Caption = 'POS Terminal';
    }
    value(5; "Website Payment")
    {
        Caption = 'Website Payment';
    }

}