unit MediaInfoTypes;

{$mode delphi}

interface

  type

    TMIStreamKind = (miskGeneral, miskVideo, miskAudio, miskText, miskChapters, miskImage, miskMenu, miskMax);

    TMIInfo = (miiName, miiText, miiMeasure, miiOptions, miiNameText, miiMeasureText, miiInfo, miiHowTo, miiMax);

    TMIInfoOption = (miioShowInform, miioReserved, miioShowInSupported, miioTypeOfValue, miioMax);

    TMIFileOptions = (mifoNothing, mifoRecursive, mifoCloseAll, mifoXxNoneXx, mifoMax);

implementation

end.