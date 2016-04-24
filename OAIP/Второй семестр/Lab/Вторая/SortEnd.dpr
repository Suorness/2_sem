program SortEnd;

{$APPTYPE CONSOLE}

uses
  SysUtils,math,windows;
Const
  ACSize:array[1..6] of integer =
  (100,250,500,1000,2000,3000);
  ACTypeStr:array[1..3] of string =
  ('Случайный','Сортированный','Перевернутый');

Type
  TArray=array of integer;
  TArrayRes=array[1..18,1..4] of integer;

Var
  MassForTest:Tarray;
  i:integer;

  total:TArrayRes;
  column:integer;
  str:integer;
  SizeArray:integer;
  TypeArray:integer;

Procedure Cocktailsort(SortMass:Tarray;SizeArray:integer;
                         var transposition:integer);
Var
  low,high:integer;
  TempValue:integer;
  i:integer;
begin
  //устанавливаем начало и конец массива
  low:=0;
  transposition:=0;
  high:=SizeArray-2;

    while low < high do
    begin
      // проход массива от начала к концу
      for i:=low to high do
      begin
        if  SortMass[i]>SortMass[i+1] then
        begin
          TempValue:=SortMass[i];
          SortMass[i]:=SortMass[i+1];
          SortMass[i+1]:=TempValue;
          inc(transposition);
        end;
      end;
      // отсекли отсортированный элемент
      high:=high-1;
      // проход массива от конца к началу
      for i:= high  downto low do
      begin
        if SortMass[i]>SortMass[i+1] then
        begin
          TempValue:=SortMass[i];
          SortMass[i]:=SortMass[i+1];
          SortMass[i+1]:=TempValue;
          inc(transposition);
        end;
      end;
      // отсекли отсортированный элемент
      low:=low+1;
    end;
end;

procedure QuickSort(SortMass:TArray; SizeArray:integer;
                      var transposition:integer);
Type
  TStak=^TRStak;
  TRStak = record
    data:integer;
    next:TStak;
  end;
var
  LeftBorder,RightBorder,i,j:integer;
  Stack:TStak;
  mid:integer;
  TempValue:integer;

//Помещение в стек

procedure push(var stack:TStak; sender:integer);
Var
  TempValue:TStak;
begin
  new(TempValue);
  TempValue^.data:=sender;
  TempValue^.next:=stack;
  stack:=TempValue;
end;

//Извлечение из стека

procedure pop (Var Receiver:integer;var stack:TStak);
Var
  TempValue:TStak;
begin
  if  stack=nil then
    Receiver:=0
  else
  begin
    TempValue:=stack;
    Receiver:=stack^.data;
    stack:=stack^.next;
    dispose(TempValue);
  end;
end;

begin
  //Основной алгоритм
  transposition:=0;
  Stack:=nil;
  push(Stack,SizeArray-1);
  push(Stack,0);
  repeat
    pop(LeftBorder,Stack);
    pop(RightBorder,Stack);
    if RightBorder-LeftBorder=1 then
    begin
      if  SortMass[LeftBorder]>SortMass[RightBorder] then
      begin
        TempValue:=SortMass[LeftBorder];
        SortMass[LeftBorder]:=SortMass[RightBorder];
        SortMass[RightBorder]:=TempValue;
        inc(transposition);
      end;
    end
    else
    begin
      mid:=SortMass[LeftBorder+((RightBorder-LeftBorder) div 2)];
      i:=LeftBorder;
      j:=RightBorder;
      repeat
        while (mid>SortMass[i]) do
          i:=i+1;
        while (SortMass[j]>mid) do
          j:=j-1;
        if i<=j then
        begin
          TempValue:=SortMass[i];
          SortMass[i]:=SortMass[j];
          SortMass[j]:=TempValue;
          inc(transposition);
          i:=i+1;
          j:=j-1;
        end;
      until i>j;
      if LeftBorder<j then
      begin
        push(Stack,j);
        push(stack,LeftBorder);
      end;
      if i<RightBorder then
      begin
        push(Stack,RightBorder);
        push(stack,i);
      end;
    end;
    until stack=nil;
