unit Main;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFilm=^listFilm;
  listFilm=record
    Name:string[30];
    Year:string[10];
    Genre:string[30];
    pic:string[255];
    Contry:string[30];
    Direct:string[50];
    History:string[50];
    Money:string[50];
    MoneyUp:string[50];
    Watch:string[50];
    Time:string[50];
    Disk:string[255];
    next:TFilm;
  end;

type
  Func = function(First,second:ListFilm):boolean;



type
  TFMain = class(TForm)
    TopMenu: TMainMenu;
    dlgOpen: TOpenDialog;
    TopFileOpen: TMenuItem;
    TopFileSave: TMenuItem;
    TopFileSaveAs: TMenuItem;
    TopFile: TMenuItem;
    TopFileNew: TMenuItem;
    PanelFilm: TPanel;
    LVFilm: TListView;
    dlgSave: TSaveDialog;
    Panel1: TPanel;
    BBAdd: TBitBtn;
    BBDel: TBitBtn;
    BBChange: TBitBtn;
    BBSearch: TBitBtn;
    BBVie: TBitBtn;
    BBUpDate: TBitBtn;
    BBSort: TBitBtn;
    BBRandom: TBitBtn;
    TopExit: TMenuItem;
    TopFunc: TMenuItem;
    TopFuncVie: TMenuItem;
    TopFuncADd: TMenuItem;
    TopFuncChange: TMenuItem;
    TopFuncDel: TMenuItem;
    TopFuncSearch: TMenuItem;
    TopFuncSort: TMenuItem;
    TopFuncRandom: TMenuItem;
    ExpTxt: TMenuItem;
    TopFuncUpdate: TMenuItem;
    TopExit2: TMenuItem;
    TopAbout: TMenuItem;
    TopAboutProgr: TMenuItem;
    TopAboutA: TMenuItem;
    procedure TopFileOpenClick(Sender: TObject);
    procedure TopFileNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure BDeletClick(Sender: TObject);
    procedure BTEstSaveClick(Sender: TObject);
    procedure BTestOpenClick(Sender: TObject);
    procedure TopFileSaveClick(Sender: TObject);
    procedure TopFileSaveAsClick(Sender: TObject);
    procedure BBAddClick(Sender: TObject);
    procedure BBChangeClick(Sender: TObject);
    procedure BBDelClick(Sender: TObject);
    procedure BBVieClick(Sender: TObject);
    procedure BBSearchClick(Sender: TObject);
    procedure BBUpDateClick(Sender: TObject);
    procedure BBSortClick(Sender: TObject);
    procedure BBRandomClick(Sender: TObject);
    procedure TopExitClick(Sender: TObject);
    procedure ExpTxtClick(Sender: TObject);
    procedure TopAboutProgrClick(Sender: TObject);
    procedure TopAboutAClick(Sender: TObject);
  private
    //Путь к открытового файла
    FFileName:string;

  public
    //путь директории
    way:string;
    //элемент и заглавный элемент однонаправленного списка
    ListOfFilm,HeaderList:TFilm;
    //путь к начальному постеру
    Poster_None:string[255];
    //Флаг на изменения данных
    FLagChanges:boolean;
    //Добавление информации
    procedure AddToLV(Sender:TObject);
    //Изменение информации ListOfFilm
    procedure ChangeLV(HeaderList:TFilm;var ListOfFilm:TFilm);
    //Удаление данных из ListOfFilm
    procedure DeletLV(HeaderList:TFilm;Var ListOfFilm:TFilm);
    //отображение списка ListOfFilm
    procedure showLV (HeaderList,ListOfFilm:TFilm);
    function SaveFilm(AlwaysAsk: Boolean;Var changes:boolean): Boolean;
    //Чтение информации из файла  FFileName и загрузка в ListOfFilm
    procedure ReadFile(Var FFileName:string;Var ListOfFilm:TFilm; HeaderList: TFilm);
    //Поиск строки StrSearch в списке ListOfFilm
    procedure Search(StrSearch:string;HeaderList,ListOfFilm:TFilm);

    // если необходимо, запросить сохранение изменений
    // true если продолжаем (открываем новый файл или еще что)
    // false отмена продолжения (не открываем)
   function TestOfSave(Changes:boolean):boolean;
   procedure sortLV(HeaderList,ListOfFilm:TFilm;SRav:Func);
   procedure StartSort(TypeSort:integer);
   procedure randomFilm(HeaderList,ListOfFilm:TFilm);
   procedure exportsToTXT(HeaderList,ListOfFilm:TFilm);
  end;
  

