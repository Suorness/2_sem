Program Div_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  input : string ='0123456789';
  ten=10;
  fifty=50;
Var
  str1,str2 : string;
  str3,str_ost : string;
  i,j,length_dividend, length_divider : integer;
  itr_result,copy_sim,temp : integer;
  Arr_dividend : array[1..fifty] of integer;
  Arr_divider : array[1..fifty] of integer;
  Arr_temp_dividend : array[1..fifty] of integer;
  Arr_temp_last_dividend : array[1..fifty] of integer;
  Arr_temp_divider : array[1..fifty] of integer;

  socer : integer;
  Arr_temp : array[1..fifty] of integer;
  Arr_result : array[1..fifty] of integer;
  number_is_negative  : boolean;

Begin
  repeat
    writeln('Enter dividend ');
    readln(str1);
    socer:=0;
    for i:=1 to (length(str1)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(str1[i]) then
          socer:=socer+1;
      if socer<>(length(str1)) then
          writeln('Error retype');
  until (socer=(length(str1)));


  for i:=1 to (length(str1)) do
    Arr_dividend[i]:=strtoint(str1[i]);

  repeat
    writeln('Enter divider ');
    readln(str2);
    socer:=0;
    for i:=1 to (length(str2)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(str2[i]) then
          socer:=socer+1;
      if socer<>(length(str2)) then
        writeln('Error retype');
  until (socer=(length(str2)));

  for i:=1 to (length(str2)) do
    Arr_divider[i]:=strtoint(str2[i]);


   length_dividend :=length(str1);
   length_divider := length(str2);

   //Копируем количество символов, которые будут делиться
   copy_sim:=length_divider;

   while copy_sim <= length_dividend do
   begin
    itr_result:=0;
    //Копируем делимое во временный массив прибаляя новый разряд
    for i:=1 to copy_sim do
    begin
      Arr_temp_dividend[i]:= Arr_dividend[i];
      //Проверка на дописывание нулей для того чтобы поставить нули на места
      if (copy_sim - i >= length_divider) then
        Arr_temp_divider[i]:=0
      else
        Arr_temp_divider[i]:= Arr_divider[i - copy_sim + length_divider]
    end;

    if copy_sim < length_divider then
      number_is_negative:=true
    else
      number_is_negative:=false;

    //Начинаем деление текущей итерации через разность
    while number_is_negative=false do
    begin
      i:=copy_sim;

      while (i>= 1) and (number_is_negative=false) do
      begin
        temp:= Arr_temp_dividend[i] - Arr_temp_divider[i];
        if (temp < 0) then
        begin
          j:=i-1;
          //Заимствование десятка у старшего разряда
          while (Arr_temp_dividend[j] = 0) and (j >= 1) do
          begin
            Arr_temp_dividend[j]:=9;
            j:= j-1;
          end;

          if( j < 1) then
            number_is_negative:= true
          else
          begin
            Arr_temp_dividend[j]:=Arr_temp_dividend[j] - 1;
            temp:= temp + 10;
          end;

        end;

        Arr_temp[i]:= temp;
        i:=i-1;
      end;


      if (number_is_negative=false) then
      begin
        //Сохраняем результаты разности в два массива
        for i:=1 to fifty do
        begin
          Arr_temp_dividend[i]:=Arr_temp[i];
          Arr_temp_last_dividend[i]:=Arr_temp[i];
        end;

        itr_result:=itr_result+1;
      end
      else
      //Перезаписываев часть результат деления в основной массив
      begin
        if(itr_result>0) then
        begin
          for i:=1 to copy_sim do
          begin
            Arr_dividend[i]:=Arr_temp_last_dividend[i];
          end;
        end;
      end;

    end;
    //Запись результата
    Arr_result[copy_sim]:=itr_result;
     
    copy_sim:=copy_sim+1;
   end;


  for i:=1 to copy_sim-1 do
    str3:=str3+inttostr(Arr_result[i]);

  while (ord(str3[1])=48) and(length(str3)<>1) do
    delete(str3,1,1);

  writeln('The integer part = ', str3);

  for i:=1 to copy_sim-1 do
    str_ost:=str_ost+inttostr(Arr_dividend[i]);

  while (ord(str_ost[1])=48) and(length(str_ost)<>1) do
    delete(str_ost,1,1);
  writeln('The residue = ',str_ost);
  readln;
end.




























