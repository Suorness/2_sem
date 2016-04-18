program SIAOD_2_11_test;

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
    pred:termin;
    subtermin:termin; {Указатель на список подтерминов}  {2}
    page:page; {указатель на список страниц} {3}
    base:termin;
    end;


  TPhashTable = array of termin;


Var
  lengthHashTable:integer;
  firstTermin,listTerm,seachElem,lost:termin;
  k,i:integer;
  HashTable:TPHashTable;
  test0,test1,test2:termin;

  {Хеш функция}
function Fhash(key:string;lengthHashTable:integer):integer;
var
  i,hash:integer;
begin
  hash:=0;
  for i:=1 to length(key) do
  begin
    hash:=((hash*17)+ord(key[i])) mod lengthHashTable;
    result:=Hash;
    if result<0 then
      inc(result);
  end;
end;

procedure entertest(var testInt:integer);
var
  i:integer;
  str:string;
  NotNomber:boolean;
begin
  repeat
    readln(str);
    notNomber:=true;
    for i:=1 to length(str) do
    begin
      if (ord(str[i])>57) or (ord(str[i])<48) then
        notNomber:=false;
    end;
    if notNomber=false then
      begin
        writeln('Повторите ввод');
        //readln(str);
      end
      else
        TestInt:=strtoint(str);
    until notNomber;
end;

{Добавление элемента в хештаблицу}
procedure addHashTable(addElem:termin;var HashTable:TPHashTable);
var
  HashNomer:integer;
  add,full:boolean;
  countFull:integer;
begin
  HashNomer:=FHash(addElem.name,lengthHashTable);
  add:=false;
  full:=false;
  countFull:=0;
    repeat
      if HashTable[hashNomer] = nil then
      begin
        HashTable[HashNomer]:=addElem;
        add:=true;
      end
      else
      begin
        inc(countFull);
        if HashNomer<lengthHashTable-1 then
          inc(hashnomer)
        else
          hashNomer:=0;
      end;
      if countfull>lengthHashTable-1 then
        full:=true;
    until add or full;
    if full then
      writeln('Таблица заполнена');

end;

{Заносит термины из константы}
procedure createTermin(listTerm:termin);
var
  i:integer;
begin
  for i:=1 to 10 do
  begin
    new(listTerm^.next);
    listTerm:=listTerm^.next;
    listTerm^.name:=CTERM[i];
    addHashTable(listTerm,HashTable);
    lost:=listTerm;
    listTerm^.base:=nil;
    listTerm^.next:=nil;
    listTerm^.subtermin:=nil;
    listTerm^.page:=nil;
  end;
end;

{создание подтерминов в постоянной таблице терминов}
procedure createUnTermin(listTerm:termin);
Var
  i:integer;
  firstEl:termin;
begin
  new(firstEl);
  for i:=1 to 10 do
  begin
    new(listTerm.subtermin);
    if i=1 then
      firstEl:=listTerm^.subtermin;
    listTerm^.subtermin.name:=UnTerm[i];

    addHashTable(listTerm.subtermin,HashTable);
    new(listTerm^.subtermin.page);
    listTerm^.subtermin.page.nomer:=CUnPages[i];
    listTerm^.subtermin.base:=listTerm;
    listTerm^.subtermin.next:=nil;
    listTerm:=listTerm^.next;

  end;
  //listterm.subtermin:=firstEl;
end;

{Добавляет страницы к постоянной таблице терминов}
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

{Выводит список поддерминов и терминов}

Procedure print(Sublist:termin;k:integer);
  var
  test:boolean;
  test1:boolean;
  i:integer;
 begin
  repeat

    test:=true;
    if SubList^.name <>'' then        {тут ощибка}
    for i:=1 to k do
    begin
      write('-');
    end;
    if SubList^.name <>''then
      write(SubList^.name);
    if Sublist^.page <> nil then
    repeat
      test1:=true;
      write(' ',Sublist^.page.nomer);
      if Sublist.page^.Next <> nil then
      begin
        Sublist.page:=Sublist.page^.Next;
        test1:=false;
      end;
    until test1;
    if SubList^.name <>''then
     writeln;
    if sublist.subtermin <> nil then
    begin
      inc(k);
      Print(sublist.subtermin,k);
      dec(k);
    end;
    if sublist.next <> nil then
    begin
      sublist:=sublist.next;
      test:=false;
    end;
  until test;
end;

