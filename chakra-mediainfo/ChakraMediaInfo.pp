unit ChakraMediaInfo;

{$mode delphi}

interface

  uses
    ChakraTypes;

  function GetJsValue: TJsValue;

implementation

  uses
    Chakra, ChakraUtils, ChakraMediaInfoUtils;

  function ChakraGetMediaFileInfo(Args: PJsValue; ArgCount: Word): TJsValue;
  var
    aFileName: WideString;
  begin
    CheckParams('getCompleteMediaFileInfo', Args, ArgCount, [jsString], 1);

    aFileName := JsStringAsString(Args^);
    Result := StringAsJsString(GetMediaFileCompleteInfo(aFileName));
  end;

  function ChakraGetMediaFileStreamPropertyValue(Args: PJsValue; ArgCount: Word): TJsValue;
  var
    aFileName: WideString;
    aStreamKind: Integer;
    aStreamIndex: Integer;
    aPropertyName: WideString;
    aPropertyKind: Integer;
    aSearchKind: Integer;
  begin
    Writeln('va chequiar');
    CheckParams('getMediaFileStreamPropertyValue', Args, ArgCount, [jsString, jsNumber, jsNumber, jsString, jsNumber, jsNumber], 6);

    Writeln('chequio okis');

    aFileName := JsStringAsString(Args^); Inc(Args);
    Writeln(aFileName);

    aStreamKind := JsNumberAsInt(Args^); Inc(Args);
    Writeln(aStreamKind);

    aStreamIndex := JsNumberAsInt(Args^); Inc(Args);
    Writeln(aStreamIndex);

    aPropertyName := JsStringAsString(Args^); Inc(Args);
    Writeln(aPropertyName);

    aPropertyKind := JsNumberAsInt(Args^); Inc(Args);
    Writeln(aPropertyKind);

    aSearchKind := JsNumberAsInt(Args^);
    Writeln(aSearchKind);

    Writeln('hasta aca todo bien');

    Result := StringAsJsString(GetMediaFileStreamProperty(aFileName, aStreamKind, aStreamIndex, aPropertyName, aPropertyKind, aSearchKind));
  end;

  function ChakraGetMediaFileCoverData(Args: PJsValue; ArgCount: Word): TJsValue;
  var
    aFileName: WideString;
  begin
    CheckParams('getCompleteMediaFileInfo', Args, ArgCount, [jsString], 1);

    aFileName := JsStringAsString(Args^);
    Result := StringAsJsString(GetMediaFileBase64EncodedCoverData(aFileName));
  end;

  function GetJsValue;
  begin

    Result := CreateObject;

    SetFunction(Result, 'getCompleteMediaFileInfo', ChakraGetMediaFileInfo);
    SetFunction(Result, 'getMediaFileStreamPropertyValue', ChakraGetMediaFileStreamPropertyValue);
    SetFunction(Result, 'getMediaFileBase64EncodedCoverData', ChakraGetMediaFileCoverData);

  end;

end.
