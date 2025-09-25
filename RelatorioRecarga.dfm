object frmRelatorioRecarga: TfrmRelatorioRecarga
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Recarga'
  ClientHeight = 574
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 9
    Top = 8
    Width = 129
    Height = 16
    Caption = 'Per'#237'odo do relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 145
    Top = 33
    Width = 22
    Height = 16
    Caption = 'at'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rlrRecarga: TRLReport
    Left = 8
    Top = 60
    Width = 794
    Height = 1123
    DataSource = dsRecarga
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Visible = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel1: TRLLabel
        Left = 3
        Top = 3
        Width = 214
        Height = 19
        Caption = 'Relat'#243'rio de Recarga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlblPeriodo: TRLLabel
        Left = 3
        Top = 23
        Width = 324
        Height = 19
        Caption = 'Per'#237'do de DD/MM/AAAA  at'#233'  DD/MM/AAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = rlblPeriodoBeforePrint
      end
      object rlblDataHora: TRLLabel
        Left = 560
        Top = 23
        Width = 100
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = rlblDataHoraBeforePrint
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 344
        Top = 3
        Width = 137
        Height = 18
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
        BeforePrint = RLSystemInfo1BeforePrint
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 604
        Top = 3
        Width = 114
        Height = 19
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = itPageNumber
        ParentFont = False
        Text = ''
        BeforePrint = RLSystemInfo2BeforePrint
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 26
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel3: TRLLabel
        Left = 419
        Top = 4
        Width = 62
        Height = 14
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 4
        Top = 4
        Width = 80
        Height = 14
        Caption = 'Data Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 200
        Top = 5
        Width = 48
        Height = 14
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 332
        Top = 4
        Width = 44
        Height = 14
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 378
        Top = 4
        Width = 38
        Height = 14
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 109
      Width = 718
      Height = 26
      object RLDBText3: TRLDBText
        Left = 3
        Top = 3
        Width = 92
        Height = 17
        DataField = 'DATA_HORA'
        DataSource = dsRecarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 153
        Top = 3
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'LITROS_RECARGA'
        DataSource = dsRecarga
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 279
        Top = 3
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_COMBUSTIVEL'
        DataSource = dsRecarga
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 380
        Top = 3
        Width = 161
        Height = 18
        DataField = 'TIPO_COMBUSTIVEL'
        DataSource = dsRecarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 419
        Top = 3
        Width = 147
        Height = 18
        DataField = 'APELIDO_TANQUE'
        DataSource = dsRecarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 135
      Width = 718
      Height = 30
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLDBResult1: TRLDBResult
        Left = 45
        Top = 6
        Width = 210
        Height = 18
        Alignment = taRightJustify
        DataField = 'LITROS_RECARGA'
        DataSource = dsRecarga
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 3
        Top = 6
        Width = 54
        Height = 18
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 139
        Top = 6
        Width = 240
        Height = 18
        Alignment = taRightJustify
        DataField = 'VALOR_COMBUSTIVEL'
        DataSource = dsRecarga
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
  end
  object dtpInicial: TDateTimePicker
    Left = 9
    Top = 30
    Width = 128
    Height = 24
    Date = 44856.954150185190000000
    Time = 44856.954150185190000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object dtpFinal: TDateTimePicker
    Left = 173
    Top = 30
    Width = 128
    Height = 24
    Date = 44856.954150185190000000
    Time = 44856.954150185190000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object btnGerarRelatorio: TBitBtn
    Left = 317
    Top = 24
    Width = 85
    Height = 30
    Caption = 'Gerar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = btnGerarRelatorioClick
  end
  object btnFechar: TBitBtn
    Left = 423
    Top = 24
    Width = 85
    Height = 30
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object qryRecarga: TFDQuery
    Connection = dmPrincipal.FDC
    SQL.Strings = (
      'select LANCAMENTO_Recarga.*,'
      ''
      
        '  Tanques.apelido_tanque, Tanques.Tipo_combustivel, Tanques.Valo' +
        'r_Combustivel'
      'from LANCAMENTO_Recarga, Tanques'
      
        'where lancamento_Recarga.data_hora >= :pData_Inicial and lancame' +
        'nto_Recarga.data_hora < :pData_Final and'
      '  LANCAMENTO_Recarga.id_tanque = Tanques.id_tanque'
      'order by Tanques.apelido_tanque, lancamento_Recarga.data_hora')
    Left = 840
    Top = 24
    ParamData = <
      item
        Name = 'PDATA_INICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PDATA_FINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end>
    object qryRecargaDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object qryRecargaLITROS_RECARGA: TFloatField
      FieldName = 'LITROS_RECARGA'
      Origin = 'LITROS_RECARGA'
      Required = True
      DisplayFormat = '###,###,##0.000'
    end
    object qryRecargaAPELIDO_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APELIDO_TANQUE'
      Origin = 'APELIDO_TANQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryRecargaTIPO_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_COMBUSTIVEL'
      Origin = 'TIPO_COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryRecargaVALOR_COMBUSTIVEL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_COMBUSTIVEL'
      Origin = 'VALOR_COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'R$ ###,###,##0.00'
    end
  end
  object dsRecarga: TDataSource
    DataSet = qryRecarga
    Left = 840
    Top = 88
  end
end
