program SIAOD_2_1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Const
  CTERM:array[1..10] of string =
  ('�������', '���', '���', '����', '�����', '����', '�����������'
  , '��������', '������', '���');

Type
  page= ^pageel;
  pageel= record
    nomer:integer; {5} {��������}
    next:page;       {6}   {��������� �� ��������� ��������}
    end;




  termin= ^term;
  term = record
    name:string;  {������� ��� ������} {1}
    next:termin; {��������� �� ��������� ������} {4}
    subtermin:termin; {��������� �� ������ �����������}  {2}
    page:page; {��������� �� ������ �������} {3}
    end;


Var
  firstTermin,listTerm:termin;

procedure createTermin(listTerm:termin);
var
  i:integer;
begin
  for i:=1 to 10 do
  begin

    new(firstTerm^.next);
    listTerm:=firstTerm^.next;
    listTerm^.name:=CTERM[i]
    listTerm^.next:=nil;
  end;
end;
Procedure print(listTerm:termin);
begin
  listTerm:=firstTermin;
  while listTerm^.next <> nil do
  begin
    writeln(listTerm^.name);
    listTerm:=listTerm^.next;
  end;
end;


Begin
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(firstTermin);
  listTerm:=firstTermin;
  createTermin(listTerm);
  print(listTerm);
  readln;
End.
 