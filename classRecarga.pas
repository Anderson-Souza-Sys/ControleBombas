unit classRecarga;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls;

type
  TCampos = record
    ID_Tanque      : Integer;
    Litros_Recarga : Double;
    Data_Hota      : TDateTime;

end;{type}

type
  TAtributos = record
    ID_Tanque : Integer;
    Apelido_Tanque : String;
    Litros_Tanque : Double;
    Tipo_Combustivel : Char;
end;{type}

type
  TRecargas = class
    // Campos: representam os dados do banco de dados
    Campos   : TCampos;
    // Atributos: dados auxiliares que não são armazenados no banco
    Atributos: TAtributos;
    // Mensagem: usado para informar erros ou status após operações
    Mensagem: String;
  private
    { Private declarations }
    Function BuscaAtributos : Boolean;
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy;
    Function LancarRecarga : Boolean;
end;{type}

implementation

uses uDmPrincipal, uGlobal, classTanque;

Constructor TRecargas.Create;
Begin
  inherited Create;

  With Campos do
  Begin
    ID_Tanque := 0;
    Litros_Recarga := 0;
    Data_Hota := DataHora;
  End;{with}

  with Atributos do
  Begin
    ID_Tanque := 0;
    Apelido_Tanque := '';
    Litros_Tanque := 0;
    Tipo_Combustivel := #32;
  End;{with}
End;{constructor}

Destructor TRecargas.Destroy;
Begin
  inherited Destroy;
End;{destructor}

Function TRecargas.BuscaAtributos : Boolean;
Begin
  Result := False;
  Mensagem := '';

  try
    With dmPrincipal.qryGenerica do
    Begin
      SQL.Text := Format('select * from Tanques where ID_Tanque = %d ', [Campos.ID_Tanque]);
      Open;

      If IsEmpty Then
      Begin
        Mensagem := 'Tanque não encontrado.';
        Close;
        Exit;
      End;{if}

      Atributos.ID_Tanque := FieldByName('ID_Tanque').AsInteger;
      Atributos.Apelido_Tanque := FieldByName('Apelido_Tanque').AsString;
      Atributos.Litros_Tanque := FieldByName('Litros').AsFloat;
      Atributos.Tipo_Combustivel := FieldByName('Tipo_Combustivel').AsString[1];

      Close;
      Result := True;
    End;{with}
  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;
  End;{try}
End;{function}

Function TRecargas.LancarRecarga : Boolean;
Begin
  Result := False;
  Mensagem := '';

  Try

    If Campos.Litros_Recarga <= 0 then
    Begin
      Mensagem := 'Deve informar um valor válido para litros.';
      Exit;
    End;{if}

    If not BuscaAtributos Then
    Begin
      Mensagem := 'Falha ao buscar so dados do tanque de combustível';
      Exit;
    End;{if}

    dmPrincipal.FDT.StartTransaction;

    with dmPrincipal.QryGenerica do
    Begin
      SQL.Text := 'UPDATE LANCAMENTO_RECARGA SET LITROS_RECARGA = :pLitros, DATA_HORA = :pDataHora WHERE ID_TANQUE = :pID';
      ParamByName('pLitros').AsFloat := Campos.Litros_Recarga;
      ParamByName('pDataHora').AsDateTime := DataHora(True);
      ParamByName('pID').AsInteger := Campos.ID_Tanque;
      ExecSQL;

      SQL.Text := 'UPDATE TANQUES SET LITROS = LITROS + :pLitros WHERE ID_TANQUE = :pID';
      ParamByName('pLitros').AsFloat := Campos.Litros_Recarga;
      ParamByName('pID').AsInteger := Campos.ID_Tanque;
      ExecSQL;
    End;{with}

    Try
      dmPrincipal.FDT.Commit;
      Result := True;
    Except
      dmPrincipal.FDT.Rollback;
      Mensagem := 'Falha na gravação da recarga!';
    End;{try}
  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;
  End;{try}
End;{function}

end.