var
  FMain: TFMain;

implementation

uses Info, Search, Sort, About;

{$R *.dfm}

procedure TFMain.TopFileOpenClick(Sender: TObject);
begin
  if testOfSave(FlagChanges) then
  begin
    if dlgOpen.Execute then
    begin
      FFileName := dlgOpen.Files[0];
      ReadFile(FFileName,ListOfFilm,HeaderList);
      showLV(HeaderList,ListOfFilm);
    end;
  end;
end;

procedure TFMain.TopFileNewClick(Sender: TObject);
Var
  temp:TFilm;
begin
  dlgOpen.InitialDir:=way;
  if TestOfSave(FLagChanges) then
  begin
    LVFilm.Clear;
    FFileName := '';
    temp:=nil;
    while HeaderList<>ListOfFilm do
    begin
      ListOfFilm:=HeaderList;
      while ListOfFilm.next<>nil do
      begin
        temp:=ListOfFilm;
        ListOfFilm:=ListOfFilm.next;
      end;
      ListOfFilm:=nil;
      dispose(ListOfFilm);
      ListOfFilm:=temp;
      ListOfFilm.next:=nil;
    end;
    FLagChanges := False;
  end;
end;


procedure TFMain.FormCreate(Sender: TObject);
begin
  way:=GetCurrentDir;
  //Создание заглавного элемента и основного списка
  new(HeaderList);
  ListOfFilm:=headerList;
  listofFilm.next:=nil;
  //задание начальных значений
  FLagChanges:=false;
  Poster_None:=way+'\pic\poster_none.jpg';
  FFileName:='';
  dlgOpen.InitialDir:=way;
  dlgSave.InitialDir:=way;
end;

procedure TFMain.AddToLV(Sender:TObject);
begin
  FchangeData.Show;
  FchangeData.ETitle.Enabled:=true;
  FchangeData.SPYear.Enabled:=true;
  FchangeData.CBGenre.Enabled:=true;
  FchangeData.EContry.Enabled:=true;
  FchangeData.EDirect.Enabled:=true;
  FchangeData.EHistory.Enabled:=true;
  FchangeData.SPMoney.Enabled:=true;
  FchangeData.SPMoneyUp.Enabled:=true;
  FchangeData.SPWath.Enabled:=true;
  FchangeData.SPTime.Enabled:=true;
  FchangeData.MMSubr.Enabled:=true;
  FchangeData.BChangePic.Enabled:=true;
  FchangeData.ETitle.Text:='';
  FchangeData.SPYear.Value:=0;
  FchangeData.CBGenre.Text:='';
  FchangeData.EContry.Text:='';
  FchangeData.EDirect.Text:='';
  FchangeData.EHistory.Text:='';
  FchangeData.SPMoney.Value:=0;
  FchangeData.SPMoneyUp.Value:=0;
  FchangeData.SPWath.Value:=0;
  FchangeData.SPTime.Value:=0;
  FchangeData.MMSubr.Text:='';
  FChangeData.BSave.Visible:=True;
  FchangeData.BSaveChanges.Visible:=false;
  FchangeData.BChanges.Visible:=false;
  FchangeData.ImageName:=Poster_None;
  FchangeData.ImgPoster.Picture.LoadFromFile(FchangeData.ImageName);
end;

procedure TFMain.BAddClick(Sender: TObject);
begin
  AddToLV(FMain);
end;

procedure TFMain.showLV (HeaderList,ListOfFilm:TFilm);
Var
  ListItem:TlistItem;
begin
 LVFilm.Clear;
 ListOfFilm:=HeaderList.next;
 LVFilm.Items.BeginUpdate;
 while  listOfFilm<>nil do
 begin
  listItem:=LVFilm.Items.add;
  ListItem.Caption:=listofFilm.Name;
  ListItem.SubItems.add(listofFilm.Year);
  ListItem.SubItems.add(listofFilm.Genre);
  ListItem.SubItems.add(listofFilm.Time);
  listOfFilm:=listOfFilm.next;
 end;
 LVFilm.Items.EndUpdate;
