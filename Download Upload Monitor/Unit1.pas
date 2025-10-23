unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, ExtCtrls, API, API_usage,
  Convert_Unit, ComCtrls, TeeProcs, TeEngine, Chart, Series,
  VclTee.TeeGDIPlus, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Grp_Interfaces: TGroupBox;
    ComboBox1: TComboBox;
    Grp_Info_Interface: TGroupBox;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Edt_MTU: TEdit;
    Panel3: TPanel;
    Edt_Speed: TEdit;
    Panel4: TPanel;
    Edt_MAC: TEdit;
    Panel5: TPanel;
    Edt_received: TEdit;
    Panel6: TPanel;
    Edt_Envoye: TEdit;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    Graph_Download: TChart;
    Graph_Upload: TChart;
    Progress_Download: TProgressBar;
    Progress_Upload: TProgressBar;
    Pnl_Tx_Download: TPanel;
    Pnl_Tx_Upload: TPanel;
    Series2: TLineSeries;
    Series1: TLineSeries;
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    ScrollBar1: TScrollBar;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TMemo;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    function CalculerAdresseMAC:string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActualiserStats;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);

  private

  public
  procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
  end;

var
  Form1: TForm1;
  PtrInterface                  : PMIB_IFROW;
  PrecedentRecu,ActuelRecu      : PAnsiChar;
  PrecedentEnvoye,ActuelEnvoye  : PAnsiChar;
  PositionX                     : Double;

const
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128; // arb.
  MAX_ADAPTER_NAME_LENGTH = 256;        // arb.
  MAX_ADAPTER_ADDRESS_LENGTH = 8;       // arb.

