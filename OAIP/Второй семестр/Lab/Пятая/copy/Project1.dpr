program Project1;

uses
  Forms,
  Unit1 in '..\Unit1.pas' {FMain},
  Unit2 in '..\Unit2.pas' {FListPlain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFListPlain, FListPlain);
  Application.Run;
end.