end;

procedure TFMain.ChangeLV(HeaderList:TFilm;var ListOfFilm:TFilm);
begin
  if LVFilm.SelCount=1 then
  begin
    FChangeData.ETitle.Enabled:=true;
    FChangeData.SPYear.Enabled:=true;
    FChangeData.CBGenre.Enabled:=true;
    FChangeData.EContry.Enabled:=true;
    FChangeData.EDirect.Enabled:=true;
    FChangeData.EHistory.Enabled:=true;
    FChangeData.SPMoney.Enabled:=true;
    FChangeData.SPMoneyUp.Enabled:=true;
    FChangeData.SPWath.Enabled:=true;
    FChangeData.SPTime.Enabled:=true;
    FChangeData.MMSubr.Enabled:=true;
    FChangeData.BSaveChanges.Enabled:=true;
    ListOfFilm:=HeaderList;
    while (LVFilm.Selected.Caption<>ListOfFilm.Name) or
          (LVFilm.Selected.SubItems[0]<>ListOfFilm.Year) or
          (LVFilm.Selected.SubItems[1]<>ListOfFilm.Genre) do
      ListOfFilm:=ListOfFilm.next;
    FchangeData.Show;
    FchangeData.ETitle.Text:=ListOfFilm.Name;
    FchangeData.SPYear.Value:=strtoint(ListOfFilm.Year);
    FchangeData.CBGenre.Text:=ListOfFilm.Genre;
    FchangeData.EContry.Text:=ListOfFilm.Contry;
    FchangeData.EDirect.Text:=ListOfFilm.Direct;
    FchangeData.EHistory.Text:=ListOfFilm.History;
    FchangeData.SPMoney.Value:=strtoint(ListOfFilm.Money);
    FchangeData.SPMoneyUp.Value:=strtoint(ListOfFilm.MoneyUp);
    FchangeData.SPWath.Value:=strtoint(ListOfFilm.Watch);
    FchangeData.SPTime.Value:=strtoint(ListOfFilm.Time);
    FchangeData.MMSubr.Text:=ListOfFilm.Disk;
    FchangeData.BChangePic.Enabled:=true;
    FchangeData.BSaveChanges.Visible:=true;
    FchangeData.BChanges.Visible:=false;
    FchangeData.BSave.Visible:=false;
    FChangeData.ImageName:=ListOFFilm.pic;
    IF  FileExists(way+ListOFFilm.pic) then
      FchangeData.ImgPoster.Picture.LoadFromFile(way+ListOFFilm.pic)
    else
      FchangeData.ImgPoster.Picture.LoadFromFile(FMain.Poster_None)
  end;
end;

procedure TFMain.DeletLV(HeaderList:TFilm;Var ListOfFilm:TFilm);
Var
  Temp:TFilm;
begin
  if LVFilm.SelCount=1 then
  begin
    ListOfFilm:=HeaderList;
    while (LVFilm.Selected.Caption<>ListOfFilm.next.Name) or
    (LVFilm.Selected.SubItems[0]<>ListOfFilm.next.Year) or
    (LVFilm.Selected.SubItems[1]<>ListOfFilm.next.Genre) do
      ListOfFilm:=ListOfFilm.next;
    Temp:=ListOfFilm.next;
    ListOfFilm.next:=ListOfFilm.next.next;
    dispose(Temp);
    showLV(HeaderList,ListOfFilm);
    FLagChanges:=true;
  end;
end;

procedure TFMain.BChangeClick(Sender: TObject);
begin
  ChangeLV(HeaderList,ListOfFilm);
end;

procedure TFMain.BDeletClick(Sender: TObject);
begin
  DeletLV(HeaderList,ListOfFilm);
end;

function TFMain.SaveFilm(AlwaysAsk: Boolean;Var changes:boolean): Boolean;
Var
  FileForSave:File of ListFilm;
  Data:ListFilm;
  Continue:boolean;
begin
  Continue:=true;
  Result := False;
  if (FFileName = '') or AlwaysAsk then
  begin
    dlgSave.InitialDir:=way;
    if dlgSave.Execute then FFileName := dlgSave.Files[0]
    else Continue:= not Continue;
  end;
  if Continue then
  begin
    AssignFile(FileForSave,FFileName);
    rewrite(FileForSave);
    ListOfFilm:=HeaderList.next;
    while ListOfFilm<>nil do
    begin
      Data:=ListOfFilm^;
      Data.next:=nil;
      write(FileForSave,Data);
      ListOfFilm:=ListOfFilm.next;
    end;
    closeFile(FileForSave);
    changes := False;
    Result := True;
  end;
