--silnia z liczby naturalnej
DECLARE @temp int;
SET @temp=1;
DECLARE @i int;
SET @i=1;
while (@i<=3)
BEGIN
	set @temp=@temp*@i;
	set @i=@i+1;
END
print(@temp)--procedure silna (tymczasowa)
--create
alter
procedure #silnia
(
@liczba int
)
as
BEGIN
	DECLARE @temp int;
	SET @temp=1;
	DECLARE @i int;
	SET @i=1;
	while (@i<=@liczba)
BEGIN
 set @temp=@temp*@i;
 set @i=@i+1;
END
print(CAST(@liczba AS varchar(20))+'!='+CAST(@temp as varchar(20)))
END
go
exec #silnia @liczba=10--potega z liczby rzeczywsitym z wykladnikiem naturalnym
--create
alter
procedure #potega
(
	@x DECIMAL,
	@n int
)
AS
BEGIN
IF (@n=0)
print(@x);
ELSE
BEGIN
	DECLARE @i int;
	DECLARE @temp DECIMAL;
	SET @temp=1;
	SET @i=1;
	WHILE (@i<=@n)
	BEGIN
	 SET @temp=@temp* @x;
	 SET @i=@i+1;
	END
	print(CAST(@x as varchar(10))+'^'+CAST(@n as varchar(10))+'='+
	CAST(@temp as varchar(10)))
	END
END
GO
exec potega @x=2 ,@n=5;