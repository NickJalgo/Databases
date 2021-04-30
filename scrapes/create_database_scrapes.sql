use master
go

create database scrapes
 
 containment = none
 on primary
 
(name= N'scrapes', filename=N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\scrapes.mdf', size=410432KB, maxsize=unlimited, filegrowth=1024KB)
log on
(name=N'scrapes_log', filename=N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\scrapes_log.ldf' , size=4715200KB , maxsize=2048GB , filegrowth=10%)
go

alter database scrapes set compatibility_level = 110
go

if (1 = fulltextserviceproperty('IsFullTextInstalled'))
begin
exec scrapes.dbo.sp_fulltext_database @action = 'enable'
end
go

alter database scrapes set ansi_null_default off
go

alter database scrapes set ansi_nulls off
go

alter database scrapes set ansi_padding off
go

alter database scrapes set ansi_warnings off
go

alter database scrapes set arithabort off
go

alter database scrapes set auto_close off
go

alter database scrapes set auto_shrink off
go

alter database scrapes set auto_update_statistics on
go

alter database scrapes set cursor_close_on_commit off
go

alter database scrapes set cursor_default global
go

alter database scrapes set concat_null_yields_null off
go

alter database scrapes set numeric_roundabort off
go

alter database scrapes set quoted_identifier off
go

alter database scrapes set recursive_triggers off
go

alter database scrapes set disable_broker
go

alter database scrapes set auto_update_statistics_async off
go

alter database scrapes set date_correlation_optimization off
go

alter database scrapes set trustworthy off
go

alter database scrapes set allow_snapshot_isolation off
go

alter database scrapes set parameterization simple
go

alter database scrapes set read_committed_snapshot off
go

alter database scrapes set honor_broker_priority off
go

alter database scrapes set recovery full
go

alter database scrapes set multi_user
go

alter database scrapes set page_verify checksum
go

alter database scrapes set db_chaining off
go

alter database scrapes set filestream(non_transacted_access=off)
go

alter database scrapes set target_recovery_time = 0 seconds
go

alter database scrapes set read_write
go