end;


procedure TFMain.ReadFile(Var FFileName:string;Var ListOfFilm:TFilm; HeaderList: TFilm);
Var
  FileForRead:File of ListFilm;
  Data:ListFilm;
  temp:TFilm;
begin
  temp:=nil;
  while HeaderList<>ListOfFilm do
  begin
    ListOfFilm:=HeaderList;
    while ListOfFilm.next<>nil do
    begin
      temp:=ListOfFilm;
      ListOfFilm:=ListOfFilm.next;
    end;
    ListOfFilm:=nil;
    dispose(ListOfFilm);
    ListOfFilm:=temp;
    ListOfFilm.next:=nil;
  end;
  AssignFile(FileForRead,FFilename);
  reset(FileForRead);
  while not eof(FileForRead) do
  begin
    read(FileForRead,Data);
    new(ListOfFilm.next);
    ListOfFilm:=ListOfFilm.next;
    ListOfFilm^:=Data;
  end;
  closeFile(FileForRead);
end;

procedure TFMain.BTEstSaveClick(Sender: TObject);
begin
  SaveFilm(true,FlagChanges);
end;

procedure TFMain.BTestOpenClick(Sender: TObject);
begin
  ReadFile(FFileName,ListOfFilm,HeaderList);
  showLV(HeaderList,ListOfFilm);
end;

function TFMain.TestOfSave(Changes:boolean):boolean;
Var
  MSBResult:integer;
begin
  Result:= not Changes;
  if  Changes then
  MSBResult:= MessageBox(Handle, 'Файл был изменен. Сохранить изменения?',
                        'Сохранить?', MB_YESNOCANCEL or MB_ICONQUESTION);
    case MSBResult of
      IDYES:
        begin
          Result := SaveFilm(false,changes);
        end;
      IDNO:
        Result := True;
      IDCANCEL:
        Result := False;
    end;
end;

procedure TFMain.TopFileSaveClick(Sender: TObject);
begin
  SaveFilm(false,Flagchanges);
end;

procedure TFMain.TopFileSaveAsClick(Sender: TObject);
begin
  SaveFilm(true,Flagchanges);
end;

procedure TFMain.BBAddClick(Sender: TObject);
begin
  AddToLV(FMain);
end;

procedure TFMain.BBChangeClick(Sender: TObject);
begin
  ChangeLV(HeaderList,ListOfFilm);
end;

procedure TFMain.BBDelClick(Sender: TObject);
begin
  DeletLV(HeaderList,ListOfFilm);
end;

procedure TFMain.BBVieClick(Sender: TObject);
begin
  ChangeLV(HeaderList,ListOfFilm);
  FChangeData.ETitle.Enabled:=false;
  FChangeData.SPYear.Enabled:=false;
  FChangeData.CBGenre.Enabled:=false;
  FChangeData.EContry.Enabled:=false;
  FChangeData.EDirect.Enabled:=false;
  FChangeData.EHistory.Enabled:=false;
  FChangeData.SPMoney.Enabled:=false;
  FChangeData.SPMoneyUp.Enabled:=false;
  FChangeData.SPWath.Enabled:=false;
  FChangeData.SPTime.Enabled:=false;
  FChangeData.MMSubr.Enabled:=false;
  FChangeData.BChangePic.Enabled:=false;
  FChangeData.BSaveChanges.Enabled:=false;
  FchangeData.BChanges.Visible:=true;
  FChangeData.BSave.Visible:=false;
  FChangeData.BChanges.Enabled:=true;
end;

procedure TFMain.BBSearchClick(Sender: TObject);
begin
  Fsearch.Width:=312;
  FSearch.Height:=200;
  FSearch.EName.Text:='';
  FSearch.show;

end;

procedure TFMain.BBUpDateClick(Sender: TObject);
begin
  showLV(HeaderList,ListOfFilm);
end;

procedure TFmain.Search(StrSearch:string;HeaderList,ListOfFilm:TFilm);
Var
  ListItem:TlistItem;
  i:integer;
