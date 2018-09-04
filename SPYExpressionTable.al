table 70140977 SPYExpressionTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;ExpressionCode;Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Expression Code';
            NotBlank = true;
        }
        field(2;Description ;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK;ExpressionCode)
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
page 70140978 SPYExpressionTableList
{
    PageType = List;
    SourceTable = SPYExpressionTable;
    ApplicationArea = all;
    UsageCategory = Lists;
    Caption = 'Expressions';
    CardPageId = SPYExpressionTableCard;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ExpressionCode;ExpressionCode)
                {
                    Caption = 'Expression';
                    ToolTip = 'Enter Expression code';
                    ApplicationArea = all;
                }
                field(Description;Description)
                {
                    Caption = 'Expression';
                    ToolTip = 'Enter Description of Expression';
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
page 70140979 SPYExpressionTableCard
{
    PageType = Card;
    SourceTable = SPYExpressionTable;
    Caption = 'Expressions';
    ApplicationArea = all;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(GroupName)
            {
                field(ExpressionCode;ExpressionCode)
                {
                   Caption = 'Expression';
                   ToolTip = 'Enter Expression Code';
                   ApplicationArea = all;
                   
                }
                field(Description;Description)
                {
                   Caption = 'Description';
                   ToolTip = 'Enter Description of Expression';
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
    
    var
        myInt : Integer;
}