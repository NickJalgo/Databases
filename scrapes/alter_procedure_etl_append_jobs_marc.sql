use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

alter procedure etl.append_jobs_marc

as
begin
	
	-- Transfer stage data to fact table
	insert			fact.scrape_data
	select			fk_scrape = (select scrape_key from dimension.scrapes where scrape = 'jobs_marc'),
					c.date_key,
					t.stock_key,
					s.job_count,
					s.perf_time,
					s.description
	from			stage.jobs_marc s
	 join			dimension.calendar c on s.date = c.date
	 join			dimension.stocks t on s.ticker = t.ticker
	 left join		fact.scrape_data f on f.fk_scrape = (select scrape_key from dimension.scrapes where scrape = 'jobs_marc')
											and f.fk_date = c.date_key
											and f.fk_stock = t.stock_key
											and f.row_count = s.job_count
	where			f.fk_date is null
					 and f.fk_stock is null
					 and f.row_count is null				

	-- Before wiping out the stage data, confirm that the stage data was consistently normalized and inserted into the fact table
	declare @stage_process_run_date as smalldatetime
	declare @check_stage_totals int
	declare @check_fact_totals int
	
	set @stage_process_run_date = (select max(date) from stage.jobs_marc)
	set @check_stage_totals = (select count(*) from stage.jobs_marc where date = @stage_process_run_date)
	set @check_fact_totals = (select		count(*)
							  from			fact.scrape_data f
							   join			dimension.stocks s on f.fk_stock = s.stock_key
							   join			dimension.calendar c on f.fk_date = c.date_key
							   join			dimension.scrapes w on f.fk_scrape = w.scrape_key
							  where			w.scrape = 'jobs_marc'
											 and c.date = @stage_process_run_date
											 and s.ticker in (select distinct ticker from stage.jobs_marc where date = @stage_process_run_date)
							 )

	-- Transfer data from stage (usually from previous process run) to backup stage table
	insert			backups.jobs_marc
	select			s.date,
					s.job_count,
					s.perf_time,
					s.ticker,
					s.description
	from			stage.jobs_marc s
	 left join		backups.jobs_marc b on b.date = s.date
										     and b.job_count = s.job_count
											 and b.ticker = s.ticker
	where			b.date is null
					 and b.job_count is null
					 and b.ticker is null

	-- If the totals check between stage and fact passes the wipe out stage
	if @check_fact_totals = @check_stage_totals delete stage.jobs_marc
	 
end