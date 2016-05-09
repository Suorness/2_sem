program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FMain},
  Unit2 in 'Unit2.pas' {FChangeData},
  Unit3 in 'Unit3.pas' {FSearch};


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFChangeData, FChangeData);
  Application.CreateForm(TFSearch, FSearch);
  Application.Run;
end.
