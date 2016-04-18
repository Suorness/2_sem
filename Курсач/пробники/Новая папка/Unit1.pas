unit BaseObject;

interface

uses DBXJSON, DBXJSONReflect;

type
  TBaseObject = class
  public
    { public declarations }
    class function ObjectToJSON <T : class>(myObject: T): TJSONValue;
    class function JSONToObject<T : class>(json: TJSONValue): T;
  end;

implementation

{ TBaseObject }

class function TBaseObject.JSONToObject<T>(json: TJSONValue): T;
var
  unm: TJSONUnMarshal;
begin
  if json is TJSONNull then
    exit(nil);
  unm := TJSONUnMarshal.Create;
  try
    exit(T(unm.Unmarshal(json)))
  finally
    unm.Free;
  end;

end;

class function TBaseObject.ObjectToJSON<T>(myObject: T): TJSONValue;
var
  m: TJSONMarshal;
begin

  if Assigned(myObject) then
  begin
    m := TJSONMarshal.Create(TJSONConverter.Create);
    try
      exit(m.Marshal(myObject));
    finally
      m.Free;
    end;
  end
  else
    exit(TJSONNull.Create);

end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;


Type
  TTestrecord = ^testt;
  testt= record
    name:string[20];
    year:string[20];
    next:TTestRecord;
       end;



  TRecordArray = array of TTestRecord;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  // я пошел есть


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
 // list:TTestRecord;
 // strm:TMemoryStream;
  //ra : TRecordArray;

  rTestRecord: TTestRecord;
  strm : TMemoryStream;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  //setlength(ra,5);
 // strm.Write(ra[0], SizeOf(TTestRecord) * Length(ra));
 strm.Write(rTestRecord, Sizeof(TTestRecord) );
end;

end.
