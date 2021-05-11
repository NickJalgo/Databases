use master
go

create database parbizi
 
 containment = none
 on primary
 
(name= N'parbizi', filename=N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\parbizi.mdf', size=410432KB, maxsize=unlimited, filegrowth=1024KB)
log on
(name=N'parbizi_log', filename=N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\parbizi_log.ldf' , size=4715200KB , maxsize=2048GB , filegrowth=10%)
go

alter database parbizi set compatibility_level = 110
go

if (1 = fulltextserviceproperty('IsFullTextInstalled'))
begin
exec parbizi.dbo.sp_fulltext_database @action = 'enable'
end
go

alter database parbizi set ansi_null_default off
go

alter database parbizi set ansi_nulls off
go

alter database parbizi set ansi_padding off
go

alter database parbizi set ansi_warnings off
go

alter database parbizi set arithabort off
go

alter database parbizi set auto_close off
go

alter database parbizi set auto_shrink off
go

alter database parbizi set auto_update_statistics on
go

alter database parbizi set cursor_close_on_commit off
go

alter database parbizi set cursor_default global
go

alter database parbizi set concat_null_yields_null off
go

alter database parbizi set numeric_roundabort off
go

alter database parbizi set quoted_identifier off
go

alter database parbizi set recursive_triggers off
go

alter database parbizi set disable_broker
go

alter database parbizi set auto_update_statistics_async off
go

alter database parbizi set date_correlation_optimization off
go

alter database parbizi set trustworthy off
go

alter database parbizi set allow_snapshot_isolation off
go

alter database parbizi set parameterization simple
go

alter database parbizi set read_committed_snapshot off
go

alter database parbizi set honor_broker_priority off
go

alter database parbizi set recovery full
go

alter database parbizi set multi_user
go

alter database parbizi set page_verify checksum
go

alter database parbizi set db_chaining off
go

alter database parbizi set filestream(non_transacted_access=off)
go

alter database parbizi set target_recovery_time = 0 seconds
go

alter database parbizi set read_write
go