end;

procedure FillingAnArray( var mass:TArray;SizeArray:integer;TypeFillng:integer);
Var
  i,j:integer;
begin
  setlength(mass,SizeArray);
  randomize;
  //Первый тип -рандом
  if  TypeFillng=1 then
    for i:=0 to SizeArray-1 do
      mass[i]:=random(100)+1
  else
    //второй тип - сортированный
    if TypeFillng=2 then
      for i:=0 to SizeArray-1 do
        mass[i]:=i
    else
    if TypeFillng=3 then
    begin
      J:=SizeArray;
      for i:=0 to SizeArray-1 do
      begin
        dec(j);
        mass[i]:=j;
      end;
    end;
end;

procedure Theoretical_calculation(SizeArray:integer;TypeFilling:integer;
          TypeSort:integer;Var Theoretical:integer );
begin
  Theoretical:=0;
  //Первая сортировка - шейкерная
  if  TypeSort= 1 then
  begin
    //Первый тип -рандом
    if  TypeFilling =1 then
      Theoretical:=Round((SizeArray-1)*SizeArray/4)
  else
    //второй тип - сортированный
    if TypeFilling=2 then
      Theoretical:=0
    else
    if TypeFilling=3 then
      Theoretical:=Round((SizeArray-1)*SizeArray/2);
  end
  else
    //быстраая
    if  TypeSort= 2 then
    begin
    //Первый тип -рандом
    if  TypeFilling =1 then
      Theoretical:=Round(SizeArray*ln(SizeArray)/4)
    else
    //второй тип - сортированный
    if TypeFilling=2 then
      Theoretical:=Round(SizeArray/2)
    else
    if TypeFilling=3 then
      Theoretical:=Round(SizeArray*ln(SizeArray)/12);
  end
end;
begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  str:=1;

  for SizeArray:=1 to 6 do
  begin
    for TypeArray:=1 to 3 do
    begin
      column:=1;
      FillingAnArray(MassForTest,ACSize[SizeArray],TypeArray);
      Cocktailsort(MassForTest,ACSize[SizeArray],total[str,column]);
      inc(column);
      Theoretical_calculation(ACSize[SizeArray],TypeArray,1,total[str,column]);
      inc(column);
      QuickSort(MassForTest,ACSize[SizeArray],total[str,column]);
      inc(column);
      Theoretical_calculation(ACSize[SizeArray],TypeArray,2,total[str,column]);
      inc(column);
      inc(str);
    end;
  end;
  write('_____________________________________________________________');
  writeln('________________________________________');
  write('|Размерность        |          Шейкерная Сортировка          |');
  writeln('          Быстрая Сортировка           |');

  write('|            массива|________________________________________|');
  writeln('_______________________________________|');
  write('|                   |Количество         |Количество          |');
  writeln('Количество          |Количество        |');
  write('|                   |экспериментальное  |теоретическое       |');
  writeln('экспериментальное   |теоретическое     |');
  write('|_____________________________________________________________');
  writeln('_______________________________________|');

  //ячейки
  str:=1;
  For SizeArray:=1 to 6 do
  begin
    for typeArray:=1 to 3 do
    begin
        write('|N =',ACSize[SizeArray]:4,'            |');
        for i:=1 to 4 do
        begin
          if i = 2 then
            write(total[str,i]:20,'|')
          else
            write(total[str,i]:19,'|');
        end;
        writeln;
        write('|',ACTypeStr[typeArray]:19,'|');
        for i:=1 to 4 do
        begin
          if i = 2 then
            write('                    |')
          else
            write('                   |');
        end;
        writeln;
        write('|_____________________________________________________________');
        writeln('_______________________________________|');
        inc(str);
    end;
  end;

  readln;
end.

