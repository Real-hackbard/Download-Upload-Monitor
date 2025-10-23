unit API_usage;

interface

uses Windows, API;

 function ListerInterfaces  : PMIB_IFTABLE;

implementation

function ListerInterfaces : PMIB_IFTABLE;
var
  PMibIfTable : PMIB_IFTABLE;
  dwSize      : DWORD;
begin
  dwSize:=0;
  GetMem(PMibIfTable,SizeOf(MIB_IFTABLE));
  if GetIfTable(PMibIfTable,Addr(dwSize),False)=ERROR_INSUFFICIENT_BUFFER then
  begin
   FreeMem(PMibIfTable,SizeOf(MIB_IFTABLE));
   GetMem(PMibIfTable,dwSize);
  end;
  GetIfTable(PMibIfTable,Addr(dwSize),False);
  Result:=PMibIfTable;
end;

end.

