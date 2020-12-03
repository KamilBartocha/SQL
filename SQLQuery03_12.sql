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
print(@temp)--double silniaDECLARE @temp int;
SET @temp=1;
DECLARE @i int;
SET @i=6;
while (@i>=1)
BEGIN
	set @temp=@temp*@i;
	set @i=@i-2;
END
print(@temp)--procedure silna (tymczasowa)
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

--create 
alter 
procedure #psilnia
(
@liczba int
)
as
BEGIN
DECLARE @temp int;
SET @temp=1;
DECLARE @i int;
SET @i=@liczba;
while (@i>=1)
BEGIN
set @temp=@temp*@i;
set @i=@i-2;
END
print(CAST(@liczba AS varchar(20))+'!='+CAST(@temp as varchar(20))) END
go
exec #psilnia @liczba=6


--potega z liczby rzeczywsitym z wykladnikiem naturalnym
create
--alter
procedure #potega
(
@x DECIMAL,
@n int
)
AS
BEGIN
IF (@n=0)
print(@x);
IF(@n<0)
BEGIN
DECLARE @v int;
DECLARE @t DECIMAL;
SET @t=1;
SET @v=-1;
WHILE (@i>=@n)
BEGIN
 SET @t=@t/@x;
 SET @v=@v-1;
END
IF(@n>0)
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
exec #potega @x=2 ,@n=-2;

--potega
--create
alter
procedure #potega(@x float, @n int)
as
begin
declare @temp float;
set @temp=1;
if(@n!=0)
begin
declare @i int;
set @i=1;
declare @m int;
if(@n>0)
set @m=@n;
else
set @m=-@n;
while(@i<=@m)
begin
set @temp=@temp*@x;
set @i=@i+1;
end
if(@n<0)
set @temp=1/@temp;
end
print(cast(@x as varchar(10))+'^'+cast(@n as varchar(10))+'='+cast(@temp as varchar(10)))
end