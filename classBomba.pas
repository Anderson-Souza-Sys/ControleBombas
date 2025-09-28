unit classBomba;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls, Data.DB;

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
    // Campos: representam os dados do banco de dados
    Campos   : TCampos;
    // Atributos: dados auxiliares que não são armazenados no banco
    Atributos: TAtributos;
    // Mensagem: usado para informar erros ou status após operações
    Mensagem: String;
  private
    { Private declarations }
    Function GeraID : Integer;
    Function VerificaSeJaExiste(tambemVerificaLimiteDeBombas : Boolean = true) : Boolean;
    Function IntegridadeReferencial : Boolean;
    Procedure LimpaCampos;
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy; override;
    Function Cadastrar : Boolean;
    Function Atualizar : Boolean;
    Function AlimentaListaCombo(combo : TComboBox; insereLinhaTODAS : boolean = false) : Boolean;
    Function Localizar(apelido : String) : Boolean;
    Function Excluir : Boolean;
end;{type}

implementation

uses uDmPrincipal, uBancoUtils, uConfiguracaoSistema;

Constructor TBombas.Create;
Begin
  inherited Create;
  LimpaCampos;
End;{constructor}

Destructor TBombas.Destroy;
Begin
  inherited Destroy;
End;{destructor}

Function TBombas.VerificaSeJaExiste(tambemVerificaLimiteDeBombas : Boolean = true) : Boolean;
var
  sql : string;
  qtdBombas : Integer;
Begin
  Result := false;
  Mensagem := '';

  try
    if tambemVerificaLimiteDeBombas then
    Begin
      sql := Format('select count(ID_Bomba) as Total from Bombas where ID_Tanque = %d and ID_Bomba <> %d',
      [Campos.ID_Tanque, Campos.ID_Bomba]);

      qtdBombas := ExecutarSQLCount(sql);

      if qtdBombas < 0 then
      Begin
        Mensagem := 'Erro processamento.';
        Exit;
      End;{if}
    End Else
      qtdBombas := 0;{if}

    If qtdBombas >= MAX_BOMBAS_POR_TANQUE then
    Begin
      Result := True;
      Mensagem := 'Número máximo de '+IntToStr(qtdBombas)+' Bombas de Combustível por tanque.';
    End Else
    Begin
      sql := Format('select count(*) from Bombas where Apelido_Bomba = %s and ID_Bomba <> %d', [QuotedStr(Campos.Apelido_Bomba), Campos.ID_Bomba]);

      qtdBombas := ExecutarSQLCount(sql);

      if qtdBombas < 0 then
      Begin
        Mensagem := 'Erro processamento.';
        Exit;
      End;{if}

      if qtdBombas > 0 then
      Begin
        Mensagem := 'Este apelido para a Bomba de Combustível já está em uso.';
        Result := True;
      End;{if}
    End;{if}
  Except on E: Exception do
    Mensagem := 'Falha dados Bomba de Combustível '+sLineBreak+E.Message;
  End;{try}
End;{function}

Procedure TBombas.LimpaCampos;
Begin
  Campos.ID_Bomba := 0;
  Campos.ID_Tanque := 0;
  Campos.Apelido_Bomba := '';
  Atributos.Tipo_Combustivel := #32;
  Atributos.Apelido_Tanque := '';
  Atributos.Litros := 0.0;
  Atributos.Valor_Combustivel := 0.0;
  Mensagem := '';
End;{procedure}

Function TBombas.GeraID : Integer;
var
  id : Integer;
Begin
  Try
    dmPrincipal.FDT.StartTransaction;
    dmPrincipal.qryID_Bomba.Open;
    id := dmPrincipal.qryID_Bomba.FieldByName('Proximo_ID').AsInteger;
    dmPrincipal.qryID_Bomba.Close;

    dmPrincipal.FDT.Commit;
  Except on E: Exception do
    Begin
      dmPrincipal.FDT.Rollback;
      id := -1;
      Mensagem := 'Falha de dados ID '+E.Message;
    End;
  End;{try}

  result := id;
End;{function}

Function TBombas.Localizar(apelido : String) : Boolean;
Begin
  Result := False;
  Mensagem := '';

  try
    With dmPrincipal.qryBomba do
    Begin
      ParamByName('pApelido_Bomba').AsString := apelido;
      Open;

      If not IsEmpty Then
      Begin
        Campos.ID_Bomba := FieldByName('ID_Bomba').AsInteger;
        Campos.ID_Tanque := FieldByName('ID_Tanque').AsInteger;
        Campos.Apelido_Bomba := FieldByName('Apelido_Bomba').AsString;
        Atributos.Tipo_Combustivel := FieldByName('Tipo_Combustivel').AsString[1];
        Atributos.Apelido_Tanque := FieldByName('Apelido_Tanque').AsString;
        Atributos.Litros := FieldByName('Litros').AsFloat;
        Atributos.Valor_Combustivel := FieldByName('Valor_Combustivel').AsFloat;

        Result := True;
      End Else
      Begin
        LimpaCampos;
        Mensagem := 'Cadastro da Bomba de Combustível não localizado';
      End;{if}

      Close;
    End;{with}
  Except on E: Exception do
    Mensagem := 'Falha dados Bomba de Combustível '+sLineBreak+E.Message;
  End;{try}
