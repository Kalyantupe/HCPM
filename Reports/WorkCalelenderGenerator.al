report 70140960 WorkCalenderGenerator
{
    ProcessingOnly = true;
    Caption ='Work Calender Generator';
    dataset
    {
        dataitem(WorkCalenderTable; WorkCalenderTable)
        {
            
        }
    }
    
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(General)
                {
                    field("Number Of Periods";"Number Of Periods")
                    {
                        Caption = 'Number of Periods';
                        ToolTip = 'Enter Number of Period';
                    }
                    field("First Period Start Date";"First Period Start Date")
                    {
                        Caption = 'First Period Start Date';
                        ToolTip = 'Enter First Period start Date';
                    }
                    field("First Payroll Processing Date";"First Payroll Processing Date")
                    {
                        Caption = 'First Payroll Processing Date';
                        ToolTip = 'Enter First Payroll Processing Date';
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
                }
            }
        }
        trigger OnOpenPage()
        var
            myInt : Integer;
        begin
            periodcode := RecPayrollPeriod.GetFilter(PayrollPeriodCode);
            RecPayrollPeriod.SetRange(PayrollPeriodCode,periodcode);
            IF RecPayrollPeriod.FindFirst then
               PayrollFrequency := RecPayrollPeriod.PayrollFrequency;

        end;
    }
    
    trigger OnPreReport();
    var
        myInt : Integer;
    begin
        RecPayrollPeriodLine.RESET;
        RecPayrollPeriod.SETRANGE(PayrollPeriodCode,periodcode);
        IF RecPayrollPeriod.FindFirst then
           RecPayrollPeriodLine.SetRange(PayrollPeriod,RecPayrollPeriod.PayrollPeriodCode);
           IF RecPayrollPeriodLine.FIND('+') then;

        RecPayrollPeriodLine.PeriodStartDate := "First Period Start Date";
        RecPayrollPeriodLine.PayrollDate := "First Payroll Processing Date";
        IF RecPayrollPeriodLine.Find('-') then begin
            FirstPeriodStartDate := RecPayrollPeriodLine.PeriodStartDate;
            IF RecPayrollPeriodLine.Find('+') then
                LastPeriodStartDate := RecPayrollPeriodLine.PeriodStartDate;
        end;
        StartDate1 := "First Period Start Date";
        for i := 1 TO "Number Of Periods" do begin
            IF ("First Period Start Date" >= "First Period Start Date") AND ("First Period Start Date" < LastPeriodStartDate) then
               Error('Please check Entered Date');

            RecPayrollPeriodLine.Init;
            RecPayrollPeriodLine.PeriodStartDate := "First Period Start Date";
            RecPayrollPeriodLine.PayrollDate := "First Payroll Processing Date";
            enddate := CalcDate(varfrequency,"First Period Start Date");
            RecPayrollPeriodLine.PeriodEndDate := CalcDate('<-1D>',enddate);
            RecPayrollPeriodLine.PayrollPeriod := periodcode;

            RecPayrollPeriodLine.Validate(PeriodStartDate);
            if not RecPayrollPeriodLine.Find('=') then
               RecPayrollPeriodLine.Insert;

            "First Period Start Date" := CalcDate(varfrequency,"First Period Start Date");
            "First Payroll Processing Date" := CalcDate(varfrequency,"First Payroll Processing Date");
        end;



    end;
    var
        myInt : Integer;
        "First Period Start Date" : Date;
        "Number Of Periods" : Integer;
        PayrollFrequency : Option;
        RecPayrollPeriod : Record SPYPayrollPeriod;
        RecPayrollPeriodLine : Record SPYPayrollPeriodLine;
        FirstPeriodStartDate : Date;
        LastPeriodStartDate : Date;
        StartDate1 : Date;
        i : Integer;
        enddate : Date;
        varfrequency : DateFormula;
        varperiod : Code[30];
        periodcode : code[30];
        varperiodfreq : DateFormula;
        "First Payroll Processing Date" : Date;

}