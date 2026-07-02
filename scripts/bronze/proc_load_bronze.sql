create or alter procedure bronze.load_bronze as 
begin
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		--for table crm_cust_info
		--loading data from the source sys
		truncate table bronze.crm_cust_info
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from "C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_crm\cust_info.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		--cross check the data (optinal)
		/*
		select count(*)
		from bronze.crm_cust_info
		-- ------------------------------
		select top 5 *
		from bronze.crm_cust_info
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		-- ==========================================================================================
		--for table crm_prd_info
		--loading data from the source 

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from "C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_crm\prd_info.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		--cross check the data (optinal)
		/*
		select count(*)
		from bronze.crm_prd_info
		-- ------------------------------
		select top 5 *
		from bronze.crm_prd_info
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		--===================================================================================================
		--for table crm_sales_details
		--loading data from the source sys
		

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from"C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_crm\sales_details.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		--cross check the data (optional)
		/*
		select count(*)
		from bronze.crm_sales_details
		-- ------------------------------
		select top 5 *
		from bronze.crm_sales_details
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		--====================================================================================================
		--====================================================================================================
		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';
		--for table erp_cust_az12
		--loading data from the source sys
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12
		from "C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		--cross check the data (optional)
		/*
		select count(*)
		from bronze.erp_cust_az12
		-- ------------------------------
		select top 5 *
		from bronze.erp_cust_az12
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		--===================================================================================================
		--for table erp_loc_a101
		--loading data from the source sys
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from "C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		--cross check the data (opyinal)
		/*
		select count(*)
		from bronze.erp_loc_a101
		-- ------------------------------
		select top 5 *
		from bronze.erp_loc_a101
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';


		--===================================================================================================
		--for table erp_px_cat_g1v2
		--loading data from the source sys
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from "C:\Users\GUHAN\Downloads\dwhp\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv"
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
	

		--cross check the data (optional)
		/*
		select count(*)
		from bronze.erp_px_cat_g1v2
		-- ------------------------------
		select top 5 *
		from bronze.erp_px_cat_g1v2
		*/
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';
		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
end
