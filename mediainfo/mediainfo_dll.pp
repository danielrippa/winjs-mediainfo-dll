unit mediainfo_dll;

{$mode delphi}

interface

  uses
    MediaInfoTypes;

  const
    dll = 'mediainfo.dll';

  function MediaInfo_New: THandle; stdcall; external dll;
  function MediaInfo_Open(aHandle: THandle; aFileName: PWideChar): Cardinal; stdcall; external dll;
  procedure MediaInfo_Delete(aHandle: THandle); stdcall; external dll;
  procedure MediaInfo_Close(aHandle: THandle); stdcall; external dll;

  function MediaInfo_Option(aHandle: THandle; aOption: PWideChar; aValue: PWideChar): PWideChar; stdcall; external dll;

  function MediaInfo_Inform(aHandle: THandle; Reserved: Integer): PWideChar; stdcall; external dll;
  function MediaInfo_GetI(aHandle: THandle; aStreamKind: TMIStreamKind; aStreamNumber: Integer; aParameter: Integer; aKindOfInfo: TMIInfo): PWideChar; stdcall; external dll;
  function MediaInfo_Get(aHandle: THandle; aStreamKind: TMIStreamKind; aStreamNumber: Integer; aParameter: PWideChar; aKindOfInfo: TMIInfo; aKindOfSearch: TMIInfo): PChar; stdcall; external dll;

implementation

end.