begin
  i:=0;
  LVFilm.Clear;
  ListOfFilm:=HeaderList;
  while ListOfFilm<>nil do
  begin
    if  StrSearch=ListOfFilm.Name then
    begin
      LVFilm.Items.BeginUpdate;
      listItem:=LVFilm.Items.add;
      ListItem.Caption:=listofFilm.Name;
      ListItem.SubItems.add(listofFilm.Year);
      ListItem.SubItems.add(listofFilm.Genre);
      ListItem.SubItems.add(listofFilm.Time);      
      LVFilm.Items.EndUpdate;
      inc(i);
    end;
    listOfFilm:=listOfFilm.next;
  end;
  if i=0 then
    messageBox(handle,'Результатов Нет','Не найдено',MB_OK);
end;

function FuncName(First,Second:ListFilm):boolean;
begin
  Result:=First.Name>Second.Name;
end;

function FuncYear(First,Second:ListFilm):boolean;
begin
  Result:=First.Year>Second.Year;
end;

function FuncTime(First,Second:ListFilm):boolean;
begin
  Result:=First.Time>Second.Time;
end;

function FuncContry(First,Second:ListFilm):boolean;
begin
  Result:=First.Contry>Second.Contry;
end;

procedure TFMain.sortLV(HeaderList,ListOfFilm:TFilm;SRav:Func);
Var
  SortMass:array of ListFilm;
  search:boolean;
  i:integer;
  ArLength:integer;
  ListItem:TlistItem;
//Простая сортировка пузырьком
procedure Sort(Var SortMass:array of ListFilm;ARLength:integer);
Var
  i,j:integer;
  temp:ListFilm;
begin
  for i:=0 to ARLength-1 do
  begin
    for j:=0 to ARLength-i-1 do
    begin
      if Srav(SortMass[j],SortMass[j+1]) then
      begin
        temp:=SortMass[j+1];
        SortMass[j+1]:=SortMass[j];
        SortMass[j]:=temp;
      end;
    end;
  end;
end;

begin
  setlength(Sortmass,LVFilm.Items.Count);
  for i:=0 to LVFilm.Items.Count-1 do
  begin
    search:=false;
    ListOfFilm:=HeaderList.next;
    while (ListOfFilm<>nil) and  not search do
    begin
      if (LVFilm.Items[i].Caption=ListOfFilm.Name) and
         (LVFilm.Items[i].SubItems[0]=ListOfFilm.Year) and
         (LVFilm.Items[i].SubItems[1]=ListOfFilm.Genre) then
      begin
        SortMass[i]:=listOfFilm^;
        SortMass[i].next:=nil;
        search:=true;
      end;
      ListOfFilm:=ListOfFilm.next;
    end;
  end;
  ArLength:=LVFilm.Items.Count-1;
  sort(SortMass,ArLength);
  LVFilm.Clear;
  LVFilm.Items.BeginUpdate;
  for i:=0 to ArLength do
  begin
    listItem:=LVFilm.Items.add;
    ListItem.Caption:=SortMass[i].Name;
    ListItem.SubItems.add(SortMass[i].Year);
    ListItem.SubItems.add(SortMass[i].Genre);
    ListItem.SubItems.add(SortMass[i].Time);
  end;
  LVFilm.Items.EndUpdate;
end;


procedure TFMain.BBSortClick(Sender: TObject);
begin
  FSort.Show;
end;

procedure TFmain.StartSort(TypeSort:integer);
begin
  case TypeSort of
  0:    sortLV(HeaderList,ListOfFilm,FuncName);
  1:    sortLV(HeaderList,ListOfFilm,FuncYear);
  2:    sortLV(HeaderList,ListOfFilm,FuncTime);
  3:    sortLV(HeaderList,ListOfFilm,FuncContry);
  end;
end;

procedure TFMain.randomFilm(HeaderList,ListOfFilm:TFilm);
Var
  i:integer;
