CREATE   PROCEDURE dbo.usp_InsertTransaction
(
    @TransactionDate DATE,
    @Description NVARCHAR(500),
    @Amount DECIMAL(18,2),
    @ExpenseType NVARCHAR(20),
    @CardName NVARCHAR(50),
    @AccountType NVARCHAR(50),
    @Category NVARCHAR(100) = '-',
    @SubCategory NVARCHAR(100) = '-',
    @AccountNo_Ref NVARCHAR(50),
    @SourceFileName NVARCHAR(260),
    @ProcessingTimestamp DATETIME2,
    @StatementDate DATE
)
AS
BEGIN

    MERGE INTO dbo.Transactions AS Target
    USING (
        SELECT 
            @TransactionDate AS TransactionDate,
            @Description AS Description,
            @Amount AS Amount,
            @ExpenseType AS ExpenseType,
            @CardName AS CardName,
            @AccountType AS AccountType,
            @Category AS Category,
            @SubCategory AS SubCategory,
            @AccountNo_Ref AS AccountNo_Ref,
            @SourceFileName AS SourceFileName,
            @ProcessingTimestamp AS ProcessingTimestamp,
            @StatementDate AS StatementDate
    ) AS Source
    ON Target.TransactionDate = Source.TransactionDate
       AND Target.Description = Source.Description
       AND Target.Amount = Source.Amount
       AND Target.CardName = Source.CardName
       AND Target.StatementDate = Source.StatementDate
       AND Target.AccountNo_Ref = Source.AccountNo_Ref
       AND Target.ExpenseType = Source.ExpenseType       

    WHEN NOT MATCHED THEN
        INSERT (
            TransactionDate,
            Description,
            Amount,
            ExpenseType,
            CardName,
            AccountType,
            Category,
            SubCategory,
            AccountNo_Ref,
            SourceFileName,
            ProcessingTimestamp,
            StatementDate
        )
        VALUES (
            Source.TransactionDate,
            Source.Description,
            Source.Amount,
            Source.ExpenseType,
            Source.CardName,
            Source.AccountType,
            Source.Category,
            Source.SubCategory,
            Source.AccountNo_Ref,
            Source.SourceFileName,
            Source.ProcessingTimestamp,
            Source.StatementDate
        );

END;

GO

