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
    // Campos: representam os dados do banco de dados
    Campos   : TCampos;
    // Mensagem: usado para informar erros ou status após operações
    Mensagem: String;
  private
    { Private declarations }
    Function GeraID : Integer;
    Procedure LimpaCampos;
    Function AutorizaGravar : Boolean;
    Function IntegridadeReferencial : Boolean;
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy;
    Function Cadastrar : Boolean;
    Function Atualizar : Boolean;
    Function AtualizaLitros : Boolean;
    function AlimentaListaCombo(combo : TComboBox; insereLinhaTODOS : boolean = false) : Boolean;
    Function Localizar(apelido : String) : Boolean;
    Function Excluir : Boolean;
end;{type}

implementation

uses uDmPrincipal, uGlobal;

Constructor TTanques.Create;
Begin
  inherited Create;
  LimpaCampos;
End;{constructor}

Destructor TTanques.Destroy;
Begin
 inherited Destroy;
End;{destructor}

Function TTanques.AutorizaGravar : Boolean;
var
  sql : String;
Begin
  Mensagem := '';
  Result := false;

  try
    sql := Format('select count(*) from Tanques where Apelido_Tanque = %s and ID_Tanque <> %d', [QuotedStr(Campos.Apelido_Tanque), Campos.ID_Tanque]);
    if ExecutarSQLCount(sql) > 0 then
    Begin
      Mensagem := 'Este apelido para o Tanque já está em uso.';
      Exit;
    End;{id}

    Result := True;

  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

Procedure TTanques.LimpaCampos;
Begin
  With Campos do
  Begin
    ID_Tanque := 0;
    Tipo_Combustivel := #32;
    Litros := 0.0;
    Apelido_Tanque := '';
    Valor_Combustivel := 0.0;
  End;{with}
  Mensagem := '';
End;{procedure}

Function TTanques.GeraID : Integer;
var
  id : Integer;
Begin
  Try
    dmPrincipal.FDT.StartTransaction;
    dmPrincipal.qryID_Tanque.Open;
    id := dmPrincipal.qryID_Tanque.FieldByName('Proximo_ID').AsInteger;
    dmPrincipal.qryID_Tanque.Close;

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

Function TTanques.Localizar(apelido : String) : Boolean;
Begin
  Result := False;
  Mensagem := '';

  try
    With dmPrincipal.qryGenerica do
    Begin
      SQL.Text := Format('select * from Tanques where Apelido_Tanque = %s ', [QuotedStr(apelido)]);
      Open;

      If IsEmpty Then
      Begin
        Close;
        LimpaCampos;
        Mensagem := 'Cadastro de Tanque não localizado';
        Exit;
      End;{if}

      Campos.ID_Tanque := FieldByName('ID_TANQUE').AsInteger;
      Campos.Apelido_Tanque := FieldByName('Apelido_Tanque').AsString;
      Campos.Tipo_Combustivel := FieldByName('Tipo_Combustivel').AsString[1];
      Campos.Litros := FieldByName('Litros').AsFloat;
      Campos.Valor_Combustivel := FieldByName('Valor_Combustivel').AsFloat;

      Close;
      Result := True;
    End;{with}

  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

Function TTanques.Cadastrar : Boolean;
var
  id : integer;
Begin
  Result := False;
  Mensagem := '';

  If not AutorizaGravar Then
    Exit;{if}

  id := GeraID;

  if id < 1  then
  begin
    Mensagem := 'Falha ao gerar ID do Tamque.';
    Exit;
  End;{if}

  try
    with dmPrincipal.qryGenerica do
    begin
      dmPrincipal.FDT.StartTransaction;
      SQL.Clear;
      SQL.Add('INSERT INTO Tanques (ID_Tanque, TIPO_COMBUSTIVEL, LITROS, APELIDO_TANQUE, Valor_Combustivel) ');
      SQL.Add('VALUES (:pID_Tanque, :pTIPO_COMBUSTIVEL, :pLITROS, :pAPELIDO_TANQUE, :pValor_Combustivel)');

      Params.ParamByName('pID_Tanque').AsInteger := id;
      Params.ParamByName('pTIPO_COMBUSTIVEL').Text := Campos.Tipo_Combustivel;
      Params.ParamByName('pLITROS').AsFloat := 0.0;
      Params.ParamByName('pAPELIDO_TANQUE').Text := Campos.Apelido_Tanque;
      Params.ParamByName('pValor_Combustivel').AsFloat := Campos.Valor_Combustivel;

      ExecSQL;
    end;{with}

    Try
      dmPrincipal.FDT.Commit;
      Result := True;
    Except
      dmPrincipal.FDT.Rollback;
      Mensagem := 'Falha na gravação de dados!';
    End;{try}
  Except on E: Exception do
   Begin
     dmPrincipal.FDT.Rollback;

     Mensagem := 'Falha dna gravação '+E.Message;{if}
   End;
  End;{try}
