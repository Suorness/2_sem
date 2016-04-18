Program Multiplication;
{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Const
  ten=10;
  fifty=50;
  null=48;

Var
  str1,str2,str3 : string[fifty];
  ArStr1,ArStr2,ArStr3,ArStrTemp : array[1..fifty] of integer;
  temp0,temp : integer;
  test : boolean;
  sim : char;
  i,j,v,k : integer;
Begin
  //Подключаем русский язык
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //вводим 2 числа с проверкой на отрицательность
  repeat
    writeln('Введите первое число');
    readln(str1);
    test:=true;
    for i:=1 to length(str1) do
    begin
      if (ord(str1[i])<48) or (ord(str1[i])>58) then
        test:=false;
    end;
    if test=false then
      writeln('Ошибка ввода, повторите ввод');
  until test=true;

  repeat
    writeln('Введите второе число');
    readln(str2);
    test:=true;
    for i:=1 to length(str2) do
    begin
      if (ord(str2[i])<48) or (ord(str2[i])>58) then
        test:=false;
    end;
    if test=false then
      writeln('Ошибка ввода, повторите ввод');
  until test=true;

  //переворачиваем строку для удобного вычисления
  for i:=1 to (length(str1) div 2) do
  begin
    sim:=str1[i];
    str1[i]:=str1[length(str1)-i+1];
    str1[length(str1)-i+1]:=sim;
  end;
  
  for i:=1 to (length(str2) div 2) do
  begin
    sim:=str2[i];
    str2[i]:=str2[length(str2)-i+1];
    str2[length(str2)-i+1]:=sim;
  end;

  //переводим в массивы
  for i:=1 to length(str1) do
    ArStr1[i]:=strtoint(str1[i]);
  for i:=1 to length(str2) do
    ArStr2[i]:=strtoint(str2[i]);
  //начинаем умножение
  for i:=1 to fifty do
  begin
    temp:=0;
    for j:=1 to fifty do
    begin
      temp0:=ArStr2[i]*ArStr1[j]+temp;
      temp:=temp0 div ten;
      ArStrTemp[j]:= temp0 mod ten;
    end;

    if i>1 then
    begin
      for v:=(i-1) downto 1 do
      begin
        for j:=(fifty) downto 1 do
          ArStrTemp[j+1]:=ArStrTemp[j];
        ArStrTemp[1]:=0;
      end;
    end;
    temp:=0;
    for k:=1 to (fifty) do
    begin
      temp0:= ArStr3[k]+ArStrTemp[k]+temp;
      temp:=temp0 div ten;
      ArStr3[k]:=temp0 mod ten;
    end;
  end;

  str3:='';

  //для удобного вывода преобразуем массив в строку
  for i:=1 to fifty do
  begin
    str3:=str3+inttostr(ArStr3[i]);
  end;
  //подготавливаем строку для вывода
  // возвращаем в привычный вид
  for i:=1 to (length(str3) div 2) do
  begin
    sim:=str3[i];
    str3[i]:=str3[length(str3)-i+1];
    str3[length(str3)-i+1]:=sim;
  end;
  // проверка на нули
  while (ord(str3[1])=null) and(length(str3)<>1) do
  begin
    delete(str3,1,1);
  end;

  write('Результат умножения = ');
  writeln(str3);
  readln;
End.

