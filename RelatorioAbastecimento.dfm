object frmRelatorioAbastecimento: TfrmRelatorioAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Abastecimento'
  ClientHeight = 574
  ClientWidth = 1123
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
    Left = 153
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
  object Label1: TLabel
    Left = 327
    Top = 8
    Width = 43
    Height = 16
    Caption = 'Bomba'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rlrAbastecimento: TRLReport
    Left = 8
    Top = 126
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    Visible = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 65
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 0
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
        Transparent = False
      end
      object rlblPeriodo: TRLLabel
        Left = 0
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
        Transparent = False
        BeforePrint = rlblPeriodoBeforePrint
      end
      object rlblDataHora: TRLLabel
        Left = 617
        Top = 22
        Width = 100
        Height = 19
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        BeforePrint = rlblDataHoraBeforePrint
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 377
        Top = 3
        Width = 112
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
        Transparent = False
        BeforePrint = RLSystemInfo1BeforePrint
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 603
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
        Transparent = False
        BeforePrint = RLSystemInfo2BeforePrint
      end
      object rlblBomba: TRLLabel
        Left = 0
        Top = 43
        Width = 83
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        BeforePrint = rlblBombaBeforePrint
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 28
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Transparent = False
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
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 0
        Top = 6
        Width = 109
        Height = 18
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
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
        Transparent = False
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
        Transparent = False
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
        Transparent = False
      end
    end
    object RLGroupAgrupador: TRLGroup
      Left = 38
      Top = 103
      Width = 718
      Height = 98
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      DataFields = 'APELIDO_BOMBA'
      Degrade.Direction = ddHorizontal
      Degrade.OppositeColor = clWhite
      Degrade.Granularity = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      object RLBand3: TRLBand
        Left = 0
        Top = 50
        Width = 718
        Height = 23
        Transparent = False
        object RLDBText3: TRLDBText
          Left = 0
          Top = 3
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
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 235
          Top = 3
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
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 394
          Top = 3
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
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 497
          Top = 3
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
          Transparent = False
        end
        object RLDBText8: TRLDBText
          Left = 616
          Top = 3
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
          Transparent = False
        end
        object RLDBText9: TRLDBText
          Left = 171
          Top = 3
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
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 339
          Top = 3
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
          Transparent = False
        end
        object RLDBText10: TRLDBText
          Left = 144
          Top = 3
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
          Transparent = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 1
        Width = 718
        Height = 24
        BandType = btHeader
        object RLDB_ApelidoBomba: TRLDBText
          Left = 0
          Top = 3
          Width = 133
          Height = 18
          DataField = 'APELIDO_BOMBA'
          DataSource = dsAbastecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = RLDB_ApelidoBombaBeforePrint
        end
        object RLDB_Data: TRLDBText
          Left = 0
          Top = 3
          Width = 43
          Height = 18
          DataField = 'DATA'
          DataSource = dsAbastecimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = RLDB_DataBeforePrint
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 73
        Width = 718
        Height = 24
        BandType = btColumnFooter
        object RLDBResult3: TRLDBResult
          Left = 564
          Top = 4
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
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 532
          Top = 4
          Width = 65
          Height = 16
          Caption = 'Sub Total'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 25
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Transparent = False
        object RLLabel2: TRLLabel
          Left = 0
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
          Transparent = False
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
          Transparent = False
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
          Transparent = False
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
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 497
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
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 613
          Top = 3
          Width = 104
          Height = 18
          Alignment = taRightJustify
          Caption = 'Valor Sem Imp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
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
          Transparent = False
        end
        object RLLabel10: TRLLabel
          Left = 140
          Top = 3
          Width = 36
          Height = 18
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
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
    Left = 189
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
    Left = 530
    Top = 88
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
    Left = 623
    Top = 88
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
  object rgAgrupar: TRadioGroup
    Left = 8
    Top = 63
    Width = 510
    Height = 57
    Caption = '  Agrupar por  '
    Columns = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Nome Bomba'
      'Por Data')
    ParentFont = False
    TabOrder = 5
  end
  object cmbApelidoBomba: TComboBox
    Left = 327
    Top = 30
    Width = 381
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'cmbApelidoBomba'
  end
  object qryAbastecimento: TFDQuery
    Connection = dmPrincipal.FDC
    SQL.Strings = (
      
        'select LANCAMENTO_ABASTECIMENTO.litros_abastecer, LANCAMENTO_ABA' +
        'STECIMENTO.valor_cobrado AS valor_cobrado_litro,'
      
        '  (LANCAMENTO_ABASTECIMENTO.valor_cobrado * LANCAMENTO_ABASTECIM' +
        'ENTO.litros_abastecer) AS valor_cobrado,'
      '  cast(LANCAMENTO_ABASTECIMENTO.data_hora as date) as DATA,'
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
      '  Bombas.id_Tanque = Tanques.id_tanque and '
      '  Tanques.apelido_tanque like :pTanque'
      
        'order by Bombas.apelido_bomba, lancamento_abastecimento.data_hor' +
        'a')
    Left = 848
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
      end
      item
        Name = 'PTANQUE'
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
    object qryAbastecimentoDATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 848
    Top = 88
  end
end
