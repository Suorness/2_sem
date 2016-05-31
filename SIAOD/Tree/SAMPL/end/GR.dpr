{ WinGraphViz Demo Application

Copyright 2004-2007 Kyle Cordes  (http://kylecordes.com)

}

program GR;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FMain},
  WINGRAPHVIZLib_TLB in '..\..\..\..\..\..\Delphi-WinGraphViz-Example\WINGRAPHVIZLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
