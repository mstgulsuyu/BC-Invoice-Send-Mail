codeunit 50111 "Send Invoice Emails"
{
    [TryFunction]
    procedure SendEmailToCustomer(SalesInvoiceHeader: Record "Sales Invoice Header");
    var
        EmailSent: Boolean;

    begin

        SalesInvoiceHeader.EmailRecords(false);

    end;

    procedure InsertLogEntry(InvoiceNo: Code[20]; CustomerNo: Code[20]; Email: Text; Status: Integer);
    var
        MailLogRec: Record "Mail Log";
    begin
        MailLogRec."Invoice No." := InvoiceNo;
        MailLogRec."Customer No." := CustomerNo;
        MailLogRec.Email := Email;
        MailLogRec."Sent Status" := Status;
        MailLogRec."Sent Date" := CurrentDateTime;
        MailLogRec.Insert();
    end;

    procedure ProcessSalesInvoices();
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        CustomerNo: Code[20];
        Email: Text;
        SentSuccessfully: Boolean;
        Customer: Record Customer;
    begin
        SalesInvHeader.RESET;
        if SalesInvHeader.FINDSET then
            repeat
                if SalesInvHeader."Posting Date" <= WORKDATE - 30 then // Son 30 gün içindeki faturalar
                begin
                    CustomerNo := SalesInvHeader."Sell-to Customer No.";
                    Customer.GEt(CustomerNo);
                    Email := Customer."E-Mail";
                    SalesInvHeader.SetRecFilter();

                    if SendEmailToCustomer(SalesInvHeader) then begin
                        InsertLogEntry(SalesInvHeader."No.", CustomerNo, Email, 0);
                    end
                    else begin
                        // Başarısız gönderim logunu kaydet
                        InsertLogEntry(SalesInvHeader."No.", CustomerNo, Email, 1);
                    end;


                end;
            until SalesInvHeader.NEXT = 0;
    end;
}
