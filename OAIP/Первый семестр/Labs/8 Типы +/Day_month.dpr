Program Day_month;

{$APPTYPE CONSOLE}

uses
  SysUtils;

//jan 31   feb 28/29   mar 31   apr 30   may 31   jun 30 jul 31   aug 31   sep 30   oct 31   nov 30   dec 31

Type
  TDay = (Saturday, Sunday, Monday, Tuesday, Wednesday,  Thursday,  Friday,nope);
  TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec,nope2);
  TMOnthDay = array[Jan..Dec] of integer;

Const
  amount_day:TMonthDay =(31,28,31,30,31,30,31,31,30,31,30,31);

Var
  Day:TDay;
  month0:TMonth;
  month: TMonthDay;
  mass1:integer;
  i,j:integer;

Begin

  day:=low(TDay);
  month0:=low(TMonth);

  for j:=1 to 4 do
  begin
    mass1:=amount_day[month0];
    writeln(mass1);
    for i:=1 to mass1 do
    begin
    write(i,' ', j, ' ');
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
                writeln('Thursday');

      day:=succ(day);
      if day=succ(friday) then
        day:=low(TDay);
      writeln;
    end;
    month0:=succ(month0);
    {day:=succ(day);
      if day=succ(friday) then
        day:=low(TDay); }
   end;





















  writeln('now = ');

  if day=Friday then
    writeln('Friday')
  else
    if day=Saturday then
      writeln('Saturday')
    else
      if day=Sunday then
      writeln('Sunday')
    else
    if day=Monday then
      writeln('Monday')
    else
    if day=Tuesday then
      writeln('Tuesday')
    else
    if day=Wednesday then
      writeln('Wednesday')
    else
      writeln('Thursday');
     writeln(mass1);











  {Day:=low(tday);
  //month:=low(tmonthday);
  if day=monday then
    writeln('work')
  else
  writeln('don t work');
  day:=succ(day);
  if day=Tuesday then
    writeln('work')
  else
  writeln('don t work');
  writeln(amount_day[Jan]);
  mass1:=amount_day[succ(jan)]+2;
  writeln(mass1); }




  readln
End.
