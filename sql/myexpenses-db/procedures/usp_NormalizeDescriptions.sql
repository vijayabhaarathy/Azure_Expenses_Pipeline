CREATE or ALTER PROCEDURE dbo.usp_NormalizeDescriptions
AS
BEGIN
    SET NOCOUNT ON;

    -- Start with the raw description only for transactions not completed
    UPDATE dbo.Transactions
    SET NormalizedDescription = UPPER(Description)
    WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove quotes and line breaks
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '"', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, CHAR(13), ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, CHAR(10), ' ') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove common payment prefixes
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'UPI-', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'IMPS-', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'NEFT-', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'RTGS-', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'M-', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'EMI ', '') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove payment gateway prefixes
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'RAZ*', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'BLD*', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'IND*', '') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove web fragments
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'HTTPS://', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'HTTP://', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'HTTPS', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'WWW', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '.COM', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' COM', '') WHERE ISNULL(Status, '') <> 'DONE';

    -- Replace punctuation with spaces
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ',', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '.', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '/', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '-', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '*', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ':', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '(', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ')', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, '#', ' ') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove common company suffixes
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' LIMITED', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' LTD', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' PRIVATE', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' PVT', '') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove city names
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'BANGALORE', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'BENGALURU', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'MUMBAI', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'CHENNAI', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'GURUGRAM', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'GURGAON', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'PUNE', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'SURAT', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'ERODE', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'NAMAKKAL', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'TIRUPPUR', '') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove common transaction artifacts
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'PAYMENT RECEIVED', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'NET BANKING', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'CREDIT CARD PAYMENT', 'CC PAYMENT') WHERE ISNULL(Status, '') <> 'DONE';

    -- Normalize common UPI transfer patterns
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'WDL TFR UPI DR ', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'WDL TFR ', '') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'UPI DR ', '') WHERE ISNULL(Status, '') <> 'DONE';
    
    -- Remove common bank routing tokens
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' UTIB ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' HDFC ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' ICIC ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' YESB ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' RATN ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    
    -- Remove UPI routing fragments
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' UPIIN ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' UPI ', ' ') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, ' AT NALLUR', '') WHERE ISNULL(Status, '') <> 'DONE';
    
    -- Normalize recurring savings-account merchants
    UPDATE dbo.Transactions SET NormalizedDescription = 'AMAZON' WHERE NormalizedDescription LIKE '%AMAZON%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'SWIGGY' WHERE NormalizedDescription LIKE '%SWIGGY%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'ZEPTO' WHERE NormalizedDescription LIKE '%ZEPTO%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'BLINKIT' WHERE NormalizedDescription LIKE '%BLINKIT%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'ZERODHA' WHERE NormalizedDescription LIKE '%ZERODHA%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'HALLI THOTA' WHERE NormalizedDescription LIKE '%HALLI TH%' AND ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = 'MONTHLY SAVINGS' WHERE NormalizedDescription LIKE '%SI MONTHLY SAVINGS%' AND ISNULL(Status, '') <> 'DONE';
    
    -- Canonical merchant normalization
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'LIFE STYLE INTERNATIONA', 'LIFESTYLE') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'SWIGGY KA', 'SWIGGY') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'ADOBE SYSTEMS', 'ADOBE') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'HOTSTAR DI SI', 'HOTSTAR') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'AMAZON SELLER SERVIC P', 'AMAZON') WHERE ISNULL(Status, '') <> 'DONE';
    UPDATE dbo.Transactions SET NormalizedDescription = REPLACE(NormalizedDescription, 'MICROSOFT', 'MICROSOFT') WHERE ISNULL(Status, '') <> 'DONE';

    -- Remove digits
    WHILE EXISTS (
        SELECT 1
        FROM dbo.Transactions
        WHERE NormalizedDescription LIKE '%[0-9]%'
          AND ISNULL(Status, '') <> 'DONE'
    )
    BEGIN
        UPDATE dbo.Transactions
        SET NormalizedDescription =
            TRANSLATE(
                NormalizedDescription,
                '0123456789',
                '          '
            )
        WHERE NormalizedDescription LIKE '%[0-9]%'
          AND ISNULL(Status, '') <> 'DONE';
    END;

    -- Collapse multiple spaces
    WHILE EXISTS (
        SELECT 1
        FROM dbo.Transactions
        WHERE NormalizedDescription LIKE '%  %'
          AND ISNULL(Status, '') <> 'DONE'
    )
    BEGIN
        UPDATE dbo.Transactions
        SET NormalizedDescription = REPLACE(NormalizedDescription, '  ', ' ')
        WHERE NormalizedDescription LIKE '%  %'
          AND ISNULL(Status, '') <> 'DONE';
    END;

    -- Final trim
    UPDATE dbo.Transactions
    SET NormalizedDescription = LTRIM(RTRIM(NormalizedDescription))
    WHERE ISNULL(Status, '') <> 'DONE';

END;