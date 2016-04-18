program SIAOD_2_16;

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
    base:termin;
    end;


  TPhashTable = array of termin;


Var
  lengthHashTable:integer;
  firstTermin,listTerm,seachElem,lost:termin;
  k,i:integer;
  count:integer;
  HashTable:TPHashTable;
 // test0,test1,test2:termin;
 testList,testListF,tempTest,tempTest1:termin;

  {Хеш функция}
function Fhash(key:string;lengthHashTable:integer):integer;
var
  i,hash:integer;
begin
  hash:=0;
  result:=0;
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

{создание подтерминов в постоянной таблице терминов}     {Правка}
procedure createUnTermin(listTerm:termin);
Var
  i:integer;
  firstEl:termin;
begin
  for i:=1 to 10 do
  begin
     //new(firstEl);
    new(listTerm.subtermin);
    firstEl:=listTerm^.subtermin;
    listTerm^.subtermin.name:=UnTerm[i];
    addHashTable(listTerm.subtermin,HashTable);
    new(listTerm^.subtermin.page);
    listTerm^.subtermin.page.nomer:=CUnPages[i];
    new( listTerm^.subtermin.base);
    listTerm^.subtermin.base:=listTerm;
    new(Listterm^.subtermin.next);
    listterm.subtermin:=listterm.subtermin.next;
    listTerm^.subtermin.name:='new';
    addHashTable(listTerm.subtermin,HashTable);
    new(listTerm^.subtermin.page);
    listTerm^.subtermin.page.nomer:=88005535;
    listTerm^.subtermin.next:=nil;
    listTerm^.subtermin.page.next:=nil;
    listterm.subtermin:=firstEl;
    listTerm:=listTerm^.next;
    //dispose(FirstEl);
  end;

end;

{Добавляет страницы к постоянной таблице терминов}
procedure createPages(listTerm:termin);
Var
  i:integer;
  firstEl:termin;
begin
  listTerm:=firstTermin^.next;
  for i:=1 to 10 do
  begin

    new(listTerm^.page);
    firstEl.page:=listTerm^.page;
    listTerm^.page.nomer:=CPages[i];
    new(listTerm^.page.next);
    listTerm^.page:=listTerm^.page.next;
    listTerm^.page.nomer:=88053522;

    listTerm^.page.next:=nil;
    listTerm^.page:=firstEl.page;
    listTerm:=listTerm^.next;
  end;

end;

{Выводит список поддерминов и терминов}

Procedure print(Sublist:termin;k:integer);
  var
  test:boolean;
  test1:boolean;
  firstEnt:integer;
  i:integer;
  firstEl:termin;
 begin
  repeat

    test:=true;
     firstEnt:=0;
    new(firstEl);
    if SubList^.name <>'' then
    for i:=1 to k do
    begin
      write('-');
    end;
    if SubList^.name <>''then
      write(SubList^.name);
    if Sublist^.page <> nil then
    repeat
      if firstEnt =0 then
      begin
        inc(firstEnt);
        firstEl.page:=Sublist^.page
      end;
      test1:=true;
      write(' ',Sublist^.page.nomer);
      if Sublist.page^.Next <> nil then
      begin
        Sublist.page:=Sublist.page^.Next;
        test1:=false;
      end
      else
      begin
        Sublist.page:=firstEl.page;
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
procedure sortword(var firsttermin:termin; var listterm:termin);
var
  i,j:integer;
  count:integer;
  firstEl:termin;
  tempWord:string;
  tempTermin,tempTerminF:termin;
  //pred,sled,big:termin;
  masWord:array of string;
  mastermin:array of termin;
begin

  count:=0;
  firstEl:=listterm;
  while listterm<>nil do
  begin
    inc(count);
    listterm:=listterm^.next;
  end;
  listterm:=firstEl;
  setlength(masWord,count);
  setlength(mastermin,count);
  for i:=0 to count-1 do
  begin
    masWord[i]:=listterm^.name;
    mastermin[i]:=listterm;
    listterm:=listterm^.next;
  end;
  new(tempTermin);
  for i:=0 to count-2 do
    for j:=0 to count-i-1 do
    begin
      if masWord[i]>masWord[i+1] then
      begin
        tempWord:=masWord[i+1];
        tempTermin:=masTermin[i+1];
        masWord[i+1]:=masWord[i];
        masTermin[i+1]:=masTermin[i];
        masWord[i]:=tempWord;
        masTermin[i]:=tempTermin;
      end;
    end;

   new(tempTerminF);
   tempTermin:=tempTerminF;

   for i:=0 to count-1 do
   begin
    new(tempTermin.next);
    tempTermin:=tempTermin.next;
    tempTermin:=mastermin[i];
    //listterm.next:=nil;
    //lost:=listterm;
   end;
  listterm:=tempTerminF^.next;