type
  PIP_ADDRESS_STRING = ^IP_ADDRESS_STRING;
  IP_ADDRESS_STRING = packed record
    acString: array [1..16] of AnsiChar;
  end;

  PIP_MASK_STRING = ^IP_MASK_STRING;
  IP_MASK_STRING = IP_ADDRESS_STRING;

  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING = packed record
    Next : PIP_ADDR_STRING;
    IpAddress: IP_ADDRESS_STRING;
    IpMask : IP_MASK_STRING;
    Context : DWORD;
  end;

  time_t = int64;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO = packed record
    Next : PIP_ADAPTER_INFO;
    ComboIndex : DWORD;
    AdapterName : array [1..MAX_ADAPTER_NAME_LENGTH + 4] of AnsiChar ;
    Description : array [1..MAX_ADAPTER_DESCRIPTION_LENGTH + 4] of AnsiChar;
    AddressLength : UINT;
    Address : array [1..MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
    Index : DWORD;
    dwType : UINT;
    DhcpEnabled : UINT;
    CurrentIpAddress : PIP_ADDR_STRING;
    IpAddressList : IP_ADDR_STRING;
    GatewayList : IP_ADDR_STRING;
    DhcpServer : IP_ADDR_STRING;
    HaveWins : Boolean;
    PrimaryWinsServer : IP_ADDR_STRING;
    SecondaryWinsServer : IP_ADDR_STRING;
    LeaseObtained : time_t;
    LeaseExpires : time_t;
  end;

implementation

{$R *.dfm}
function GetAdaptersInfo(const pAdapterInfo: PIP_ADAPTER_INFO; const pOutBufLen: PULONG): DWORD; stdcall;
    external 'IPHLPAPI.DLL' name 'GetAdaptersInfo';

function GetUsername: String;
var
  Buffer: array[0..255] of Char;
  Size: DWord;
begin
  Size := SizeOf(Buffer);
  if not Windows.GetUserName(Buffer, Size) then
    RaiseLastOSError;     //RaiseLastWin32Error; {Bis D5};
  SetString(Result, Buffer, Size - 1);
end;


procedure GetConnectionNameList(List: TStrings);
var
  pAdapterList: PIP_ADAPTER_INFO;
  dwLenAdapter: DWORD;
  ErrorCode : DWORD;

begin
  List.Clear;

  pAdapterList := nil; // Everything to 0 ==> Determine required buffer size
  dwLenAdapter := 0;

  ErrorCode := GetAdaptersInfo(pAdapterList, @dwLenAdapter);

  If ErrorCode <> ERROR_BUFFER_OVERFLOW then
    begin
      RaiseLastOSError(ErrorCode);

      exit;
    end;

  pAdapterList := AllocMem(dwLenAdapter);

  try
    ErrorCode := GetAdaptersInfo(pAdapterList, @dwLenAdapter);

    If ErrorCode <> ERROR_SUCCESS then
      begin
        RaiseLastOSError(ErrorCode);

        exit;
      end;

    while Assigned(pAdapterList) do
      begin
        {
        List.Add(Format('AdapterName: %s', [String(pAdapterList.AdapterName)]));
        List.Add(Format('Descpription: %s', [String(pAdapterList.Description)]));
        List.Add(Format('Index: %d', [pAdapterList.ComboIndex]));
        List.Add(Format('AddressLength: %d', [pAdapterList.AddressLength]));
        List.Add(Format('Address: %d', [UInt64(pAdapterList.Address)]));
        List.Add(Format('Index: %d', [pAdapterList.Index]));
        List.Add(Format('dwType: %d', [pAdapterList.dwType]));
        List.Add(Format('DHCP-Enabled: %d', [pAdapterList.DhcpEnabled]));
        }
        List.Add(Format('IpAddress: %s', [String(pAdapterList.IpAddressList.IpAddress.acString)]));
        List.Add(Format('IpMask: %s', [String(pAdapterList.IpAddressList.IpMask.acString)]));
        List.Add(Format('IpAddressList.Context: %d', [pAdapterList.IpAddressList.Context]));
        List.Add(Format('GatewayList.IpAddress: %s', [String(pAdapterList.GatewayList.IpAddress.acString)]));
        List.Add(Format('GatewayList.IpMask: %s', [String(pAdapterList.GatewayList.IpMask.acString)]));
        //List.Add(Format('GatewayList.Context: %d', [pAdapterList.GatewayList.Context]));
        List.Add(Format('DhcpServer.IpAddress: %s', [String(pAdapterList.DhcpServer.IpAddress.acString)]));
        List.Add(Format('DhcpServer.IpMask: %s', [String(pAdapterList.DhcpServer.IpMask.acString)]));
        List.Add(Format('DhcpServer.Context: %d', [pAdapterList.DhcpServer.Context]));
        List.Add(Format('IpAddressList.HaveWins: %d', [Integer(pAdapterList.HaveWins)]));
        List.Add(Format('PrimaryWinsServer.IpAddress: %s', [String(pAdapterList.PrimaryWinsServer.IpAddress.acString)]));
        List.Add(Format('PrimaryWinsServer.IpMask: %s', [String(pAdapterList.PrimaryWinsServer.IpMask.acString)]));
        List.Add(Format('PrimaryWinsServer.Context: %d', [pAdapterList.PrimaryWinsServer.Context]));
        List.Add(Format('SecondaryWinsServer.IpAddress: %s', [String(pAdapterList.SecondaryWinsServer.IpAddress.acString)]));
        List.Add(Format('SecondaryWinsServer.IpMask: %s', [String(pAdapterList.SecondaryWinsServer.IpMask.acString)]));
        List.Add(Format('SecondaryWinsServer.Context: %d', [pAdapterList.SecondaryWinsServer.Context]));

        Form1.Label7.Caption := Format('%s', [String(pAdapterList.Description)]);
        Form1.StatusBar1.Panels[3].Text := Format('%s', [String(pAdapterList.IpAddressList.IpAddress.acString)]);
        Form1.Label8.Caption := Format('%s', [String(pAdapterList.IpAddressList.IpAddress.acString)]);
        Form1.Label9.Caption := Format('%s', [String(pAdapterList.GatewayList.IpAddress.acString)]);
        Form1.StatusBar1.Panels[5].Text := Format('%s', [String(pAdapterList.GatewayList.IpMask.acString)]);
        Form1.Label10.Caption := Format('%s', [String(pAdapterList.DhcpServer.IpAddress.acString)]);

        pAdapterList := pAdapterList.Next;


      end;
   finally
     FreeMem(pAdapterList);
   end;
end;

procedure TForm1.CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning: DWord;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;

           OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  PtrTable        : PMIB_IFTABLE;
  NumeroInterface : byte;
begin
  PtrTable := ListerInterfaces;
  GetMem(PtrInterface, SizeOf(MIB_IFROW));
  GetConnectionNameList(ComboBox1.Items);
  FreeMem(PtrTable,SizeOf(PtrTable^));
  StatusBar1.Panels[1].Text := GetUsername;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex := 14;
  ComboBox1.OnChange(sender);

  Memo1.Clear;
  CaptureConsoleOutput('cmd /c', 'curl -4 icanhazip.com', Memo1);
  Sleep(25);
  StatusBar1.Panels[3].Text := Memo1.Lines[4];
  Memo1.Clear;
  CaptureConsoleOutput('cmd /c', 'curl -6 icanhazip.com', Memo1);
  Sleep(25);
  Label12.Caption := Memo1.Lines[4];
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  PtrInterface^.dwIndex := ComboBox1.ItemIndex;
  GetIfEntry(PtrInterface);
  Edt_MTU.Text := IntToStr(PtrInterface^.dwMtu);
  Edt_Speed.Text := Convert_Bits(PtrInterface^.dwSpeed);
  Edt_MAC.Text := CalculerAdresseMAC;
  Edt_received.Text := Convert_bytes(PtrInterface^.dwInOctets,True);
  Edt_Envoye.Text := Convert_bytes(PtrInterface^.dwOutOctets,True);
  PrecedentRecu := PAnsiChar(AnsiString( PtrInterface^.dwInOctets));
  PrecedentEnvoye := PAnsiChar(AnsiString(PtrInterface^.dwOutOctets));
  ActuelRecu:=0;
  ActuelEnvoye:=0;
  Progress_Download.Max:=0;
  Progress_Upload.Max:=0;
  Graph_Download.Series[0].Clear;
  Graph_Upload.Series[0].Clear;
  Graph_Download.BottomAxis.Maximum:= SpinEdit1.Value;
  Graph_Download.BottomAxis.Minimum:=0;
  Graph_Download.LeftAxis.Maximum:=0;
  Graph_Download.LeftAxis.Minimum:=0;
  Graph_Upload.BottomAxis.Maximum := SpinEdit2.Value;
  Graph_Upload.BottomAxis.Minimum:=0;
  Graph_Upload.LeftAxis.Maximum:=0;
  Graph_Upload.LeftAxis.Minimum:=0;
  PositionX:=0;
  ActualiserStats;
end;

function TForm1.CalculerAdresseMAC:string;
var
  IndexAdresse  : byte;
  AdresseMACTemp: string;
begin
  for IndexAdresse:=1 to PtrInterface^.dwPhysAddrLen do
  begin
    AdresseMACTemp:=AdresseMACTemp+IntToHex(PtrInterface^.bPhysAddr[IndexAdresse],2);
    if IndexAdresse<PtrInterface^.dwPhysAddrLen then
      AdresseMACTemp:=AdresseMACTemp+'-';
  end;
  if AdresseMACTemp='' then
    Result:='n/a'
  else
    Result:=AdresseMACTemp;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then begin
    Graph_Download.View3D := true;
    Graph_Upload.View3D := true;
  end else begin
    Graph_Download.View3D := false;
    Graph_Upload.View3D := false;
  end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = true then begin
  SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end else begin
  SetWindowPos(Handle, HWND_NoTOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeMem(PtrInterface,SizeOf(PtrInterface^));
end;

procedure TForm1.ActualiserStats;
var
  PtrTable        : PMIB_IFTABLE;
begin
  PtrTable := ListerInterfaces;
  PtrInterface^.dwIndex := ComboBox1.ItemIndex;
  GetIfEntry(PtrInterface);
  FreeMem(PtrTable,SizeOf(PtrTable^));
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  DebitUpload,DebitDownload:LongWord;
begin
  try
    ActualiserStats;
    ActuelRecu:= PAnsiChar(AnsiString( PtrInterface^.dwInOctets));
    ActuelEnvoye:= PAnsiChar(AnsiString(PtrInterface^.dwOutOctets));
    DebitDownload:=ActuelRecu-PrecedentRecu;
    DebitUpload:=ActuelEnvoye-PrecedentEnvoye;

    if DebitDownLoad>=(Progress_Download.Max+0.5) then
      Progress_Download.Max:=DebitDownload;
    Progress_Download.Position:=DebitDownload;

    if DebitUpload>=(Progress_Upload.Max+0.5) then
      Progress_Upload.Max:=DebitUpload;

    Progress_Upload.Position := DebitUpload;
    Pnl_Tx_Download.Caption := Convert_bytes(DebitDownload,True)+'/s';
    Pnl_Tx_Upload.Caption := Convert_bytes(DebitUpload,True)+'/s';
    Graph_Download.Series[0].AddXY(PositionX,DebitDownload);
    Graph_Upload.Series[0].AddXY(PositionX,DebitUpload);
    PositionX:=PositionX+1;

    if PositionX>Graph_Download.BottomAxis.Maximum then
    begin
      Graph_Download.BottomAxis.Maximum:=Graph_Download.BottomAxis.Maximum+1;
      Graph_Download.BottomAxis.Minimum:=Graph_Download.BottomAxis.Minimum+1;
      Graph_Upload.BottomAxis.Maximum:=Graph_Upload.BottomAxis.Maximum+1;
      Graph_Upload.BottomAxis.Minimum:=Graph_Upload.BottomAxis.Minimum+1;
    end;

    PrecedentRecu:=ActuelRecu;
    PrecedentEnvoye:=ActuelEnvoye;
  except
    on E: Exception do
      ShowMessage('Adapter Conection Error!' + E.Message);
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edt_Speed.Text = '0 Bit/sec' then
  begin
    Beep;
    MessageDlg('No Connection found"',mtError, [mbOK], 0);
    Exit;
  end;

  ComboBox1.Enabled := false;
  Timer1.Enabled := true;
  Button1.Enabled := false;
  Button2.Enabled := true;
  Label13.Enabled := false;
  Label14.Enabled := false;
  SpinEdit1.Enabled := false;
  SpinEdit2.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ComboBox1.Enabled := true;
  Timer1.Enabled := false;
  Button1.Enabled := true;
  Button2.Enabled := false;
  Label13.Enabled := true;
  Label14.Enabled := true;
  SpinEdit1.Enabled := true;
  SpinEdit2.Enabled := true;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  Timer1.Interval := ScrollBar1.Position;
  Label3.Caption := IntToStr(ScrollBar1.Position) + ' (ms)';
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  ComboBox1.OnChange(sender);
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  ComboBox1.OnChange(sender);
end;

end.

