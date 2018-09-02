table 70140973 SPYPayElementGroupTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;PayElementGroupCode;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay Element Group';
        }
        field(2;Description;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK;PayElementGroupCode)
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
page 70140973 SPYPayElement
{
    PageType = List;
    SourceTable = SPYPayElementGroupTable;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(SPYPayElementAccountSetup)
            {
                field(PayElementGroupCode;PayElementGroupCode)
                {
                    Caption = 'Pay Element Group';
                    ToolTip = 'Pay Element Group Code';
                    ApplicationArea = all;
                }
                field(Description;Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Description of Pay Element Group Code';
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