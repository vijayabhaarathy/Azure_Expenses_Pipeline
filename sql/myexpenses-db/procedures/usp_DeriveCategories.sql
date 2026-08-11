CREATE PROCEDURE dbo.usp_DeriveCategories
AS
BEGIN
    SET NOCOUNT ON;

    -- Reset derived values only for transactions that are not completed
    UPDATE dbo.Transactions
    SET DerivedCategory = NULL,
        DerivedSubCategory = NULL
    WHERE ISNULL(Status, '') <> 'DONE';

    -- Apply amount-specific rules
    UPDATE T
    SET
        DerivedCategory = M.Category,
        DerivedSubCategory = M.SubCategory
    FROM dbo.Transactions T
    INNER JOIN dbo.MerchantMaster M
        ON T.MerchantName = M.MerchantName
       AND M.Amount IS NOT NULL
       AND T.Amount = M.Amount
    WHERE ISNULL(T.Status, '') <> 'DONE';

    -- Apply general merchant rules where nothing has been derived yet
    UPDATE T
    SET
        DerivedCategory = M.Category,
        DerivedSubCategory = M.SubCategory
    FROM dbo.Transactions T
    INNER JOIN dbo.MerchantMaster M
        ON T.MerchantName = M.MerchantName
       AND M.Amount IS NULL
    WHERE ISNULL(T.Status, '') <> 'DONE'
      AND T.DerivedCategory IS NULL;

    -- Merchant review: no merchant mapping found
    UPDATE dbo.Transactions
    SET Status = 'MERCHANT_REVIEW'
    WHERE MerchantName IS NULL
      AND ISNULL(Status, '') NOT IN ('DONE', 'PIPELINE_REVIEW');

    -- Category review: merchant found and category derived
    UPDATE dbo.Transactions
    SET Status = 'CATEGORY_REVIEW'
    WHERE MerchantName IS NOT NULL
      AND DerivedCategory IS NOT NULL
      AND ISNULL(Status, '') NOT IN ('DONE', 'PIPELINE_REVIEW');

END;