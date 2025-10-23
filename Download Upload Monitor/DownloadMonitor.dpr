program DownloadMonitor;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  API in 'API.pas',
  API_usage in 'API_usage.pas',
  Convert_Unit in 'Convert_Unit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
