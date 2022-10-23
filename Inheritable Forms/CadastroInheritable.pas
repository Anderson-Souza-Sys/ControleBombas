unit CadastroInheritable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseInheritable, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmCadastroInheritable = class(TfrmbaseInheritable)
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroInheritable: TfrmCadastroInheritable;

implementation

{$R *.dfm}

procedure TfrmCadastroInheritable.btnEditarClick(Sender: TObject);
begin
  inherited;
  btnExcluir.Enabled := False;
  btnNovo.Enabled := False;
end;

procedure TfrmCadastroInheritable.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadastroInheritable.btnGravarClick(Sender: TObject);
begin
  inherited;

  btnNovo.Enabled := True;
  btnExcluir.Enabled := True;
end;

procedure TfrmCadastroInheritable.btnNovoClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  btnExcluir.Enabled := False;

  For i:= 0 to ComponentCount -1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Text := ''{}
    else
    if Components[i] is TMaskEdit then
      TMaskEdit(Components[i]).Text := ''{}
    else
    if Components[i] is TComboBox then
      TComboBox(Components[i]).Text := ''{}
    else
    if Components[i] is TMemo then
      TMemo(Components[i]).Text := ''{}
    else
    if Components[i] is TCheckbox then
      TCheckbox(Components[i]).Checked := False{}
    else
    if Components[i] is TRadioGroup then
      TRadioGroup(Components[i]).ItemIndex := -1;
  end;

end;

end.
