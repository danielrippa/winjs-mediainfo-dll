unit ChakraMediaInfoUtils;

{$mode delphi}

interface

  function GetMediaFileCompleteInfo(aFileName: WideString): WideString;
  function GetMediaFileStreamProperty(aFileName: WideString; aStreamKind: Integer; aStreamIndex: Integer; aPropertyName: WideString; aPropertyKind: Integer; aSearchKind: Integer): WideString;
  function GetMediaFileBase64EncodedCoverData(aFileName: WideString): WideString;

implementation

  uses
    mediainfo_dll, MediaInfoTypes, SysUtils, ChakraErr;

  function MediaInfoOpen(aFileName: WideString): THandle;
  begin
    Result := MediaInfo_New;

    MediaInfo_Option(Result, 'CharSet', 'UTF-8');
    MediaInfo_Option(Result, 'Complete', '1');
    MediaInfo_Option(Result, 'Cover_Data', 'base64');

    MediaInfo_Open(Result, PWideChar(aFileName));
  end;

  procedure MediaInfoClose(aHandle: THandle);
  begin
    MediaInfo_Close(aHandle);
    MediaInfo_Delete(aHandle);
  end;

  function GetMediaFileCompleteInfo;
  var
    Handle: THandle;
  begin
    Handle := MediaInfoOpen(aFileName);

    Result := MediaInfo_Inform(Handle, 0);

    MediaInfoClose(Handle);
  end;

  function GetMediaFileStreamProperty;
  var
    Handle: THandle;
    StreamKind: TMIStreamKind;
    KindOfInfo: TMIInfo;
    KindOfSearch: TMIInfo;
  begin
    Handle := MediaInfoOpen(aFileName);

    try
      StreamKind := TMIStreamKind(aStreamKind);
      KindOfInfo := TMIInfo(aPropertyKind);
      KindOfSearch := TMIInfo(aSearchKind);
    except
      on E: Exception do
        ThrowError(E.Message, []);
    end;

    Writeln(StreamKind, ' ', KindOfInfo, ' ', KindOfSearch);

    Result := MediaInfo_Get(Handle, StreamKind, aStreamIndex, PWideChar(aPropertyName), KindOfInfo, KindOfSearch);

    MediaInfoClose(Handle);
  end;

  function GetMediaFileBase64EncodedCoverData;
  var
    Handle: THandle;
  begin
    Handle := MediaInfoOpen(aFileName);

    if Handle <> 0 then begin
      MediaInfo_Option(0, 'Cover_Data', 'base64');

      Result := MediaInfo_Get(Handle, miskGeneral, 0, 'Cover_Data', miiText, miiName);

      MediaInfoClose(Handle);
    end;
  end;

end.
