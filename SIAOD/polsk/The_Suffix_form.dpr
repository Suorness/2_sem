program The_Suffix_form;

{$APPTYPE CONSOLE}
uses
  SysUtils;

Type
  TStak=^st;
  st=record
  Next:Tstak;
  Sim:char;
  Relative_Priority:integer;
  Stack_Priority:integer;
  Rank:integer;
  end;

var
  str:string;
  rankEX:integer;


Procedure addToStak(Var Stak:TStak;sim:char;Relative_P,Stack_P,rank:integer);
var
  newcell:Tstak;
begin
  new(newcell);
  newcell.next:=Stak;
  newcell.sim:=sim;
  newcell^.Relative_Priority:=Relative_P;
  newcell^.Stack_Priority:=Stack_P;
  newcell^.Rank:=rank;
  Stak:=newcell;
end;


Procedure DeleteCell(Var Stak:TStak;var Str:string);
begin
  Str:=str+stak^.sim;
  stak:=stak^.Next;
end;

Procedure Determination_of_priority(sim:char;var Relative_P:integer;var Stack_P:integer;var rank:integer);
begin
  sim:=upcase(sim);
  if (sim>='A') and (sim<='Z') then
  begin
    Relative_P:=7;
    Stack_P:=8;
    rank:=1;
  end
  else
  begin
    if (sim='+') or (sim='-') then
    begin
      Relative_P:=1;
      Stack_P:=2;
      rank:=-1;
    end
    else
    begin
      if (sim='*') or (sim='/') then
      begin
        Relative_P:=3;
        Stack_P:=4;
        rank:=-1;
      end
      else
      begin
        if (sim='^')  then
        begin
          Relative_P:=6;
          Stack_P:=5;
          rank:=-1;
        end
        else
        begin
          if (sim='(')  then
          begin
            Relative_P:=9;
            Stack_P:=0;
            rank:=0;
          end
          else
          begin
            if (sim=')')  then
            begin
              Relative_P:=0;
              Stack_P:=0;
              rank:=0;
            end;
          end;
        end;
      end;
    end;
  end;
end;

Function Make_Suffix_form(Str:string;var rankEX:integer):string;
var
  Stak:TStak;
  Relative_P,Stack_P,rank:integer;
  testend,testbkt:boolean;
  i:integer;
begin
  stak:=nil;
  result:='';
  testbkt:=true;
  for i:=1 to length(str) do
  begin
    testend:=false;
    Determination_of_priority(str[i],Relative_P,Stack_P,rank);
    RankEX:=RankEX+rank;
    repeat
      if  Relative_P=0 then
      begin
        while stak^.Stack_Priority<>0 do
        begin
          DeleteCell(Stak,result);
        end;
        stak:=stak^.next;
        testend:=true;
      end
      else
      begin
        if  (stak=nil) or (Relative_P>stak^.Stack_Priority) then
        begin
          addToStak(Stak,str[i],Relative_P,Stack_P,rank);
          testend:=true;
        end
        else
        begin
          if Relative_P<=stak^.Stack_Priority then
          begin
            DeleteCell(Stak,result);
          end;
        end;
      end;
    until testend and testbkt;
  end;
  while stak <>nil do
  begin
    DeleteCell(Stak,Result);
  end;
end;

procedure inputdata(var str:string);
var
  i:integer;
  invalid_input:boolean;
  teststr:string;
begin
  repeat
    invalid_input:=false;
    readln(str);
    teststr:=str;
    teststr[1]:=upcase(teststr[1]);
    if  ((teststr[1]<'A') or (teststr[1]>'Z')) and (teststr[1]<>'(') then
    begin
      invalid_input:=true;
      writeln('Invalid data');
      writeln('Please re-enter');
    end
    else
    begin
      i:=2;
      while (i<=length(teststr)) and (invalid_input=false) do
      begin
        teststr[i]:=upcase(teststr[i]);
        if  ((teststr[i]<'A') or (teststr[i]>'Z')) and ((teststr[i]<'(') or
        (teststr[i]>'+')) and (teststr[i]<>'-') and (teststr[i]<>'/') and (teststr[i]<>'^')   then
        begin
          invalid_input:=true;
          writeln('Invalid data');
          writeln('Please re-enter');

        end;
        inc(i);
      end;
    end;
  until invalid_input=false;
end;

begin
repeat
  rankEX:=0;
  writeln('Please enter a mathematical expression:');
  inputdata(str);
  writeln;
  writeln('Result:');
  writeln(Make_Suffix_form(str,rankEX));
  writeln('Rank = ',rankEX);
  writeln;
until str='end';

end.
  //((a+b)*c-d^x^y)/h
  //((a-(b+c))*d)^(e+f)
 //(a+b)*(c+d)
