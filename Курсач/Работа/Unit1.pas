unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Buttons;

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
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MSaveAsClick(Sender: TObject);
    procedure MFileClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);

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
  setlength(FilmArray,FilmCount);
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
    for i:=1 to filmcount do
    begin
      write(FileSave,filmArray[i]);

    end;
  finally
   CloseFile(FileSave);
  end;
end;




end.

