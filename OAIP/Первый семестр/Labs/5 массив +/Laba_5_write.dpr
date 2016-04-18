Program Laba_5_write;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Const
  {Определение размерности массива}
  length_col=3;
  length_str=3;
  input : string ='0123456789';

Type 
  AR=Array[1..length_col,1..length_str] of integer;

Var
  Arr : AR;
  Arr_new : AR;
  scorer_str : integer;
  scorer_col : integer;
  i,j,k,v : integer;
  str,col : integer;
  max_in_str,max_in_col : integer;
  shift_str,shift_col : integer;
  socer : integer;
  input_str : string;

Begin
  {Инициализация  массива}
  for i:=1 to length_col do
    for j:=1 to length_str do
    repeat
      writeln('Enter element ',i*10+j);
      readln(input_str);
      socer:=0;
      if (input_str[1])=(chr(45)) then
        socer:=socer+1;
      if (socer=1) and ((length(input_str))=1) then
        socer:=socer+1;
      for k:=1 to (length(input_str)) do
        for v:=1 to (length(input)) do
          if (chr(ord(input[v])))=(input_str[k]) then
            socer:=socer+1;
      if socer<>(length(input_str)) then
        writeln('Error retype')
      else
        Arr[i,j]:=strtoint(input_str);
    until (socer=(length(input_str)));


  max_in_str:=0;
  str:=1;
  max_in_col:=0;
  col:=1;

  {Поиск нужного столбца}
  for i:=1 to length_col do
  begin
    scorer_str:=0;
    for j:=1 to length_str do
    begin
      if Arr[i,j]<0 then
        scorer_str:=scorer_str+1;
      if scorer_str>max_in_str then
      begin
        max_in_str:=scorer_str;
        str:=i;
      end;
      if (Arr[i,j])>=0 then
        write(' ', Arr[i,j],' ')
      else
        write(Arr[i,j],' ');
    end;
    writeln;
  end;

  {Поиск нужной строки}
  for j:=1 to length_str do
  begin
    scorer_col:=0;
    for i:=1 to length_col do
    begin
      if Arr[i,j]>0 then
        scorer_col:=scorer_col+1;
      if scorer_col>max_in_col then
      begin
        max_in_col:=scorer_col;
        col:=j
      end;
    end;
  end;

  writeln;


  {Cдвиг и вывод}
  for i:=1 to (length_col-1) do
  begin
    shift_str:=0;
    shift_col:=0;
    if i>=str then
      shift_str:=1;
    for j:=1 to (length_str-1) do
    begin
      if j>=col then
        shift_col:=1;
      Arr_new[i,j]:=Arr[i+shift_str,j+shift_col];
      if (Arr_new[i,j])>=0 then
        write(' ', Arr_new[i,j],' ')
      else
        write(Arr_new[i,j],' ');
    end;
    writeln;
  end;
  
  writeln;
  writeln('string - ',str);
  writeln('column -', col);

  readln;


End.
