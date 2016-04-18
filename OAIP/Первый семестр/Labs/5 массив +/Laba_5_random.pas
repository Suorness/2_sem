Program Laba_5_random;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Const
  {Определение размерности массива}
  length_col=5;
  length_str=6;

Type 
  AR=Array[1..length_col,1..length_str] of integer;

Var
  Arr,Arr_new : AR;
  scorer_str,scorer_col : integer;
  i,j : integer;
  max_in_str,max_in_col : integer;
  str,col : integer;
  shift_str,shift_col : integer;

Begin
  {Генерация случайных чисел в диапазоне [-5;5]}
  randomize;
  for i:=1 to length_col do
    for j:=1 to length_str do
      Arr[i,j]:= random(10)-5;


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
  writeln('column - ', col);

  readln;


End.
