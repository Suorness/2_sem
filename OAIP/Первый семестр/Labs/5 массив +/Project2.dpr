program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N=6; M=5;
  X: Array[1..N,1..M] of integer = ((-3 ,5 ,3,-64,-4),
                                    (-7 , -9 , -4,-12,-5),
                                    (12 , 3 ,-2,  5, 9),
                                    (-3 , 5 ,-3, 64, 4),
                                    (-7 ,-9 , 4,-12,-5),
                                    (12 , 3 ,-2,  5, 9));
Var
  X1: Array[1..N,1..M] of integer;
  scorer_0 : integer; //счетчик строки
  scorer_1 : integer; //счетчик столбца
  i,j,k,min,max,l:integer;
  // k строка, которую надо удалить
  // l столбец, который надо удалить
Begin

  min:=0;
  k:=1;
  max:=0;
  l:=1;
  for i:=1 to N do
  begin
    scorer_0:=0;
    for j:=1 to M do
    begin
      x1[i,j]:=x[i,j];
      if x[i,j]<0 then
        scorer_0:=scorer_0+1;
      if scorer_0>min then
      begin
        min:=scorer_0;
        k:=i;
      end;
      write(x[i,j],' ');
    end;
    writeln;
  end;
  for j:=1 to M do
  begin
    scorer_1:=0;
    for i:=1 to N do
    begin
      if x[i,j]>0 then
        scorer_1:=scorer_1+1;
      if scorer_1>max then
      begin
        max:=scorer_1;
        l:=j
      end;
    end;
  end;
   writeln('column -', l);
  writeln('string - ',k);
  for j:=1 to M do
  begin
    for i:=k to N do
    begin
      if i<>n then
      x1[i,j]:= x[i+1,j]
      else
      x1[i,j]:=0;
    end;
  end;
  for i:=1 to N do
  begin
   for j:=1 to M do
     write(x1[i,j],' ');
   writeln;
  end;
 
  readln;


end.
