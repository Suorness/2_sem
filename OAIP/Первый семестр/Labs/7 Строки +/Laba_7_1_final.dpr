Program Laba_7_1_final;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Const
  sim_true='qwertyuiopasdfghjklzxcvbnm'+' ,.';

Var
  str,str_temp:string;
  last_word,word:string;
  i,j,k:integer;
  sim:char;
  test,test0:boolean;
  socer,socer0:integer;
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


  str_temp:=str;
  {Нахождение последнего слова}
  {Переворот строки}
  for i:=1 to (length(str_temp) div 2) do
  begin
     sim:=str_temp[i];
     str_temp[i]:=str_temp[length(str_temp)-i+1];
     str_temp[length(str_temp)-i+1]:=sim;
  end;
  {Поиск конца слова}
  i:=2;
  while (str_temp[i]<>chr(32)) and (str_temp[i]<>chr(44)) do
  begin
    last_word:=last_word + str_temp[i];
    i:=i+1;
  end;
  {Переворот слова}
  for i:=1 to (length(last_word) div 2) do
  begin
     sim:=last_word[i];
     last_word[i]:=last_word[length(last_word)-i+1];
     last_word[length(last_word)-i+1]:=sim;
  end;
  {Нахождение и вывод слов подходящих под условие}
  i:=1;
  socer:=0;
  while str[i]<>chr(46) do
  begin
    word:='';
    while (str[i]<>chr(32)) and (str[i]<>chr(44)) and (str[i]<>chr(46))  do
    begin
      word:=word+str[i];
      i:=i+1;
    end;
    test:=true;
    if word<>last_word then
    begin
      for j:=1 to length(word) do
        for k:=length(word) downto j+1 do
          if word[j]=word[k] then
            test:=false;

      if test then
      begin
        writeln(word);
        socer:=socer+1;
      end;
    end;

    if str[i]<>chr(46) then
      i:=i+1;
  end;
  
  if socer=0 then
    writeln('No matching words');
  readln;
  
End.