End;{function}

Function TTanques.AlimentaListaCombo(combo : TComboBox; insereLinhaTODOS : boolean = false) : Boolean;
Begin
  try
    Result := false;
    Mensagem := '';

    try
      combo.Items.BeginUpdate;
      combo.Clear;

      If insereLinhaTODOS Then
        combo.Items.Append('<TODOS>');{if}

      with dmPrincipal.qryTanque do
      Begin
        Open;
        First;
        while not Eof do
        Begin
          combo.Items.Append(FieldByName('Apelido_Tanque').AsString);
          Next;
        End;{do}
      End;{with}

      combo.ItemIndex := 0;
      Result := true;
    Except on E: Exception do
      Mensagem := 'Falha de dados '+E.Message;{if}
    End;{try}
  finally
    dmPrincipal.qryTanque.Close;
    combo.Items.EndUpdate;
  end;
End;{function}

Function TTanques.Atualizar : Boolean;
var
  id : integer;
Begin
  Result := False;
  Mensagem := '';

  Try

    If not AutorizaGravar Then
      Exit;{if}

    with dmPrincipal.updTanque do
    Begin
      dmPrincipal.FDT.StartTransaction;

      ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;

      ParamByName('pApelidoTanque').AsString := Campos.Apelido_Tanque;
      ParamByName('pTipoCombustivel').AsString := Campos.Tipo_Combustivel;
      ParamByName('pLitros').AsFloat := Campos.Litros;
      ParamByName('pValor_Combustivel').AsFloat := Campos.Valor_Combustivel;

      ExecSQL;

      Try
        dmPrincipal.FDT.Commit;
        Result := True;
      Except
        dmPrincipal.FDT.Rollback;
        Mensagem := 'Falha na atualização de dados!';
      End;{try}
    End;{with}

  Except on E: Exception do
    if Mensagem = '' then
      Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

Function TTanques.AtualizaLitros : Boolean;
var
  id : integer;
Begin
  Result := False;
  Mensagem := '';
  Try

    If not AutorizaGravar Then
      Exit;{if}

    with dmPrincipal.updLitros do
    Begin
      dmPrincipal.FDT.StartTransaction;

      ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;
      ParamByName('pLitros').AsFloat :=  Campos.Litros;

      ExecSQL;

      Try
        dmPrincipal.FDT.Commit;
        Result := True;
      Except
        dmPrincipal.FDT.Rollback;
        Mensagem := 'Falha na atualização de dados!';
      End;{try}
    End;{with}

  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

Function TTanques.IntegridadeReferencial : Boolean;
var
  sql : string;
Begin
  Result := False;
  Mensagem := '';

  try
    sql := Format(
      'SELECT COUNT(ID_Tanque) AS Qtd FROM Bombas WHERE ID_Tanque = %d',
      [Campos.ID_Tanque]);

    if ExecutarSQLCount(sql) > 0 then
      Mensagem := '- Compromete a integridade referencal com Cadastro de Bombas.'+sLineBreak;{if}

    sql := Format(
      'SELECT COUNT(ID_Tanque) AS Qtd FROM LANCAMENTO_RECARGA WHERE ID_Tanque = %d',
      [Campos.ID_Tanque]);

    if ExecutarSQLCount(sql) > 0 then
      Mensagem := Mensagem + '- Compromete a integridade referencal com Lançamentos de Recarga.';{if}

    if Mensagem = '' then
      Result := True;{if}

  except on E: Exception do
    if Mensagem = '' then
      Mensagem := 'Falha de dados '+E.Message;{if}
  end;{try}
End;{function}

Function TTanques.Excluir : Boolean;
var
  id : integer;
Begin
  Result := False;
  Mensagem := '';

  Try
    If not IntegridadeReferencial Then
      Exit;{if}

    with dmPrincipal.delTanque do
    Begin
      dmPrincipal.FDT.StartTransaction;

      ParamByName('pID_Tanque').AsInteger := Campos.ID_Tanque;
      ExecSQL;

      Try
        dmPrincipal.FDT.Commit;
        Result := True;
      Except
        dmPrincipal.FDT.Rollback;
        Mensagem := 'Falha ao tentar excluir o cadastro!';
      End;{try}
    End;{with}

  Except on E: Exception do
    Mensagem := 'Falha de dados '+E.Message;{if}
  End;{try}
End;{function}

end.

