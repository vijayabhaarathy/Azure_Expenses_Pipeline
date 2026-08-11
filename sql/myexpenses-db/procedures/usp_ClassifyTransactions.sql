CREATE   PROCEDURE dbo.usp_ClassifyTransactions
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Normalize descriptions
    EXEC dbo.usp_NormalizeDescriptions;

    -- Step 2: Populate MerchantName from MerchantMapping
    UPDATE T
    SET T.MerchantName = M.MerchantName
    FROM dbo.Transactions T
    JOIN dbo.MerchantMapping M
        ON T.NormalizedDescription = M.NormalizedDescription;

    -- Step 3: Derive categories and subcategories
    EXEC dbo.usp_DeriveCategories;
END;