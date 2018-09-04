report 70140960 WorkCalenderGenerator
{
    ProcessingOnly = true;
    Caption ='Work Calender Generator';
    dataset
    {
        dataitem(SPYPayrollPeriod; SPYPayrollPeriod)
        {
            
        }
    }
    
    requestpage
    {
       
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
                        ApplicationArea = all;
                    }
                    field("First Period Start Date";"First Period Start Date")
                    {
                        Caption = 'First Period Start Date';
                        ToolTip = 'Enter First Period start Date';
                        ApplicationArea = all;
                    }
                    field("First Payroll Processing Date";"First Payroll Processing Date")
                    {
                        Caption = 'First Payroll Processing Date';
                        ToolTip = 'Enter First Payroll Processing Date';
                        ApplicationArea =all;
                    }
                }
            }
        }
    
        actions
        {
        
        }
        trigger onOpenpage()
        
        var
            myInt : Integer;
        begin
            periodcode := SPYPayrollPeriod.GetFilter(PayrollPeriodCode);
            RecPayrollPeriod.SetRange(PayrollPeriodCode,periodcode);
            IF RecPayrollPeriod.FindFirst then
               PayrollFrequency := RecPayrollPeriod.PayrollFrequency;
               
               if PayrollFrequency = PayrollFrequency ::Annually then
                  Evaluate(varperiodfreq,'1Y');
               if PayrollFrequency = PayrollFrequency::Daily then
                  Evaluate(varperiodfreq,'1D');
                if PayrollFrequency = PayrollFrequency::Monthly then
                  Evaluate(varperiodfreq,'1M');
                if PayrollFrequency = PayrollFrequency::Quarterly then
                  Evaluate(varperiodfreq,'4M');
                if PayrollFrequency = PayrollFrequency::Semiannually then
                  Evaluate(varperiodfreq,'6M');
                if PayrollFrequency = PayrollFrequency::Weekly then
                  Evaluate(varperiodfreq,'1W');
                if PayrollFrequency = PayrollFrequency::Semimonthly then
                  Evaluate(varperiodfreq,'1M');
                if PayrollFrequency = PayrollFrequency::Biweekly then
                  Evaluate(varperiodfreq,'2W');
                RecPayrollPeriodLine.SetRange(PayrollPeriod,RecPayrollPeriod.PayrollPeriodCode);
                If RecPayrollPeriodLine.FIND('+') then
                  "First Period Start Date":=CalcDate('<+1D>',RecPayrollPeriodLine.PeriodEndDate); 
                     

        end;
    }
    labels
    {
        
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
            
            IF ("First Period Start Date" <= FirstPeriodStartDate) AND (i = "Number Of Periods" + 1) THEN
            EXIT;
            IF FirstPeriodStartDate <> 0D THEN
            IF ("First Period Start Date" >= "First Period Start Date") AND ("First Period Start Date" < LastPeriodStartDate) then
               Error('Please check Entered Date');
            RecPayrollPeriodLine.Init;
            RecPayrollPeriodLine.PeriodStartDate := "First Period Start Date";
            RecPayrollPeriodLine.PayrollDate := "First Payroll Processing Date";
            enddate := CalcDate(varperiodfreq,"First Period Start Date");
            RecPayrollPeriodLine.PeriodEndDate := CalcDate('<-1D>',enddate);
            RecPayrollPeriodLine.PayrollPeriod := periodcode;
            

            RecPayrollPeriodLine.Validate(PeriodStartDate);
            if not RecPayrollPeriodLine.Find('=') then
               RecPayrollPeriodLine.Insert;

            "First Period Start Date" := CalcDate(varperiodfreq,"First Period Start Date");
            "First Payroll Processing Date" := CalcDate(varperiodfreq,"First Payroll Processing Date");
        end;



    end;
    var
        myInt : Integer;
        "First Period Start Date" : Date;
        "Number Of Periods" : Integer;
        PayrollFrequency : Option Daily,Weekly,Biweekly,Semimonthly,Monthly,Quarterly,Semiannually,Annually;
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