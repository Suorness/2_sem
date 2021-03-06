unit WINGRAPHVIZLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 4/21/2007 11:12:18 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\WINDOWS\system32\WinGraphViz.dll (1)
// LIBID: {052DB09C-95F7-43BD-B7F8-492373D1151E}
// LCID: 0
// Helpfile: 
// HelpString: WinGraphviz 1.01.7 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Parameter 'Type' of IDOT.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of IDOT.ToBinaryGraph changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of INEATO.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of INEATO.ToBinaryGraph changed to 'Type_'
//   Hint: Parameter 'Type' of ITWOPI.ToTextGraph changed to 'Type_'
//   Hint: Parameter 'Type' of ITWOPI.ToBinaryGraph changed to 'Type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WINGRAPHVIZLibMajorVersion = 1;
  WINGRAPHVIZLibMinorVersion = 0;

  LIBID_WINGRAPHVIZLib: TGUID = '{052DB09C-95F7-43BD-B7F8-492373D1151E}';

  IID_IDOT: TGUID = '{A1080582-D33F-486E-BD5F-581989A3C7E9}';
  CLASS_DOT: TGUID = '{55811839-47B0-4854-81B5-0A0031B8ACEC}';
  IID_IBinaryImage: TGUID = '{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}';
  IID_ISequentialStream: TGUID = '{0C733A30-2A1C-11CE-ADE5-00AA0044773D}';
  IID_IStream: TGUID = '{0000000C-0000-0000-C000-000000000046}';
  IID_INEATO: TGUID = '{B41D4C33-882C-4534-8352-EE981323CD96}';
  CLASS_NEATO: TGUID = '{1F25D86C-95BC-4E33-A177-EE8DABEF8B04}';
  CLASS_BinaryImage: TGUID = '{6B3F62C8-80CE-470D-B2E4-0BA42A035228}';
  IID_ITWOPI: TGUID = '{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}';
  CLASS_TWOPI: TGUID = '{684811FB-0523-420F-9E8F-A5452C65A19C}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum GraphvizTypeIndex
type
  GraphvizTypeIndex = TOleEnum;
const
  GRAPHVIZ_ATTRIBUTED_DOT = $00000000;
  GRAPHVIZ_PS = $00000001;
  GRAPHVIZ_PLAIN = $00000006;
  GRAPHVIZ_PLAIN_EXT = $00000007;
  GRAPHVIZ_GIF = $0000000B;
  GRAPHVIZ_JPEG = $0000000C;
  GRAPHVIZ_PNG = $0000000D;
  GRAPHVIZ_WBMP = $0000000E;
  GRAPHVIZ_ISMAP = $00000010;
  GRAPHVIZ_IMAP = $00000011;
  GRAPHVIZ_CMAP = $00000012;
  GRAPHVIZ_VRML = $00000013;
  GRAPHVIZ_SVG = $00000017;
  GRAPHVIZ_SVGZ = $00000018;
  GRAPHVIZ_CANONICAL_DOT = $00000019;
  GRAPHVIZ_EMF = $0000001B;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDOT = interface;
  IDOTDisp = dispinterface;
  IBinaryImage = interface;
  IBinaryImageDisp = dispinterface;
  ISequentialStream = interface;
  IStream = interface;
  INEATO = interface;
  INEATODisp = dispinterface;
  ITWOPI = interface;
  ITWOPIDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DOT = IDOT;
  NEATO = INEATO;
  BinaryImage = IBinaryImage;
  TWOPI = ITWOPI;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PByte1 = ^Byte; {*}

  _LARGE_INTEGER = packed record
    QuadPart: Int64;
  end;

  _ULARGE_INTEGER = packed record
    QuadPart: Largeuint;
  end;

  _FILETIME = packed record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

  tagSTATSTG = packed record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: _ULARGE_INTEGER;
    mtime: _FILETIME;
    ctime: _FILETIME;
    atime: _FILETIME;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;


