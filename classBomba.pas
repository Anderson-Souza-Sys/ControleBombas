unit classBomba;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls;

type
  TCampos = record
    ID_Bomba        : Integer;
    ID_Tanque       : Integer;
    Apelido_Bomba   : String;
end;{type}

type
  TAtributos = record
    Apelido_Tanque   : String;
    Tipo_Combustivel : Char;
    Litros           : Double;
    Valor_Combustivel: Double;
end;{type}


type
  TBombas = class
    Campos   : TCampos;//Corresponde ao campo do banco de dados
    Atributos: TAtributos;// Apenas Atributos que não corresponde a campos no DB
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
    Procedure AlimentaListaCombo(combo : TComboBox; insereLinhaTODAS : boolean = false);
    Function Localizar(apelido : String) : Boolean;
    Function Excluir : Boolean;
end;{type}

implementation

uses uDmPrincipal, uGlobal;

Constructor TBombas.Create;
Begin
  LimpaCampos;
End;{constructor}

Destructor TBombas.Destroy;
Begin

End;{destructor}

Function TBombas.VerificaSeJaExiste : Boolean;
var
  R : Boolean;
  T : Integer;
Begin
  Mensagem := '';
  R := True;

  dmPrincipal.qryGenerica.SQL.Text :=
  'select count(ID_Bomba) as Total from Bombas where '+
  ' Bombas.ID_Tanque = '+IntToStr(Campos.ID_Tanque)+
  ' and Bombas.ID_Bomba <> '+IntToStr(Campos.ID_Bomba);

  dmPrincipal.qryGenerica.Open;
  T := dmPrincipal.qryGenerica.FieldByName('Total').AsInteger;
  dmPrincipal.qryGenerica.Close;

  If T >= MAX_BOMBAS_TANQUE then
  Begin
    R := True;
    Mensagem := 'Número máximo de '+IntToStr(T)+' bombas por tanque.';
  End Else
  Begin
    dmPrincipal.tbBomba.Open;

    If dmPrincipal.tbBomba.Locate('Apelido_Bomba', Campos.Apelido_Bomba,[]) Then
    Begin
      If Campos.ID_Bomba <> dmPrincipal.tbBomba.FieldByName('ID_Bomba').AsInteger Then
      Begin
        Mensagem := 'Este apelido para a Bomba já está em uso.';
        R := True;
      End Else
        R := False;{if}
    End Else
      R := False;{if}

    dmPrincipal.tbBomba.Close;
  End;{if}

  Result := R;
End;{function}

Procedure TBombas.LimpaCampos;
Begin
  Campos.ID_Bomba := 0;
  Campos.Apelido_Bomba := '';
  Atributos.Tipo_Combustivel := #32;
  Atributos.Apelido_Tanque := '';
  Atributos.Litros := 0;
  Mensagem := '';
End;{procedure}

Function TBombas.GeraID : Integer;
var
  id : Integer;
Begin
  dmPrincipal.FDT.StartTransaction;
  dmPrincipal.qryID_Bomba.Open;
  id := dmPrincipal.qryID_Bomba.FieldByName('Proximo_ID').AsInteger;
  dmPrincipal.qryID_Bomba.Close;

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

Function TBombas.Localizar(apelido : String) : Boolean;
var
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  try

    dmPrincipal.qryBomba.Open;

    If dmPrincipal.qryBomba.Locate('Apelido_Bomba', apelido,[]) Then
    Begin
      Campos.ID_Bomba := dmPrincipal.qryBomba.FieldByName('ID_Bomba').AsInteger;
      Campos.ID_Tanque := dmPrincipal.qryBomba.FieldByName('ID_Tanque').AsInteger;
      Campos.Apelido_Bomba := dmPrincipal.qryBomba.FieldByName('Apelido_Bomba').AsString;
      Atributos.Tipo_Combustivel := dmPrincipal.qryBomba.FieldByName('Tipo_Combustivel').AsString[1];
      Atributos.Apelido_Tanque := dmPrincipal.qryBomba.FieldByName('Apelido_Tanque').AsString;
      Atributos.Litros := dmPrincipal.qryBomba.FieldByName('Litros').AsFloat;
      Atributos.Valor_Combustivel := dmPrincipal.qryBomba.FieldByName('Valor_Combustivel').AsFloat;

      R := True;
    End Else
    Begin
      LimpaCampos;
      Mensagem := 'Cadastro da bomba não localizado';
    End;{if}

    dmPrincipal.qryBomba.Close;
    Result := R;
  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
      Result := R;
    End;
  End;{try}
