unit Convert_Unit;

interface

uses SysUtils;

  function Convert_Bits(Value:LongWord):string;
  function Convert_bytes(Value:LongWord;IndiquerUnites:boolean):string;

implementation

function Convert_Bits(Value:LongWord):string;
begin
  if Value > 1000000000 then
  begin
    Result := FloatToStrF(Value/1000000000,ffGeneral,3,16)+' GBit/sec';
    exit;
  end;

  if Value > 1000000 then
  begin
    Result := FloatToStrF(Value/1000000,ffGeneral,3,16) + ' MBit/sec';
    exit;
  end;

  if Value > 1000 then
  begin
    Result := FloatToStrF(Value/1000,ffGeneral,3,16)+' kBit/sec';
    exit;
  end;
  Result:=IntToStr(Value)+' Bit/sec';
end;

function Convert_bytes(Value:LongWord;IndiquerUnites:boolean):string;
begin
  if Value > 1073741824 then
  begin
    if IndiquerUnites then
      Result:=FloatToStrF(Value/1073741824,ffGeneral,3,16)+' GO'
    else
      Result:=FloatToStrF(Value/1073741824,ffGeneral,3,16);
    exit;
  end;

  if Value > 1048576 then
  begin
    if IndiquerUnites then
      Result:=FloatToStrF(Value/1048576,ffGeneral,3,16)+' MO'
    else
      Result:=FloatToStrF(Value/1048576,ffGeneral,3,16);
    exit;
  end;

  if Value>1024 then
  begin
    if IndiquerUnites then
      Result:=FloatToStrF(Value/1024,ffGeneral,3,16)+' kO'
    else
      Result:=FloatToStrF(Value/1024,ffGeneral,3,16);
    exit;
  end;

  if IndiquerUnites then
    Result:=IntToStr(Value)+' bytes'
  else
    Result:=IntToStr(Value);
end;

end.

