table 90795 "EIE Sales Invoice Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Sales Invoice – Open"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count ("Sales Header" WHERE("Document Type" = FILTER(Invoice), Status = FILTER(Open)));
        }
        field(3; "Sales This Month"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    procedure CalcSalesThisMonthAmount() Amount: Decimal
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        CustLedgEntrySales: Query "EIE Cust.Ledg. Entry Sales Que";
    begin
        CustLedgEntrySales.SetRange(Document_Type, CustLedgEntry.
           "Document Type"::Invoice);

        CustLedgEntrySales.SetRange(Posting_Date, CalcDate('<-CM>',
          Workdate), Workdate);

        CustLedgEntrySales.Open;
        if CustLedgEntrySales.Read then
            Amount := CustLedgEntrySales.Sum_Sales_LCY;
    end;
}