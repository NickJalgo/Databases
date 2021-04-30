use scrapes
go

set ansi_nulls on
go

set quoted_identifier on
go

create table backups.jobs_marc (
	date			smalldatetime		not null,
	job_count		int					not null,
	perf_time		numeric(16, 6)		not null,
	ticker			varchar(16)			not null,
	description		varchar(512)		null
)
go