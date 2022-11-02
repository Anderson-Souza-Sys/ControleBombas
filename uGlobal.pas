unit uGlobal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus;

Function Pergunta(Frase : String) : Boolean;
procedure Erro(Frase : String);
procedure Alerta(Frase : String);
function DataHora(Atualiza : Boolean = False) : TDateTime;
Function FormataValor(valor : String; decimais : byte = 2; parteInteira : byte = 15) : String;
Procedure KeyValor(var Key : Char);
Procedure KeyNumero(var Key : Char);
Function TextoParaValor(valor : String) : Double;
Function Criptografa(texto : string; chave: string) : String;
Function DesCriptografa(texto : string; chave : string) : String;
Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false) : String; overload;
Function SomaValores(valores : Array of String) : Double; overload;
Function SomaValores(valores : Array of Double; decimais : byte; moeda : boolean = false) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String) : Double; overload;


type
  TCFG = record
    Caminho : String[255];
    IP      : String[38];
    Usuario : String[100];
    Senha   : String[100];
    Porta   : LongInt;
end;{type}

const
  NOME_EMPRESA = 'Posto ABC';
  MAX_BOMBAS_TANQUE = 2;
  IMPOSTO_COMBUSTIVEL = 13; // em porcentagem
  CHAVE_CRIPTOGRAFIA = 'stringparachave';

var
 _path : string;
 _hoje : TDateTime;

implementation

uses uDmPrincipal;

Function Criptografa(texto : string; chave: string) : String;
begin
  // Função a desenvolver.
  // Documentei aqui pra mostrar que estou ciente que informações do DB
  // gravadas em arquivo de configuração devem estar criptografadas.
  result := texto;
end;{function}

Function DesCriptografa(texto : string; chave : string) : String;
begin
  result := texto;
end;{function}

Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false) : String; overload;
var
  s : string;
  v1, v2,
  total : Double;
Begin

  try
    s := StringReplace(valores[0], '.', '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v1 := StrToFloat(Trim(s));

    s := StringReplace(valores[1], '.', '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v2 := StrToFloat(Trim(s));

    total := v1* v2;
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  if moeda then
    result := FloatToStrF(total, ffCurrency, 15, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 15, decimais);{if}
End;{function}

Function MultiplicaDoisValoresStr(valores : Array of String) : Double; overload;
var
  s : string;
  v1, v2,
  total : Double;
Begin

  try
    s := StringReplace(valores[0], '.', '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v1 := StrToFloat(Trim(s));

    s := StringReplace(valores[1], '.', '', [rfReplaceAll, rfIgnoreCase]);
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

Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false) : String; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  total := 0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
       total := total + StrToFloat(Trim(s));
    End;{for}
  except
    total := 0;
    Erro('Falha na conversão de valores!');
    Abort;
  end;

  if moeda then
    result := FloatToStrF(total, ffCurrency, 15, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 15, decimais);{if}
End;{function}

Function SomaValores(valores : Array of String) : double; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  total := 0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], '.', '', [rfReplaceAll, rfIgnoreCase]);
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

Function SomaValores(valores : Array of Double; decimais : byte; moeda : boolean = false) : string; overload;
var
  i : Integer;
  total : Double;
Begin
  total := 0;

  For i := 0 to Length(valores)-1 do
    total := total + valores[i];{for}

  if moeda then
    result := FloatToStrF(total, ffCurrency, 15, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 15, decimais);{if}
End;{function}

Procedure KeyValor(var Key : Char);
Begin
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key = #44) or (Key = #46) or (Key = #8) or (Key = #26) or (Key = #26))  Then
    Key := #0;{if}
End;{procedure}

Procedure KeyNumero(var Key : Char);
Begin
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key = #8) or (Key = #26) or (Key = #26))  Then
    Key := #0;{if}
End;{procedure}

Function FormataValor(valor : String; decimais : byte = 2; parteInteira : byte = 15) : String;
Begin
  try
    valor := StringReplace(valor, '.', '', [rfReplaceAll, rfIgnoreCase]);
    Result := FloatToStrF(StrToFloat(Trim(valor)), ffNumber, parteInteira, decimais);
  Except
    Erro('Valor incorreto!');
    Abort;
  end;{try}
End;{function}

Function TextoParaValor(valor : String) : Double;
Begin
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
  Application.MessageBox(PChar(Frase), PChar(Application.Title), mb_iconError + mb_Ok);
  Application.ProcessMessages;
End;{function}

procedure Alerta(Frase : String);
Begin
  Application.MessageBox(PChar(Frase), PChar(Application.Title), mb_IconExclamation + mb_Ok);
  Application.ProcessMessages;
End;{function}

function DataHora(Atualiza : Boolean = False) : TDateTime;
Begin
  Try
    If (Atualiza) or (_hoje < 44857) then // 44857 = 23/10/2022
    Begin
      dmPrincipal.qryDataHora.Open;
      _hoje := dmPrincipal.qryDataHora.FieldByName('DataHora').AsDateTime;
      dmPrincipal.qryDataHora.Close;
    End;{if}
  Finally
    Result := _hoje;
  End;{try}
End;{function}

end.
