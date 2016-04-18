Program Laba_5_TConst;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Const
  {Определение размерности массива}
  length_col=6;
  length_str=5;


Const
  {Обьявление и инициализация  массива}
  Arr : Array[1..length_col,1..length_str] of integer =
  (( 11 , 12 , 13, 14,-15),
   (-21 ,-22 , 23,-24, 25),
   ( 31 ,-32 , 33, 34,-35),
   ( 41 ,-42 , 43, 44, 45),
   ( 51 , 52 ,-53,-54, 55),
   ( 61 , 62 , 63, 64, 65));

Var
  Arr_new : Array[1..length_col,1..length_str] of integer;
  scorer_str,scorer_col : integer;
  i,j : integer;
  max_in_str,max_in_col : integer;
  str,col : integer;
  shift_str,shift_col : integer;

Begin

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
