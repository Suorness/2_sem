unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

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
    Edit1: TEdit;
    PanelFilm: TPanel;
    LVFilm: TListView;
    PFunction: TPanel;
    BAdd: TButton;
    BChange: TButton;
    BDelet: TButton;
    BTEstSave: TButton;
    BTestOpen: TButton;
    procedure TopFileOpenClick(Sender: TObject);
    procedure TopFileNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BChangeClick(Sender: TObject);
    procedure BDeletClick(Sender: TObject);
    procedure BTEstSaveClick(Sender: TObject);
    procedure BTestOpenClick(Sender: TObject);
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
    procedure SaveFilm(Sender:ToBject);
    procedure ReadFile(Sender:TOBject);
    //проверка на необходимость сохранения изменения
    //true - надо сохрнить
    // false не надо
    function TestOfSave(FlagChanges:boolean):boolean;
  end;

var
  FMain: TFMain;

implementation

uses Unit2;

{$R *.dfm}

procedure TFMain.TopFileOpenClick(Sender: TObject);
begin
  if  not dlgOpen.Execute then exit;
  FFileName := dlgOpen.Files[0];
  //test string!!!
  edit1.Text:=FFileName;
  {Тут нужно продолжение
  Очистка старого списка
  Загрузка типизированныго файла
  Еще можно установить фильтр типа файла}

end;

procedure TFMain.TopFileNewClick(Sender: TObject);
begin
  {Проверка сохранений
  очистка  старого списка
  }
end;


procedure TFMain.FormCreate(Sender: TObject);
begin
  //Создание заглавного элемента и основного списка
  new(HeaderList);
  ListOfFilm:=headerList;
  listofFilm.next:=nil;
  FLagChanges:=false;
  Poster_None:='C:\Users\Mike\Desktop\Labs\2_sem\курсач\Создание\pic\poster_none.jpg';
 // FFileName:='C:\Users\Mike\Desktop\Labs\2_sem\курсач\Создание\File\List.dat';
  FFileName:='';
end;

procedure TFMain.AddToLV(Sender:TObject);
begin
  FchangeData.Show;
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
    FchangeData.ImgPoster.Picture.LoadFromFile(ListOFFilm.pic);
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

Procedure TFMain.SaveFilm(Sender:TOBject);
Var
  FileForSave:File of ListFilm;
  Data:ListFilm;
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
  SaveFilm(FMain);
end;

procedure TFMain.BTestOpenClick(Sender: TObject);
begin
  ReadFile(Fmain);
  showLV(FMain);
end;

procedure TFMain.TestOfSave(Sender:Tobject);
begin
  
end;

end.
