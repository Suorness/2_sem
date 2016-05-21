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
  private
    //���� � ����������� �����
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
    //function FuncName(Senger:TObject;First,Second:ListFilm):boolean;

    // ���� ����������, ��������� ���������� ���������
    // true ���� ���������� (��������� ����� ���� ��� ��� ���)
    // false ������ ����������� (�� ���������)
    function TestOfSave(Changes:boolean):boolean;
   procedure sortLV(Sender:TObject;SRav:Func);
   procedure StartSort(Sender:TObject;TypeSort:integer);
   procedure randomFilm(Sender:TObject);

  end;

var
  FMain: TFMain;

implementation

uses Unit2, Unit3, Unit4;

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
  //�������� ���������� �������� � ��������� ������
  new(HeaderList);
  ListOfFilm:=headerList;
  listofFilm.next:=nil;
  FLagChanges:=false;
  Poster_None:='C:\Users\Mike\Desktop\Labs\2_sem\������\��������\pic\poster_none.jpg';
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

{ListOfFilm HeaderList}
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
  ListItem.SubItems.add(listofFilm.Time);
  listOfFilm:=listOfFilm.next;
 end;
 LVFilm.Items.EndUpdate;
end;
{ListOFFilm}
procedure TFMain.ChangeLV(Sender:TOBject);
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
    FchangeData.BSaveChanges.Visible:=true;
    FchangeData.BChanges.Visible:=false;
    FchangeData.BSave.Visible:=false;
    FChangeData.ImageName:=ListOFFilm.pic;
    IF  ListOFFilm.pic <> '' then
      FchangeData.ImgPoster.Picture.LoadFromFile(ListOFFilm.pic)
    else
      FchangeData.ImgPoster.Picture.LoadFromFile(FMain.Poster_None)

  end;
end;

{Var listOfFilm}
procedure TFMain.DeletLV(Sender:TOBject);
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
    showLV(Fmain);
    FLagChanges:=true;
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

{Var FLagChanges FFileName}
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

{ListOfFilm,FFileName,headerList}
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
  MSBResult:= MessageBox(Handle, '���� ��� �������. ��������� ���������?', '���������?', MB_YESNOCANCEL or MB_ICONQUESTION);
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
  showLV(Fmain);
end;

{ListOfFilm}
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
      ListItem.SubItems.add(listofFilm.Time);      
      LVFilm.Items.EndUpdate;
      inc(i);
    end;
    listOfFilm:=listOfFilm.next;
  end;
  if i=0 then
    messageBox(handle,'����������� ���','�� �������',MB_OK);
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

{ListOfFilm,HeaderList}
procedure TFMain.sortLV(Sender:TObject;SRav:Func);
Var
  SortMass:array of ListFilm;
  search:boolean;
  i:integer;
  ArLength:integer;
  ListItem:TlistItem;

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

procedure TFmain.StartSort(Sender:Tobject;TypeSort:integer);
begin
  case TypeSort of
  0:    sortLV(Fmain,FuncName);
  1:    sortLV(Fmain,FuncYear);
  2:    sortLV(Fmain,FuncTime);
  3:    sortLV(Fmain,FuncContry);
  end;
end;

{ListOfFilm}
procedure TFMain.randomFilm(Sender:TObject);
Var
  i:integer;
begin
  randomize;
  LVFilm.Clear;
  showLV(Fmain);
  ListOfFilm:=HeaderList;
  For i:=1 to random(LVFilm.Items.Count-1)+1 do
  begin
    ListOfFilm:=ListOfFilm.next;
  end;
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

procedure TFMain.BBRandomClick(Sender: TObject);
begin
  randomFilm(FMain);
end;

procedure TFMain.TopExitClick(Sender: TObject);
begin
  if not TestOfSave(FLagChanges) then exit;
  close;
end;

end.


