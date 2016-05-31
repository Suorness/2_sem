program Laba_9;

{$APPTYPE CONSOLE}

uses
  SysUtils,windows;

Var
  str:string;
  correctly:boolean;

procedure Checking_Sum(str:string;var correctly:boolean);
Const
  Numbers=['0','1','2','3','4','5','6','7','8','9'];
Var
  i:integer;
  strContinue:string;

begin
  i:=1;
  while (str[i]<>'.') and (str[i]<>'+') and (str[i]<>'-') do
  begin
    if (str[i]  in Numbers) then
    begin
      inc(i);
    end
    else
    begin
      correctly:=false;
      str[i]:='.';
    end;
  end;

  if (str[i]='+') or (str[i]='-') then
  begin
    if i<>1 then
    begin
      strContinue:=copy(str,i+1,length(str)-i);
      Checking_Sum(strContinue,correctly);
    end
    else
    begin
      correctly:=false;
      str[i]:='.';
    end;
  end;

  if ((str[i]='.') and (i<>length(str))) or (length(str)=1)  then
  begin
    correctly:=false;
  end

end;

begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  writeln('Введите текст для определения соответсвую  <Сумма>');
  writeln('<Сумма>::=<Целое>|(<Сумма><Знак_операции><Целое>).');
  writeln('<Целое>::=<Цифра>{<Цифра>}.');
  writeln('<Знак_операции>::=+|-.');
  readln(str);
  correctly:=true;
  if str[length(str)]='.' then
    Checking_Sum(str,correctly)
  else
    correctly:=false;
  if correctly then writeln('Корректно')
  else writeln('Некорректно');
  readln;

end.
