codeunit 90795 "EIE CompanyInfo. Ass. Setup"
{
    /*     [EventSubscriber(ObjectType::Codeunit, 3725, 'OnRegister', '', false, false)]
        local procedure RegisterAssistedSetup(var
                 TempAggregatedAssistedSetup: Record 1808 TEMPORARY)
        var
            CompanyInformation: Record 79;
        begin
            TempAggregatedAssistedSetup.AddExtensionAssistedSetup(
                          PAGE::CompanyInfoWizard,
                          'Setup Company Information',
                          TRUE,
                          CompanyInformation.RecordId,
                          GetCompanyInformationSetupStatus(
                                TempAggregatedAssistedSetup),
                          '');
        end;

        local procedure GetCompanyInformationSetupStatus(AggAssStp: Record 1808): Option
        var
            CompanyInformation: Record 79;
        begin
            with AggAssStp do begin
                if CompanyInformation.Get then
                    if (CompanyInformation.Name = '') or
                       (CompanyInformation."E-mail" = '') then
                        Status := Status::"Not Completed"
                    else
                        Status := Status::Completed
                else
                    Status := Status::"Not Completed";
                exit(Status);
            end;
        end; */

}