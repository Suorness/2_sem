Program WorK_FuLL_without_test;

{$APPTYPE CONSOLE}

uses
  SysUtils;
Type
  TDay = (Sunday,Monday, Tuesday, Wednesday,Thursday,Friday,Saturday,nope);
  TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec,nope2);
  TMOnthDay = array[Jan..Dec] of integer;

Const
  amount_day:TMonthDay =(31,28,31,30,31,30,31,31,30,31,30,31);

Var
  Day:TDay;
  month0:TMonth;
  mass1:integer;
  i,j,k,year:integer;
  RDay:integer;
  TH_M,TH_N:integer;

Begin
  RDay:=0;
  day:=low(TDay);
  month0:=low(TMonth);

  writeln('Enter');
  readln(year);

  for k:=1 to year do
  begin
    for j:=1 to 12 do
    begin
      mass1:=amount_day[month0];

      if month0=feb then
      begin
        if (((k mod 4) = 0) and ((k mod 100) <>0)) or ((k mod 400) = 0)  then
          RDay:=1
        else
          RDay:=0;
      end
      else
      RDay:=0;

      for i:=1 to mass1+RDay do
      begin
        day:=succ(day);
        if day=nope then
          day:=low(TDay);
        if day=Thursday then
        begin
          TH_N:=i;
          TH_M:=j;
        end;
      end;

      month0:=succ(month0);
      if month0=succ(Dec) then
        month0:=low(TMonth);
        
     if k=year then
      writeln(TH_N:2,'.', TH_M:2,'.',year:4);
    end;
  end;
  readln
End.
