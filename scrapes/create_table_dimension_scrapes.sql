use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table dimension.scrapes (
	scrape_key		int					not null,
	scrape			varchar(24)			not null,
constraint pk_scrape primary key clustered (
	scrape_key		asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=ON)
)
go