object frmRelatorioAbastecimento: TfrmRelatorioAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Abastecimento'
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
  object rlrAbastecimento: TRLReport
    Left = 8
    Top = 60
    Width = 794
    Height = 1123
    DataSource = dsAbastecimento
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
      object RLLabel1: TRLLabel
        Left = 3
        Top = 3
        Width = 214
        Height = 19
        Caption = 'Relat'#243'rio de Abastecimento'
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
        Left = 606
        Top = 3
        Width = 50
        Height = 18
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 667
        Top = 3
        Width = 137
        Height = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 658
        Top = 3
        Width = 8
        Height = 18
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 25
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 4
        Top = 3
        Width = 74
        Height = 18
        Caption = 'Data Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 287
        Top = 4
        Width = 45
        Height = 18
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 334
        Top = 4
        Width = 105
        Height = 18
        Caption = 'Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 443
        Top = 4
        Width = 46
        Height = 18
        Caption = 'Imp %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 492
        Top = 3
        Width = 100
        Height = 18
        Caption = 'Valor Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 605
        Top = 3
        Width = 104
        Height = 18
        Caption = 'Valor Sem Imp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 164
        Top = 4
        Width = 36
        Height = 18
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 205
        Top = 4
        Width = 66
        Height = 18
        Caption = 'Val. Litro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 108
      Width = 718
      Height = 40
      object RLDBText3: TRLDBText
        Left = 3
        Top = 20
        Width = 82
        Height = 16
        DataField = 'DATA_HORA'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 235
        Top = 20
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'LITROS_ABASTECER'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 342
        Top = 20
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_COBRADO'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 394
        Top = 19
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'IMPOSTO_PERC'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 497
        Top = 20
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_IMPOSTO'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 615
        Top = 19
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_SEM_IMP'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 167
        Top = 19
        Width = 132
        Height = 16
        DataField = 'TIPO_COMBUSTIVEL'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 52
        Top = 3
        Width = 115
        Height = 16
        DataField = 'APELIDO_BOMBA'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 3
        Top = 3
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText9: TRLDBText
        Left = 172
        Top = 19
        Width = 100
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_COBRADO_LITRO'
        DataSource = dsAbastecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 148
      Width = 718
      Height = 28
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult1: TRLDBResult
        Left = 161
        Top = 6
        Width = 174
        Height = 16
        Alignment = taRightJustify
        DataField = 'LITROS_ABASTECER'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 282
        Top = 6
        Width = 159
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_COBRADO'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult4: TRLDBResult
        Left = 444
        Top = 6
        Width = 153
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_IMPOSTO'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult5: TRLDBResult
        Left = 562
        Top = 6
        Width = 153
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_SEM_IMP'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
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
  object qryAbastecimento: TFDQuery
    Connection = dmPrincipal.FDC
    SQL.Strings = (
      
        'select LANCAMENTO_ABASTECIMENTO.litros_abastecer, LANCAMENTO_ABA' +
        'STECIMENTO.valor_cobrado AS valor_cobrado_litro,'
      
        '  (LANCAMENTO_ABASTECIMENTO.valor_cobrado * LANCAMENTO_ABASTECIM' +
        'ENTO.litros_abastecer) AS valor_cobrado,'
      ''
      
        '  (LANCAMENTO_ABASTECIMENTO.valor_cobrado * LANCAMENTO_ABASTECIM' +
        'ENTO.litros_abastecer) *(lancamento_abastecimento.imposto_perc /' +
        '100) as Valor_Imposto,'
      
        '  (LANCAMENTO_ABASTECIMENTO.valor_cobrado * LANCAMENTO_ABASTECIM' +
        'ENTO.litros_abastecer) - (LANCAMENTO_ABASTECIMENTO.valor_cobrado' +
        ' *(lancamento_abastecimento.imposto_perc /100)) as Valor_Sem_Imp' +
        ','
      
        '  LANCAMENTO_ABASTECIMENTO.imposto_perc, LANCAMENTO_ABASTECIMENT' +
        'O.litros_abastecer, LANCAMENTO_ABASTECIMENTO.data_hora,'
      ''
      '  Bombas.apelido_bomba,  Tanques.apelido_tanque,'
      '  Tanques.Tipo_combustivel'
      'from LANCAMENTO_ABASTECIMENTO, Bombas, Tanques'
      
        'where lancamento_abastecimento.data_hora >= :pData_Inicial and l' +
        'ancamento_abastecimento.data_hora < :pData_Final and'
      '  LANCAMENTO_ABASTECIMENTO.ID_BOMBA = Bombas.ID_Bomba and'
      '  Bombas.id_Tanque = Tanques.id_tanque'
      
        'order by Bombas.apelido_bomba, lancamento_abastecimento.data_hor' +
        'a')
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
    object qryAbastecimentoLITROS_ABASTECER: TFloatField
      FieldName = 'LITROS_ABASTECER'
      Origin = 'LITROS_ABASTECER'
      Required = True
      DisplayFormat = '###,###,##0.000'
    end
    object qryAbastecimentoVALOR_COBRADO: TFloatField
      FieldName = 'VALOR_COBRADO'
      Origin = 'VALOR_COBRADO'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object qryAbastecimentoIMPOSTO_PERC: TFloatField
      FieldName = 'IMPOSTO_PERC'
      Origin = 'IMPOSTO_PERC'
      Required = True
      DisplayFormat = '##0.0 %'
    end
    object qryAbastecimentoDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      Required = True
    end
    object qryAbastecimentoVALOR_IMPOSTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object qryAbastecimentoVALOR_SEM_IMP: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_SEM_IMP'
      Origin = 'VALOR_SEM_IMP'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'R$  ###,###,##0.00'
    end
    object qryAbastecimentoAPELIDO_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APELIDO_BOMBA'
      Origin = 'APELIDO_BOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryAbastecimentoTIPO_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_COMBUSTIVEL'
      Origin = 'TIPO_COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryAbastecimentoAPELIDO_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APELIDO_TANQUE'
      Origin = 'APELIDO_TANQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryAbastecimentoVALOR_COBRADO_LITRO: TFloatField
      FieldName = 'VALOR_COBRADO_LITRO'
      Origin = 'VALOR_COBRADO'
      Required = True
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 840
    Top = 88
  end
end
