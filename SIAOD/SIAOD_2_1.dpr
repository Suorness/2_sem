program SIAOD_2_1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Const
  CTERM:array[1..10] of string =
  ('Квадрат', 'Куб', 'Шар', 'Ромб', 'Линия', 'Круг', 'Треугольник'
  , 'Пирамида', 'Эллипс', 'Тор');

Type
  page= ^pageel;
  pageel= record
    nomer:integer; {5} {страницы}
    next:page;       {6}   {указатель на следующую страницу}
    end;




  termin= ^term;
  term = record
    name:string;  {Заносим сам термин} {1}
    next:termin; {Указатель на следующий термин} {4}
    subtermin:termin; {Указатель на список подтерминов}  {2}
    page:page; {указатель на список страниц} {3}
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
 