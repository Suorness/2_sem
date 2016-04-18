Program Lab_8_Final;

{$APPTYPE CONSOLE}

Uses
  SysUtils;
Type
  TDay = (Sunday,Monday, Tuesday, Wednesday,Thursday,
  Friday,Saturday,nope);
  TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep,
  Oct, Nov, Dec,nope2);
  TMOnthDay = array[Jan..Dec] of integer;

Const
  amount_day:TMonthDay =(31,28,31,30,31,30,31,31,30,31,30,31);
  test_str = '0123456789';

Var
  Day:TDay;
  month0:TMonth;
  mass1:integer;
  i,j,k,year:integer;
  RDay:integer;
  TH_M,TH_N:integer;
  str:string;
  socer:integer;

Begin
  RDay:=0;
  TH_M:=0;
  TH_N:=0;
  day:=low(TDay);
  month0:=low(TMonth);

  writeln('Enter the year');

  repeat
    readln(str);
    socer:=0;
    for i:=1 to length(str) do
      for j:=1 to length(test_str) do
      if test_str[j]=str[i] then
        socer:=socer+1;
    if (socer<>length(str)) or (length(str)=0) or (length(str)>8) then
      writeln('Incorrect data, repeat')
    else
      if strtoint(str)=0 then
      begin
        socer:=socer+1;
        writeln('Incorrect data, repeat')
      end;
  until (socer=length(str)) and (length(str)<>0) and(length(str)<8);

  year:=strtoint(str);


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
      if TH_M<10 then
        writeln(TH_N:2,'.0', TH_M:1,'.',year)
      else
        writeln(TH_N:2,'.', TH_M:2,'.',year);
    end;
  end;
  readln
End.
