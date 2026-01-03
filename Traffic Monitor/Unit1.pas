unit Unit1;

interface

uses
  Windows, Graphics, ExtCtrls, Controls, StdCtrls, Buttons, Tabs,
  ComCtrls, Classes, SysUtils, Forms, dialogs, XPMan, Traffic, IPHelper,
  IPHLPAPI, ShellAPI;


type
  TForm1 = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    ExitButton: TButton;
    UnFreezeButton: TBitBtn;
    FreezeButton: TBitBtn;
    ClearCountersButton: TBitBtn;
    Timer1: TTimer;
    RemoveInactiveButton: TBitBtn;
    cbOnTop: TCheckBox;
    GroupBox: TGroupBox;
    LabelEdit1: TLabeledEdit;
    LabelEdit2: TLabeledEdit;
    gbIN: TGroupBox;
    LabelEdit6: TLabeledEdit;
    LabelEdit8: TLabeledEdit;
    LabelEdit7: TLabeledEdit;
    LabelEdit9: TLabeledEdit;
    gbOUT: TGroupBox;
    LabelEdit10: TLabeledEdit;
    LabelEdit12: TLabeledEdit;
    LabelEdit11: TLabeledEdit;
    LabelEdit13: TLabeledEdit;
    gbTime: TGroupBox;
    LabelEdit4: TLabeledEdit;
    LabelEdit5: TLabeledEdit;
    StatusText: TStaticText;
    LabelEdit3: TLabeledEdit;
    TabSet1: TTabSet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure ClearCountersButtonClick(Sender: TObject);
    procedure cbOnTopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FreezeButtonClick(Sender: TObject);
    procedure UnFreezeButtonClick(Sender: TObject);
    procedure RemoveInactiveButtonClick(Sender: TObject);
    procedure LabelEdit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    procedure HandleNewAdapter(ATraffic : TTraffic);
    procedure HandleFreeze(ATraffic : TTraffic);
    procedure HandleUnFreeze(ATraffic : TTraffic);
    function LocateTraffic(AdapterIndex : DWord) : TTraffic;
    procedure ProcessMIBData;
    procedure ClearDisplay;
    procedure RefreshDisplay;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  ActiveTraffic : TTraffic;

implementation

{$R *.dfm}
procedure TForm1.ClearDisplay;
var
  j : integer;
begin
  TabSet1.Tabs.Clear;
  StatusText.Caption:='';
  for j:= 0 to GroupBox.ControlCount-1 do
  begin
    if GroupBox.Controls[j] is TCustomEdit then
      TCustomEdit(GroupBox.Controls[j]).Text := '';
  end;
end; (*ClearDisplay*)

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  ProcessMIBData;
  Timer1.Enabled := True;
end; (*TimerTimer*)

procedure TForm1.ClearCountersButtonClick(Sender: TObject);
begin
  ActiveTraffic.Reset;
  RefreshDisplay;
end;

procedure TForm1.cbOnTopClick(Sender: TObject);
begin
  if cbOnTop.Checked = true then
     FormStyle := fsSTAYONTOP
  else
     FormStyle := fsNORMAL;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  Timer1.OnTimer := nil;
  ActiveTraffic := nil;

  for i:= 0 to -1 + TabSet1.Tabs.Count do
    TabSet1.Tabs.Objects[i].Free;
end;

procedure TForm1.TabSet1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  if NewTab = -1 then
    ActiveTraffic := nil
  else
    ActiveTraffic := TTraffic(TabSet1.Tabs.Objects[NewTab]);

  RefreshDisplay;
end;

procedure TForm1.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //do NOT change
  Timer1.Interval := 1000; // all calculatoins on 1 sec.

  //remove design time testing data
  ClearDisplay;
  ActiveTraffic := nil;
  Timer1.Enabled := True;
end;


procedure TForm1.RefreshDisplay;
begin
  if not Assigned(ActiveTraffic) then
  begin
    ClearDisplay;
    Exit;
  end;

  with ActiveTraffic do
  begin
    FreezeButton.Visible := Connected;
    UnFreezeButton.Visible := Connected;
    ClearCountersButton.Visible := Connected;
    RemoveInactiveButton.Visible := not Connected;

    FreezeButton.Enabled := Running;
    UnFreezeButton.Enabled := not Running;

    LabelEdit1.Text := Description;
    LabelEdit2.Text := MAC;
    LabelEdit3.Text := BitsToFriendlyString(Speed);

    if CheckBox2.Checked = true then
    begin
      LabelEdit6.Text := BytesToFriendlyString(InPerSec);
      LabelEdit7.Text := BytesToFriendlyString(PeakInPerSec);
      LabelEdit8.Text := BytesToFriendlyString(AverageInPerSec);
      LabelEdit9.Text := BytesToFriendlyString(InTotal);
    end;
    if CheckBox3.Checked = true then
    begin
      LabelEdit10.Text := BytesToFriendlyString(OutPerSec);
      LabelEdit11.Text := BytesToFriendlyString(PeakOutPerSec);
      LabelEdit12.Text := BytesToFriendlyString(AverageOutPerSec);
      LabelEdit13.Text := BytesToFriendlyString(OutTotal);
    end;

    self.LabelEdit4.Text := DateTimeToStr(StartedAt);
    self.LabelEdit5.Text := FriendlyRunningTime;

    StatusText.Caption := GetStatus;
  end;//with
