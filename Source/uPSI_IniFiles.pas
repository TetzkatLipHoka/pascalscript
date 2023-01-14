unit uPSI_IniFiles;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
{$WARN UNSAFE_CODE OFF}
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_IniFiles = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIniFile(CL: TPSPascalCompiler);
procedure SIRegister_TMemIniFile(CL: TPSPascalCompiler);
procedure SIRegister_THashedStringList(CL: TPSPascalCompiler);
procedure SIRegister_TStringHash(CL: TPSPascalCompiler);
procedure SIRegister_TCustomIniFile(CL: TPSPascalCompiler);
procedure SIRegister_IniFiles(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIniFile(CL: TPSRuntimeClassImporter);
procedure RIRegister_TMemIniFile(CL: TPSRuntimeClassImporter);
procedure RIRegister_THashedStringList(CL: TPSRuntimeClassImporter);
procedure RIRegister_TStringHash(CL: TPSRuntimeClassImporter);
procedure RIRegister_TCustomIniFile(CL: TPSRuntimeClassImporter);
procedure RIRegister_IniFiles(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IniFiles
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IniFiles]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIniFile(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomIniFile', 'TIniFile') do
  with CL.AddClassN(CL.FindClass('TCustomIniFile'),'TIniFile') do
  begin
    RegisterMethod('Constructor Create( const FileName : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TMemIniFile(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TCustomIniFile', 'TMemIniFile') do
  with CL.AddClassN(CL.FindClass('TCustomIniFile'),'TMemIniFile') do
  begin
    RegisterMethod('Constructor Create( const FileName : string)');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure GetStrings( List : TStrings)');
    RegisterMethod('Procedure Rename( const FileName : string; Reload : Boolean)');
    RegisterMethod('Procedure SetStrings( List : TStrings)');
    RegisterProperty('CaseSensitive', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_THashedStringList(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringList', 'THashedStringList') do
  with CL.AddClassN(CL.FindClass('TStringList'),'THashedStringList') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TStringHash(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TStringHash') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TStringHash') do
  begin
    RegisterMethod('Constructor Create( Size : Cardinal)');
    RegisterMethod('Procedure Add( const Key : string; Value : Integer)');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Remove( const Key : string)');
    RegisterMethod('Function Modify( const Key : string; Value : Integer) : Boolean');
    RegisterMethod('Function ValueOf( const Key : string) : Integer');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TCustomIniFile(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TCustomIniFile') do
  with CL.AddClassN(CL.FindClass('TObject'),'TCustomIniFile') do
  begin
    RegisterMethod('Constructor Create( const FileName : string)');
    RegisterMethod('Function SectionExists( const Section : string) : Boolean');
    RegisterMethod('Function ReadString( const Section, Ident, Default : string) : string');
    RegisterMethod('Procedure WriteString( const Section, Ident, Value : String)');
    RegisterMethod('Function ReadInteger( const Section, Ident : string; Default : Longint) : Longint');
    RegisterMethod('Procedure WriteInteger( const Section, Ident : string; Value : Longint)');
    RegisterMethod('Function ReadBool( const Section, Ident : string; Default : Boolean) : Boolean');
    RegisterMethod('Procedure WriteBool( const Section, Ident : string; Value : Boolean)');
    RegisterMethod('Function ReadBinaryStream( const Section, Name : string; Value : TStream) : Integer');
    RegisterMethod('Function ReadDate( const Section, Name : string; Default : TDateTime) : TDateTime');
    RegisterMethod('Function ReadDateTime( const Section, Name : string; Default : TDateTime) : TDateTime');
    RegisterMethod('Function ReadFloat( const Section, Name : string; Default : Double) : Double');
    RegisterMethod('Function ReadTime( const Section, Name : string; Default : TDateTime) : TDateTime');
    RegisterMethod('Procedure WriteBinaryStream( const Section, Name : string; Value : TStream)');
    RegisterMethod('Procedure WriteDate( const Section, Name : string; Value : TDateTime)');
    RegisterMethod('Procedure WriteDateTime( const Section, Name : string; Value : TDateTime)');
    RegisterMethod('Procedure WriteFloat( const Section, Name : string; Value : Double)');
    RegisterMethod('Procedure WriteTime( const Section, Name : string; Value : TDateTime)');
    RegisterMethod('Procedure ReadSection( const Section : string; Strings : TStrings)');
    RegisterMethod('Procedure ReadSections( Strings : TStrings)');
    RegisterMethod('Procedure ReadSectionValues( const Section : string; Strings : TStrings)');
    RegisterMethod('Procedure EraseSection( const Section : string)');
    RegisterMethod('Procedure DeleteKey( const Section, Ident : String)');
    RegisterMethod('Procedure UpdateFile');
    RegisterMethod('Function ValueExists( const Section, Ident : string) : Boolean');
    RegisterProperty('FileName', 'string', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IniFiles(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'EIniFileException');
  SIRegister_TCustomIniFile(CL);
//  CL.AddTypeS('PPHashItem', '^PHashItem');
//  CL.AddTypeS('PHashItem', '^THashItem');
//  CL.AddTypeS('THashItem', 'record Next : PHashItem; Key : string; Value : Inte'
//   +'ger; end');
  SIRegister_TStringHash(CL);
  SIRegister_THashedStringList(CL);
  SIRegister_TMemIniFile(CL);
  SIRegister_TIniFile(CL);
  SIRegister_TIniFile(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TMemIniFileCaseSensitive_W(Self: TMemIniFile; const T: Boolean);
begin Self.CaseSensitive := T; end;

(*----------------------------------------------------------------------------*)
procedure TMemIniFileCaseSensitive_R(Self: TMemIniFile; var T: Boolean);
begin T := Self.CaseSensitive; end;

(*----------------------------------------------------------------------------*)
procedure TCustomIniFileFileName_R(Self: TCustomIniFile; var T: string);
begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIniFile(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIniFile) do
  begin
    RegisterConstructor(@TIniFile.Create, 'Create');
    RegisterMethod(@TIniFile.ReadInteger, 'ReadInteger');
    RegisterMethod(@TIniFile.WriteInteger, 'WriteInteger');
    RegisterMethod(@TIniFile.ReadBool, 'ReadBool');
    RegisterMethod(@TIniFile.WriteBool, 'WriteBool');
    RegisterMethod(@TIniFile.ReadBinaryStream, 'ReadBinaryStream');
    RegisterMethod(@TIniFile.ReadDate, 'ReadDate');
    RegisterMethod(@TIniFile.ReadDateTime, 'ReadDateTime');
    RegisterMethod(@TIniFile.ReadFloat, 'ReadFloat');
    RegisterMethod(@TIniFile.ReadTime, 'ReadTime');
    RegisterMethod(@TIniFile.WriteBinaryStream, 'WriteBinaryStream');
    RegisterMethod(@TIniFile.WriteDate, 'WriteDate');
    RegisterMethod(@TIniFile.WriteDateTime, 'WriteDateTime');
    RegisterMethod(@TIniFile.WriteFloat, 'WriteFloat');
    RegisterMethod(@TIniFile.WriteTime, 'WriteTime');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TMemIniFile(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TMemIniFile) do
  begin
    RegisterConstructor(@TMemIniFile.Create, 'Create');
    RegisterMethod(@TMemIniFile.Clear, 'Clear');
    RegisterMethod(@TMemIniFile.GetStrings, 'GetStrings');
    RegisterMethod(@TMemIniFile.Rename, 'Rename');
    RegisterMethod(@TMemIniFile.SetStrings, 'SetStrings');
    RegisterPropertyHelper(@TMemIniFileCaseSensitive_R,@TMemIniFileCaseSensitive_W,'CaseSensitive');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_THashedStringList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(THashedStringList) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TStringHash(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TStringHash) do
  begin
    RegisterConstructor(@TStringHash.Create, 'Create');
    RegisterMethod(@TStringHash.Add, 'Add');
    RegisterMethod(@TStringHash.Clear, 'Clear');
    RegisterMethod(@TStringHash.Remove, 'Remove');
    RegisterMethod(@TStringHash.Modify, 'Modify');
    RegisterMethod(@TStringHash.ValueOf, 'ValueOf');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TCustomIniFile(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCustomIniFile) do
  begin
    RegisterConstructor(@TCustomIniFile.Create, 'Create');
    RegisterMethod(@TCustomIniFile.SectionExists, 'SectionExists');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.ReadString, 'ReadString');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.WriteString, 'WriteString');
    RegisterVirtualMethod(@TCustomIniFile.ReadInteger, 'ReadInteger');
    RegisterVirtualMethod(@TCustomIniFile.WriteInteger, 'WriteInteger');
    RegisterVirtualMethod(@TCustomIniFile.ReadBool, 'ReadBool');
    RegisterVirtualMethod(@TCustomIniFile.WriteBool, 'WriteBool');
    RegisterVirtualMethod(@TCustomIniFile.ReadBinaryStream, 'ReadBinaryStream');
    RegisterVirtualMethod(@TCustomIniFile.ReadDate, 'ReadDate');
    RegisterVirtualMethod(@TCustomIniFile.ReadDateTime, 'ReadDateTime');
    RegisterVirtualMethod(@TCustomIniFile.ReadFloat, 'ReadFloat');
    RegisterVirtualMethod(@TCustomIniFile.ReadTime, 'ReadTime');
    RegisterVirtualMethod(@TCustomIniFile.WriteBinaryStream, 'WriteBinaryStream');
    RegisterVirtualMethod(@TCustomIniFile.WriteDate, 'WriteDate');
    RegisterVirtualMethod(@TCustomIniFile.WriteDateTime, 'WriteDateTime');
    RegisterVirtualMethod(@TCustomIniFile.WriteFloat, 'WriteFloat');
    RegisterVirtualMethod(@TCustomIniFile.WriteTime, 'WriteTime');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.ReadSection, 'ReadSection');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.ReadSections, 'ReadSections');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.ReadSectionValues, 'ReadSectionValues');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.EraseSection, 'EraseSection');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.DeleteKey, 'DeleteKey');
//    RegisterVirtualAbstractMethod(@TCustomIniFile, @!.UpdateFile, 'UpdateFile');
    RegisterMethod(@TCustomIniFile.ValueExists, 'ValueExists');
    RegisterPropertyHelper(@TCustomIniFileFileName_R,nil,'FileName');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IniFiles(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EIniFileException) do
  RIRegister_TCustomIniFile(CL);
  RIRegister_TStringHash(CL);
  RIRegister_THashedStringList(CL);
  RIRegister_TMemIniFile(CL);
  RIRegister_TIniFile(CL);
  RIRegister_TIniFile(CL);
end;

 
 
{ TPSImport_IniFiles }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IniFiles.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IniFiles(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IniFiles.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IniFiles(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
