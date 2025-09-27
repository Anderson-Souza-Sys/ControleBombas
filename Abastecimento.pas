unit Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, classBomba;

type
  TfrmAbastecimento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblTipoCombustivel: TLabel;
    cmbApelidoBomba: TComboBox;
    edtLitros: TEdit;
    btnAbastecer: TBitBtn;
    btnFechar: TBitBtn;
    Label4: TLabel;
    lblValorCombustivel: TLabel;
    Label5: TLabel;
    lblValorTotal: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cmbApelidoBombaSelect(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAbastecerClick(Sender: TObject);
  private
    { Private declarations }
    Bomba : TBombas;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses uGlobal, classAbastecimento;

procedure TfrmAbastecimento.btnAbastecerClick(Sender: TObject);
var
  Abastecimento : TAbastecimentos;
begin
  edtLitrosExit(Sender);

  if Trim(cmbApelidoBomba.Text) = '' Then
  Begin
    Erro('Informe uma bomba de combustível.');
    Exit;
  End;{if}

  if not Pergunta('Confirma o abastecimento?')  then
    Exit;{if}

  Abastecimento := TAbastecimentos.Create;

  Try
    try
      Abastecimento.Campos.ID_Bomba := Bomba.Campos.ID_Bomba;
      Abastecimento.Campos.Litros_Abastecer := TextoParaValor(edtLitros.Text);

      If not Abastecimento.LancarBastecimento Then
        Erro(Abastecimento.Mensagem);{if}

      cmbApelidoBomba.SetFocus;
      edtLitros.Text := '0,000';
      lblValorTotal.Caption := '0,00';
    Except on E: Exception do
      Erro('Falha no Abastecimento '+sLineBreak+E.Message);
    End;{try}
  Finally
    FreeAndNil(Abastecimento);
  End;
end;{procedure}

procedure TfrmAbastecimento.btnFecharClick(Sender: TObject);
begin
  Close;
end;{procedure}

procedure TfrmAbastecimento.cmbApelidoBombaSelect(Sender: TObject);
begin
  if (Trim(cmbApelidoBomba.Text) <> '') and (not Bomba.Localizar(cmbApelidoBomba.Text)) Then
    Erro(Bomba.Mensagem);{if}

  cmbApelidoBomba.Text := Bomba.Campos.Apelido_Bomba;
  lblTipoCombustivel.Caption := Bomba.Atributos.Tipo_Combustivel;
  lblValorCombustivel.Caption := FloatToStrF(Bomba.Atributos.Valor_Combustivel, ffNumber, 10, 2);
end;{procedure}

procedure TfrmAbastecimento.edtLitrosExit(Sender: TObject);
var
  v1, v2 :  double;
  s : string;
  valores : Array[1..2] of String;
begin
  edtLitros.Text := FormataValor(edtLitros.Text, 3);
  cmbApelidoBombaSelect(Sender);
  Application.ProcessMessages;

  lblValorTotal.Caption := MultiplicaDoisValoresStr([edtLitros.Text, lblValorCombustivel.Caption], 2, True);
end;{procedure}

procedure TfrmAbastecimento.edtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  KeyValor(Key, edtLitros);
end;{procedure}

procedure TfrmAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Bomba);

  Action := caFree;
  frmAbastecimento := nil;
end;{procedure}

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  frmAbastecimento.Top := 100;
  frmAbastecimento.Left := (Screen.Width - frmAbastecimento.Width) div 2;

  edtLitros.Text := '0,000';
  lblValorCombustivel.Caption := '0,00';
  lblValorTotal.Caption := '0,00';
  lblTipoCombustivel.Caption := '';

  Bomba := TBombas.Create;
  Bomba.AlimentaListaCombo(cmbApelidoBomba);

  cmbApelidoBomba.ItemIndex := 0;
  cmbApelidoBombaSelect(Sender);
end;{procedure}

end.
