use scrapes
go

bulk insert dimension.calendar from 'C:\Users\Administrator\Desktop\DBS\temp_data\calendar.csv'
with (fieldterminator=',', rowterminator='\n', firstrow=2)
go