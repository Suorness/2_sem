unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
   sc =^TScores;
    TScores = record
     name: string[50];
     score: integer;
     next:sc;
   end;  

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Edit2: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  rank: array[1..3] of Tscores;
  first:sc;
  list:sc;

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
  edit2.Text:=inttostr(rank[1].score);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i:integer;
begin
  list:=first^.next;
  i:=1;
  while list <>nil do
  begin
    rank[i].name:=list.name;
    rank[i].score:=list.score;
    inc(i);
    list:=list^.next;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  new(first);
  new(first^.next);
  list:=first^.next;
  list^.name:='Тест';
  list^.score:=42;
  new(list^.next);
  list:=list^.next;
  list^.name:='test2';
  list^.score:=43;
  list^.next:=nil;
end;

end.
