program FilmoTeka;

uses
  Forms,
  Main in 'Main.pas' {FMain},
  Info in 'Info.pas' {FChangeData},
  Search in 'Search.pas' {FSearch},
  Sort in 'Sort.pas' {FSort},
  About in 'About.pas' {FAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFChangeData, FChangeData);
  Application.CreateForm(TFSearch, FSearch);
  Application.CreateForm(TFSort, FSort);
  Application.CreateForm(TFAbout, FAbout);
  Application.Run;
end.
