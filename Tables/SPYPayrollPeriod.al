table 70140974 SPYPayrollPeriod
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;PayrollPeriodCode;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Payroll Period';
            NotBlank = true;
        }
        field(2;PayrollFrequency;Option)
        {
            OptionCaption = 'Daily,Weekly,BiWeekly,Semimonthly,Monthly,Quarterly,Semiannually,Annually';
            OptionMembers = Daily,Weekly,BiWeekly,Semimonthly,Monthly,Quarterly,Semiannually,Annually;
            DataClassification = ToBeClassified;
            Caption = 'Payroll frequency';
            
        }
        field(3;Description;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
            NotBlank = true;
        }
    }

    keys
    {
        key(PK;PayrollPeriodCode)
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