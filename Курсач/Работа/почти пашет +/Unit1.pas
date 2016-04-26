unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Buttons, ExtCtrls, jpeg;

type
  Tlist= ^TlistEL;
  TListEl= record
    FilmName:string[50];
    FilmYear:integer;
    Next:Tlist;
  end;
  Tarray = array of TListEl;

  TFMain = class(TForm)
    MenuMain: TMainMenu;
    MFile: TMenuItem;
    MNew: TMenuItem;
    MSave: TMenuItem;
    MSaveAs: TMenuItem;
    MRenamed: TMenuItem;
    MClose: TMenuItem;
    MAbout: TMenuItem;
    MSort: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    ListFilm: TListView;
    BitBtn1: TBitBtn;
    MOpen: TMenuItem;
    BitBtn2: TBitBtn;
    DetailInfo: TPanel;
    PanelPoster: TImage;
    PanelFilmTitle: TEdit;
    PanelGenre: TLabel;
    PanelGenreLabel: TEdit;
    PanelYearLabel: TLabel;
    PanelYearEdit: TEdit;
    PanelCountryLabel: TLabel;
    Edit1: TEdit;
    PanelProducerLabel: TLabel;
    PanelProducerEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MSaveAsClick(Sender: TObject);
    //procedure MFileClick(Sender: TObject);
    //procedure OpenClick(Sender: TObject);
    procedure MOpenClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    FFileName: String;
    FilmCount:integer;
    procedure addlist(Sender: TObject;firstEnt:boolean;var filmlist:TList);
    Procedure addToArray(Sender: TObject;var FilmArray:Tarray);
    procedure addToList(Sender:TObject;var filmlist:TList);
    procedure addFilmList(Sender:TObject);
    procedure tempdata(Sender:TObject;var filmlist:Tlist);
  public

  end;

var
  FMain: TFMain;
  First,FilmList:Tlist;
  FilmArray:Tarray;


implementation

{$R *.dfm}
{��������� ����� �������� ������ ��� ������ �������� ������}
procedure TFMain.addlist(Sender: TObject;firstEnt:boolean;var filmlist:TList
                         {var FilmCount:integer});
begin
  FilmList:=first^.Next;  {�������� � ���������� ���������}
  while Filmlist.next<>nil do
  begin
    filmlist:=filmlist^.Next;
  end;
  {�������� �� ������ ����}
  {���� �������� ������ �� ��������, �� ����� � ���� �������}
  if filmlist^.FilmName <>'' then
  begin
    new(filmlist^.next);
    filmlist:=filmlist^.Next;
    filmlist^.next:=nil;
    inc(FilmCount);
  end;
end;
{��������� ������ ��������� �� ������ � �������������� ������}
Procedure TFMain.addToArray(Sender: TObject;var FilmArray:Tarray);
var
  i:integer;
begin
  i:=0;
  setlength(FilmArray,FilmCount+1);
  filmlist:=first^.next;
  while filmlist<> nil do
  begin
    {�������� �� �������� ��������� ������� ��� ����������!!!}
    FilmArray[i].FilmName:=filmlist.FilmName;
    FilmArray[i].FilmYear:=filmlist.FilmYear;

    {} {����� ��� nil ���������� � ��������� ������}
    inc(i);
     filmlist:=filmlist^.Next;
  end;

end;

{��������� ������ �� ������������� ������� � ������}
procedure TFMain.addToList(Sender: TObject;var filmlist:TList);
var
  i:integer;
begin
  filmlist:=first^.Next;
  for i:=0 to length(FilmArray)-1 do {+-1 need?}
  begin
    filmlist.FilmName:=FilmArray[i].FilmName;
    filmlist.FilmYear:=filmArray[i].FilmYear;

    {� ��� ���� ����� ����������� ����� ��������}
    new(filmlist^.next);
    {� ����� ����� ���� ������ �������, ����� ���������}
    filmlist:=filmlist^.Next;
  end;
  filmlist^.Next:=nil;
end;

procedure TFMain.addFilmList(Sender:TObject);
var


  ListItem : TListItem;
 begin

  FilmList:=first^.Next;
  Listfilm.Items.BeginUpdate;
  while filmlist<>nil do
  begin
    ListItem:= Listfilm.Items.Add;
    ListItem.Caption:=filmlist.filmname;
    ListItem.SubItems.Add(inttostr(filmlist^.FilmYear));
    filmlist:=filmlist^.Next;

  end;
  Listfilm.Items.EndUpdate;
end;

procedure TFMain.tempdata(Sender:TObject;var filmlist:Tlist);
var
  I:integer;

begin
  i:=0;
  randomize;
  addlist(FMain,true,filmlist);
  filmlist^.FilmName:='�����'+inttostr(i);
  filmlist^.FilmYear:=1900+random(150);
  for i:=1 to 5 do
  begin
    addlist(FMain,false,filmlist);
    filmlist^.FilmName:='�����'+inttostr(i);
    filmlist^.FilmYear:=1900+random(150);
  end;
end;



procedure TFMain.FormCreate(Sender: TObject);
begin
 {��� �������� ����� ����� ���������� ������ ��� ��������� �� ������
 ������� � ��� �� ����}
  new(first);
  new(first.next);
  filmlist:=first^.next;
  filmlist^.Next:=nil;
  {��������� ��������� ������� � ����}
  FilmCount:=0;
end;

procedure TFMain.BitBtn1Click(Sender: TObject);
begin
  tempdata(FMain,filmlist);
  addFilmlist(FMain);
end;

procedure TFMain.MSaveAsClick(Sender: TObject);
var
  i:integer;

  FileSave: File of TListEl;
begin
  //if not dlgSave.Execute then Exit;
  //FFileName := dlgSave.Files[0];
  addtoarray(FMain,Filmarray);
  assignfile(FileSave,'C:\Users\Mike\Desktop\Labs\test\Test.dat');
  rewrite(FileSave);
  try
    for i:=0 to filmcount do
    begin
      write(FileSave,filmArray[i]);

    end;
  finally
   CloseFile(FileSave);
  end;
end;




procedure TFMain.MOpenClick(Sender: TObject);
var
  i:integer;
  scores:TListEl;
  LoadFile: file of TListEl;

begin
  FilmCount:=0;
  AssignFile(LoadFile,'C:\Users\Mike\Desktop\Labs\test\Test.dat');
  reset(LoadFile);
  while not EOF(loadFile) do
  begin
    inc(FilmCount);
    read(loadfile,scores);
  end;
  reset(LoadFile);
  try
  i:=0;
  setlength(FilmArray,FilmCount);
  while not EOF(loadFile) do
  begin
    read(loadfile,scores);

    {������ ��� � ��� ���� ����� � ������}
   // FilmArray[filmCount]:=scores;
    FilmArray[i].FilmName:=scores.FilmName;
    FilmArray[i].FilmYear:=scores.FilmYear;
    inc(i);
  end;
  addtolist(FMain,Filmlist);
  finally
    closeFile(LoadFile);
  end;


end;

procedure TFMain.BitBtn2Click(Sender: TObject);
begin

  addFilmlist(FMain);
end;

end.

