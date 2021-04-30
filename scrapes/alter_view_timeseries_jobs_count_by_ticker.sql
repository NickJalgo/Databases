use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

alter view timeseries.jobs_count_by_ticker

as

select			c.date,
				s.ticker,
				s.nickname,
				total_jobs = count(*)
from			scrapes.fact.scrape_data d
 join			scrapes.dimension.scrapes w on d.fk_scrape = w.scrape_key
 join			scrapes.dimension.calendar c on d.fk_date = c.date_key
 join			scrapes.dimension.stocks s on d.fk_stock = s.stock_key
where			w.scrape = 'jobs_marc'
group by		c.date,
				s.ticker,
				s.nickname

go