page 90795 "EIE Sales Invoice Cue"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "EIE Sales Invoice Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Sales Invoices")
            {
                Caption = 'Sales Invoices';
                field("Sales Invoice – Open"; "Sales Invoice – Open")
                {
                    Caption = 'Open';
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";
                }
                field("Sales This Month"; "Sales This Month")
                {
                    Caption = 'Sales This Month';
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
                    AutoFormatType = 10;
                    AutoFormatExpression = 'kr <precision,0:0><standard format,0>';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("New Sales Invoice")
            {
                Caption = 'New Sales Invoice';
                RunPageMode = Create;
                RunObject = Page "Sales Invoice";
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Reset;
        If not Get then begin
            Init;
            Insert;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        "Sales This Month" := CalcSalesThisMonthAmount;
    end;
}