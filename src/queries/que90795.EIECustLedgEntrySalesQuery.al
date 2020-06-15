query 90795 "EIE Cust.Ledg. Entry Sales Que"
{
    QueryType = Normal;

    elements
    {
        dataitem(Cust_Ledger_Entry; "Cust. Ledger Entry")
        {
            filter(Document_Type; "Document Type") { }
            filter(Posting_Date; "Posting Date") { }
            column(Sum_Sales_LCY; "Sales (LCY)") { Method = Sum; }
        }
    }
}