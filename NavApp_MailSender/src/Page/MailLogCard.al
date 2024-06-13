page 50110 "Mail Log Card"
{
    PageType = Card;
    SourceTable = "Mail Log";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }
                field("Sent Status"; Rec."Sent Status")
                {
                    ApplicationArea = All;
                }
                field("Sent Date"; Rec."Sent Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
