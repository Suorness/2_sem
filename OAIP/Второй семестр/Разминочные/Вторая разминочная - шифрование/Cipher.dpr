program Cipher;

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
  firststatus:TStat;
  direction:integer;
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
procedure cypher(CArray:TArD;lengthAr,sim:integer; var firststatus:TStat;
                  var totalstr:string; var direction:integer);
Var
  status:TStat;
  centr,x,y,number,step,range,rangestep:integer;
begin
  randomize;
  firststatus:=random(4)+1;
  direction:=random(2);  //0 против 1 по
  status:=firststatus;
  totalstr:='';
  centr:=(sqr(lengthAR)+1) div 2;
  x:=ceil(centr/lengthAr);
  y:= centr mod lengthAr;
  randomize;
  number:=1;
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
  createarray(frontstring,true,NArray,lengthAr);
  writeln('The encrypted string:');
  cypher(NArray,lengthAr,length(frontstring),firststatus,totalstr,direction);
  writeln(totalstr);
  createarray(totalstr,false,totalArray,lengthAr);
  writeln('The decrypted string');
  uncypher(totalArray,lengthAr,length(totalstr),totalstr,firststatus,direction);
  createstr(totalArray,lengthAr,totalstr);
  writeln(totalstr);
  readln;
End.
