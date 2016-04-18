program SIAOD_2_2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

Const
  CTERM:array[1..10] of string =
  ('Квадрат', 'Куб', 'Шар', 'Ромб', 'Линия', 'Круг', 'Треугольник'
  , 'Пирамида', 'Эллипс', 'Тор');
  UnTerm:array[1..10] of string =
  ('Недоквадрат','НедоКуб','Недошар','НедоРомб','НедоЛиния','НедоКруг',
  'НедоТреульгольник','НедоПирамида','НедоЭллипс','НедоТор');
  CPages:array[1..10] of integer =
  (18,16,26,23,42,96,73,88,93,102);
  CUnPages:array[1..10] of integer =
  (32,21,81,25,42,76,75,89,19,132);

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
  k:integer;
procedure createTermin(listTerm:termin);
var
  i:integer;
begin
  for i:=1 to 10 do
  begin
    new(listTerm^.next);
    listTerm:=listTerm^.next;
    listTerm^.name:=CTERM[i];
    listTerm^.next:=nil;
    listTerm^.subtermin:=nil;
    listTerm^.page:=nil;
  end;
end;

procedure createUnTermin(listTerm:termin);
Var
  i:integer;
begin
  listTerm:=firstTermin^.next;
  for i:=1 to 10 do
  begin
    new(listTerm^.subtermin);
    listTerm^.subtermin.name:=UnTerm[i];
    new(listTerm^.subtermin.page);
    listTerm^.subtermin.page.nomer:=CUnPages[i];
    listTerm^.subtermin.next:=nil;
    listTerm:=listTerm^.next;

  end;
end;
procedure createPages(listTerm:termin);
Var
  i:integer;
begin
  listTerm:=firstTermin^.next;
  for i:=1 to 10 do
  begin
    new(listTerm^.page);
    listTerm^.page.nomer:=CPages[i];
    listTerm^.page.next:=nil;
    listTerm:=listTerm^.next;
  end;

end;
{Выводит список поддерминов}

{Procedure print(listTerm:termin);
begin
  listTerm:=firstTermin^.next;
  while listTerm^.next <> nil do
  begin
    write(listTerm^.name);
    if listTerm^.page <> nil then
    repeat
      write(' ',listTerm.page.nomer);
      if listTerm.page^.Next <> nil then
        listTerm.page:=listTerm.page^.Next;
    until (listTerm.page.next = nil);
    writeln;
    if listTerm^.subtermin <> nil then

    repeat
      writeln('-',listTerm.subtermin.name);
      if listTerm.subtermin^.Next <> nil then
        listTerm.subtermin:=listTerm.subtermin^.Next;
    until (listTerm.subtermin= nil);
    listTerm:=listTerm^.next;
  end;
end;   }

Procedure print(Sublist:termin;k:integer);
  var
  test:boolean;
  test1:boolean;
  i:integer;
begin
  repeat
    test:=true;
    for i:=1 to k do
    begin
      write('-');
    end;
    write(SubList.name);
    if Sublist^.page <> nil then
    repeat
      test1:=true;
      write(' ',Sublist.page.nomer);
      if Sublist.page^.Next <> nil then
      begin
        Sublist.page:=Sublist.page^.Next;
        test1:=false;
      end;
    until test1;
    writeln;
    if sublist.subtermin <> nil then
    begin
      inc(k);
      Print(sublist.subtermin,k);
      K:=0;
    end;
    if sublist.next <> nil then
    begin
      sublist:=sublist.next;
      test:=false;
    end;
  until test;
end;

procedure search(listTerm:termin);
var
  test:boolean;
  test1:boolean;
  str:string;
begin
// listTerm:=firstTermin^.next;
  repeat
    test:=false;
    writeln('Введите термин для поиска');
    readln(str);
    while (listterm.next <> nil) or (test1=false) do
    begin
    end;
  until test;
end;


procedure edited;
begin
end;


Begin
  k:=0;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  new(firstTermin);
  listTerm:=firstTermin;
  createTermin(listTerm);
  createUntermin(listTerm);
  createPages(listTerm);
  {
  listTerm:=firsttermin.next;
  new(listTerm.subtermin.subtermin);
  new(listTerm.subtermin.subtermin.subtermin);
  new(listTerm.subtermin.subtermin.page);
  new(listTerm.subtermin.subtermin.subtermin.page);
  listTerm.subtermin.subtermin.name:='пашет';
  listTerm.subtermin.subtermin.page.nomer:=1881;
  listterm.subtermin.subtermin.subtermin.name:='точно пашет';
  listterm.subtermin.subtermin.subtermin.page.nomer:=1882;
  {}
  print(firstTermin^.next,k);




  readln;
End.
