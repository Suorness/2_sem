Program Lab_6;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Const
  str=9;
  col=7+1;

Var
  Arr_opening:array[0..str,0..col] of integer;
  i,j,k,temp:integer;


Begin
  writeln('Initial data');
  writeln('==================================');
  {Создание массива заполненного случайными значениями [0;49]}
  randomize;
  i:=1;
  while(i<=str) do
  begin
    j:=1;
    while(j<=(col-1)) do
    begin
      Arr_opening[i,j]:=random(50);
      write(Arr_opening[i,j]:3);
      write(' ');
      j:=j+1;
    end;
    writeln;
    i:=i+1;
  end;
  writeln('==================================');
  writeln;
  writeln('First sorting');
  writeln('==================================');

  {Сортировка строк массива
  методом простой вставки с барьерным элементом}

  k:=1;
  while(k<=str) do
  begin
    i:=2;
    while(i<=col-1) do
    begin
      Arr_opening[k,0]:=Arr_opening[k,i];
      j:=i-1;
      {Сравнение чисел
      Если <=, то младший элемент становится в нужную позицию}
      while (Arr_opening[k,j]>Arr_opening[k,0]) do
      begin
        Arr_opening[k,j+1]:=Arr_opening[k,j];
        j:=j-1;
      end;
      Arr_opening[k,j+1]:=Arr_opening[k,0];
      i:=i+1;
    end;
    {Запись минимального элемента}
    Arr_opening[k,col]:=Arr_opening[k,1];
    k:=k+1;
  end;


  {Вывод значений массива после сортировки строк}
  i:=1;
  while(i<=str) do
  begin
    j:=1;
    while(j<=col) do
    begin
      write(Arr_opening[i,j]:3);
      write(' ');
      if j=col-1 then
        write(' | ');
      j:=j+1;
    end;
    i:=i+1;
    writeln;
  end;

  writeln('==================================');
  writeln;
  writeln('The second sorting');
  writeln('==================================');

  {Сортировка пузырьком}
  {Сортировка строк массива по убыванию минимальных элементов
  в строке}

  j:=1;
  while(j<=str-1) do
  begin
    i:=1;
    while(i<=str-j) do
    begin
      if Arr_opening[i,col]<Arr_opening[i+1,col] then
      begin
        k:=1;
        while (k<=col) do
        begin
          temp:=Arr_opening[i,k];
          Arr_opening[i,k]:=Arr_opening[i+1,k];
          Arr_opening[i+1,k]:=temp;
          k:=k+1;
        end;
      end;
      i:=i+1;
    end;
    j:=j+1;
  end;

  {Вывод значений массива после второй сортировки}
  i:=1;
  while(i<=str) do
  begin
    j:=1;
    while(j<=col) do
    begin
      write(Arr_opening[i,j]:3);
      write(' ');
      if j=col-1 then
        write(' | ');
      j:=j+1;
    end;
    i:=i+1;
    writeln;
  end;
  
  writeln('==================================');

  readln
End.
