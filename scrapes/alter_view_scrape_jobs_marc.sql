use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

alter view scrape.jobs_marc

as

select			ticker = s.ticker,
				w.scrape,
				h.header,
				u.base_url,
				x.xpath
from			scrapes.dimension.stocks s
  cross join	scrapes.dimension.scrapes w
  join			scrapes.metadata.headers h on h.fk_stock = s.stock_key and h.fk_scrape = w.scrape_key
  join			scrapes.dimension.calendar c1 on c1.date_key = h.fk_start
  join			scrapes.dimension.calendar c2 on c2.date_key = h.fk_end
  join			scrapes.metadata.urls u on u.fk_stock = s.stock_key and u.fk_scrape = w.scrape_key
  join			scrapes.dimension.calendar c3 on c3.date_key = u.fk_start
  join			scrapes.dimension.calendar c4 on c4.date_key = u.fk_end
  join			scrapes.metadata.xpaths x on x.fk_stock = s.stock_key and x.fk_scrape = w.scrape_key
  join			scrapes.dimension.calendar c5 on c5.date_key = x.fk_start
  join			scrapes.dimension.calendar c6 on c6.date_key = x.fk_end
where			getdate() between c1.date and c2.date
				 and getdate() between c3.date and c4.date
				 and getdate() between c5.date and c6.date
go