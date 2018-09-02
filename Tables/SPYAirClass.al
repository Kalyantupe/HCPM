table 70140971 SpyAirClass
{
   DataClassification = ToBeClassified;
    Caption='Spy Air Class';
    
    fields
    {
        field(1;AirClassCode;Text[20])
        {
            Caption = 'Air Class Code';
            DataClassification = ToBeClassified;
        }
           field(2;Description;Text[60])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;AirClassCode)
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
page 70140971 SPYAirClass
{
    PageType = List;
    SourceTable = SpyAirClass;
    UsageCategory = Lists;
    ApplicationArea = all;
    Caption = 'Air Class';
    
    
    layout
    {
        area(content)
        {
            repeater(SpyAirClass)
            {
                field(AirClassCode;AirClassCode)
                {
                    Caption='Air Class';
                    ApplicationArea=all;
                    ToolTip = 'Air Class Code';
                }
                field(Description;Description)
                {
                    Caption='Description';
                    ApplicationArea=all;
                    ToolTip = 'Description of Air Class';
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
