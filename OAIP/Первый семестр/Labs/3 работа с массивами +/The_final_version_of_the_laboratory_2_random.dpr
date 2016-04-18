Program The_final_version_of_the_laboratory_2_random;

{$APPTYPE CONSOLE}
Uses
  SysUtils;

Const
  five = 5;

Var
  Arr : array[1..five] of integer;
  i,j,scorer,scorer_2 : integer;
  test : boolean;

Begin
  //¬вод данных
  for i:=1 to five do
  begin
   Randomize;
   arr[i]:=random(5);
   writeln(arr[i]);
  end;
  // —ортировка данныз
  for j:=1 to (five-1) do
    for i:=1 to (five-j) do
      if Arr[i]>Arr[i+1] then
      begin
        Arr[i+1]:=Arr[i+1]+Arr[i];
        Arr[i]:=Arr[i+1]-Arr[i];
        Arr[i+1]:=Arr[i+1]-Arr[i];
      end;
  scorer:=1;
  scorer_2:=1;
  i:=1;
  test:=true;
  //анализ данных
  while i<=five do
  begin
    if test then
    begin
      if Arr[i]=Arr[i+1] then
        scorer:=scorer+1
      else
      if scorer>=2 then
        test:=false
    end
    else
    if Arr[i]=Arr[i+1] then
      scorer_2:=scorer_2+1;

    i:=i+1;
  end;
  //вывод нужного значени€
  writeln('Result');
  if (scorer=5) then
    writeln('1');
  if (scorer=4) then
    writeln('2');
  if (scorer=3) and (scorer_2=2) then
    writeln('3');
  if (scorer=3)and (scorer_2<>2) then
    writeln('4');
  if (scorer=2) and (scorer_2=2) then
    writeln('5');
  if (scorer=2)and (scorer_2<>2) then
    writeln('6');
  if (scorer=1) then
    writeln('7');

  readln;

End.

