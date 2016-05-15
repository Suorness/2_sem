program Laba5fin;

uses
  Forms,
  Unit1 in 'pas\Unit1.pas' {FMain},
  Unit2 in 'pas\Unit2.pas' {FListPlain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFListPlain, FListPlain);
  Application.Run;
end.
