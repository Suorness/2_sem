Program Laba_7_2_final;

{$APPTYPE CONSOLE}

Uses
  SysUtils;
Const
  sim_true='qwertyuiopasdfghjklzxcvbnm'+' ,.';

Var
  str:string;
  word:string;
  i,j,k:integer;
  test,test0:boolean;
  socer,socer0:integer;
  ArStr:array[1..50] of string[8];
  str_arr_col:integer;

Begin
  {Ввод последовательности с проверкой ввода}
  writeln('Enter the string');
  repeat
    test:=true;
    readln(str);
    str:=AnsiLowerCase(str);
    {Проверка на наличие данных}
    if length(str)=0 then
      test:=false
    else
    begin
      {Проверка на наличие точки в конце}
      if str[length(str)]<>chr(46) then
        test:=false;
      socer:=0;
      {Проверка на количество точек}
      for i:=1 to length(str) do
      begin
        if str[i]=chr(46) then
          socer:=socer+1;
        test0:=false;
        {Проверка на допустимые символы}
        for j:=1 to length(sim_true) do
          if sim_true[j]=str[i] then
            test0:=true;
        if test0=false then
          test:=false;
      end;

      if socer>1 then
        test:=false;

      socer:=0;
      socer0:=0;
      for i:=1 to length(str) do
      begin
        {Проверка на ограничение размера слова}
        if (str[i]<>chr(32)) and (str[i]<>chr(44)) then
        begin
          socer:=socer+1;
          socer0:=socer0+1;
        end
        else
          socer:=0;
        if socer>8 then
          test:=false;
      end;
      {Проверка на количество слов}
      if socer0=length(str) then
        test:=false;
    end;

    if test = false then
      writeln('Incorrect data retype');
  until test;

  socer:=0;
  i:=1;
  j:=1;
  while str[i]<>chr(46) do
  begin
    word:='';
    while (str[i]<>chr(32)) and (str[i]<>chr(44)) and (str[i]<>chr(46))  do
    begin
      word:=word + str[i];
      i:=i+1;
    end;
    ArStr[j]:=word;
    str_arr_col:=j;
    j:=j+1;
    if str[i]<>chr(46) then
      i:=i+1;
  end;
  for i:=1 to str_arr_col-1 do
  begin
    test:=true;
    if ArStr[i]=ArStr[str_arr_col] then
      test:=false
    else
    begin
      for j:=1 to length(ArStr[i]) do
        for k:=length(ArStr[i]) downto j+1 do
          if ArStr[i][j]=ArStr[i][k] then
            test:=false;
       if test then
       begin
        writeln(ArStr[i]);
        socer:=socer+1;
       end;
    end;
  end;
  if socer=0 then
    writeln('No matching words');
  readln;
  
End.
