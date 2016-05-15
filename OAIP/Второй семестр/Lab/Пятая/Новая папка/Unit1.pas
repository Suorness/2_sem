unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;
Type
  TAirplain=record
    //Тип самолета
    TypeAirPlain:string[50];
    //Год выпуска
    Year:integer;
    //расход горючего на 1000 км
    oil:integer;

  end;

  TTimeTable=record
    //номер рейса
    numberFlight:integer;
    //пункт назначение
    place:string[50];
    //дальность полета
    range:integer;
    //тип самолета
    aircraft:TAirplain;
    //время вылета
    timeOutPut:TDateTime;
    //время прибытия
    timeComing:TDateTime;
  end;
type
  TFMain = class(TForm)
    ButtomListPlain: TButton;
    ListTable: TListView;
    LabMainText: TLabel;
    LabNumberFlight: TLabel;
    LabPlace: TLabel;
    LabRange: TLabel;
    LabAirCraft: TLabel;
    LabTimeOutPut: TLabel;
    LabComing: TLabel;
    EPlace: TEdit;
    ComboBoxAirPlain: TComboBox;
    TimeOutPut: TDateTimePicker;
    TimeComing: TDateTimePicker;
    BTest: TButton;
    BTest2: TButton;
    BAddDataList: TButton;
    BDowloadData: TButton;
    SENumberFlight: TSpinEdit;
    SERange: TSpinEdit;
    BDel: TButton;
    procedure ButtomListPlainClick(Sender: TObject);
    procedure BTestClick(Sender: TObject);
    procedure ComboBoxAirPlainDropDown(Sender: TObject);
    procedure BAddDataListClick(Sender: TObject);
    procedure BDowloadDataClick(Sender: TObject);
    procedure BDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure addToFileListTable(Sender:TObject);
    procedure addToListTable(Sender:TObject);
    procedure DeleteDateInList(Sender:TObject);
  end;

var
  FMain: TFMain;

implementation

uses Unit2;

{$R *.dfm}

procedure TFMain.ButtomListPlainClick(Sender: TObject);
begin
  flistPlain.show;
end;

procedure TFMain.BTestClick(Sender: TObject);

begin
  addToListTable(FMain);
end;

//end;

procedure TFMain.ComboBoxAirPlainDropDown(Sender: TObject);
Var
 FileForUpDate:File of TAirplain;
 Data:Tairplain;

begin
  ComboBoxAirplain.Clear;
  assignfile(FileForUpDate,'PlainList.dat');
  reset(FileForUpDate);
  while not eof(FileForUpDate) do
  begin
    read(FileForUpDate,Data);
    ComboBoxAirplain.AddItem(Data.TypeAirPlain,ComboBoxAirplain);
  end;
  closefile(FileForUpDate)
end;

procedure TFMain.addToFileListTable(Sender:TObject);
Var
  FileForSave:File of TTimeTable;
  FileInfo:File of TAirPlain;
  AddData:TTimeTable;
  ListItem:TlistItem;
begin
  if (SENumberFlight.value <>0) and(EPlace.text <>'' ) and(SERange.value<>0 )and(ComboBoxAirPlain.text <>'' )  then
  begin
    assignFile(FileInfo,'PlainList.dat');
    reset(FileInfo);

    adddata.numberFlight:=SENumberFlight.value;
    adddata.place:=EPlace.text;
    adddata.range:=SERange.value;
    EPlace.text:='';
    SERange.Value:=0;
    SENumberFlight.value:=0;

    repeat
      read(FileInfo,adddata.aircraft);
    until (ComboBoxAirPlain.text=adddata.aircraft.TypeAirPlain) or eof(FileInfo);
    closeFile(FileInfo);
    adddata.timeOutPut:=timeOutPut.DateTime;
    adddata.timeComing:=timeComing.DateTime;
    assignfile(FileForSave,'TimeTable.dat');
    reset(FileForSave);
    seek(FileForSave,FileSize(FileForSave));
    write(FileForSave,AddData);
    closeFile(FileForSave);
    timeoutPut.DateTime:=time;
    timeComing.DateTime:=time;
    ComboBoxAirPlain.text:='';
    listTable.Items.BeginUpdate;
    listItem:=listTable.Items.add;
    ListItem.Caption:=inttostr(addData.numberFlight);
    ListItem.SubItems.add(addData.place);
    ListItem.SubItems.add(inttostr(addData.range));
    ListItem.SubItems.add(addData.aircraft.TypeAirPlain);
    ListItem.SubItems.add(TimeToStr(AddData.timeOutPut));
    ListItem.SubItems.add(TimeToStr(AddData.timeComing));
    listTable.Items.EndUpdate;

  end
  else
  showmessage('error');
end;
procedure TFMain.addToListTable(Sender:TObject);
Var
 FileForLoad:File of TTimeTable;
 AddData:TTimeTable;
 ListItem:TlistItem;
 //formattedDateTime : string;
begin
  listTable.Clear;
  assignfile(FileForLoad,'TimeTable.dat');
  reset(FileForLoad);
  while not eof(FileForLoad) do
  begin
    read(FileForLoad,addData);
    listTable.Items.BeginUpdate;
    listItem:=listTable.Items.add;
    ListItem.Caption:=inttostr(addData.numberFlight);
    ListItem.SubItems.add(addData.place);
    ListItem.SubItems.add(inttostr(addData.range));
    ListItem.SubItems.add(addData.aircraft.TypeAirPlain);
    ListItem.SubItems.add(TimeToStr(AddData.timeOutPut));
    ListItem.SubItems.add(TimeToStr(AddData.timeComing));
    listTable.Items.EndUpdate;
  end;
  //showmessage('End File');
  closefile(FileForLoad);
end;

procedure TFMain.BAddDataListClick(Sender: TObject);
begin
  addToFileListTable(FMain);
end;

procedure TFMain.BDowloadDataClick(Sender: TObject);
begin
  addToListTable(Fmain);
end;
procedure TFMain.DeleteDateInList(Sender:TObject);
Var
 FileForUpDate:File of TTimeTable;
 AddData:TTimeTable;
 FileInfo:File of TAirPlain;
 //addInfo:TAirPlain;
 i:integer;
begin
  ListTable.DeleteSelected;
  assignfile(FileForUpDate,'TimeTable.dat');
  rewrite(FileForUpDate);

  assignFile(FileInfo,'PlainList.dat');
  reset(FileInfo);

  for i:=0 to ListTAble.Items.Count-1 do
  begin
    adddata.numberFlight:=SENumberFlight.value;
    adddata.place:=EPlace.text;
    adddata.range:=SERange.value;

    repeat
      read(FileInfo,adddata.aircraft);
    until (ComboBoxAirPlain.text=adddata.aircraft.TypeAirPlain) or eof(FileInfo);
    closeFile(fileInfo);

    adddata.timeOutPut:=timeOutPut.DateTime;
    adddata.timeComing:=timeComing.DateTime;
    write(FileForUpDate,AddData);
  end;
  closeFile(FileForUpDate);
end;

procedure TFMain.BDelClick(Sender: TObject);
begin
  DeleteDateInList(FMain);
end;

end.