end; (*RefreshDisplay*)

procedure TForm1.ProcessMIBData;
var
 MibArr : IpHlpAPI.TMIBIfArray;
 i : integer;
 ATraffic : TTraffic;
begin
  Get_IfTableMIB(MibArr);  // get current MIB data


  //Mark not Found as NOT Connected
  for i:= 0 to -1 + TabSet1.Tabs.Count do
  begin
    ATraffic := TTraffic(TabSet1.Tabs.Objects[i]);
    if ATraffic.Connected then ATraffic.Found := False;
  end;
//  ATraffic := nil;

  //process
  if Length(MibArr) > 0 then
  begin
    for i := Low(MIBArr) to High(MIBArr) do
    begin
      ATraffic := LocateTraffic(MIBArr[i].dwIndex);
      if Assigned(ATraffic) then
      begin
        //already connected
        ATraffic.NewCycle(MIBArr[i].dwInOctets, MIBArr[i].dwOutOctets, MIBArr[i].dwSpeed);
      end
      else
      begin
        //New one!
        ATraffic := TTraffic.Create(MIBArr[i], HandleNewAdapter);
        ATraffic.Found := True;
        ATraffic.OnFreeze := HandleFreeze;
        ATraffic.OnUnFreeze := HandleUnFreeze;
      end;
    end;
  end;

  //Mark not Found as Inactive
  for i:= 0 to -1 + TabSet1.Tabs.Count do
    if NOT TTraffic(TabSet1.Tabs.Objects[i]).Found then
      TTraffic(TabSet1.Tabs.Objects[i]).MarkDisconnected;

  RefreshDisplay;
end; (*ProcessMIBData*)

function TForm1.LocateTraffic(AdapterIndex : DWord): TTraffic;
var
  j : cardinal;
  ATraffic : TTraffic;
begin
  Result := nil;
  if TabSet1.Tabs.Count = 0 then Exit;

  for j:= 0 to -1 + TabSet1.Tabs.Count do
  begin
    ATraffic := TTraffic(TabSet1.Tabs.Objects[j]);
    if ATraffic.InterfaceIndex = AdapterIndex then
    begin
      Result := ATraffic;
      Result.Found := True;
      Break;
    end;
  end;
end; (*LocateAdapter*)

procedure TForm1.HandleNewAdapter(ATraffic: TTraffic);
begin
  //add adapter
  TabSet1.Tabs.AddObject(ATraffic.IP, ATraffic);
  //select it
  TabSet1.TabIndex := -1 + TabSet1.Tabs.Count;
end; (*HandleNewAdapter*)

procedure TForm1.FreezeButtonClick(Sender: TObject);
begin
  ActiveTraffic.Freeze;
end;

procedure TForm1.UnFreezeButtonClick(Sender: TObject);
begin
  ActiveTraffic.UnFreeze;
end;

procedure TForm1.HandleFreeze(ATraffic: TTraffic);
begin
  self.FreezeButton.Enabled := ATraffic.Running;
  self.UnFreezeButton.Enabled := not ATraffic.Running;
end;

procedure TForm1.HandleUnFreeze(ATraffic: TTraffic);
begin
  self.FreezeButton.Enabled := ATraffic.Running;
  self.UnFreezeButton.Enabled := not ATraffic.Running;
end;

procedure TForm1.RemoveInactiveButtonClick(Sender: TObject);
begin
  If not ActiveTraffic.Connected then //just checking
  begin
    ActiveTraffic.Free;
    ActiveTraffic := nil;
    TabSet1.Tabs.Delete(TabSet1.TabIndex);
    TabSet1.SelectNext(False);
  end;

  RefreshDisplay;
end; (*RemoveInactiveButtonClick*)


procedure TForm1.LabelEdit1Change(Sender: TObject);
begin
  //testing - not working since GroupBox is disabled
  LabelEdit1.Hint := LabelEdit1.Text;
  LabelEdit1.ShowHint := Canvas.TextWidth(LabelEdit1.Text) > LabelEdit1.ClientWidth;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then
  begin
    Timer1.Enabled := true;
  end else begin
    Timer1.Enabled := false;
  end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked = true then
  begin
    LabelEdit6.Enabled := true;
    LabelEdit7.Enabled := true;
    LabelEdit8.Enabled := true;
    LabelEdit9.Enabled := true;
  end else begin
    LabelEdit6.Text := '0,00 B';
    LabelEdit7.Text := '0,00 B';
    LabelEdit8.Text := '0,00 B';
    LabelEdit9.Text := '0,00 B';

    LabelEdit6.Enabled := false;
    LabelEdit7.Enabled := false;
    LabelEdit8.Enabled := false;
    LabelEdit9.Enabled := false;
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked = true then
  begin
    LabelEdit10.Enabled := true;
    LabelEdit11.Enabled := true;
    LabelEdit12.Enabled := true;
    LabelEdit13.Enabled := true;
  end else begin
    LabelEdit10.Text := '0,00 B';
    LabelEdit11.Text := '0,00 B';
    LabelEdit12.Text := '0,00 B';
    LabelEdit13.Text := '0,00 B';

    LabelEdit10.Enabled := false;
    LabelEdit11.Enabled := false;
    LabelEdit12.Enabled := false;
    LabelEdit13.Enabled := false;
  end;
end;

end.

