CREATE TABLE [dbo].[Transactions] (
    [Id]                  INT              IDENTITY (1, 1) NOT NULL,
    [TransactionDate]     DATE             NULL,
    [Description]         NVARCHAR (500)   NULL,
    [Amount]              DECIMAL (18, 2)  NULL,
    [ExpenseType]         NVARCHAR (50)    NULL,
    [CardName]            NVARCHAR (100)   NULL,
    [AccountType]         NVARCHAR (50)    NULL,
    [Category]            NVARCHAR (100)   NULL,
    [SubCategory]         NVARCHAR (100)   NULL,
    [AccountNo_Ref]       NVARCHAR (50)    NOT NULL,
    [SourceFileName]      NVARCHAR (260)   NULL,
    [ProcessingTimestamp] DATETIME2 (7)    DEFAULT (getutcdate()) NULL,
    [StatementDate]       DATE             NULL,
    [IsOffset]            BIT              NULL,
    [TransferGroupId]     UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Transaction_Key] UNIQUE NONCLUSTERED ([TransactionDate] ASC, [Description] ASC, [Amount] ASC, [ExpenseType] ASC, [StatementDate] ASC, [AccountNo_Ref] ASC)
);


GO

