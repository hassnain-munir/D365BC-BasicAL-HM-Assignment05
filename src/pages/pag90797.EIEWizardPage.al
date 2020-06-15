page 90797 "EIE Company Info. Wizard"
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Company Information";

    layout
    {
        area(Content)
        {
            group(Step1)
            {
                group("Company Name")
                {
                    Caption = 'Company Name';
                    field(Name; Name) { ApplicationArea = All; }
                }
            }
            group(Step2)
            {
                group("Email Address")
                {
                    Caption = 'Email Address';
                    field("E-Mail"; "E-Mail") { ApplicationArea = All; }
                }
            }
            group(Step3)
            {
                group("All Done")
                {
                    Caption = 'All Done';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Enabled = ActionBackAllowed;
                Image = PreviousRecord;
                trigger OnAction()
                begin
                    TakeStep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Enabled = ActionNextAllowed;
                Image = NextRecord;
                trigger OnAction()
                begin
                    TakeStep(1);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                InFooterBar = true;
                Enabled = ActionFinishAllowed;
                Image = Approve;
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    local procedure SetControls()
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;
    end;

    local procedure TakeStep(Step: Integer)
    begin
        CurrentStep += Step;
        SetControls;
    end;

    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        SetControls();
    end;

    var
        CurrentStep: Integer;
        ActionBackAllowed: Boolean;
        ActionNextAllowed: Boolean;
        ActionFinishAllowed: Boolean;
}