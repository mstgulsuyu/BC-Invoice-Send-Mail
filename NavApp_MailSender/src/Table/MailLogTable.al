table 50110 "Mail Log"
{

    DrillDownPageID = "Mail Log List";
    LookupPageID = "Mail Log List";
    DataClassification = ToBeClassified;
    Caption = 'Mail Gönderim Logu';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Giriş No.';
            AutoIncrement = true;
        }
        field(2; "Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Fatura No.';
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Müşteri No.';
        }
        field(4; "Email"; Text[1000])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
        }
        field(5; "Sent Status"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gönderim Durumu';
            OptionMembers = Sent,Failed;
        }
        field(6; "Sent Date"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gönderim Tarihi';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
