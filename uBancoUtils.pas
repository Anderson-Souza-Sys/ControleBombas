unit uBancoUtils;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,

  System.DateUtils, System.StrUtils, System.Types;

Procedure ConfigPaths(caminho : string; database : string = 'database.dat');
function ExecutarSQLCount(const ASQL: string): Integer;
function DataHora(Atualiza : Boolean = False) : TDateTime;
Function DateTimeParaTimeStampStr(Data : TDateTime) : String;

type
  TCFG = record
    Caminho : String[255];
    IP      : String[40];
    Usuario : String[100];
    Senha   : String[100];
    Porta   : String[14];
end;{type}

var
  _path : string;
  _caminhoCfgDB : String;

implementation

uses uDmPrincipal;

var
  _hoje : TDateTime;

Procedure ConfigPaths(caminho : string; database : string = 'database.dat');
begin
  {$IFDEF DEBUG}
    _path := ExtractFilePath(Application.ExeName);
  {$ELSE}
    _path := caminho;
    ForceDirectories(_path);
  {$ENDIF}
  _path := IncludeTrailingPathDelimiter(_path);

  _caminhoCfgDB := _path + 'database.dat';
end;{procedure}

function ExecutarSQLCount(const ASQL: string): Integer;
begin
  result := -1;

  with dmPrincipal.qryGenerica do
  begin
    try
      Close;
      SQL.Text := ASQL;
      Open;
      Result := Fields[0].AsInteger;
    finally
      Close;
    end;
  end;
end;{function}

function DataHora(Atualiza : Boolean = False) : TDateTime;
var
  s : String;
  a : TStringDynArray;
Begin
  Try
    If (Atualiza) or (_hoje < EncodeDate(2025, 2, 1)) then
    Begin
      dmPrincipal.qryDataHora.Open;
      s := dmPrincipal.qryDataHora.Fields[0].AsString;
      dmPrincipal.qryDataHora.Close;

      a := SplitString(S, ' ');
      _hoje := EncodeDateTime(StrToInt(a[0]), StrToInt(a[1]), StrToInt(a[2]), StrToInt(a[3]), StrToInt(a[4]), StrToInt(a[5]), 0);
    End;{if}
  Except
    Application.MessageBox('Falha ao obter a Data/Hora do servidor.', PChar('Erro - '+Application.Title), mb_iconError + mb_Ok);
    Application.Terminate;
    Abort;
  End;{try}
  Result := _hoje;
End;{function}

Function DateTimeParaTimeStampStr(Data : TDateTime) : String;
Begin
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', Data);
End;{function}

initialization
  _hoje := EncodeDate(2000, 1, 1);

end.
