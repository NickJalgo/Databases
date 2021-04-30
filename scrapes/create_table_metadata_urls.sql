use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table metadata.urls (
	url_key				int				not null,
	fk_scrape			int				not null,
	fk_stock			int				not null,
	fk_start			int				not null,
	fk_end				int				not null,
	base_url					text			null,
constraint pk_url primary key clustered (
	url_key				asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=ON)
)
go

alter table metadata.urls with nocheck add constraint fk_url_to_scrape foreign key(fk_scrape)
references dimension.scrapes(scrape_key)
go

alter table metadata.urls with nocheck add constraint fk_url_to_stock foreign key(fk_stock)
references dimension.stocks(stock_key)
go

alter table metadata.urls with nocheck add constraint fk_url_to_start foreign key(fk_start)
references dimension.calendar(date_key)
go

alter table metadata.urls with nocheck add constraint fk_url_to_end foreign key(fk_end)
references dimension.calendar(date_key)
go