end;

{Вывод одного термина с страницами и всеми поддерминами}
procedure PrintOneTermin(PrintTermin:termin);
var
  k,firstEnt:integer;
  firstEl:termin;
begin
  k:=1;
  firstEnt:=0;
  new(firstEl);
  write(PrintTermin.name,' ');
  while printTermin.page <> nil do
  begin
      if firstEnt= 0 then
      begin
        inc(firstEnt);
        firstEl.page:=printTermin.page;
      end;
      write(printTermin.page.nomer,' ');
      printTermin.page:=printTermin.page.next;
  end;
  printTermin.page:=firstEl.page;
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


procedure delete(var listTerm:termin; var hashTable:TPHashTable);
var
  str:string;
  deleteEl,temp:termin;
  hashNomer,subhashNomer:integer;
  search,noEl,succses:boolean;
  pred,root,FirstEl,tempFordelete:termin;
begin
  new(deleteEl);
  writeln('Введите название термина/подтермина для удаления');
  readln(str);
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
      new(temp);
      new(pred);
      pred:=listterm;
      temp:=firstTermin^.next;
      succses:=false;
      if deleteEl=firsttermin^.next then
      begin

        HashTable[hashNomer]:=nil;
        succses:=true;

          while firsttermin^.next.subtermin <> nil do
          begin
            subhashNomer:=Fhash(firsttermin^.next.subtermin.name,lengthHashTable);
            new(tempFordelete);
            tempFordelete:=hashTable[subhashNomer];
            while tempFordelete.name <> firsttermin^.next.subtermin.name do
            begin
              repeat
              if subhashNomer <> lengthHashTable-1 then
              begin
                inc(subhashNomer);
                tempFordelete:=hashTable[subhashNomer];
              end
              else
                subhashNomer:=0;
              until tempFordelete<>nil;
            end;
              HashTable[subhashNomer]:=nil;
              firsttermin^.next.subtermin:=firsttermin^.next.subtermin.next;
          end;
          firsttermin^.next:=firsttermin^.next.next;   {cen}

        writeln('Термин успешно удален');
        dispose(temp);
      end;
      while succses=false do
      begin
        if temp = deleteEl then
        begin

          succses:=true;
          if listterm.subtermin <> nil then
            if listterm.subtermin.name='' then
              listterm.subtermin:=listterm.subtermin.next;
          while listterm.subtermin <> nil do               {тут}
          begin
            new(tempFordelete);
            subhashNomer:=Fhash(listterm.subtermin.name,lengthHashTable);
            repeat
              tempFordelete:=hashTable[subhashNomer];
                if tempFordelete=nil then
                begin
                  if  subhashNomer <> lengthHashTable-1 then
                  begin
                    inc(subhashNomer);
                    tempFordelete:=hashTable[subhashNomer];
                  end
                  else
                    subhashNomer:=0;
                end;
            until tempFordelete<>nil;
            tempFordelete:=hashTable[subhashNomer];
            while tempFordelete.name <> listterm.subtermin.name do
            begin
              repeat
                if subhashNomer <> lengthHashTable-1 then
                begin
                  inc(subhashNomer);
                  tempFordelete:=hashTable[subhashNomer];
                end
                else
                  subhashNomer:=0;
              until tempFordelete <> nil;
            end;
              HashTable[subhashNomer]:=nil;
              listterm.subtermin:=listterm.subtermin.next;
          end;
          //listterm.name:='';
          listterm.subtermin:=nil;
          listterm.page:=nil;
          listterm.base:=nil;
          listterm:=pred;

          if listterm.next.next = nil then
          begin
            lost:=listterm;
            lost.next:=nil;

          end
          else
            listterm.next:=listterm.next.next;

          HashTable[hashNomer]:=nil;
          writeln('Термин успешно удален');
          dispose(temp);
        end
        else
        begin
          pred:=temp;
          listterm:=listterm^.next;
          temp:=listterm;
        end;
      end;
    end
    else
    begin
      writeln('Это под термин!');
      {new(root);        {Содержит элемент из которого мы вошли в этот подтермин
      new(temp);        {Будем сверять по нему
      root:=deleteEl.base;
      new(firstEl);  {Указатель на первый в подсписке
      FirstEl:=root.subtermin;            {тут мб бяка
      succses:=false;
      temp:=FirstEl;
      pred:=root.subtermin;
      while succses=false do
      begin
        if temp=deleteEl then
        begin
          if firstEl= deleteEl then
          begin
            listterm.subtermin:=root.subtermin;
            listterm.subtermin:=nil;
          end;
          succses:=true;
          listterm:=pred;
          listterm:=temp.next;
          HashTable[hashNomer]:=nil;
          writeln('Термин успешно удален2');

        end
        else
        begin
          pred:=temp;
          temp:=temp.next;
        end;
      end;}
    end;
  end;
  if noel then
    writeln('Элемента в таблице нет');
  writeln;
end;

procedure edit(var editEl:termin);
var
  hashNomer:integer;
  search,noEl:boolean;
  i,num,k:integer;
  str:string;
  firstEl:termin;
  mas:array[1..20] of integer;
begin
  //new(seachElem);
  writeln('Введите термин для изменения');
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
  if noel then
  begin
    seachElem:=nil;
    writeln('Элемента в таблице нет');
  end;
  writeln;
  if  seachElem<> nil then
  begin
    editEl:=seachElem;
    writeln('Изменить название?');
    writeln('Введите "Да" для изменения');
    readln(str);
    if str='Да' then
    begin
      writeln('Введите новое название');
      readln(str);
      editEl.name:=str;
    end;
    writeln('Добавить страницу?');
    writeln('Введите "Да" для изменения');
    readln(str);
    if str='Да' then
    begin
      new(firstEl);
      firstEl^.page:=editEl^.page;
      i:=1;
      while editEl.page<>nil do
      begin
        mas[i]:=editEl.page.nomer;
        editEl.page:=editEl^.page.next;
        inc(i);
      end;

      writeln('Введите страницу');
      num:=0;

      entertest(num);
      mas[i]:=num;
      editEl.page:=nil;
      new(editEl^.page);
      editEl^.page.nomer:=mas[1];
      firstEl.page:=editEl^.page;
      for k:=2 to i do
      begin
        new(editEl^.page.next);
        editEl^.page:=editEl^.page.next;
        editEl^.page.nomer:=mas[k];
        editEl^.page.next:=nil;
      end;
      editEl^.page:=firstEl.page;

    end;
  end;
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
  if noel then
  begin
    seachElem:=nil;
    writeln('Элемента в таблице нет');
  end;
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
  writeln('Введите "Да" если имеются');
  readln(str);
  if str = 'Да' then
  begin
    new(firstEl);
    writeln('Укажите количество под терминов');
    nomberterm:=0;
    entertest(nomberterm);
    new(addTermin^.subtermin);
    addTermin.subtermin.name:='';
    addTermin.subtermin.subtermin:=nil;
    firstEl:=addTermin^.subtermin;
    for i:=1 to Nomberterm do
    begin
      new(addTermin^.subtermin.next);
      writeln('Введите название под термина');
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
  lost.subtermin:=nil;
  writeln('Имеются ли подтермины?');
  writeln('Введите "Да" если имеются');
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
      writeln('Введите название под термина');
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
  writeln('Команда 2 - Редактирование Термина\подтермина');
  writeln('Команда 4 - Поиск термина\подтермина');
  writeln('Команда 5 - Поиск по термина по подтермину');
  writeln('Команда 6 - Добавление терминов');
  writeln('Команда 7 - Удаление терминов');
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
      begin
        new(seachElem);                                {Правки}
        newsearch(listterm,HashTable,seachElem);       {!!!!!!!!!!!!!!!!!!!!!}
        if seachElem <> nil then
          PrintOneTermin(seachElem);
      end
        else
          if strtoint(command) = 5 then
            Unsearch(listterm,HashTable,seachElem)
          else
            if strtoint(command) = 6 then
              addTerm(lost,HashTable)
              else
              if strtoint(command) = 7 then
              begin
                listterm:=firstTermin;
                delete(listterm,hashTable);
              end
              else
              begin
                if strtoint(command) = 2 then
                begin
                  listterm:=firsttermin^.next;
                  edit(listterm);
                end;
              end;

  writeln('---------------');
  main;
end;


Begin
  k:=0;
  new(lost);{Правка}
  lengthHashTable:=50;
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);
  setlength(HashTable,lengthHashTable);
  new(firstTermin);
  listTerm:=firstTermin;
  createTermin(listTerm);
  createUntermin(firstTermin^.next);
  createPages(firstTermin^.next);
  print(firstTermin^.next,k);
   writeln('------');
  //main;

  sortword(firsttermin,listterm);
  print(firsttermin^.next,k);
  readln;
End.