{Вывод одного термина с страницами и всеми поддерминами}
procedure PrintOneTermin(PrintTermin:termin);
var
  k:integer;
begin
  k:=1;
  write(PrintTermin.name,' ');
  if printTermin.page <> nil then
    begin
      write(printTermin.page.nomer,' ');
      printTermin.page:=printTermin.page.next;
    end;
  if printTermin.subtermin <> nil then
  begin
    writeln;
    print(printTermin.subtermin,k);
  end;
end;

procedure SubSearch(str:string;Sublist:termin; var searchElem:termin;var test1:boolean);
var
  test:boolean;
begin
  repeat
    test:=true;
    if sublist.name = str then
    begin
      test1:=true;
      seachElem:=sublist;
    end
    else
    begin
      if sublist.subtermin <> nil then
        subsearch(str,sublist.subtermin,searchElem,test1);
    end;
    if sublist.next <> nil then
    begin
      sublist:=sublist.next;
      test:=false;
    end;
  until test or test1;
end;


procedure delete(listTern:termin;hashTable:TPHashTable;);
var
  str:string;
  deleteEl:termin;
  hashNomer:integer;
  search,noEl:boolean;
begin
  new(deleteEl);
  writeln('Введите название термина/подтермина для удаления');
  hashNomer:=FHash(str,lengthHashTable);
  deleteEl:=HashTable[hashNomer];
  search:=false;
  noel:=false;
  repeat
    if deleteEl <> nil then
    begin
      if deleteEl.name = str then
        search:=true
      else
      begin
        if hashnomer<lengthHashTable-1 then
        begin
          inc(hashNomer);
          deleteEl:=HashTable[hashNomer];
        end
        else
        begin
          hashNomer:=0;
          deleteEl:=HashTable[hashNomer];
        end;
      end;
    end
    else
      noel:=true;

  until search or noel;
  if search then
  begin
    if deleteEl.base = nil then
    begin

    end;

  end;

  if noel then
    writeln('Элемента в таблице нет');
  writeln;
end;


procedure newsearch(listterm:termin;HashTable:TPHashTable;var seachElem:termin);
var
  hashNomer:integer;
  str:string;
  search,noEl:boolean;
begin
  writeln('Введите термин для поиска');
  readln(str);
  hashNomer:=FHash(str,lengthHashTable);
  seachElem:=HashTable[hashNomer];
  search:=false;
  noel:=false;
  repeat
    if seachElem <> nil then
    begin
      if seachElem.name = str then
        search:=true
      else
      begin
        if hashnomer<lengthHashTable-1 then
        begin
          inc(hashNomer);
          seachElem:=HashTable[hashNomer];
        end
        else
        begin
          hashNomer:=0;
          seachElem:=HashTable[hashNomer];
        end;
      end;
    end
    else
      noel:=true;

  until search or noel;
  if search then
    PrintOneTermin(seachElem);
  if noel then
    writeln('Элемента в таблице нет');
  writeln;
end;

procedure Unsearch(listterm:termin;HashTable:TPHashTable;var seachElem:termin);
var
  hashNomer:integer;
  str:string;
  search,noEl:boolean;
begin
  writeln('Введите подтермин для поиска термина');
  readln(str);
  hashNomer:=FHash(str,lengthHashTable);
  seachElem:=HashTable[hashNomer];
  search:=false;
  noel:=false;
  repeat
    if seachElem <> nil then
    begin
      if seachElem.name = str then
        search:=true
      else
      begin
        if hashnomer<lengthHashTable-1 then
        begin
          inc(hashNomer);
          seachElem:=HashTable[hashNomer];
        end
        else
        begin
          hashNomer:=0;
          seachElem:=HashTable[hashNomer];
        end;
      end;
    end
    else
      noel:=true;

  until search or noel;
  if search and (seachelem.base <> nil)  then
      writeln(seachelem.base.name,' ',seachelem.base.page.nomer);
  if noel then
    writeln('Элемента в таблице нет')
  else
  if seachelem.base = nil then
    writeln('Это термин');
  writeln;
end;
procedure addUnTerm(var addTermin:termin;lost:termin;var hashTable:TPHashTable);
var
  firstEl:termin;
  str:string;
  firstpage:page;
  Nomberterm:integer;
  page,i:integer;
