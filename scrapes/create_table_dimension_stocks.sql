use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table dimension.stocks (
	stock_key		int				not null,
	ticker			varchar(16)		not null,
	country_code	varchar(2)		not null,
	nickname		varchar(16)		not null,
	company			varchar(36)		not null,
constraint pk_stock primary key clustered
(
	stock_key		asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=on),
constraint c1_stock_description unique nonclustered
(
	ticker			asc,
	country_code	asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=on)
)
go