End;{function}

Function TBombas.Cadastrar : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Campos.ID_Bomba := -1;

  Try

    If not VerificaSeJaExiste Then
    Begin
      with dmPrincipal.tbBomba do
      Begin
        id := GeraID;

        If id > 0 then
        Begin
          dmPrincipal.FDT.StartTransaction;
          Open;
          Append;
          FieldByName('ID_Bomba').AsInteger := id;
          FieldByName('ID_Tanque').AsInteger := Campos.ID_Tanque;
          FieldByName('APELIDO_Bomba').Text := Campos.Apelido_Bomba;
          Refresh;

          Try
            dmPrincipal.FDT.Commit;
            R := True;
          Except
            dmPrincipal.FDT.Rollback;
            Close;
            Mensagem := 'Falha na gravação da Bomba!';
            R := False;
          End;{try}
        End Else
        Begin
          Mensagem := 'Falha na gravação do ID para a Bomba!';
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
      Result := R;
    End;
  End;{try}
  Result := R;
End;{function}

Procedure TBombas.AlimentaListaCombo(combo : TComboBox; insereLinhaTODAS : boolean = false);
Begin
  Mensagem := '';

  combo.Clear;
  If insereLinhaTODAS Then
    combo.Items.Append('<TODAS>');

  dmPrincipal.qryBomba.Open;
  dmPrincipal.qryBomba.First;
  while not dmPrincipal.qryBomba.Eof do
  Begin
    combo.Items.Append(dmPrincipal.qryBomba.FieldByName('Apelido_Bomba').AsString);
    dmPrincipal.qryBomba.Next;
  End;{do}

  dmPrincipal.qryBomba.Close;
End;{procedure}

Function TBombas.Atualizar : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try

    If not VerificaSeJaExiste Then
    Begin
      with dmPrincipal.updBomba do
      Begin
        dmPrincipal.FDT.StartTransaction;

        ParamByName('pID_Bomba').AsInteger := Campos.ID_Bomba;

        ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;
        ParamByName('pApelidoBomba').AsString := Campos.Apelido_Bomba;

        ExecSQL;

        Try
          dmPrincipal.FDT.Commit;
          R := True;
        Except
          dmPrincipal.FDT.Rollback;
          Close;
          Mensagem := 'Falha na atualização dos dados da Bomba!';
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
      Result := R;
    End;
  End;{try}

  Result := R;
End;{function}

Function TBombas.IntegridadeReferencial : Boolean;
var
  r : boolean;
Begin
  r := True;

  dmPrincipal.tbAbastecimento.Open;
  if dmPrincipal.tbAbastecimento.Locate('ID_Bomba', Campos.ID_Bomba, []) then
  Begin
    dmPrincipal.tbAbastecimento.Close;
    r := false;
    Mensagem := 'Operação não pode ser feita! Compromete a integridade referencal com Lançamentos de Abastecimento.';
  End Else
  Begin
    dmPrincipal.tbBomba.Close;
  End;{if}

  result := r;
End;{function}

Function TBombas.Excluir : Boolean;
var
  id : integer;
  R : Boolean;
Begin
  R := False;
  Mensagem := '';
  Try
    If IntegridadeReferencial Then
    Begin
      with dmPrincipal.delBomba do
      Begin
        dmPrincipal.FDT.StartTransaction;

        ParamByName('pID_Bomba').AsInteger := Campos.ID_Bomba;

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
      Result := R;
    End;
  End;{try}

  result := r;
End;{function}

end.