End;{function}

Function TBombas.Cadastrar : Boolean;
var
  id: Integer;
begin
  Result := False;
  Mensagem := '';
  Campos.ID_Bomba := 0;

  if VerificaSeJaExiste then
    Exit;{if}

  id := GeraID;

  if id < 1 then
  begin
    Mensagem := 'Falha ao gerar ID da Bomba de Combustível.';
    Exit;
  End;{if}

  try
    if VerificaSeJaExiste(true) then
      Exit;{if}

    dmPrincipal.FDT.StartTransaction;

    with dmPrincipal.qryGenerica do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO Bombas (ID_Bomba, ID_Tanque, Apelido_Bomba) ');
      SQL.Add('VALUES (:ID_Bomba, :ID_Tanque, :Apelido_Bomba)');

      Params.ParamByName('ID_Bomba').AsInteger := id;
      Params.ParamByName('ID_Tanque').AsInteger := Campos.ID_Tanque;
      Params.ParamByName('Apelido_Bomba').AsString := Campos.Apelido_Bomba;

      ExecSQL;
    end;

    Try
      dmPrincipal.FDT.Commit;
      Result := True;
    Except
      dmPrincipal.FDT.Rollback;
      Mensagem := 'Falha na gravação dos dados da Bomba de Combustível!';
    End;{try}
  except
    on E: Exception do
    begin
      dmPrincipal.FDT.Rollback;
      Mensagem := 'Falha na gravação da Bomba de Combustível: ' + E.Message;{if}
    end;
  end;{try}
end;{function}

Function TBombas.AlimentaListaCombo(combo : TComboBox; insereLinhaTODAS : boolean = false) : Boolean;
Begin
  try
    Result := false;
    Mensagem := '';

    try
      combo.Items.BeginUpdate;
      combo.Clear;
      If insereLinhaTODAS Then
        combo.Items.Append('<TODAS>');

      with dmPrincipal.qryBombas do
      Begin
        Open;
        First;
        while not Eof do
        Begin
          combo.Items.Append(FieldByName('Apelido_Bomba').AsString);
          Next;
        End;{do}
      End;{with}

      combo.ItemIndex := 0;
      Result := true;
    except
      on E: Exception do
        Mensagem := 'Erro inesperado: ' + E.Message;
    end;
  finally
    dmPrincipal.qryBombas.Close;
    combo.Items.EndUpdate;
  end;
End;{function}

Function TBombas.Atualizar : Boolean;
Begin
  Result := False;
  Mensagem := '';
  Try
    If VerificaSeJaExiste(false) Then
      Exit;{if}

    with dmPrincipal.updBomba do
    Begin
      dmPrincipal.FDT.StartTransaction;

      ParamByName('pID_Bomba').AsInteger := Campos.ID_Bomba;

      ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;
      ParamByName('pApelidoBomba').AsString := Campos.Apelido_Bomba;

      ExecSQL;

      Try
        dmPrincipal.FDT.Commit;
        Result := True;
      Except
        dmPrincipal.FDT.Rollback;
        Mensagem := 'Falha na atualização dos dados da Bomba de Combustível!';
      End;{try}
    End;{with}
  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

Function TBombas.IntegridadeReferencial : Boolean;
var
  qtdLancamentos : Integer;
  sql : string;
Begin
  Result := False;
  Mensagem := '';

  try
    sql := Format(
      'SELECT COUNT(ID_Bomba) AS Qtd FROM Lancamento_Abastecimento WHERE ID_Bomba = %d',
      [Campos.ID_Bomba]);

    qtdLancamentos := ExecutarSQLCount(sql);

    if qtdLancamentos < 0 then
      Mensagem := 'Erro processamento.';{if}

    if qtdLancamentos > 0 then
      Mensagem := 'Operação não permitida! Há lançamentos de abastecimento vinculados a esta Bomba de Combustível.';{if}

    if Mensagem = '' then
      Result := True;{if}

  Except on E: Exception do
    if Mensagem = '' then
      Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

function TBombas.Excluir: Boolean;
begin
  Result := False;
  Mensagem := '';

  try
    if Campos.ID_Bomba < 1 then
    Begin
      Mensagem := 'Bomba para exclusão não foi informada.';
      Exit;
    End;{if}


    if not IntegridadeReferencial then
      Exit;{if}

    with dmPrincipal.delBomba do
    begin
      dmPrincipal.FDT.StartTransaction;

      ParamByName('pID_Bomba').AsInteger := Campos.ID_Bomba;

      try
        ExecSQL;
        dmPrincipal.FDT.Commit;
        LimpaCampos;
        Result := True;
      except
        on E: Exception do
        begin
          dmPrincipal.FDT.Rollback;
          Mensagem := 'Falha ao tentar excluir o cadastro: ' + E.Message;
        end;
      end;
    end;

  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
end;{function}

end.

