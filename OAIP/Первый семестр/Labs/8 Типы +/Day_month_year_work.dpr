Program Day_month_year_work;

{$APPTYPE CONSOLE}

uses
  SysUtils;

//jan 31   feb 28/29   mar 31   apr 30   may 31   jun 30 jul 31   aug 31   sep 30   oct 31   nov 30   dec 31

Type
  TDay = (Sunday,Monday, Tuesday, Wednesday,Thursday,Friday,Saturday,nope);
  TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec,nope2);
  TMOnthDay = array[Jan..Dec] of integer;

Const
  amount_day:TMonthDay =(31,28,31,30,31,30,31,31,30,31,30,31);

Var
  Day:TDay;
  month0:TMonth;
  month: TMonthDay;
  mass1:integer;
  i,j,k,year:integer;
  test:boolean;
  RDay:integer;
  c:integer;
Begin
  RDay:=0;
  day:=low(TDay);
  month0:=low(TMonth);
  writeln('Enter');
  readln(year);
  for k:=1 to year do
  begin
    test:=false;
    for j:=1 to 12 do
    begin
      mass1:=amount_day[month0];
      if month0=feb then
      begin
        if ((k mod 4) = 0) and ((k mod 100) <>0)  then
          RDay:=1
        else
          if ((k mod 400) = 0) then
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
      end;
      RDay:=0;
      write(i-1,' ', j, ' ',k,' ');
      if day=Friday then
        write('Friday')
      else
        if day=Saturday then
          write('Saturday')
        else
          if day=Sunday then
            write('Sunday')
          else
            if day=Monday then
              write('Monday')
            else
              if day=Tuesday then
                write('Tuesday')
              else
                if day=Wednesday then
                  write('Wednesday')
                else
                  write('Thursday');
      writeln;
      month0:=succ(month0);
      if month0=succ(Dec) then
        month0:=low(TMonth);

    end;
    writeln;
  end;















       {if day=Friday then
        write('Friday')
      else
        if day=Saturday then
          write('Saturday')
        else
          if day=Sunday then
            write('Sunday')
          else
            if day=Monday then
              write('Monday')
            else
              if day=Tuesday then
                write('Tuesday')
              else
                if day=Wednesday then
                  write('Wednesday')
                else
                  writeln('Thursday'); }

  readln
End.
