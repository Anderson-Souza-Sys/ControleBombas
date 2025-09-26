unit classAbastecimento;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls;

type
  TCampos = record
    ID_Bomba      : Integer;
    Litros_Abastecer : Double;
    Valor_Cobrado : Double;
    Imposto_Perc  : Double;
    Data_Hota     : TDateTime;

end;{type}

type
  TAtributos = record
    ID_Tanque : Integer;
    Apelido_Tanque : String;
    Litros_Tanque : Double;
    Apelido_Bomba : String;
    Tipo_Combustivel : Char;
end;{type}

type
  TAbastecimentos = class
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
    Function LancarBastecimento : Boolean;
end;{type}

implementation

uses uDmPrincipal, uGlobal, classTanque;

Constructor TAbastecimentos.Create;
Begin
  inherited Create;

  With Campos do
  Begin
    ID_Bomba := 0;
    Litros_Abastecer := 0;
    Valor_Cobrado := 0;
    Imposto_Perc := 0;
    Data_Hota := DataHora;
  End;{with}

  with Atributos do
  Begin
    ID_Tanque := 0;
    Apelido_Tanque := '';
    Litros_Tanque := 0;
    Apelido_Bomba := '';
    Tipo_Combustivel := #32;
  End;{with}
  Mensagem := '';
End;{constructor}

Destructor TAbastecimentos.Destroy;
Begin
  inherited Destroy;
End;{destructor}

Function TAbastecimentos.BuscaAtributos : Boolean;
Begin
  Result := False;
  Mensagem := '';

  try
    With dmPrincipal.qryGenerica do
    Begin
      SQL.Text := Format('SELECT Bombas.*, '+
                         'Tanques.Apelido_Tanque, Tanques.Tipo_Combustivel, Tanques.Litros, Tanques.Valor_Combustivel '+
                         'FROM Bombas '+
                         'INNER JOIN Tanques ON Bombas.ID_Tanque = Tanques.ID_Tanque '+
                         'WHERE Bombas.ID_Bomba = %d'
                         , [Campos.ID_Bomba]);

      Open;

      If IsEmpty Then
      Begin
        Mensagem := 'Bomba não encontrada.';
        Close;
        Exit;
      End;{if}

      Atributos.ID_Tanque := FieldByName('ID_Tanque').AsInteger;
      Atributos.Apelido_Tanque := FieldByName('Apelido_Tanque').AsString;
      Atributos.Litros_Tanque := FieldByName('Litros').AsFloat;
      Atributos.Apelido_Bomba := FieldByName('Apelido_Bomba').AsString;
      Atributos.Tipo_Combustivel := FieldByName('Tipo_Combustivel').AsString[1];
      Campos.Valor_Cobrado := FieldByName('Valor_Combustivel').AsFloat;

      Close;
    End;{with}
    Result := True;
  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;
  End;{try}
End;{function}

Function TAbastecimentos.LancarBastecimento : Boolean;
var
  Tanque : TTanques;
  calculoLitros : Double;
Begin
  Result := False;
  Mensagem := '';

  Try

    If Campos.Litros_Abastecer <= 0 then
    Begin
      Mensagem := 'Deve informar um valor válido para litros.';
      Exit;
    End;{if}

    If not BuscaAtributos Then
    Begin
      Mensagem := 'Falha ao buscar so dados do tanque de combustível';
      Exit;
    End;{if}

    Tanque := TTanques.Create;
    Tanque.Localizar(Atributos.Apelido_Tanque);
    calculoLitros := Tanque.Campos.Litros - Campos.Litros_Abastecer;

    If calculoLitros < 0 Then
    Begin
      Mensagem := 'Não existe combustível suficiente para abastecer.';
      Tanque.Free;
      Exit;
    End;{if}

    FreeAndNil(Tanque);

    dmPrincipal.FDT.StartTransaction;

    with dmPrincipal.qryGenerica do
    Begin
      SQL.Text := 'INSERT INTO LANCAMENTO_ABASTECIMENTO '+
                  '(ID_Bomba, LITROS_ABASTECER, Valor_Cobrado, Imposto_Perc) '+
                  'VALUES '+
                  '(:pID_Bomba, :pLITROS_ABASTECER, :pValor_Cobrado, :pImposto_Perc)';

      ParamByName('pID_Bomba').AsInteger := Campos.ID_Bomba;
      ParamByName('pLITROS_ABASTECER').AsFloat := Campos.Litros_Abastecer;
      ParamByName('pValor_Cobrado').AsFloat := Campos.Valor_Cobrado;
      ParamByName('pImposto_Perc').AsFloat := IMPOSTO_COMBUSTIVEL;
      ExecSQL;
    End;{with}

    Try
      dmPrincipal.FDT.Commit;
      Result := True;
    Except
      dmPrincipal.FDT.Rollback;
      Mensagem := 'Falha no Abastecimento.';
    End;{try}
  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;
  End;{try}
End;{function}

end.

