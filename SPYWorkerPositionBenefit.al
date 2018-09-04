table 70140979 SPYWorkerPositionBenefit
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;Worker;code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Worker';
            TableRelation = Employee;
            NotBlank = true;
        }
        field(2;Position;code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Position';
        }
        field(3;Benefit;code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay element';
            //TableRelation = 
        }
        field(4;ValidFrom;Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Effective';
        }
        field(5;ValidTo;Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Expiration';
        }
        field(6;PayrollPeriod;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Payroll Period';
            TableRelation = SPYPayrollPeriod;
            NotBlank = true;
        }
        field(7;currency;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Currency';
            TableRelation = Currency;
            NotBlank = true;
        }
        field(8;AmountHourly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Hourly';
        }
        field(9;AmountDaily;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Daily';
        }
        field(10;AmountWeekly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Weekly';
        }
        field(11;AmountBiWeekly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bi Weekly';
        }
        field(12;AmountMonthly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Monthly';
        }
        field(13;AmountQuarterly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quarterly';
        }
        field(14;AmountSemiAnnual;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Semi annual';
        }
        field(15;AmountAnnual;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Annual';
        }
        field(16;QtyHourly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Hourly';
        }
        field(17;QtyDaily;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Daily';
        }
        field(18;QtyBiWeekly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bi Weekly';
        }
        field(19;QtyWeekly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Weekly';
        }
        field(20;QtyMonthly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Monthly';
        }
        field(21;QtyQuarterly;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Qurterly';
        }
        field(22;QtySemiannual;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Semi annual';
        }
        field(23;Qtyannual;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Annual';
        }
        field(24;Legalentity;Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Legal entity';
            TableRelation = Company;
        }
    }

    keys
    {
        key(PK;Worker,Position,Legalentity,Benefit,ValidFrom,ValidTo)
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
page 70140981 SpyWorkerPositionBenefitList
{
    PageType = List;
    SourceTable = SPYWorkerPositionBenefit;
    Caption = 'benefit List';
    ApplicationArea =all;
    UsageCategory = Lists;
    CardPageId = SPYWorkerPositionBenefitCard;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Position;Position)
                {
                   Caption = 'Postion';
                   ApplicationArea = all;
                   ToolTip = 'Position'; 
                }
                field(Benefit;Benefit)
                {
                   Caption = 'Pay element';
                   ApplicationArea = all;
                   ToolTip = 'Pay element'; 
                }
                field(ValidFrom;ValidFrom)
                {
                   Caption = 'Effective';
                   ApplicationArea = all;
                   ToolTip = 'Effective date for Benefit'; 
                }
                field(ValidTo;ValidTo)
                {
                   Caption = 'Expiration';
                   ApplicationArea = all;
                   ToolTip = 'Expiration date for Benefit'; 
                }
            }
        }
        area(factboxes)
        {
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
page 70140982 SPYWorkerPositionBenefitCard
{
    PageType = Card;
    SourceTable = SPYWorkerPositionBenefit;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'Benefit Card';

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                field(Worker;Worker)
                {
                   caption = 'Worker';
                   ApplicationArea = all;
                   ToolTip = 'Select Worker'; 
                }
                field(Position;Position)
                {
                   caption = 'Position';
                   ApplicationArea = all;
                   ToolTip = 'Select Position of Worker'; 
                }
                field(Benefit;Benefit)
                {
                   caption = 'Pay element';
                   ApplicationArea = all;
                   ToolTip = 'Select Pay element of Worker'; 
                }
                
            }
            group(Validdates)
            {
                Caption = 'Valid dates';
                field(ValidFrom;ValidFrom)
                {
                    Caption = 'Effective';
                    ApplicationArea = all;
                    ToolTip = 'Select Effective Date';
                }
                field(ValidTo;ValidTo)
                {
                    Caption = 'Expiration';
                    ApplicationArea = all;
                    ToolTip = 'Select Expiration Date';
                }
            }
            group(Details)
            {
                field(PayrollPeriod;PayrollPeriod)
                {
                    Caption = 'Payroll period';
                    ApplicationArea = all;
                    ToolTip = 'Select Payroll Period';
                }
                field(currency;currency)
                {
                    Caption = 'currency';
                    ApplicationArea = all;
                    ToolTip = 'Select currency';
                }

            }
            group(Quantity)
            {
                field(QtyHourly;QtyHourly)
                {
                    Caption = 'Hourly';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Hourly';
                }
                field(QtyDaily;QtyDaily)
                {
                    Caption = 'Daily';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Daily';
                }
                field(QtyBiWeekly;QtyBiWeekly)
                {
                    Caption = 'Bi Weekly';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Bi Weekly';
                }
                field(QtyWeekly;QtyWeekly)
                {
                    Caption = 'Weekly';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Weekly';
                }
                field(QtyMonthly;QtyMonthly)
                {
                    Caption = 'Monthly';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Monthly';
                }
                field(QtyQuarterly;QtyQuarterly)
                {
                    Caption = 'Quarterly';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Quarterly';
                }
                field(QtySemiannual;QtySemiannual)
                {
                    Caption = 'Semi Annual';
                    ApplicationArea = all;
                    ToolTip = 'Quantity Semi annually';
                }
                field(Qtyannual;Qtyannual)
                {
                    Caption = 'Annual';
                    ApplicationArea = all;
                    ToolTip = 'Quantity annually';
                }
            }
            group(Amount)
            {
                field(AmountHourly;AmountHourly)
                {
                    Caption = 'Hourly';
                    ApplicationArea = all;
                    ToolTip = 'Amount Hourly';
                }
                field(AmountDaily;AmountDaily)
                {
                    Caption = 'Daily';
                    ApplicationArea = all;
                    ToolTip = 'Amount Daily';
                }
                field(AmountWeekly;AmountWeekly)
                {
                    Caption = 'Weekly';
                    ApplicationArea = all;
                    ToolTip = 'Amount Weekly';
                }
                field(AmountBiWeekly;AmountBiWeekly)
                {
                    Caption = 'Bi Weekly';
                    ApplicationArea = all;
                    ToolTip = 'Amount Bi Weekly';
                }
                field(AmountMonthly;AmountMonthly)
                {
                    Caption = 'Monthly';
                    ApplicationArea = all;
                    ToolTip = 'Amount Monthly';
                }
                field(AmountQuarterly;AmountQuarterly)
                {
                    Caption = 'Quarterly';
                    ApplicationArea = all;
                    ToolTip = 'Amount Qurterly';
                }
                field(AmountSemiAnnual;AmountSemiAnnual)
                {
                    Caption = 'Semi annual';
                    ApplicationArea = all;
                    ToolTip = 'Amount Semi annually';
                }
                field(AmountAnnual;AmountAnnual)
                {
                    Caption = 'Annual';
                    ApplicationArea = all;
                    ToolTip = 'Amount annually';
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
    
    var
        myInt : Integer;
}