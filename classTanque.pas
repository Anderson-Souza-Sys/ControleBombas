unit classTanque;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls;

type
  TCampos = record
    ID_Tanque        : Integer;
    Tipo_Combustivel : Char;
    Litros           : Double;
    Apelido_Tanque   : String;
    Valor_Combustivel: Double;
end;{type}

type
  TTanques = class
    Campos   : TCampos;
    Mensagem: String;
  private
    { Private declarations }
    Function GeraID : Integer;
    Procedure LimpaCampos;
    Function VerificaSeJaExiste : Boolean;
    Function IntegridadeReferencial : Boolean;
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy;
    Function Cadastrar : Boolean;
    Function Atualizar : Boolean;
    Function AtualizaLitros : Boolean;
    Procedure AlimentaListaCombo(combo : TComboBox; insereLinhaTODOS : boolean = false);
    Function Localizar(apelido : String) : Boolean;
    Function Excluir : Boolean;
end;{type}

implementation

uses uDmPrincipal;

Constructor TTanques.Create;
Begin
  LimpaCampos;
End;{constructor}

Destructor TTanques.Destroy;
Begin

End;{destructor}

Function TTanques.VerificaSeJaExiste : Boolean;
var
  R : Boolean;
Begin
  Mensagem := '';
  dmPrincipal.tbTanque.Open;

  If dmPrincipal.tbTanque.Locate('Apelido_Tanque', Campos.Apelido_Tanque,[]) Then
  Begin
    If Campos.ID_Tanque <> dmPrincipal.tbTanque.FieldByName('ID_TANQUE').AsInteger Then
    Begin
      Mensagem := 'Este apelido para o Tanque já está em uso.';
      R := True;
    End Else
      R := False;{if}
  End Else
    R := False;{if}

  dmPrincipal.tbTanque.Close;
  Result := R;
End;{function}

Procedure TTanques.LimpaCampos;
Begin
  With Campos do
  Begin
    ID_Tanque := 0;
    Tipo_Combustivel := Chr(32);
    Litros := 0;
    Apelido_Tanque := '';
  End;{with}
  Mensagem := '';
End;{procedure}

Function TTanques.GeraID : Integer;
var
  id : Integer;
Begin
  dmPrincipal.FDT.StartTransaction;
  dmPrincipal.qryID_Tanque.Open;
  id := dmPrincipal.qryID_Tanque.FieldByName('Proximo_ID').AsInteger;
  dmPrincipal.qryID_Tanque.Close;

  Try
    dmPrincipal.FDT.Commit;
  Except on E: Exception do
    Begin
      dmPrincipal.FDT.Rollback;
      id := -1;
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  result := id;
End;{function}

Function TTanques.Localizar(apelido : String) : Boolean;
var
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  dmPrincipal.tbTanque.Open;

  If dmPrincipal.tbTanque.Locate('Apelido_Tanque', apelido,[]) Then
  Begin
    Campos.ID_Tanque := dmPrincipal.tbTanque.FieldByName('ID_TANQUE').AsInteger;
    Campos.Apelido_Tanque := dmPrincipal.tbTanque.FieldByName('Apelido_Tanque').AsString;
    Campos.Tipo_Combustivel := dmPrincipal.tbTanque.FieldByName('Tipo_Combustivel').AsString[1];
    Campos.Litros := dmPrincipal.tbTanque.FieldByName('Litros').AsFloat;
    Campos.Valor_Combustivel := dmPrincipal.tbTanque.FieldByName('Valor_Combustivel').AsFloat;

    R := True;
  End Else
  Begin
    LimpaCampos;
    Mensagem := 'Cadastro não localizado';
  End;{if}

  dmPrincipal.tbTanque.Close;
  Result := R;
End;{function}

Function TTanques.Cadastrar : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try

    If not VerificaSeJaExiste Then
    Begin
      with dmPrincipal.tbTanque do
      Begin
        id := GeraID;

        If id > 0 then
        Begin
          dmPrincipal.FDT.StartTransaction;
          Open;
          Append;
          FieldByName('ID_Tanque').AsInteger := id;
          FieldByName('TIPO_COMBUSTIVEL').Text := Campos.Tipo_Combustivel;
          FieldByName('LITROS').AsFloat := 0;
          FieldByName('APELIDO_TANQUE').Text := Campos.Apelido_Tanque;
          FieldByName('Valor_Combustivel').AsFloat := Campos.Valor_Combustivel;
          Refresh;

          Try
            dmPrincipal.FDT.Commit;
            R := True;
          Except
            dmPrincipal.FDT.Rollback;
            Close;
            Mensagem := 'Falha na gravação!';
            R := False;
          End;{try}
        End Else
        Begin
          Mensagem := 'Falha na gravação do ID!';
          R := False;
        End;{if}

      End;{with}
    End Else
    Begin
      R := False;
    End;{if}
  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  Result := R;
