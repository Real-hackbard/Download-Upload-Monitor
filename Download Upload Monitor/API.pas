unit API;

interface

uses Windows;

const
  MAX_INTERFACE_NAME_LEN = 256;
  MAXLEN_PHYSADDR        = 8;
  MAXLEN_IFDESCR         = 256;
type MIB_IFROW=record
  wszName           :  array[1..MAX_INTERFACE_NAME_LEN] of WCHAR;        
  dwIndex           :  DWORD;                                            
  dwType            :  DWORD;                                            
  dwMtu             :  DWORD;                                            
  dwSpeed           :  DWORD;                                            
  dwPhysAddrLen     :  DWORD;                                            
  bPhysAddr         :  array[1..MAXLEN_PHYSADDR] of byte;                
  dwAdminStatus     :  DWORD;                                            
  dwOperStatus      :  DWORD;                                            
  dwLastChange      :  DWORD;                                            
  dwInOctets        :  DWORD;                                            
  dwInUcastPkts     :  DWORD;                                            
  dwInNUcastPkts    :  DWORD;                                            
  dwInDiscards      :  DWORD;                                            
  dwInErrors        :  DWORD;                                            
  dwInUnknownProtos :  DWORD;                                            
  dwOutOctets       :  DWORD;                                            
  dwOutUcastPkts    :  DWORD;                                            
  dwOutNUcastPkts   :  DWORD;                                            
  dwOutDiscards     :  DWORD;                                            
  dwOutErrors       :  DWORD;                                            
  dwOutQLen         :  DWORD;                                            
  dwDescrLen        :  DWORD;                                            
  bDescr            :  array[1..MAXLEN_IFDESCR] of char;                 
end;

PMIB_IFROW=^MIB_IFROW;

type MIB_IFTABLE=record
  dwNumEntries  : DWORD;                                  
  table         : array[1..8] of MIB_IFROW;               
end;

PMIB_IFTABLE=^MIB_IFTABLE;

function GetIfEntry(PMib_IfRow:PMIB_IFROW):DWORD ; stdcall ; external 'IPHLPAPI.DLL';
function GetIfTable(pIfTable:PMIB_IFTABLE;pdwSize:PULONG;bOrder:boolean):DWORD ; stdcall ; external 'IPHLPAPI.DLL';

implementation

end.

