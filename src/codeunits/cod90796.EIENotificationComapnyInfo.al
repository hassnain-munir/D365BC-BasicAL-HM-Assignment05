codeunit 90796 "EIE Notification Company Info."
{
    procedure ShowCompanyInfoWizard(TheNotification: Notification)
    begin
        Page.Run(Page::"EIE Company Info. Wizard");
    end;

    [EventSubscriber(ObjectType::Page, 42, 'OnOpenPageEvent', '', false, false)]
    local procedure CheckInfo_OnOpenSalesOrder(var Rec: Record 36)
    var
        CompanyInformation: Record 79;
        myNotification: Notification;
    begin
        if CompanyInformation.Get then
            if (CompanyInformation.Name <> '') and (CompanyInformation."E-mail" <> '') then
                exit;
        myNotification.Id := '5ca2f77c-29ab-451d-bbe7-cf9cb9f25952';
        myNotification.Scope := NotificationScope::LocalScope;
        myNotification.Message := 'Company Information is missing.';
        myNotification.AddAction('Open Company Information', 50112,
                  'ShowCompanyInfoWizard');
        myNotification.Send;

    end;
}