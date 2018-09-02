table 70140975 SPYPayrollPeriodLine
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;PayrollPeriod;Code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'Payroll Period';  
        }
        field(2;Description;Text[60])
        {
            DataClassification = ToBeClassified;
            caption = 'Comments'; 
        }
        field(3;PayrollDate;Date)
        {
            DataClassification = ToBeClassified;
            caption = 'Default Payroll Processing Date'; 
        }
        field(4;PeriodStatus;Option)
        {
            OptionCaption = 'Open,Closed,Stopped';
            OptionMembers = Open,Closed,Stopped;
            DataClassification = ToBeClassified;
            caption = 'Status';
        }
        field(5;PeriodStartDate;Date)
        {
            DataClassification = ToBeClassified;
            caption = 'Period Start Date'; 
            NotBlank = true;
        }
        field(6;PeriodEndDate;Date)
        {
            DataClassification = ToBeClassified;
            caption = 'Period End Date';
            NotBlank = true; 
        }
    }

    keys
    {
        key(PK;PayrollPeriod)
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}