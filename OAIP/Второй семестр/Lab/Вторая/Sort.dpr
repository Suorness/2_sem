program Sort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  TArray=array of integer;


Var
  SortMass:Tarray;
  i:integer;
Procedure Cocktailsort(var SortMass:Tarray;SizeArray:integer);
Var
  low,high:integer;
  TempValue:integer;
  i:integer;
begin
  //устанавливаем начало и конец массива
  low:=0;
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
        end;
      end;
      // отсекли отсортированный элемент
      low:=low+1;
    end;
end;

procedure QuickSort(var SortMass:TArray; SizeArray:integer);
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

begin
  setlength(SortMass,100);
  randomize;
  for i:=0 to 99 do
  begin
    SortMass[i]:=random(50)+1;;
    write(SortMass[i]:3,' ');
    if (i mod 10)=0 then
      writeln;
  end;
  writeln;
  writeln('==================TEST================');
  writeln;
  //Cocktailsort(SortMass,100);
  //QuickSort(SortMass,100);
  for i:=0 to 99 do
  begin
    write(SortMass[i]:3,' ');
    if (i mod 10)=0 then
      writeln;
  end;
  readln;
end.
