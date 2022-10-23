unit RelatorioAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, classBomba, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRelatorioAbastecimento = class(TForm)
    rlrAbastecimento: TRLReport;
    qryAbastecimento: TFDQuery;
    Label2: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    btnGerarRelatorio: TBitBtn;
    dsAbastecimento: TDataSource;
    qryAbastecimentoLITROS_ABASTECER: TFloatField;
    qryAbastecimentoVALOR_COBRADO: TFloatField;
    qryAbastecimentoIMPOSTO_PERC: TFloatField;
    qryAbastecimentoDATA_HORA: TSQLTimeStampField;
    qryAbastecimentoVALOR_IMPOSTO: TFloatField;
    qryAbastecimentoVALOR_SEM_IMP: TFloatField;
    qryAbastecimentoAPELIDO_BOMBA: TStringField;
    qryAbastecimentoTIPO_COMBUSTIVEL: TStringField;
    qryAbastecimentoAPELIDO_TANQUE: TStringField;
    btnFechar: TBitBtn;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    rlblPeriodo: TRLLabel;
    rlblDataHora: TRLLabel;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel9: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel10: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBText2: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    qryAbastecimentoVALOR_COBRADO_LITRO: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure rlblPeriodoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure rlblDataHoraBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioAbastecimento: TfrmRelatorioAbastecimento;
  Bomba : TBombas;
  dInicial, dFinal : TDateTime;

implementation

{$R *.dfm}

uses uDmPrincipal, uGlobal;

procedure TfrmRelatorioAbastecimento.btnFecharClick(Sender: TObject);
begin
  Close;
end;{procedure}

procedure TfrmRelatorioAbastecimento.btnGerarRelatorioClick(Sender: TObject);
begin
  dInicial := StrToDate(DateToStr(dtpInicial.Date));
  dFinal := StrToDate(DateToStr(dtpFinal.Date));
  DataHora(True);

  if qryAbastecimento.Active then
    qryAbastecimento.Close;{if}

  qryAbastecimento.ParamByName('pData_Inicial').AsDate := dInicial;
  qryAbastecimento.ParamByName('pData_Final').AsDate := dFinal+1;

  qryAbastecimento.Open;

  If qryAbastecimento.RecordCount < 1 then
  Begin
    qryAbastecimento.Close;
    Alerta('Nenhum dado a exibir!');
    Abort;
  End;{if}

  rlrAbastecimento.Preview;
end;{procedure}

procedure TfrmRelatorioAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryAbastecimento.Active then
    qryAbastecimento.Close;{if}

  Action := caFree;
  frmRelatorioAbastecimento := nil;
end;{procedure}

procedure TfrmRelatorioAbastecimento.FormShow(Sender: TObject);
begin
  dtpInicial.DateTime := DataHora(True);
  dtpFinal.DateTime := DataHora;

  frmRelatorioAbastecimento.Width := btnFechar.Left + btnFechar.Width + 20;
  frmRelatorioAbastecimento.Height := btnFechar.Top + btnFechar.Height + 40;
end;{procedure}

procedure TfrmRelatorioAbastecimento.rlblDataHoraBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := DateTimeToStr(DataHora);
end;{procedure}

procedure TfrmRelatorioAbastecimento.rlblPeriodoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := DateToStr(dInicial) +'  at�  '+ DateToStr(dFinal);
end;{procedure}

end.
