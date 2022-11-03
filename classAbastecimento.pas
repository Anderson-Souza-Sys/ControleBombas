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
    Campos   : TCampos;
    Atributos: TAtributos;
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
End;{constructor}

Destructor TAbastecimentos.Destroy;
Begin

End;{destructor}

Function TAbastecimentos.BuscaAtributos : Boolean;
Begin
  dmPrincipal.qryBomba.Open;
  If dmPrincipal.qryBomba.Locate('ID_Bomba', Campos.ID_Bomba, []) Then
  Begin
    Atributos.ID_Tanque := dmPrincipal.qryBomba.FieldByName('ID_Tanque').AsInteger;
    Atributos.Apelido_Tanque := dmPrincipal.qryBomba.FieldByName('Apelido_Tanque').AsString;
    Atributos.Litros_Tanque := dmPrincipal.qryBomba.FieldByName('Litros').AsFloat;
    Atributos.Apelido_Bomba := dmPrincipal.qryBomba.FieldByName('Apelido_Bomba').AsString;
    Atributos.Tipo_Combustivel := dmPrincipal.qryBomba.FieldByName('Tipo_Combustivel').AsString[1];
    Campos.Valor_Cobrado := dmPrincipal.qryBomba.FieldByName('Valor_Combustivel').AsFloat;

    dmPrincipal.qryBomba.Close;
    Result := True;
  End Else
  Begin
    dmPrincipal.qryBomba.Close;
    Result := False;
  End;{if}
End;{function}

Function TAbastecimentos.LancarBastecimento : Boolean;
var
  R : Boolean;
  hora : TDateTime;
  Tanque : TTanques;
Begin
  R := False;
  Mensagem := '';

  Try

    If Campos.Litros_Abastecer <= 0 then
    Begin
      R := False;
      Mensagem := 'Deve informar um valor válido para litros.';
    End Else
    If not BuscaAtributos Then
    Begin
      R := False;
      Mensagem := 'Falha ao buscar so dados do tanque de combustível';
    End Else
    Begin
      with dmPrincipal.tbAbastecimento do
      Begin
        hora := DataHora(True);

        dmPrincipal.FDT.StartTransaction;
        Open;
        Append;
        FieldByName('ID_Bomba').AsInteger := Campos.ID_Bomba;
        FieldByName('LITROS_ABASTECER').AsFloat := Campos.Litros_Abastecer;
        FieldByName('Valor_Cobrado').AsFloat := Campos.Valor_Cobrado;
        FieldByName('Imposto_Perc').AsFloat := IMPOSTO_COMBUSTIVEL;
        FieldByName('Data_Hora').AsDateTime := hora;
        Refresh;

        Tanque := TTanques.Create;
        Tanque.Campos.ID_Tanque := Atributos.ID_Tanque;
        Tanque.Campos.Litros := Atributos.Litros_Tanque - Campos.Litros_Abastecer;

        If Tanque.Campos.Litros < 0 Then
        Begin
          Mensagem := 'Não existe combustível suficiente para abastecer.';
          R := False;
        End Else
        If Tanque.AtualizaLitros Then
        Begin
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
          Mensagem := Tanque.Mensagem;
          R := False;
          dmPrincipal.FDT.Rollback;
          Close;
        End;{if}

         Tanque.Destroy;
      End;{with}
    End;{if}
  Except on E: Exception do
    Begin
      Mensagem := 'Falha de dados '+E.Message;
    End;
  End;{try}

  Result := R;
End;{function}

end.

