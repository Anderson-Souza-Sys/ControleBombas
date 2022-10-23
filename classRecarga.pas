unit classRecarga;

interface

uses Sysutils, Forms, Windows, System.Classes, Vcl.StdCtrls;

type
  TCampos = record
    ID_Tanque      : Integer;
    Litros_Recarga: Double;
    Data_Hota     : TDateTime;

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
    Function LancarRecarga : Boolean;
end;{type}

implementation

uses uDmPrincipal, uGlobal, classTanque;

Constructor TRecargas.Create;
Begin
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

End;{destructor}

Function TRecargas.BuscaAtributos : Boolean;
Begin
  dmPrincipal.tbTanque.Open;
  If dmPrincipal.tbTanque.Locate('ID_Tanque', Campos.ID_Tanque, []) Then
  Begin
    Atributos.ID_Tanque := dmPrincipal.tbTanque.FieldByName('ID_Tanque').AsInteger;
    Atributos.Apelido_Tanque := dmPrincipal.tbTanque.FieldByName('Apelido_Tanque').AsString;
    Atributos.Litros_Tanque := dmPrincipal.tbTanque.FieldByName('Litros').AsFloat;
    Atributos.Tipo_Combustivel := dmPrincipal.tbTanque.FieldByName('Tipo_Combustivel').AsString[1];

    dmPrincipal.tbTanque.Close;
    Result := True;
  End Else
  Begin
    dmPrincipal.tbTanque.Close;
    Result := False;
  End;{if}
End;{function}

Function TRecargas.LancarRecarga : Boolean;
var
  R : Boolean;
  Tanque : TTanques;
Begin
  R := False;
  Mensagem := '';

  Try

    If not BuscaAtributos Then
    Begin
      R := False;
      Mensagem := 'Falha ao buscar so dados do tanque de combustível';
    End Else
    Begin
      with dmPrincipal.tbRecarga do
      Begin

        dmPrincipal.FDT.StartTransaction;
        Open;
        Append;
        FieldByName('ID_Tanque').AsInteger := Campos.ID_Tanque;
        FieldByName('LITROS_Recarga').AsFloat := Campos.Litros_Recarga;
        FieldByName('Data_Hora').AsDateTime := DataHora(True);
        Refresh;

        Tanque := TTanques.Create;
        Tanque.Campos.ID_Tanque := Atributos.ID_Tanque;
        Tanque.Campos.Litros := Atributos.Litros_Tanque + Campos.Litros_Recarga;

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

