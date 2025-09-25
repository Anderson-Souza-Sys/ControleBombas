unit RecargaTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroInheritable, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Vcl.Grids, Vcl.DBGrids, classTanque, classRecarga;

type
  TfrmRecargaTanque = class(TfrmCadastroInheritable)
    Label1: TLabel;
    Label2: TLabel;
    cmbApelidoTanque: TComboBox;
    lblTipoCombustivel: TLabel;
    Label3: TLabel;
    lblLitros: TLabel;
    edtLitrosIncluir: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cmbApelidoTanqueSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLitrosIncluirKeyPress(Sender: TObject; var Key: Char);
    procedure edtLitrosIncluirExit(Sender: TObject);
  private
    { Private declarations }
    Tanque : TTanques;
    Recarga : TRecargas;
    novo : boolean;
  public
    { Public declarations }
  end;

var
  frmRecargaTanque: TfrmRecargaTanque;

implementation

{$R *.dfm}

uses uDmPrincipal, uGlobal;

procedure TfrmRecargaTanque.btnGravarClick(Sender: TObject);
begin
  inherited;
  edtLitrosIncluirExit(Sender);

  If not Pergunta('Deseja incluir esta recarga a bomba?') then
    Exit;{if}

  Recarga := TRecargas.Create;

  Recarga.Campos.ID_Tanque := Tanque.Campos.ID_Tanque;
  Recarga.Campos.Litros_Recarga := TextoParaValor(edtLitrosIncluir.Text);

  If not Recarga.LancarRecarga Then
    Erro(Recarga.Mensagem);{if}

  Recarga.Destroy;

  edtLitrosIncluir.Text := '0,000';
  cmbApelidoTanqueSelect(Sender);
  edtLitrosIncluir.SetFocus;
end;{procedure}

procedure TfrmRecargaTanque.cmbApelidoTanqueSelect(Sender: TObject);
begin
  inherited;
  if not novo then
  Begin
    if (Trim(cmbApelidoTanque.Text) <> '') and (not Tanque.Localizar(cmbApelidoTanque.Text)) Then
      Erro(Tanque.Mensagem);{if}

    cmbApelidoTanque.Text := Tanque.Campos.Apelido_Tanque;
    lblTipoCombustivel.Caption := Tanque.Campos.Tipo_Combustivel;
    lblLitros.Caption := FloatToStrF(Tanque.Campos.Litros, ffNumber, 10, 3);
  End;{if}
end;{procedure}

procedure TfrmRecargaTanque.edtLitrosIncluirExit(Sender: TObject);
begin
  inherited;
  edtLitrosIncluir.Text := FormataValor(edtLitrosIncluir.Text, 3);
end;{procedure}

procedure TfrmRecargaTanque.edtLitrosIncluirKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  KeyValor(Key);
end;{procedure}

procedure TfrmRecargaTanque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Tanque);

  Action := caFree;
  frmRecargaTanque := nil;
end;{procedure}

procedure TfrmRecargaTanque.FormShow(Sender: TObject);
begin
  inherited;
  novo := false;
  Tanque := TTanques.Create;

  Tanque.AlimentaListaCombo(cmbApelidoTanque);
  cmbApelidoTanque.ItemIndex := 0;
  cmbApelidoTanqueSelect(Sender);
  cmbApelidoTanque.SetFocus;
end;{procedure}

end.
