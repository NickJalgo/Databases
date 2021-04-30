use scrapes
go

select 'Current Stage', count(*) from stage.jobs_marc
select ticker, date, count(ticker) from scrapes.stage.jobs_marc group by ticker, date order by ticker, date
select ticker, date, count(*) from scrapes.stage.jobs_marc where date in ('04/23/2021', '04/26/2021') group by ticker, date order by ticker, date

return

select * from scrapes.stage.jobs_marc order by ticker, count
select * from scrapes.stage.jobs_marc where ticker = 'CMA order by count'
select ticker, date, count(ticker) from scrapes.stage.jobs_marc where date = '04/21/2021' group by ticker, date order by ticker, date
select ticker, date, count(description) from scrapes.stage.jobs_marc where date = '04/22/2021' group by ticker, date order by ticker
select * from scrapes.scrape.jobs_marc where ticker = 'GDOT'
select * from scrapes.dimension.stocks
select * from scrapes.scrape.jobs_marc order by ticker
select * from stage.jobs_marc where date = '04/27/2021'

--update scrape.metadata set header = '{}' where fk_stock = 17
--update scrape.metadata set base_url = 'https://greendotcorp.wd1.myworkdayjobs.com/en-us/gdc' where fk_stock = 17
--delete scrapes.stage.jobs_marc
--delete scrapes.stage.jobs_marc where ticker = 'CFG' and date = '04/27/2021'

/*
insert stage.copy_job_postings_marc select * from stage.job_postings_marc
*/

--insert stage.job_postings_marc select '04/26/2021', 51, 22.067207, 'GDOT', 'Senior Site Reliability Engineer (SRE)'
--insert stage.job_postings_marc select '04/26/2021', 52, 22.067207, 'GDOT', 'Senior Product Designer'

--exec etl.append_jobs_marc
--delete from fact.scrape_data where fk_date = (select date_key from dimension.calendar where date = '04/27/2021')
select * from timeseries.jobs_count_by_ticker order by ticker, date