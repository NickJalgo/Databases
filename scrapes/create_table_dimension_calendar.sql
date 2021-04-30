use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table dimension.calendar (
	date_key		int					not null,
	date			smalldatetime		not null,
constraint pk_calendar primary key clustered (
	date_key		asc
) with (pad_index=OFF, statistics_norecompute=OFF, ignore_dup_key=OFF, allow_row_locks=ON, allow_page_locks=ON)
)
go