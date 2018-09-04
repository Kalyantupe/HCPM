tableextension 70140960 SPYEmployeeExt extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(70140960;OriginCity;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption='Origin City';
            //TableRelation= if ("country/Region code"=const('')) "Post Code".city else if ("country/Region code"=filter(<>'')) 
            //"Post Code".city where ("country/Region code"=field("country/Region code"));
            //TestTableRelation = false;
            //ValidateTableRelation = false;
            TableRelation= "Post Code".city;
        }
        field(70140961;DestinationCity;Text[30])
        {
            Caption='Destination City';
            TableRelation = "Post Code";
        }
        field(70140962;SPYAirClassCode;Text[20])
        {
          Caption='Air Class';  
          TableRelation = SpyAirClass.AirClassCode;
        }
        field(70140963;SPYWorkerGroupCode;Text[20])
        {
            Caption='Worker Group';
            TableRelation = SpyWorkerGroupTable.WorkerGroupCode;
        }
        field(70140964;SPYCostContributionBasis;Option)
        {
            Caption = 'Cost Contribution Basis';
            OptionCaption ='Timesheet,Slit By Revenue,Split By Dimension,Slit Equaly';
            OptionMembers = Timesheet,"Slit By Revenue","Split By Dimension","Slit Equaly";
        }
        field(70140965;SPYPayrollDisbursementMode;Option)
        {
            Caption = 'Payroll Disbursement Mode';
            OptionCaption = 'Cash,Bank';
            OptionMembers = Cash,Bank;
        }
        field(70140966;SPYDefaultPayrollCurrency;Text[3])
        {
            Caption = 'Default Payroll Currency';
            TableRelation = Currency;
        }
        field(70140967;SPYDefaultPayrollPeriod;Text[20])
        {
            Caption = 'Default Payroll Period';
            TableRelation = SPYPayrollPeriod.PayrollPeriodCode;
        }
        field(70140968;Calender;Code[10])
        {
            Caption = 'Calender';
            //TableRelation = "Base Calendar";
        }


    }
    
    var
        myInt : Integer;
}