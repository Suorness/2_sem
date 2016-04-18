Program kri;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Var
  countKri,countProcces:integer;
  outStr,str:string;
  entertest:boolean;
  i:integer;

procedure mainbody(countKri:integer;outstr:string; var countProcces:integer);
begin
  if (countKri = 2) or (countKri = 4) then
    mainbody(countKri-2,outStr+'и',countProcces)
  else
    if (countKri=3)then
      mainbody(countKri-3,outStr+'ш',countProcces)
    else
      if countKri=0 then
      begin
        inc(countProcces);
        writeln(outStr);
      end
      else
      begin
        mainbody(countKri-2,outStr+'и',countProcces);
        mainbody(countKri-3,outStr+'ш',countProcces);
      end;
end;


begin
  {Подключение языка}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  {Ввод начального значения}
  writeln('Введите количество крючков:');
  repeat
    readln(str);
    entertest:=true;
    for i:=1 to length(str) do
      if (ord(str[i])>58) or (ord(str[i])<47) then
        entertest:=false;
      if entertest then
      begin
        countKri:=strtoint(str);
        if (countKri=0) or (countKri=1) then
        begin
          writeln('Невозможно составить слово');
          writeln('Попробуйте еще раз');
          entertest:=false;
        end;
      end
      else
        writeln('Некорректный ввод, повторите ввод');
  until entertest;
  countProcces:=0;
  outStr:='';
  mainbody(countKri,outStr,CountProcces);
  writeln('Количество вариантов слов: ', CountProcces);
  readln;
end.
