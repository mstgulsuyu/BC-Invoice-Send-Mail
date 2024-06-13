tableextension 50111 SalesInvHeaderMailExtension extends "Sales Invoice Header"
{
    fields
    {
        field(50001; IsSendMail; Boolean)
        {
            Caption = 'Is Send Mail';
            DataClassification = ToBeClassified;
        }
    }
}