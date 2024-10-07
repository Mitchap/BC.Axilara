page 50149 CustomBusinessManagerRC
{
    PageType = RoleCenter;
    ApplicationArea = All;
    SourceTable = "User Setup";
    UsageCategory = Administration;

    layout
    {
        area(rolecenter)
        {
            part(Control139; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            // part(ApprovalsActivities; "Approvals Activities")
            // {
            //     ApplicationArea = Suite;
            // }
            // part(Control46; "Team Member Activities No Msgs")
            // {
            //     ApplicationArea = Suite;
            // }
            part(Control55; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
                Caption = '';
            }
            // part("Favorite Accounts"; "My Accounts")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Favorite Accounts';
            // }
            // part(Control9; "Trial Balance")
            // {
            //     AccessByPermission = TableData "G/L Entry" = R;
            //     ApplicationArea = Basic, Suite;
            // }
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                AccessByPermission = TableData "Power BI Context Settings" = I;
                ApplicationArea = Basic, Suite;
            }
            // part("My Job Queue"; "My Job Queue")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Visible = false;
            // }
            part(Control96; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Suite;
            }
            /*            part(PowerBIEmbeddedReportPart2; "Power BI Embedded Report Part")
                        {
                            AccessByPermission = TableData "Power BI Context Settings" = I;
                            ApplicationArea = Basic, Suite;
                            SubPageView = where(Context = const('Power BI Part II'));
                            Visible = false;
                        }
                        part(PowerBIEmbeddedReportPart3; "Power BI Embedded Report Part")
                        {
                            AccessByPermission = TableData "Power BI Context Settings" = I;
                            ApplicationArea = Basic, Suite;
                            SubPageView = where(Context = const('Power BI Part III'));
                            Visible = false;
                        }
              */
            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }

    }
    actions
    {
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action(Customers)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customers';
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            /*        action(Items)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Items';
                            RunObject = Page "Item List";
                            ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
                        } */
            action(RA)
            {
                ApplicationArea = All;
                Caption = 'Reservation Agreement';
                RunObject = Page "Reservation Agreement List";
                //ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';

            }

            // action("Bank Accounts")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Bank Accounts';
            //     //Image = BankAccount;
            //     RunObject = Page "Bank Account List";
            //     ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
            // }

            // action("Chart of Accounts")
            // {
            //     //ApplicationArea = Basic, Suite;
            //     ApplicationArea = All;
            //     Caption = 'Chart of Accounts';
            //     RunObject = Page "Chart of Accounts";
            //     ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            // }
        }

        area(sections)
        {
            group("Transacted Sales")
            {
                Caption = 'Transacted Sales';
                Image = Journals;
                ToolTip = 'Post financial transactions, manage budgets, analyze G/L  data, and prepare financial statements.';
                // action(GeneralJournals)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'General Journals';
                //     Image = Journal;
                //     RunObject = Page "General Journal Batches";
                //     RunPageView = where("Template Type" = const(General),
                //                         Recurring = const(false));
                //     ToolTip = 'Post financial transactions directly to general ledger accounts and other accounts, such as bank, customer, vendor, and employee accounts. Posting with a general journal always creates entries on general ledger accounts. This is true even when, for example, you post a journal line to a customer account, because an entry is posted to a general ledger receivables account through a posting group.';
                // }
                action("TS-Status of Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Transactions';
                    RunObject = Page "TS02 Status of Accounts";
                    ToolTip = 'Transacted Sales listing of RAs, Status, Alerts... ';
                }
                // action("G/L Budgets")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'G/L Budgets';
                //     RunObject = Page "G/L Budget Names";
                //     ToolTip = 'View summary information about the amount budgeted for each general ledger account in different time periods.';
                // }
                // action(Dimensions)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Dimensions';
                //     RunObject = Page Dimensions;
                //     ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                // }
                // action(AllocationAccounts)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Allocation Accounts';
                //     RunObject = Page "Allocation Account List";
                //     ToolTip = 'Define Allocation accounts that can be used to distribute amounts on general journal lines or allocation account lines in documents to different accounts based on fixed or variable percentages.';
                // }
                // action(PostedGeneralJournals)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Posted General Journals';
                //     RunObject = Page "Posted General Journal";
                //     ToolTip = 'Open the list of posted general journal lines.';
                // }
                // action(CashReceiptJournals)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Cash Receipt Journals';
                //     Image = Journals;
                //     RunObject = Page "General Journal Batches";
                //     RunPageView = where("Template Type" = const("Cash Receipts"),
                //                         Recurring = const(false));
                //     ToolTip = 'Register received payments by manually applying them to the related customer, vendor, or bank ledger entries. Then, post the payments to G/L accounts and thereby close the related ledger entries.';
                // }
                action("RA Payments")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'RA Payments Sched.';
                    //Image = BankAccount;
                    RunObject = Page "RA Payment Schedule List";
                    ToolTip = 'View or set up detailed information about your client payments';
                }
                action("Bank Account")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Bank Account List";
                    ToolTip = 'View or set up detailed information about your bank account, such as which currency to use, the format of bank files that you import and export as electronic payments, and the numbering of checks.';
                }
                action("Bank Acc. Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Acc. Statements';
                    Image = BankAccountStatement;
                    RunObject = Page "Bank Account Statement List";
                    ToolTip = 'View statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
                }
                // action(Deposits)
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Bank Deposits';
                //     RunObject = codeunit "Open Deposits Page";
                //     ToolTip = 'Manage bank deposits to your bank accounts.';
                // }
                action(BankAccountReconciliations)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Account Reconciliations';
                    Image = BankAccountRec;
                    RunObject = Page "Bank Acc. Reconciliation List";
                    ToolTip = 'Reconcile bank accounts in your system with bank statements received from your bank.';
                }
            }
            group("Billing and Collection")
            {
                Caption = 'Billing and Collection';
                //ToolTip = 'Process incoming and outgoing payments. Set up bank accounts and service connections for electronic banking.';
                action("Check Submissions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Check Submissions';
                    RunObject = Page "Check Submission Payment Sched";
                    ToolTip = 'Input Check Payment Schedule';
                }
                // action("Chart of Cash Flow Accounts")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Chart of Cash Flow Accounts';
                //     RunObject = Page "Chart of Cash Flow Accounts";
                //     ToolTip = 'View a chart contain a graphical representation of one or more cash flow accounts and one or more cash flow setups for the included general ledger, purchase, sales, services, or fixed assets accounts.';
                // }
                // action("Cash Flow Manual Revenues")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Cash Flow Manual Revenues';
                //     RunObject = Page "Cash Flow Manual Revenues";
                //     ToolTip = 'Record manual revenues, such as rental income, interest from financial assets, or new private capital to be used in cash flow forecasting.';
                // }
                // action("Cash Flow Manual Expenses")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Cash Flow Manual Expenses';
                //     RunObject = Page "Cash Flow Manual Expenses";
                //     ToolTip = 'Record manual expenses, such as salaries, interest on credit, or planned investments to be used in cash flow forecasting.';
                // }
                // action("Direct Debit Collections")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Direct Debit Collections';
                //     RunObject = Page "Direct Debit Collections";
                //     ToolTip = 'Instruct your bank to withdraw payment amounts from your customer''s bank account and transfer them to your company''s account. A direct debit collection holds information about the customer''s bank account, the affected sales invoices, and the customer''s agreement, the so-called direct-debit mandate. From the resulting direct-debit collection entry, you can then export an XML file that you send or upload to your bank for processing.';
                // }
                action("Payment Terms")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Terms';
                    Image = Payment;
                    RunObject = Page "Payment Terms";
                    ToolTip = 'Set up the payment terms that you select from on customer cards to define when the customer must pay, such as within 14 days.';
                }
            }
            group("Status of Accounts")
            {
                Caption = 'Status of Accounts';
                //ToolTip = ''
                action("Property Inventory")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Property Inventory';
                    RunObject = Page "Property List";
                    //ToolTip = ''
                }

                action("Customer Ledger Status")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger Status';
                    RunObject = Page "Reservation Agreement List";
                    //ToolTip = ''
                }
            }
            group("Ledger")
            {
                Caption = 'Ledger';
                //ToolTip = ''
                action("Customer Ledger")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger';
                    RunObject = Page "Customer List";
                    //ToolTip = ''
                }
                action("Seller Agents Commission List")
                {
                    ApplicationArea = All;
                    Caption = 'Seller Agents Commission';
                    //Image = Navigate;
                    RunObject = Page "Seller Agents Commission List";
                    //ShortCutKey = 'Ctrl+Alt+Q';
                    //ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
                action("Commission Rates SetUp")
                {
                    ApplicationArea = All;
                    Caption = 'Commission Rates Setup';
                    //Image = Navigate;
                    RunObject = Page "Commission Rates Setup List";
                    //ShortCutKey = 'Ctrl+Alt+Q';
                    //ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
                }
            }
            group("AR Accounting")
            {
                Caption = 'AR Accounting';
                //ToolTip = ''

                action("Chart of Accounts AR")
                {
                    //ApplicationArea = Basic, Suite;
                    ApplicationArea = All;
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                    ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
                }
                action("General Ledger")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'General Ledger Entries';
                    RunObject = Page "General Ledger Entries";
                    //ToolTip = ''
                }
            }

        }
        area(processing)
        {

            action("Project List")
            {
                ApplicationArea = All;
                Caption = 'Project List';
                Image = Navigate;
                RunObject = Page "Project List";
                //ShortCutKey = 'Ctrl+Alt+Q';
                //ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
            action("Property List")
            {
                ApplicationArea = All;
                Caption = 'Property List';
                Image = Navigate;
                RunObject = Page "Property List";
                //ShortCutKey = 'Ctrl+Alt+Q';
                //ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
            action("Promo List")
            {
                ApplicationArea = All;
                Caption = 'Promo List';
                Image = Navigate;
                RunObject = Page "Promo List";
                //ShortCutKey = 'Ctrl+Alt+Q';
                //ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Seller Agents';
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }

        }

    }
}
