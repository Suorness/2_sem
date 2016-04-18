program TaskOne;

{$APPTYPE CONSOLE}
uses
  SysUtils;

var
Monax10, monax5, monax05:integer;

(* Monax10 - Кол-во монахов, которые едят по 10 и счетчик цикла
   monax5 -  Кол-во монахов, которые едят по 5 и счетчик цикла
   monax05 - Кол-во монахов, которые едят по 0.5  *)

begin
  for Monax10:= 0 to 10 do
       {Если счетчик цикла будет больше 10, то решение
        выйдет за пределы условия задачи}
    begin
      for monax5:=0 to 20 do
      {Если счетчик цикла будет больше 20, то решение
        выйдет за пределы условия задачи}
      begin
          monax05:=100-Monax10-monax5;     // рассчет третих монахов
          if Monax10+monax5+monax05=100 then          //Две проверки условия
              if Monax10*10+monax5*5+monax05*0.5=100  then
              begin  // вывод результатов
                writeln ('Monaxi po 10 = ' ,Monax10);
                writeln ('Monaxi po 5 = ' ,monax5);
                writeln ('Monaxi po 0.5 = ' ,monax05);

              end;
      end;
    end;
readln;
end.