begin
  randomize;
  LVFilm.Clear;
  showLV(HeaderList,ListOfFilm);
  ListOfFilm:=HeaderList;
  For i:=1 to random(LVFilm.Items.Count-1)+1 do
    ListOfFilm:=ListOfFilm.next;
  FchangeData.Show;
  FchangeData.ETitle.Text:=ListOfFilm.Name;
  FchangeData.SPYear.Value:=strtoint(ListOfFilm.Year);
  FchangeData.CBGenre.Text:=ListOfFilm.Genre;
  FchangeData.EContry.Text:=ListOfFilm.Contry;
  FchangeData.EDirect.Text:=ListOfFilm.Direct;
  FchangeData.EHistory.Text:=ListOfFilm.History;
  FchangeData.SPMoney.Value:=strtoint(ListOfFilm.Money);
  FchangeData.SPMoneyUp.Value:=strtoint(ListOfFilm.MoneyUp);
  FchangeData.SPWath.Value:=strtoint(ListOfFilm.Watch);
  FchangeData.SPTime.Value:=strtoint(ListOfFilm.Time);
  FchangeData.MMSubr.Text:=ListOfFilm.Disk;
  FchangeData.BSaveChanges.Visible:=true;
  FchangeData.BChanges.Visible:=true;
  FchangeData.BSave.Visible:=false;
  IF  FileExists(way+ListOFFilm.pic) then
    FchangeData.ImgPoster.Picture.LoadFromFile(way+ListOFFilm.pic)
  else
    FchangeData.ImgPoster.Picture.LoadFromFile(FMain.Poster_None);
  FChangeData.ETitle.Enabled:=false;
  FChangeData.SPYear.Enabled:=false;
  FChangeData.CBGenre.Enabled:=false;
  FChangeData.EContry.Enabled:=false;
  FChangeData.EDirect.Enabled:=false;
  FChangeData.EHistory.Enabled:=false;
  FChangeData.SPMoney.Enabled:=false;
  FChangeData.SPMoneyUp.Enabled:=false;
  FChangeData.SPWath.Enabled:=false;
  FChangeData.SPTime.Enabled:=false;
  FChangeData.MMSubr.Enabled:=false;
  FChangeData.BChangePic.Enabled:=false;
  FChangeData.BSaveChanges.Enabled:=false;
  FChangeData.BSave.Visible:=false;
  FChangeData.BChanges.Enabled:=true;
end;

procedure TFmain.exportsToTXT(HeaderList,ListOfFilm:TFilm);
Var
  FTextFile:textFile;
begin
  if dlgOpen.Execute then
  begin
    assignFile(FTextFile,dlgOpen.FileName+'.txt');
    rewrite(FTextFile);
    ListOfFilm:=headerList.next;
    while ListOfFilm<>nil do
    begin
      writeln(FTextFile,listOfFilm.name);
      ListOfFilm:=ListOfFilm.next;
    end;
    closeFile(FTextFile);
  end;
end;

procedure TFMain.BBRandomClick(Sender: TObject);
begin
  randomFilm(HeaderList,ListOfFilm);
end;

procedure TFMain.TopExitClick(Sender: TObject);
begin
  if not TestOfSave(FLagChanges) then exit;
  close;
end;

procedure TFMain.ExpTxtClick(Sender: TObject);
begin
  exportsToTXT(HeaderList,ListOfFilm);
end;

procedure TFMain.TopAboutProgrClick(Sender: TObject);
Var
  FTextFile:textfile;
  str:string;
begin
  Fabout.show;
  FAbout.MMText.Text:='';
  Fabout.LTitle.Caption:='O программе';
  assignfile(Ftextfile,Fmain.way+'\txt\'+'AboutProgram.txt');
  reset(FtextFile);
  while not eof (FtextFile) do
  begin
    readln(Ftextfile,str);
    FAbout.MMText.Text:=FAbout.MMText.Text+str;
  end;
  FAbout.MMText.Enabled:=false;
  closefile(FTextFile);

end;

procedure TFMain.TopAboutAClick(Sender: TObject);
Var
  FTextFile:textfile;
  str:string;
begin
  Fabout.show;
  FAbout.MMText.Text:='';
  Fabout.LTitle.Caption:='Oб авторе';
  assignfile(Ftextfile,Fmain.way+'\txt\'+'Aboutcreator.txt');
  reset(FtextFile);
  while not eof (FtextFile) do
  begin
    readln(Ftextfile,str);
    FAbout.MMText.Text:=FAbout.MMText.Text+str;
  end;
  FAbout.MMText.Enabled:=false;
  closefile(FTextFile);
end;

end.