begin
  writeln('Имеются ли подтермины в подтермине?');
  writeln('Введите "Да" или "Нет"');
  readln(str);
  if str = 'Да' then
  begin
    new(firstEl);
    writeln('Укажите количество подтерминов');
    nomberterm:=0;
    entertest(nomberterm);
    new(addTermin^.subtermin);
    addTermin.subtermin.name:='';
    addTermin.subtermin.subtermin:=nil;
    firstEl:=addTermin^.subtermin;
    for i:=1 to Nomberterm do
    begin
      new(addTermin^.subtermin.next);
      writeln('Введите название подтермина');
      readln(str);
      addTermin^.subtermin:=addTermin^.subtermin.next;
      addTermin^.subtermin.next:=nil;
      addTermin.subtermin^.name:=str;
      addHashTable(addTermin.subtermin,HashTable);
      writeln('Введите страницу');
      page:=0;
      entertest(page);
      new(addTermin^.subtermin.page);
      addTermin^.subtermin.page.nomer:=page;
      addTermin^.subtermin.page.next:=nil;
      addTermin.subtermin.subtermin:=nil;
      addUnTerm(addTermin.subtermin,lost,HashTable);
      addTermin.subtermin.base:=lost;
    end;
    addTermin^.subtermin:=firstEl;
  end;
end;


procedure addTerm(var lost:termin;var hashTable:TPHashTable);
var
  firstpage:page;
  firstEl:termin;
  str:string;
  Nomberterm:integer;
  page,i:integer;
begin
  new(lost.next);
  lost:=lost.next;
  writeln('Введите название термина');
  readln(str);
  lost.name:=str;
  addHashTable(lost,HashTable);
  writeln('Введите страницy');
  page:=0;
  entertest(page);
  new(lost.page);
  lost.page.nomer:=page;
  lost.page.next:=nil;
  lost.next:=nil;
  lost.base:=nil;
  writeln('Имеются ли подтермины?');
  writeln('Введите "Да" или "Нет"');
  readln(str);
  if str = 'Да' then
  begin
    new(firstEl);
    writeln('Укажите количество подтерминов');
    nomberterm:=0;
    entertest(nomberterm);
    new(lost^.subtermin);
    lost^.subtermin.name:=''; {тут}
    lost^.subtermin.subtermin:=nil;
    firstEl:=lost^.subtermin;
    for i:=1 to Nomberterm do
    begin
      new(lost^.subtermin.next);
      writeln('Введите название термина');
      readln(str);
      lost^.subtermin:=lost^.subtermin.next;
      lost^.subtermin.next:=nil;
      lost.subtermin^.name:=str;
      writeln('Введите страницу');
      page:=0;
      entertest(page);
      new(lost^.subtermin.page);
      addHashTable(lost.subtermin,HashTable);
      lost^.subtermin.page.next:=nil;
      lost^.subtermin.page.nomer:=page;
      lost^.subtermin.subtermin:=nil;
      addUnTerm(lost^.subtermin,lost,hashTable);
      lost.subtermin.base:=lost;
    end;
    lost^.subtermin:=firstEl;         {правка}
  end;
end;



procedure main;
var
  command:string;
  correct:boolean;
  i:integer;
begin
  writeln('Команда 1 - Просмотр всего предметного указателя');
  writeln('Команда 4 - Поиск термина\подтермина');
  writeln('Команда 5 - Поиск по термина по подтермину');
  writeln('Команда 6 - Добавление терминов');
  writeln('Введите номер команды для выполнения');
  repeat
    correct:=true;
    readln(command);
    for i:=1 to length(command) do
    begin
      if (ord(command[i])>58) or (ord(command[i])<47) then
        correct:=false;
    end;
    if correct=false then
      writeln('Повторите ввод команды');
  until correct;
  if strtoint(command) = 1 then
      print(firstTermin^.next,k)
    else
      if strtoint(command) = 4 then
           newsearch(listterm,HashTable,seachElem)
        else
          if strtoint(command) = 5 then
            Unsearch(listterm,HashTable,seachElem)
          else
            if strtoint(command) = 6 then
              addTerm(lost,HashTable);

  writeln('---------------');
  main;
end;


Begin
  k:=0;
  lengthHashTable:=50;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  setlength(HashTable,lengthHashTable);
  new(firstTermin);
  listTerm:=firstTermin;
  createTermin(listTerm);
  createUntermin(firstTermin^.next);
  createPages(firstTermin^.next);

   writeln('------');
  main;

  readln;
End.
