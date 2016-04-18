Program V1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  input : string ='0123456789';
  ten=10;
Var
  input_dividend,input_divider : string;
  i,j,ten_flag,lenth_dividend, lenth_divider, current_result_number, current_start_index, copy_count,diff : integer;
  Arr_dividend : array[1..50] of integer;
  Arr_divider : array[1..50] of integer;
  Arr_temp_devived : array[1..50] of integer;
  Arr_temp_last_devived : array[1..50] of integer;
  Arr_temp_divider : array[1..50] of integer;

  Arr_temp : array[1..50] of integer;
  Arr_temp2 : array[1..50] of integer;
  Arr_result : array[1..50] of integer;
  test,test1,test2,test3, number_is_negative  : boolean;
  socer,socer_0,socer_R : integer;
Begin
  repeat
    writeln('Enter dividend ');
    readln(input_dividend);
    socer:=0;
    for i:=1 to (length(input_dividend)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(input_dividend[i]) then
          socer:=socer+1;
      if socer<>(length(input_dividend)) then
          writeln('Error retype');
  until (socer=(length(input_dividend)));


  for i:=1 to (length(input_dividend)) do
    Arr_dividend[i]:=strtoint(input_dividend[i]);

  repeat
    writeln('Enter divider ');
    readln(input_divider);
    socer:=0;
    for i:=1 to (length(input_divider)) do
      for j:=1 to (length(input)) do
        if (chr(ord(input[j])))=(input_divider[i]) then
          socer:=socer+1;
      if socer<>(length(input_divider)) then
        writeln('Error retype');
  until (socer=(length(input_divider)));

  for i:=1 to (length(input_divider)) do
    Arr_divider[i]:=strtoint(input_divider[i]);
   
   
   lenth_dividend :=length(input_dividend);
   lenth_divider := length(input_divider);

   copy_count:=  lenth_divider;  // колличество цифр для копирования
   while copy_count <= lenth_dividend do
   begin
   
       current_result_number:=0; //хранит результат текущей итерации деления
       
       for i:=1 to copy_count do //получаем число из делимого (оно становится больше на 1 разряд каждую итерацию)
       begin
          Arr_temp_devived[i]:= Arr_dividend[i];
          if (copy_count - i >= lenth_divider) then //дописываем нули в начале если разрядность делителя меньше
             Arr_temp_divider[i]:=0
          else
             Arr_temp_divider[i]:= Arr_divider[i - copy_count + lenth_divider] 
       end;



       number_is_negative:= copy_count < lenth_divider; //флаг показывающий отрицательная ли разность
       while number_is_negative=false do //деление в текущей итерации (разностью)
           begin
           i:=copy_count;
           while (i>= 1) and (number_is_negative=false) do
           begin
              diff:= Arr_temp_devived[i] - Arr_temp_divider[i];
              if (diff < 0) then
              begin
                j:=i-1;

                while (Arr_temp_devived[j] = 0) and (j >= 1) do
                begin
                   Arr_temp_devived[j]:=9;
                   j:= j-1;
                end;

                if( j < 1) then
                   number_is_negative:= true
                else
                begin
                   Arr_temp_devived[j]:=Arr_temp_devived[j] - 1;
                   diff:= diff + 10;
                end;
              end;

              Arr_temp[i]:= diff;
              i:=i-1;
           end;

         if (number_is_negative=false) then //проверяем что число не отрицательное и если это так копируем результат
         begin
             for i:=1 to 50 do //положим в делимое результат разности, а также сохраним его на случай если это было последнее положительное число в этой итерации
             begin
                Arr_temp_devived[i]:=Arr_temp[i];
                Arr_temp_last_devived[i]:=Arr_temp[i];
             end;
                                 
             current_result_number:=current_result_number+1;
         end
         else
         begin
             if(current_result_number>0) then //возвращаем остаток в делимое, для переиспользования в цикле, только если делимое изменялось
             begin
                 for i:=1 to copy_count do 
                 begin
                    Arr_dividend[i]:=Arr_temp_last_devived[i];
                 end;
             end;
         end;
         
       end;
       
       Arr_result[copy_count]:=current_result_number; //записываем в массив результатов текущее деление
       copy_count:=copy_count+1;
   end;


   for i:=1 to copy_count-1 do
   write(Arr_result[i]);

   writeln('');
   write('ost:');
   for i:=1 to copy_count-1 do
   write(Arr_dividend[i]);



  {socer :=1;
  socer_0:=0;
  socer_R:=1;
  test1:=false;
  test:=false;
  test2:=true;
  test3:=false;

  while socer<=(length(input_dividend)) do
  begin

    test3:=false; //разность
    if test2 then    //во временный массив
    begin
      arr_temp[socer]:=Arr_dividend[socer];
      test2:=false
    end;
    //socer:=socer+1;
    if test1 then
    begin
      for i:=(length(input_divider)+socer_0) downto 1 do
        Arr_divider[i+1]:=Arr_divider[i];
      Arr_divider[1]:=0;
      test1:=false;
    end;


    while test3=false do
    begin
      for i:=(length(input_divider)+socer_0) downto 1 do
      begin
        ten_flag:=0;
        if (Arr_temp[i]<Arr_divider[i]) and (i<>1)   then
        begin
          arr_temp[i-1]:=arr_temp[i-1]-1;
          ten_flag:=1;
        end;
        Arr_temp2[i]:= arr_temp[i]-arr_divider[i]+ten*ten_flag;
      end;
      if (arr_temp2[1]<0) then
      begin
         socer:=socer+1;
        if (test=false) and (socer<=(length(input_dividend)))  then
          Arr_result[socer_R]:=0;

        socer_R:=socer_R+1;
        test1:=true;
        test2:=true;
        test3:=true;
      end
      else
      begin
        Arr_result[socer_R]:=Arr_result[socer_R]+1;
        test:=true;
        for j:=1 to socer do
          Arr_temp[j]:=arr_temp2[j];
      end;
    end;
  end;
  for i:=1 to socer_r do
  write(Arr_result[i]);   }
  readln;
  end.




























