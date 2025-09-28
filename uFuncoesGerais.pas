unit uFuncoesGerais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,

  System.DateUtils, System.StrUtils, System.Types;

Function Pergunta(Frase : String) : Boolean;
procedure Erro(Frase : String);
procedure Alerta(Frase : String);

Function FormataValor(valor : String; decimais : byte = 2; charDecimal : char = #44) : String;
Procedure KeyValor(var Key : Char; var edit : TEdit);
Procedure KeyNumero(var Key : Char);
Function TextoParaValor(valor : String; charMilhar : char = #46) : Double;
Function TextoParaValorE(valor : String; charMilhar : char = #46) : Extended;
Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function SomaValores(valores : Array of String; charMilhar : char = #46) : Double; overload;
Function SomaValores(valores : Array of Double; decimais : byte = 2; moeda : boolean = false) : String; overload;
Function SomaValoresE(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function SomaValoresE(valores : Array of String; charMilhar : char = #46) : Extended; overload;
Function SomaValoresE(valores : Array of Extended; decimais : byte = 2; moeda : boolean = false) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function MultiplicaDoisValoresStr(valores : Array of String; charMilhar : char = #46) : Double; overload;
Function MultiplicaDoisValoresStrE(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
Function MultiplicaDoisValoresStrE(valores : Array of String; charMilhar : char = #46) : Extended; overload;


implementation

Function MultiplicaDoisValoresStr(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  s : string;
  v1, v2, total : Double;
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

    if moeda then
      result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
    Else
      result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function MultiplicaDoisValoresStr(valores : Array of String; charMilhar : char = #46) : Double; overload;
var
  s : string;
  v1, v2 : Double;
Begin
  Result := 0.0;

  try
    s := StringReplace(valores[0], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v1 := StrToFloat(Trim(s));

    s := StringReplace(valores[1], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
    v2 := StrToFloat(Trim(s));

    result := v1* v2;
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function MultiplicaDoisValoresStrE(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  s : string;
  v1, v2, total : Extended;
Begin
  result := '';

  try
    s := StringReplace(valores[0], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

    if not TryStrToFloat(Trim(s), v1) then
    begin
      Erro('Valor incorreto!');
      Abort;
    End;{if}

    s := StringReplace(valores[1], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

    if not TryStrToFloat(Trim(s), v2) then
    begin
      Erro('Valor incorreto!');
      Abort;
    End;{if}

    total := v1* v2;

    if moeda then
      result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
    Else
      result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function MultiplicaDoisValoresStrE(valores : Array of String; charMilhar : char = #46) : Extended; overload;
var
  s : string;
  v1, v2 : Extended;
Begin
  Result := 0.0;

  try
    s := StringReplace(valores[0], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

    if not TryStrToFloat(Trim(s), v1) then
    begin
      Erro('Valor incorreto!');
      Abort;
    End;{if}

    s := StringReplace(valores[1], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

    if not TryStrToFloat(Trim(s), v2) then
    begin
      Erro('Valor incorreto!');
      Abort;
    End;{if}

    result := v1* v2;
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function SomaValores(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  Result := '';
  total := 0.0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
       total := total + StrToFloat(Trim(s));
    End;{for}

    if moeda then
      result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
    Else
      result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function SomaValores(valores : Array of Double; decimais : byte = 2; moeda : boolean = false) : string; overload;
var
  i : Integer;
  total : Double;
Begin
  result := '';
  total := 0.0;

  try
  For i := 0 to Length(valores)-1 do
    total := total + valores[i];{for}

  if moeda then
    result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
  Else
    result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  Except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function SomaValores(valores : Array of String; charMilhar : char = #46) : double; overload;
var
  i : Integer;
  s : string;
  total : Double;
Begin
  Result := 0.0;
  total := 0.0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);
       total := total + StrToFloat(Trim(s));
    End;{for}
    result := total;
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function SomaValoresE(valores : Array of String; decimais : byte; moeda : boolean = false; charMilhar : char = #46) : String; overload;
var
  i : Integer;
  s : string;
  v, total : Extended;
Begin
  Result := '';
  total := 0.0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

       if not TryStrToFloat(Trim(s), v) then
       begin
         Erro('Valor incorreto!');
         Abort;
       End;{if}
       total := total + v;
    End;{for}

    if moeda then
      result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
    Else
      result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Function SomaValoresE(valores : Array of Extended; decimais : byte = 2; moeda : boolean = false) : string; overload;
var
  i : Integer;
  v, total : Extended;
Begin
  result := '';
  total := 0.0;

  try
    For i := 0 to Length(valores)-1 do
      total := total + valores[i];{for}

    if moeda then
      result := FloatToStrF(total, ffCurrency, 14+decimais, decimais){}
    Else
      result := FloatToStrF(total, ffNumber, 14+decimais, decimais);{if}
  except
    Erro('Valor incorreto!');
    Abort;
  end;
End;{function}

Function SomaValoresE(valores : Array of String; charMilhar : char = #46) : Extended; overload;
var
  i : Integer;
  s : string;
  v, total : Extended;
Begin
  Result := 0.0;
  total := 0.0;

  try
    For i := 0 to Length(valores)-1 do
    Begin
       s := StringReplace(valores[i], charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
       s := StringReplace(s, FormatSettings.CurrencyString, '', [rfReplaceAll, rfIgnoreCase]);

       if not TryStrToFloat(Trim(s), v) then
       begin
         Erro('Valor incorreto!');
         Abort;
       End;{if}
       total := total + v;
    End;{for}
    result := total;
  except
    Erro('Falha na conversão de valores!');
    Abort;
  end;
End;{function}

Procedure KeyValor(var Key : Char; var edit : TEdit);
Begin
  if (Key = #44) or (Key = #46) then
  Begin
    if (Pos(#44, edit.Text) > 0) or (Pos(#46, edit.Text) > 0) then
      Key := #0;{if}
  End Else
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key in [#8, #26, #127, #0])) then
    Key := #0;{if}
End;{procedure}

Procedure KeyNumero(var Key : Char);
Begin
  if not (((Ord(Key) >= 48) and (Ord(Key) <= 57)) or (Key in [#8, #26, #127, #0])) then
    Key := #0;{if}
End;{procedure}

Function FormataValor(valor : String; decimais : byte = 2; charDecimal : char = #44) : String;
var
  v : Extended;
Begin
  result := '';
  try
    valor := StringReplace(valor, ',', charDecimal, [rfReplaceAll, rfIgnoreCase]);
    valor := StringReplace(valor, '.', charDecimal, [rfReplaceAll, rfIgnoreCase]);

    if not TryStrToFloat(Trim(valor), v) then
    begin
      Erro('Valor incorreto!');
      Abort;
    end;{if}

    Result := FloatToStrF(v, ffNumber, 14+decimais, decimais);
  Except
    Erro('Valor incorreto!');
    Abort;
  end;{try}
End;{function}

Function TextoParaValor(valor : String; charMilhar : char = #46) : Double;
Begin
  result := 0.0;
  try
    valor := StringReplace(valor, charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    Result := StrToFloat(Trim(valor));
  Except
    Erro('Valor incorreto!');
    Abort;
  end;{try}
End;{function}

Function TextoParaValorE(valor : String; charMilhar : char = #46) : Extended;
var
  v : Extended;
Begin
  result := 0.0;
  try
    valor := StringReplace(Trim(valor), charMilhar, '', [rfReplaceAll, rfIgnoreCase]);
    if not TryStrToFloat(valor, v) then
    begin
      Erro('Valor incorreto!');
      Abort;
    end;{if}
    result := v;
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

end.
