program Cipher2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  math;

Type
  TArD=array of array of char;
  TStat = 1..4;
Var
  lengthAr:integer;
  frontstring:string;
  NArray,totalArray:TArD;
  totalstr:string;
  status,firststatus:TStat;
  direction:integer;
  first:boolean;
{Создание и заполнение массива значениями из строки}
procedure createarray(enterstring:string;first:boolean;
                      var NArray:TArD;var lengthAr:integer);
var
  i,j,border:integer;
begin
  lengthAr:=ceil(sqrt(length(enterstring)));
  if (lengthAr mod 2)= 0 then
    lengthAr:=lengthAr+1;
  setlength(NArray,lengthAr,lengthAr);
  if first then
  begin
  border:=1;
    for i:=0 to lengthAr-1 do
      for j:=0 to lengthAr-1 do
      begin
        if border <= length(enterstring) then
          NArray[i,j]:=enterstring[border]
        else
          NArray[i,j]:=' ';

        border:=border+1;
      end;
  end;
end;

procedure print(NArray:TArD);
var
  i,j:integer;
begin
  for i:=0 to lengthAr-1 do
  begin
    for j:=0 to lengthAr-1 do
    begin
      write(NArray[i,j],' ');
    end;
    writeln;
  end;
end;

procedure createstr(CArray:TArD;lengthStrInAr:integer; var totalstr:string);
var
  i,j:integer;
begin
  totalstr:='';
  for i:=0 to lengthStrInAr-1 do
    for j:=0 to lengthStrInAr-1 do
      totalstr:=totalstr + CArray[i,j]
end;



{Шифрование}
procedure cypher(CArray:TArD;lengthAr,sim:integer;status:TStat;
                  var totalstr:string;direction:integer);
Var
  centr,x,y,number,step,range,rangestep:integer;
begin
  totalstr:='';
  centr:=(sqr(lengthAR)+1) div 2;
  x:=ceil(centr/lengthAr);
  y:= centr mod lengthAr;
  randomize;
  number:=1;
  writeln('first status ',status);
  writeln('direction ',direction); //0 против 1 по
  {step - сколько шагов сделано в закономерности <2}
  step:=0;
  {range - зависимое значение от step, барьер для rangestep}
  range:=1;
  rangestep:=1;
  totalstr:=totalstr + CArray[y-1,x-1];
  while number<sqr(lengthAR) do
  begin
    while (rangestep<=range) and (number<sqr(lengthAR)) do
    begin
      if status = 1 then       //up
        dec(y)
      else
        if status =2 then    //left or rigth
        begin
          if direction=0 then
            dec(x)
          else
            inc(x);
        end
        else
          if status = 3 then    //down
            inc(y)
          else
            if status = 4 then      //rigth  or left
            begin
              if direction=0 then
                inc(x)
              else
                dec(x);
            end;
      totalstr:=totalstr + CArray[y-1,x-1];
      inc(rangestep);
      inc(number);
    end;
    inc(step);
    rangestep:=1;
    inc(status);
    if step>=2 then
    begin
      inc(range);
      step:=0;
    end;
    if status>4 then
      status:=low(status);
  end;
end;

procedure uncypher(CArray:TArD;lengthAr,sim:integer;
                  var totalstr:string;status:TStat;direction:integer);
Var
  centr,x,y,number,step,range,rangestep:integer;
begin
  centr:=(sqr(lengthAR)+1) div 2;
  x:=ceil(centr/lengthAr);
  y:= centr mod lengthAr;
  number:=1;
  {step - сколько шагов сделано в закономерности <2}
  step:=0;
  {range - зависимое значение от step, барьер для rangestep}
  writeln('first status ',status);
  writeln('direction ',direction);
  range:=1;
  rangestep:=1;
  CArray[y-1,x-1]:=totalstr[number];
  inc(number);
  while number<=sqr(lengthAR) do
  begin
    while (rangestep<=range) and (number<=sqr(lengthAR)) do
    begin
      if status = 1 then       //up
        dec(y)
      else
        if status =2 then    //left or rigth
        begin
          if direction=0 then
            dec(x)
          else
            inc(x);
        end
        else
          if status = 3 then    //down
            inc(y)
          else
            if status = 4 then      //rigth  or left
            begin
              if direction=0 then
                inc(x)
              else
                dec(x);
            end;
      CArray[y-1,x-1]:=totalstr[number];
      inc(rangestep);
      inc(number);
    end;
    inc(step);
    rangestep:=1;
    inc(status);
    if step>=2 then
    begin
      inc(range);
      step:=0;
    end;
    if status>4 then
      status:=low(status);
  end;
end;

Begin
  writeln('Enter string');
  readln(frontstring);
  first:=true;
  createarray(frontstring,first,NArray,lengthAr);
  print(NArray);
  writeln('-------------------------');
  status:=1;
  direction:=0;
  firststatus:=random(4)+1;
  direction:=random(2);
  cypher(NArray,lengthAr,length(frontstring),firststatus,totalstr,direction);
  writeln('-------------------------');
  writeln(totalstr);
  writeln('-------------------------');
  first:=false;
  createarray(totalstr,first,totalArray,lengthAr);
  writeln('-------------------------');
  uncypher(totalArray,lengthAr,length(totalstr),totalstr,firststatus,direction);
  print(totalArray);
  writeln('-------------------------');
  createstr(totalArray,lengthAr,totalstr);
  writeln(totalstr);
  readln;
End.
