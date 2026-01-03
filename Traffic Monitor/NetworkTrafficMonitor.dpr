program NetworkTrafficMonitor;

uses
  Forms,
  IPHelper in 'IPHelper.pas',
  IPHLPAPI in 'IPHLPAPI.pas',
  Unit1 in 'Unit1.pas' {Form1},
  Traffic in 'Traffic.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
