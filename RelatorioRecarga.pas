unit RelatorioRecarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, classBomba, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRelatorioRecarga = class(TForm)
    rlrRecarga: TRLReport;
    qryRecarga: TFDQuery;
    Label2: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    Label3: TLabel;
    btnGerarRelatorio: TBitBtn;
    dsRecarga: TDataSource;
    btnFechar: TBitBtn;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    rlblPeriodo: TRLLabel;
    rlblDataHora: TRLLabel;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel9: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLDBResult2: TRLDBResult;
    qryRecargaDATA_HORA: TSQLTimeStampField;
    qryRecargaAPELIDO_TANQUE: TStringField;
    qryRecargaTIPO_COMBUSTIVEL: TStringField;
    qryRecargaVALOR_COMBUSTIVEL: TFloatField;
    qryRecargaLITROS_RECARGA: TFloatField;
    RLDBText2: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure rlblPeriodoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure rlblDataHoraBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure RLSystemInfo1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLSystemInfo2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioRecarga: TfrmRelatorioRecarga;
  dInicial, dFinal : TDateTime;
  ultimaPagina : string;

implementation

{$R *.dfm}

uses uDmPrincipal, uGlobal;

procedure TfrmRelatorioRecarga.btnFecharClick(Sender: TObject);
begin
  Close;
end;{procedure}

procedure TfrmRelatorioRecarga.btnGerarRelatorioClick(Sender: TObject);
begin
  dInicial := StrToDate(DateToStr(dtpInicial.Date));
  dFinal := StrToDate(DateToStr(dtpFinal.Date));
  DataHora(True);

  if qryRecarga.Active then
    qryRecarga.Close;{if}

  qryRecarga.ParamByName('pData_Inicial').AsDate := dInicial;
  qryRecarga.ParamByName('pData_Final').AsDate := dFinal+1;

  qryRecarga.Open;

  If qryRecarga.RecordCount < 1 then
  Begin
    qryRecarga.Close;
    Alerta('Nenhum dado a exibir!');
    Exit;
  End;{if}

  rlrRecarga.Preview;
end;{procedure}

procedure TfrmRelatorioRecarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryRecarga.Active then
    qryRecarga.Close;{if}

  Action := caFree;
  frmRelatorioRecarga := nil;
end;{procedure}

procedure TfrmRelatorioRecarga.FormShow(Sender: TObject);
begin
  dtpInicial.DateTime := DataHora(True);
  dtpFinal.DateTime := DataHora;

  frmRelatorioRecarga.Width := btnFechar.Left + btnFechar.Width + 20;
  frmRelatorioRecarga.Height := btnFechar.Top + btnFechar.Height + 40;
end;{procedure}

procedure TfrmRelatorioRecarga.rlblDataHoraBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := DateTimeToStr(DataHora);
end;{procedure}

procedure TfrmRelatorioRecarga.rlblPeriodoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Período de  '+DateToStr(dInicial) +'  até  '+ DateToStr(dFinal);
end;{procedure}

procedure TfrmRelatorioRecarga.RLSystemInfo1BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  ultimaPagina := AText;
  PrintIt := False;
end;{procedure}

procedure TfrmRelatorioRecarga.RLSystemInfo2BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Página  '+AText+'  /  '+ultimaPagina;
end;{procedure}

end.
