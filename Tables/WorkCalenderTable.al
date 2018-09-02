table 70140976 WorkCalenderTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;CalenderId;code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'CalenderId';
            NotBlank = true;
        }
        field(2;Name;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3;BasicCalenderId;Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'BasicCalederId';
            TableRelation = WorkCalenderTable.CalenderId;
        }
        field(4;StandardWorkDayHours;Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'StandardWorkDayHours';
        }
    }

    keys
    {
        key(PK;CalenderId)
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
page 70140975 WorkCalenderTableCard
{
    PageType = Card;
    SourceTable = WorkCalenderTable;

    layout
    {
        area(content)
        {
            group("Calender")
            {
                field(Name;Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                    ToolTip = 'Description of Calender';
                }
                field(CalenderId;CalenderId)
                {
                    Caption = 'Calender';
                    ApplicationArea = all;
                    ToolTip = 'Name of Calender';
                }
                
            }
            group("Base Calender")
            {
                field(BasicCalenderId;BasicCalenderId)
                {
                    Caption = 'Base Calender';
                    ApplicationArea = all;
                    ToolTip = 'Select Base Caleneder for Calender';
                }
            }
            group("Standard Work Day")
            {
                field(StandardWorkDayHours;StandardWorkDayHours)
                {
                    Caption = 'Standard Work Day in Hours';
                    ApplicationArea = all;
                    ToolTip = 'Enter Standard Work Day in Hours';
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
page 70140974 WorkCalenderTableList
{
    PageType = List;
    SourceTable = WorkCalenderTable;
    ApplicationArea = all;
    UsageCategory = Lists;
    CardPageId = WorkCalenderTableCard;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CalenderId;CalenderId)
                {
                    Caption = 'Calender';
                    ApplicationArea = all;
                    ToolTip = 'Calender ID of Calender';
                }
                field(Name;Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                    ToolTip = 'Name of Calender';
                }
                field(BasicCalenderId;BasicCalenderId)
                {
                    Caption = 'Base Calender';
                    ApplicationArea = all;
                    ToolTip = 'Calender ID of Calender';
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