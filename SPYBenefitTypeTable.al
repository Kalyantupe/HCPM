table 70140978 SPYBenefitTypeTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;BenefitTypeCode;code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay element';
            NotBlank = true;
        }
        field(2;Description;Text[60])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK;BenefitTypeCode)
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
page 70140980 SPYBenefitTypeTable
{
    PageType = List;
    SourceTable = SPYBenefitTypeTable;
    Caption = 'Benefit Type';
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(BenefitTypeCode;BenefitTypeCode)
                {
                    Caption = 'Benefit Type';
                    ToolTip = 'Enter Benefit Type';
                    ApplicationArea = all;
                }
                field(Description;Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Enter Description of Benefit Type';
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