End;{function}

Procedure TTanques.AlimentaListaCombo(combo : TComboBox; insereLinhaTODOS : boolean = false);
Begin
  Mensagem := '';

  combo.Clear;
  If insereLinhaTODOS Then
    combo.Items.Append('<TODOS>');

  dmPrincipal.qryTanque.Open;
  dmPrincipal.qryTanque.First;
  while not dmPrincipal.qryTanque.Eof do
  Begin
    combo.Items.Append(dmPrincipal.qryTanque.FieldByName('Apelido_Tanque').AsString);
    dmPrincipal.qryTanque.Next;
  End;{do}

  dmPrincipal.qryTanque.Close;
  combo.ItemIndex := 0;
End;{procedure}

Function TTanques.Atualizar : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try

    If not VerificaSeJaExiste Then
    Begin
      with dmPrincipal.updTanque do
      Begin
        dmPrincipal.FDT.StartTransaction;

        ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;

        ParamByName('pApelidoTanque').AsString := Campos.Apelido_Tanque;
        ParamByName('pTipoCombustivel').Text := Campos.Tipo_Combustivel;
        ParamByName('pLitros').AsFloat := Campos.Litros;
        ParamByName('pValor_Combustivel').AsFloat := Campos.Valor_Combustivel;

        ExecSQL;

        Try
          dmPrincipal.FDT.Commit;
          R := True;
        Except
          dmPrincipal.FDT.Rollback;
          Close;
          Mensagem := 'Falha na atualização de dados!';
          R := False;
        End;{try}
      End;{with}
    End Else
    Begin
      R := False;
    End;{if}
  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  Result := R;
End;{function}

Function TTanques.AtualizaLitros : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try

    If not VerificaSeJaExiste Then
    Begin
      with dmPrincipal.updLitros do
      Begin
        dmPrincipal.FDT.StartTransaction;

        ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;
        ParamByName('pLitros').AsFloat :=  Campos.Litros;

        ExecSQL;

        Try
          dmPrincipal.FDT.Commit;
          R := True;
        Except
          dmPrincipal.FDT.Rollback;
          Close;
          Mensagem := 'Falha na atualização de dados!';
          R := False;
        End;{try}
      End;{with}
    End Else
    Begin
      R := False;
    End;{if}
  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  Result := R;
End;{function}

Function TTanques.IntegridadeReferencial : Boolean;
var
  r : boolean;
Begin
  r := True;
  dmPrincipal.tbBomba.Open;
  if dmPrincipal.tbBomba.Locate('ID_Tanque', Campos.ID_Tanque, []) then
  Begin
    dmPrincipal.tbBomba.Close;
    r := false;
    Mensagem := 'Operação não pode ser feita! Compromete a integridade referencal com Cadastro de Bombas.';
  End Else
  Begin
    dmPrincipal.tbBomba.Close;
    dmPrincipal.tbRecarga.Open;
    if dmPrincipal.tbRecarga.Locate('ID_Tanque', Campos.ID_Tanque, []) then
    Begin
      dmPrincipal.tbRecarga.Close;
      r := false;
      Mensagem := 'Operação não pode ser feita! Compromete a integridade referencal com Lançamentos de Recarga.';
    End Else
    Begin
      dmPrincipal.tbBomba.Close;
    End;{if}
  End;{if}
  result := r;
End;{function}

Function TTanques.Excluir : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try
    If IntegridadeReferencial Then
    Begin
      with dmPrincipal.delTanque do
      Begin
        dmPrincipal.FDT.StartTransaction;

        ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;

        ExecSQL;

        Try
          dmPrincipal.FDT.Commit;
          R := True;
        Except
          dmPrincipal.FDT.Rollback;
          Close;
          Mensagem := 'Falha ao tentar excluir o cadastro!';
          R := False;
        End;{try}
      End;{with}
    End Else
      R := False;{if}

  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  Result := R;
End;{function}

end.

