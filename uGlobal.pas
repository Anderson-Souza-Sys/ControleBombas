unit uGlobal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,

  System.DateUtils, System.StrUtils, System.Types;

Procedure ConfigPaths;
function ExecutarSQLCount(const ASQL: string): Integer;
Function Pergunta(Frase : String) : Boolean;
procedure Erro(Frase : String);
procedure Alerta(Frase : String);
function DataHora(Atualiza : Boolean = False) : TDateTime;
Function FormataValor(valor : String; decimais : byte = 2; charDecimal : char = #44) : String;
Procedure KeyValor(var Key : Char; var edit : TEdit);
Procedure KeyNumero(var Key : Char);
Function TextoParaValor(valor : String) : Double;
Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function SomaValores(valores : Array of String; charMilhar : char = #46) : Double; overload;
Function SomaValores(valores : Array of Double; decimais : byte = 2; moeda : boolean = false) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String; charMilhar : char = #46) : Double; overload;


type
  TCFG = record
    Caminho : String[255];
    IP      : String[40];
    Usuario : String[100];
    Senha   : String[100];
    Porta   : String[14];
end;{type}

const
  NOME_EMPRESA = 'Posto de Combustível ABC';
  MAX_BOMBAS_POR_TANQUE = 2;
  IMPOSTO_COMBUSTIVEL = 13; // em porcentagem
  CHAVE_CRIPTOGRAFIA = 'bfBrJ6DJ5o./v3XaJn>uJ+D<bn{0,Z`jr&&WlA~)/IAsC7o~]R';

var
  _path : string;
  _caminhoCfgDB : String;
  _hoje : TDateTime;

implementation

uses uDmPrincipal;

Procedure ConfigPaths;
begin
  {$IFDEF DEBUG}
    _path := ExtractFilePath(Application.ExeName);
  {$ELSE}
    _path := 'C:\ProgramData\CFGProjetoSistemaControleBombas\';
    ForceDirectories(_path);
  {$ENDIF}
  _path := IncludeTrailingPathDelimiter(_path);

  _caminhoCfgDB := _path + 'database.dat';
end;{procedure}

function ExecutarSQLCount(const ASQL: string): Integer;
begin
  with dmPrincipal.qryGenerica do
  begin
    Close;
    SQL.Text := ASQL;
    Open;
    try
      Result := Fields[0].AsInteger;
    finally
      Close;
    end;
  end;
end;{function}

Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  s : string;
  v1, v2,
  total : Double;
Begin
  result := '';

  try
    s := StringReplace(valores[0], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v1 := StrToFloat(Trim(s));

    s := StringReplace(valores[1], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v2 := StrToFloat(Trim(s));

    total := v1* v2;
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  if moeda then
    result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
End;{function}

Function MultiplicaDoisValoresStr(valores : Array of String; charMilhar : char = #46) : Double; overload;
var
  s : string;
  v1, v2,
  total : Double;
Begin
  Result := 0.0;

  try
    s := StringReplace(valores[0], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v1 := StrToFloat(Trim(s));

    s := StringReplace(valores[1], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v2 := StrToFloat(Trim(s));

    total := v1* v2;
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  result := total;
End;{function}

Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  Result := '';
  total := 0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
       total := total + StrToFloat(Trim(s));
    End;{for}
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  if moeda then
    result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
End;{function}

Function SomaValores(valores : Array of String; charMilhar : char = #46) : double; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  total := 0;
  Result := 0.0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
       total := total + StrToFloat(Trim(s));
    End;{for}
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  result := total;
End;{function}

Function SomaValores(valores : Array of Double; decimais : byte = 2; moeda : boolean = false) : string; overload;
var
  i : Integer;
  total : Double;
Begin
  total := 0;

  For i := 0 to Length(valores)-1 do
    total := total + valores[i];{for}

  if moeda then
    result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
End;{function}

Procedure KeyValor(var Key : Char; var edit : TEdit);
Begin
  if (Key = #44) or (Key = #46) then
  Begin
    if (Pos(#44, edit.Text) > 0) or (Pos(#46, edit.Text) > 0) then
      Key := #0;{if}
  End Else
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key = #8) or (Key = #26) or (Key = #26))  Then
    Key := #0;{if}
End;{procedure}

Procedure KeyNumero(var Key : Char);
Begin
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key = #8) or (Key = #26) or (Key = #26))  Then
    Key := #0;{if}
End;{procedure}

Function FormataValor(valor : String; decimais : byte = 2; charDecimal : char = #44) : String;
Begin
  result := '';
  try
    valor := StringReplace(valor, ',', charDecimal, [rfReplaceAll, rfIgnoreCase]);
    valor := StringReplace(valor, '.', charDecimal, [rfReplaceAll, rfIgnoreCase]);

    Result := FloatToStrF(StrToFloat(Trim(valor)), ffNumber, 15, decimais);
  Except
    Erro('Valor incorreto!');
    Abort;
  end;{try}
End;{function}

Function TextoParaValor(valor : String) : Double;
Begin
  result := 0.0;
  try
    valor := StringReplace(valor, '.', '', [rfReplaceAll, rfIgnoreCase]);
    Result := StrToFloat(Trim(valor));
  Except
    Erro('Valor incorreto!');
    Abort;
  end;{try}
End;{function}

Function Pergunta(Frase : String) : Boolean;
var
  r : Boolean;
Begin
  If Application.MessageBox(PChar(Frase), PChar(Application.Title), mb_iconQuestion + mb_YesNo + mb_DefButton1) = mrYes then
    r := True{}
  Else
    r := False;{if}

  Application.ProcessMessages;
  Result := r;
End;{function}

procedure Erro(Frase : String);
Begin
  Application.MessageBox(PChar(Frase), PChar('Erro - '+Application.Title), mb_iconError + mb_Ok);
  Application.ProcessMessages;
End;{function}

procedure Alerta(Frase : String);
Begin
  Application.MessageBox(PChar(Frase), PChar('Atenção - '+Application.Title), mb_IconExclamation + mb_Ok);
  Application.ProcessMessages;
End;{function}

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
    Erro('Falha ao obter a Data/Hora do servidor.');
    Application.Terminate;
    Abort;
  End;{try}
  Result := _hoje;
End;{function}

Function DateTimeParaTimeStampStr(Data : TDateTime) : String;
Begin
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', Data);
End;{function}

end.
