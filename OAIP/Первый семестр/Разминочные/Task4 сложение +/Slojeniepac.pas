Program Slojeniepac;
{$APPTYPE CONSOLE}

Uses
  SysUtils,
  windows;

Var str0,str1,str2:string;
    sim0,sim1,sim2,a,b,c,i,k,g:integer;
    sim:char;
{str0-конечный результат
 str1-первое число
 str2-второе число
 sim0-количество символов 3 строки
 sim1-количество символов первой строки
 sim2-количество символов второй строки
 а,b,c- промежуточные значения, которые принимают вид одного символа
 k-переходящий десяток при сложении
 g-разность строк
 sim-используем при перевороте числа, как сохранение символа     }
Begin
  //Подлючаем русский язык
  setconsoleoutputcp(1251);
  setconsolecp(1251);
  //вводим 2 числа
  writeln('Введите первое число');
  readln(str1);
  writeln('Введите второе число');
  readln(str2);
  // рассчет количества символов
  sim1:=length(str1);
  sim2:=length(str2);
  sim0:=0;
 (*присваем  максимальное количество символов
   конечной строке и выравниваем количество сиволов
   во второй строке*)
  if sim1>sim2 then
  begin
    sim0:=sim1;
    g:=sim1-sim2;
    for i:=1 to g do
    str2:='0'+str2;

  end;
  if sim1<sim2 then
  begin
    sim0:=sim2;
    g:=sim2-sim1;
    for i:=1 to g do
    str1:='0'+str1;
    str0:=str2;
  end;
  if sim1=sim2 then
  sim0:=sim1;
  str0:=str2;

  //переворачиваем  первое число
  for i:=1 to (length(str1) div 2) do
  begin
    sim:=str1[i];
    str1[i]:=str1[length(str1)-i+1];
    str1[length(str1)-i+1]:=sim;
  end;
  //переворачиваем  второе число
  for i:=1 to (length(str2) div 2) do
  begin
    sim:=str2[i];
    str2[i]:=str2[length(str2)-i+1];
    str2[length(str2)-i+1]:=sim;
  end;
  k:=0;
  // начинаем складывать числа
  for i:=1 to sim0 do
  begin
    //преобразуем один символ строки в число
    a:=strtoint(str1[i]);
    b:=strtoint(str2[i]);
    //складываем числа
    c:=b+a+k;
    k:=0;
    // проверка на прибавление нового разряда
    if (i=sim0) and (c>=10) then
    str0:=str0+'1';
    //проверка на переход десятка
    if c>=10 then
    begin
      k:=1;
      c:=c-10;
    end;
    //преобразуем чисвло в один символ строки
    str0[i]:=inttostr(c)[1];
  end;
  //переварачиваем число в исходную форму
  for i:=1 to (length(str0) div 2) do
  begin
    sim:=str0[i];
    str0[i]:=str0[length(str0)-i+1];
    str0[length(str0)-i+1]:=sim;
  end;
  writeln('Результат сложения');
  writeln(str0);
  readln;
readln;
end.
