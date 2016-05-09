unit Unit1;

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
  private
    //Путь к открытового файла
    FFileName:string;

  public
    ListOfFilm,HeaderList:TFilm;
    Poster_None:string[255];
    FLagChanges:boolean;
    procedure AddToLV(Sender:TObject);
    procedure ChangeLV(sender:TOBject);
    procedure DeletLV(Sender:TOBject);
    procedure showLV(Sender:TOBject);
    function SaveFilm(Sender:ToBject;AlwaysAsk: Boolean): Boolean;
    procedure ReadFile(Sender:TOBject);
    procedure Search(sender:Tobject;StrSearch:string);

    // если необходимо, запросить сохранение изменений
    // true если продолжаем (открываем новый файл или еще что)
    // false отмена продолжения (не открываем)
    function TestOfSave(Changes:boolean):boolean;
    procedure sortLV(Sender:TObject);
  end;

var
  FMain: TFMain;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TFMain.TopFileOpenClick(Sender: TObject);
begin
  if not TestOfSave(FlagChanges) then Exit;
  if  not dlgOpen.Execute then exit;
  FFileName := dlgOpen.Files[0];
  ReadFile(Fmain);
  showLV(FMain);
end;

procedure TFMain.TopFileNewClick(Sender: TObject);
Var
  temp:TFilm;
begin
  if not TestOfSave(FLagChanges) then exit;
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


procedure TFMain.FormCreate(Sender: TObject);
begin
  //Создание заглавного элемента и основного списка
  new(HeaderList);
  ListOfFilm:=headerList;
  listofFilm.next:=nil;
  FLagChanges:=false;
  Poster_None:='C:\Users\Mike\Desktop\Labs\2_sem\курсач\Создание\pic\poster_none.jpg';
  FFileName:='';
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

procedure TFMain.showLV (Sender:TOBject);
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
  listOfFilm:=listOfFilm.next;
 end;
 LVFilm.Items.EndUpdate;
end;

procedure TFMain.ChangeLV(Sender:TOBject);
begin
  if LVFilm.SelCount=1 then
  begin
    ListOfFilm:=HeaderList;
    while LVFilm.Selected.Caption<>ListOfFilm.Name do
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
    IF  ListOFFilm.pic <> '' then
      FchangeData.ImgPoster.Picture.LoadFromFile(ListOFFilm.pic)
    else
      FchangeData.ImgPoster.Picture.LoadFromFile(FMain.Poster_None)

  end;
end;

procedure TFMain.DeletLV(Sender:TOBject);
Var
  Temp:TFilm;
begin
  FLagChanges:=true;
  if LVFilm.SelCount=1 then
  begin
    ListOfFilm:=HeaderList;
    while LVFilm.Selected.Caption<>ListOfFilm.next.Name do
      ListOfFilm:=ListOfFilm.next;
    Temp:=ListOfFilm.next;
    ListOfFilm.next:=ListOfFilm.next.next;
    dispose(Temp);
    showLV(Fmain);
  end;
end;

procedure TFMain.BChangeClick(Sender: TObject);
begin
  ChangeLV(FMain);
  //SaveFilm(FMain);
end;

procedure TFMain.BDeletClick(Sender: TObject);
begin
  DeletLV(FMain);
  //SaveFilm(Fmain);
end;

function TFMain.SaveFilm(Sender:TOBject;AlwaysAsk: Boolean): Boolean;
Var
  FileForSave:File of ListFilm;
  Data:ListFilm;
begin
  Result := False;
  if (FFileName = '') or AlwaysAsk then
  begin
    if not dlgSave.Execute then Exit;
    FFileName := dlgSave.Files[0];
  end;
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
  
  FLagChanges := False;
  Result := True
end;

procedure TFMain.ReadFile(Sender:TOBject);
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
  SaveFilm(FMain,true);
end;

procedure TFMain.BTestOpenClick(Sender: TObject);
begin
  ReadFile(Fmain);
  showLV(FMain);
end;

function TFMain.TestOfSave(Changes:boolean):boolean;
Var
  MSBResult:integer;
begin
  Result:= not Changes;
  if  Changes then
  MSBResult:= MessageBox(Handle, 'Файл был изменен. Сохранить изменения?', 'Сохранить?', MB_YESNOCANCEL or MB_ICONQUESTION);
    case MSBResult of
      IDYES:
        begin
          Result := SaveFilm(Fmain,false);
        end;
      IDNO:
        Result := True;
      IDCANCEL:
        Result := False;
    end;
end;

procedure TFMain.TopFileSaveClick(Sender: TObject);
begin
  SaveFilm(Fmain,false);
end;

procedure TFMain.TopFileSaveAsClick(Sender: TObject);
begin
  SaveFilm(Fmain,true);
end;

procedure TFMain.BBAddClick(Sender: TObject);
begin
  AddToLV(FMain);
end;

procedure TFMain.BBChangeClick(Sender: TObject);
begin
  ChangeLV(FMain);
end;

procedure TFMain.BBDelClick(Sender: TObject);
begin
  DeletLV(FMain);
end;

procedure TFMain.BBVieClick(Sender: TObject);
begin
  ChangeLV(FMain);
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

procedure TFMain.BBSearchClick(Sender: TObject);
begin
  Fsearch.Width:=312;
  FSearch.Height:=200;
  FSearch.EName.Text:='';
  FSearch.show;

end;

procedure TFMain.BBUpDateClick(Sender: TObject);
begin
  showLV(Fmain);
end;

procedure TFmain.Search(sender:Tobject;StrSearch:string);
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
      LVFilm.Items.EndUpdate;
    end;
    listOfFilm:=listOfFilm.next;
  end;
end;

procedure TFMain.sortLV(Sender:TObject);
Var
  TempHeaderList,TempListOfFilm,temp:TFilm;
  i:integer;
  search:boolean;
Procedure qSort;
begin
  
end;
begin
  new(TempHeaderList);
  TempListOfFilm:=TempHeaderList;
  for i:=0 to LVFilm.Items.Count-1 do
  begin
    ListOfFilm:=HeaderList;
    search:=false;
    while (ListOfFilm<>nil) and not search do
    begin
      if (LVFilm.Items[i].Caption=ListOfFilm.Name) and
         (LVFilm.Items[i].SubItems[0]=ListOfFilm.Year) and
         (LVFilm.Items[i].SubItems[1]=ListOfFilm.Genre) then
      begin
        new(TempListOfFilm.next);
        TempListOfFilm:=TempListOfFilm.next;
        TempListOfFilm^:=ListOfFilm^;
        search:=true;
      end;
      ListOfFilm:=ListOfFilm.next;
    end;
  end;


  //окончание
  TempListOfFilm:=TempHeaderList;
  while TempListOfFilm.next<>nil do
  begin
    temp:=templistofFilm;
    while TempListOfFilm.next<>nil do
    begin
      temp:=TempListOfFilm;
      TempListOfFilm:=TempListOfFilm.next;
    end;
    dispose(TempListOfFilm);
    temp.next:=nil;
    TempListOfFilm:=TempHeaderList;
  end;
  dispose(TempHeaderList);

end;


procedure TFMain.BBSortClick(Sender: TObject);
begin
  sortLV(Fmain);
end;

end.


