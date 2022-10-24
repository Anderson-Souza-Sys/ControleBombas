unit uGlobal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus;

Function Pergunta(Frase : String) : Boolean;
procedure Erro(Frase : String);
procedure Alerta(Frase : String);
function DataHora(Atualiza : Boolean = False) : TDateTime;
Procedure KeyValor(var Key : Char);
Procedure KeyNumero(var Key : Char);
Function FormataValor(valor : String; decimais : byte = 2; parteInteira : byte = 10) : String;
Function TextoParaValor(valor : String) : Double;
Function Criptografa(texto : string; chave: string) : String;
Function DesCriptografa(texto : string; chave : string) : String;

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
 hoje : TDateTime;

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

Function FormataValor(valor : String; decimais : byte = 2; parteInteira : byte = 10) : String;
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
    If (Atualiza) or (hoje < 44857) then // 44857 = 23/10/2022
    Begin
      dmPrincipal.qryDataHora.Open;
      Hoje := dmPrincipal.qryDataHora.FieldByName('DataHora').AsDateTime;
      dmPrincipal.qryDataHora.Close;
    End;{if}
  Finally
    Result := Hoje;
  End;{try}
End;{function}

end.
