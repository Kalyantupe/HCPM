table 70140972 SpyWorkerGroupTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;WorkerGroupCode;Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Worker Group';
            
        }
        field(2;Description;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK;WorkerGroupCode)
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
page 70140972 SPYWorkerGroup
{
    PageType = List;
    SourceTable = SpyWorkerGroupTable;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(SpyWorkerGroup)
            {
                field(WorkerGroupCode;WorkerGroupCode)
                {
                   Caption = 'Worker Group';
                   ToolTip = 'Worker Group Code';
                   ApplicationArea = all;
                }
                field(Description;Description)
                {
                   Caption = 'Description';
                   ToolTip = 'Description of Worker Group';
                   ApplicationArea = all;
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