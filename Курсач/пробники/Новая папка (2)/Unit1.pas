unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
   TScores = record
     name: string[50];
     score: integer;
   end;  

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    //procedure Memo1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  rank: array[1..3] of Tscores;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  //test:TScores;
  i: Integer;
  myFile: File of TScores;
  begin
begin
  AssignFile(myFile,'C:\Users\Mike\Desktop\Labs\test\Rank.dat');
  Rewrite(myFile);

  try
    for i := 1 to 3 do
      Write(myFile, Rank[i]);
 finally
   CloseFile(myFile);
 end;
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
  Scores: TScores;
  myFile: File of TScores;
begin
begin
  AssignFile(myFile, 'C:\Users\Mike\Desktop\Labs\test\Rank.dat');
  Reset(myFile);

  try
    i := 1;
    while not EOF(myFile) do 
    begin
      Read(myFile, Scores);
      Rank[i] := Scores;
      Inc(i);
    end;
  finally
   CloseFile(myFile);
  end;
 end;
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
  edit1.Text:=rank[1].name;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  rank[1].name:='Тест';
  rank[1].score:=0;
end;

end.