// *********************************************************************//
// Interface: IDOT
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1080582-D33F-486E-BD5F-581989A3C7E9}
// *********************************************************************//
  IDOT = interface(IDispatch)
    ['{A1080582-D33F-486E-BD5F-581989A3C7E9}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  IDOTDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1080582-D33F-486E-BD5F-581989A3C7E9}
// *********************************************************************//
  IDOTDisp = dispinterface
    ['{A1080582-D33F-486E-BD5F-581989A3C7E9}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToDot(const Source: WideString): WideString; dispid 2;
    function ToCanon(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// Interface: IBinaryImage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}
// *********************************************************************//
  IBinaryImage = interface(IDispatch)
    ['{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}']
    function Save(const FilePath: WideString): WordBool; safecall;
    function Dump(const stream: IStream): WordBool; safecall;
    function Get_type_: WideString; safecall;
    function Get_Picture: IPictureDisp; safecall;
    function ToBase64String: WideString; safecall;
    property type_: WideString read Get_type_;
    property Picture: IPictureDisp read Get_Picture;
  end;

// *********************************************************************//
// DispIntf:  IBinaryImageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}
// *********************************************************************//
  IBinaryImageDisp = dispinterface
    ['{FFF6CEBE-BD9B-4C3A-A274-12E600B6BD10}']
    function Save(const FilePath: WideString): WordBool; dispid 1;
    function Dump(const stream: IStream): WordBool; dispid 3;
    property type_: WideString readonly dispid 2;
    property Picture: IPictureDisp readonly dispid 4;
    function ToBase64String: WideString; dispid 5;
  end;

// *********************************************************************//
// Interface: ISequentialStream
// Flags:     (0)
// GUID:      {0C733A30-2A1C-11CE-ADE5-00AA0044773D}
// *********************************************************************//
  ISequentialStream = interface(IUnknown)
    ['{0C733A30-2A1C-11CE-ADE5-00AA0044773D}']
    function RemoteRead(out pv: Byte; cb: LongWord; out pcbRead: LongWord): HResult; stdcall;
    function RemoteWrite(var pv: Byte; cb: LongWord; out pcbWritten: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IStream
// Flags:     (0)
// GUID:      {0000000C-0000-0000-C000-000000000046}
// *********************************************************************//
  IStream = interface(ISequentialStream)
    ['{0000000C-0000-0000-C000-000000000046}']
    function RemoteSeek(dlibMove: _LARGE_INTEGER; dwOrigin: LongWord; 
                        out plibNewPosition: _ULARGE_INTEGER): HResult; stdcall;
    function SetSize(libNewSize: _ULARGE_INTEGER): HResult; stdcall;
    function RemoteCopyTo(const pstm: IStream; cb: _ULARGE_INTEGER; out pcbRead: _ULARGE_INTEGER; 
                          out pcbWritten: _ULARGE_INTEGER): HResult; stdcall;
    function Commit(grfCommitFlags: LongWord): HResult; stdcall;
    function Revert: HResult; stdcall;
    function LockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function UnlockRegion(libOffset: _ULARGE_INTEGER; cb: _ULARGE_INTEGER; dwLockType: LongWord): HResult; stdcall;
    function Stat(out pstatstg: tagSTATSTG; grfStatFlag: LongWord): HResult; stdcall;
    function Clone(out ppstm: IStream): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: INEATO
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B41D4C33-882C-4534-8352-EE981323CD96}
// *********************************************************************//
  INEATO = interface(IDispatch)
    ['{B41D4C33-882C-4534-8352-EE981323CD96}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  INEATODisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B41D4C33-882C-4534-8352-EE981323CD96}
// *********************************************************************//
  INEATODisp = dispinterface
    ['{B41D4C33-882C-4534-8352-EE981323CD96}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToCanon(const Source: WideString): WideString; dispid 2;
    function ToDot(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// Interface: ITWOPI
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}
// *********************************************************************//
  ITWOPI = interface(IDispatch)
    ['{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; safecall;
    function ToDot(const Source: WideString): WideString; safecall;
    function ToCanon(const Source: WideString): WideString; safecall;
    function ToPlain(const Source: WideString): WideString; safecall;
    function ToPlainExt(const Source: WideString): WideString; safecall;
    function ToSvg(const Source: WideString): WideString; safecall;
    function Validate(const Source: WideString): WordBool; safecall;
    function ToPS(const Source: WideString): WideString; safecall;
    function ToGIF(const Source: WideString): IBinaryImage; safecall;
    function ToPNG(const Source: WideString): IBinaryImage; safecall;
    function ToSVGZ(const Source: WideString): IBinaryImage; safecall;
    function ToVRML(const Source: WideString): WideString; safecall;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; safecall;
    function ToCMAP(const Source: WideString): WideString; safecall;
    function ToIMAP(const Source: WideString): WideString; safecall;
    function ToISMAP(const Source: WideString): WideString; safecall;
    function ToWBMP(const Source: WideString): IBinaryImage; safecall;
    function ToJPEG(const Source: WideString): IBinaryImage; safecall;
    function Get_Codepage: Integer; safecall;
    procedure Set_Codepage(pVal: Integer); safecall;
    function ToEMF(const Source: WideString): IBinaryImage; safecall;
    property Codepage: Integer read Get_Codepage write Set_Codepage;
  end;

// *********************************************************************//
// DispIntf:  ITWOPIDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}
// *********************************************************************//
  ITWOPIDisp = dispinterface
    ['{B22DD1A2-6884-47AA-9CAA-8E35C1154A5C}']
    function ToTextGraph(const Source: WideString; Type_: Integer): WideString; dispid 1;
    function ToDot(const Source: WideString): WideString; dispid 2;
    function ToCanon(const Source: WideString): WideString; dispid 3;
    function ToPlain(const Source: WideString): WideString; dispid 4;
    function ToPlainExt(const Source: WideString): WideString; dispid 5;
    function ToSvg(const Source: WideString): WideString; dispid 6;
    function Validate(const Source: WideString): WordBool; dispid 7;
    function ToPS(const Source: WideString): WideString; dispid 8;
    function ToGIF(const Source: WideString): IBinaryImage; dispid 9;
    function ToPNG(const Source: WideString): IBinaryImage; dispid 10;
    function ToSVGZ(const Source: WideString): IBinaryImage; dispid 11;
    function ToVRML(const Source: WideString): WideString; dispid 12;
    function ToBinaryGraph(const Source: WideString; Type_: Integer): IBinaryImage; dispid 13;
    function ToCMAP(const Source: WideString): WideString; dispid 14;
    function ToIMAP(const Source: WideString): WideString; dispid 15;
    function ToISMAP(const Source: WideString): WideString; dispid 16;
    function ToWBMP(const Source: WideString): IBinaryImage; dispid 17;
    function ToJPEG(const Source: WideString): IBinaryImage; dispid 18;
    property Codepage: Integer dispid 19;
    function ToEMF(const Source: WideString): IBinaryImage; dispid 20;
  end;

// *********************************************************************//
// The Class CoDOT provides a Create and CreateRemote method to          
// create instances of the default interface IDOT exposed by              
// the CoClass DOT. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDOT = class
    class function Create: IDOT;
    class function CreateRemote(const MachineName: string): IDOT;
  end;

// *********************************************************************//
// The Class CoNEATO provides a Create and CreateRemote method to          
// create instances of the default interface INEATO exposed by              
// the CoClass NEATO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNEATO = class
    class function Create: INEATO;
    class function CreateRemote(const MachineName: string): INEATO;
  end;

// *********************************************************************//
// The Class CoBinaryImage provides a Create and CreateRemote method to          
// create instances of the default interface IBinaryImage exposed by              
// the CoClass BinaryImage. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBinaryImage = class
    class function Create: IBinaryImage;
    class function CreateRemote(const MachineName: string): IBinaryImage;
  end;

// *********************************************************************//
// The Class CoTWOPI provides a Create and CreateRemote method to          
// create instances of the default interface ITWOPI exposed by              
// the CoClass TWOPI. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTWOPI = class
    class function Create: ITWOPI;
    class function CreateRemote(const MachineName: string): ITWOPI;
  end;

implementation

uses ComObj;

class function CoDOT.Create: IDOT;
begin
  Result := CreateComObject(CLASS_DOT) as IDOT;
end;

class function CoDOT.CreateRemote(const MachineName: string): IDOT;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DOT) as IDOT;
end;

class function CoNEATO.Create: INEATO;
begin
  Result := CreateComObject(CLASS_NEATO) as INEATO;
end;

class function CoNEATO.CreateRemote(const MachineName: string): INEATO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NEATO) as INEATO;
end;

class function CoBinaryImage.Create: IBinaryImage;
begin
  Result := CreateComObject(CLASS_BinaryImage) as IBinaryImage;
end;

class function CoBinaryImage.CreateRemote(const MachineName: string): IBinaryImage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BinaryImage) as IBinaryImage;
end;

class function CoTWOPI.Create: ITWOPI;
begin
  Result := CreateComObject(CLASS_TWOPI) as ITWOPI;
end;

class function CoTWOPI.CreateRemote(const MachineName: string): ITWOPI;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TWOPI) as ITWOPI;
end;

end.
