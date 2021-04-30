use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table fact.scrape_data (
	fk_scrape			int				not null,
	fk_date				int				not null,
	fk_stock			int				not null,
	row_count			int				not null,
	perf_time			numeric(16, 6)	not null,
	scraped_data		varchar(512)	null,
constraint pk_scrape_data primary key clustered (
	fk_scrape			asc,
	fk_date				asc,
	fk_stock			asc,
	row_count			asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=ON)
)
go

alter table fact.scrape_data with nocheck add constraint fk_scrape_data_to_scrape foreign key(fk_scrape)
references dimension.scrapes(scrape_key)
go

alter table fact.scrape_data check constraint fk_scrape_data_to_scrape
go

alter table fact.scrape_data with nocheck add constraint fk_scrape_data_to_date foreign key(fk_date)
references dimension.calendar(date_key)
go

alter table fact.scrape_data check constraint fk_scrape_data_to_date
go

alter table fact.scrape_data with nocheck add constraint fk_scrape_data_to_stock foreign key(fk_stock)
references dimension.stocks(stock_key)
go

alter table fact.scrape_data check constraint fk_scrape_data_to_stock
go