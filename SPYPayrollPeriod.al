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
page 70140976 SPYPayrollPeriod
{
    PageType = Document;
    SourceTable = SPYPayrollPeriod;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'Payroll Period';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PayrollPeriodCode;PayrollPeriodCode)
                {
                   Caption = 'Payroll Period';
                   ToolTip = 'Enter payroll Period Code';
                   ApplicationArea = all;
                }
                field(Description;Description)
                {
                   Caption = 'Description';
                   ToolTip = 'Enter Description of Payroll Period';
                   ApplicationArea = all;
                }
                field(PayrollFrequency;PayrollFrequency)
                {
                   Caption = 'Payroll Frequency';
                   ToolTip = 'Enter Payroll Frequency of Payroll Period';
                   ApplicationArea = all;
                }
            }
            part(Control5;SPYPayrollPeriodLine)
            {
                SubPageLink = PayrollPeriod = field(PayrollPeriodCode);
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup7)
            {
                action(Generate)
                {
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = all;

                    trigger OnAction();
                    begin
                        Clear(PeriodGenerator);
                        payrollPeriod.SETRANGE(PayrollPeriodCode,Rec.PayrollPeriodCode);
                        PeriodGenerator.SetTableView(payrollPeriod);
                        PeriodGenerator.Run;

                       
                    end;
                }
            }
        }
    }
    
    var
        myInt : Integer;
        payrollPeriod:Record SPYPayrollPeriod;
        PeriodGenerator : Report WorkCalenderGenerator;
        


}

page 70140977 SPYPayrollPeriodLine
{
    PageType = ListPart;
    SourceTable = SPYPayrollPeriodLine;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PeriodStartDate;PeriodStartDate)
                {
                    ApplicationArea = all;
                    Caption = 'Period start date';
                    ToolTip = 'Payroll Periods start date';
                }
                field(PeriodEndDate;PeriodEndDate)
                {
                    ApplicationArea = all;
                    Caption = 'Period end date';
                    ToolTip = 'Payroll Periods end date';
                }
                field(PeriodStatus;PeriodStatus)
                {
                    ApplicationArea = all;
                    Caption = 'Status';
                    ToolTip = 'Status of payroll period';
                }
                field(PayrollDate;PayrollDate)
                {
                    ApplicationArea = all;
                    Caption = 'Default payroll processing date';
                    ToolTip = 'Default payroll processing date';
                }
                field(comments;comments)
                {
                    Caption = 'Comments';
                    ToolTip = 'You can enter comment for payroll Period';
                    ApplicationArea = all;
                }

                
                
            }
        }
        
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}