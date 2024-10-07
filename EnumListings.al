enum 50100 "Payment Term Enum"
{
    Extensible = true;

    value(0; "Full Cash")
    {
        Caption = 'Full Cash';
    }
    value(1; "Full DP")
    {
        Caption = 'Full DP';
    }
    value(2; "Split Cash")
    {
        Caption = 'Split Cash';
    }
    value(3; "Split DP")
    {
        Caption = 'Split DP';
    }
    value(4; " ")
    {
        Caption = ' ';
    }
}



enum 50101 "RA Status Enum"
{
    Extensible = true;

    value(0; "Current")
    {
        Caption = 'Current';
    }
    value(1; "Past Due")
    {
        Caption = 'Past Due';
    }
    value(2; "Retention Balance")
    {
        Caption = 'Retention Balance';
    }
    value(3; "Fully Paid")
    {
        Caption = 'Fully Paid';
    }
    value(4; "Ex Deal")
    {
        Caption = 'Ex Deal';
    }
    value(5; "with Outstanding Balance")
    {
        Caption = 'with Outstanding Balance';
    }
    value(6; "Title Transferred to Client")
    {
        Caption = 'Title Transferred to Client';
    }
    value(7; "In Default")
    {
        Caption = 'In Default';
    }
    value(8; "Over Due")
    {
        Caption = 'Over Due';
    }
    value(9; "Cancelled")
    {
        Caption = 'Cancelled';
    }
    value(10; "     ")
    {
        Caption = '     ';
    }
}

enum 50102 "Split Count Enum"
{
    Extensible = false;

    value(0; "0 Splits")
    {
        Caption = '0 Splits';
    }
    value(1; "1 Split")
    {
        Caption = '1 Split';
    }
    value(2; "2 Splits")
    {
        Caption = '2 Splits';
    }
    value(3; "3 Splits")
    {
        Caption = '3 Splits';
    }
    value(4; "4 Splits")
    {
        Caption = '4 Splits';
    }
    value(5; "5 Splits")
    {
        Caption = '5 Splits';
    }
    value(6; "6 Splits")
    {
        Caption = '6 Splits';
    }
    value(7; "7 Splits")
    {
        Caption = '7 Splits';
    }
    value(8; "8 Splits")
    {
        Caption = '8 Splits';
    }
    value(9; "9 Splits")
    {
        Caption = '9 Splits';
    }
    value(10; "10 Splits")
    {
        Caption = '10 Splits';
    }
    value(11; "11 Splits")
    {
        Caption = '11 Splits';
    }
    value(12; "12 Splits")
    {
        Caption = '12 Splits';
    }
    value(13; " ")
    {
        Caption = ' ';
    }


}

enum 50106 "Remarks Enum"
{
    Extensible = false;
    Caption = 'Remarks Options';

    value(0; None)
    {
        Caption = ' ';
    }
    value(1; Processing)
    {
        Caption = 'Processing';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
}

enum 50107 "Split Type"
{
    Extensible = false;
    Caption = 'Split Type Options';

    value(0; None)
    {
        Caption = ' ';
    }
    value(1; "Split Payment")
    {
        Caption = 'Split Payment';
    }
    value(2; "Split Cash")
    {
        Caption = 'Split Cash';
    }
    value(3; "Split DP")
    {
        Caption = 'Split DP';
    }
}
