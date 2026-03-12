/*
========================================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
========================================================================================================
Script Purpose:
          This stored procedure loads data into the 'bronze' schema from external csv files. 
          It first truncates target tables to avoid duplicate entries and then performs 
          BULK INSERT operations from CSV files into CRM and ERP tables. Progress messages

Parameters: The procedure does not require input parameters or return any values.

Usage Example: To load data into the bronze layer, simply execute:
EXEC bronze.load_bronze
========================================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @StartTime DATETIME, @EndTime DATETIME, @Batch_StartTime DATETIME, @Batch_EndTime DATETIME;
	BEGIN TRY
	    SET @Batch_StartTime = GETDATE();
		PRINT '=====================================================';
		PRINT 'Starting data loading process for bronze layer...';
		PRINT '=====================================================';

		PRINT '-----------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------------';

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		PRINT '-----------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------------------------';

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;

		PRINT '>> Inserting Data Into Table: bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;

		PRINT '>> Inserting Data Into Table: bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------'

		SET @StartTime = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

		PRINT '>> Inserting Data Into Table: bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\yoges\OneDrive\sql-data_with_bara\sql-dataset\sql-data-warehouse-project-yh\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @EndTime = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @StartTime, @EndTime) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @Batch_EndTime = GETDATE();
		PRINT '=====================================================';
		PRINT 'Data loading process for bronze layer completed.';
		PRINT 'Total Load Duration: ' + CAST(DATEDIFF(second, @Batch_StartTime, @Batch_EndTime) AS NVARCHAR) + ' seconds';
		PRINT '=====================================================';
	END TRY
	BEGIN CATCH
	    PRINT '=====================================================';
		PRINT 'An error occurred during loading bronze layer.';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Message: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=====================================================';
	END CATCH
END
