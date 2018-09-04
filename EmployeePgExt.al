pageextension 70140961 SpyEmployeePgExt extends "Employee Card"
{
    
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            group("Employment Details")
            {
                
                Caption='Employment Details';
                
                field(SPYAirClassCode;SPYAirClassCode)
                {
                    Caption='Air Class';
                    ApplicationArea=all;
                }
                
                field(OriginCity;OriginCity)
                {
                    Caption='Origin City';
                    ApplicationArea=all;
                }

                field(DestinationCity;DestinationCity)
                {
                    Caption='Destination City';
                    ApplicationArea=all;
                }
                field(SPYCostContributionBasis;SPYCostContributionBasis)
                {
                    Caption='Contribution Basis';
                    ApplicationArea=all;
                }
                field(SPYWorkerGroupCode;SPYWorkerGroupCode)
                {
                    Caption='Worker Group Code';
                    ApplicationArea=all;
                }
                field(SPYPayrollDisbursementMode;SPYPayrollDisbursementMode)
                {
                    Caption='Payroll Disbursement Mode';
                    ApplicationArea=all;
                }
                field(SPYDefaultPayrollCurrency;SPYDefaultPayrollCurrency)
                {
                    Caption='Default Payroll Currency';
                    ApplicationArea=all;
                }
                field(SPYDefaultPayrollPeriod;SPYDefaultPayrollPeriod)
                {
                    Caption='Default Payroll Period';
                    ApplicationArea=all;
                }
                
            }
        }           
        

    }

    
    actions
    {
        // Add changes to page actions here
        addafter("Ledger E&ntries")
        {
            group(Payelement)
            {
                action(Benefit)
                {
                    Promoted = true;
                    Image = Payment;
                    PromotedCategory = New;
                    RunObject = page SpyWorkerPositionBenefitList;
                    ApplicationArea = all;
                    trigger OnAction();
                    begin
                    end;
                }
            }
        }
    }
    
    var
        myInt : Integer;
}