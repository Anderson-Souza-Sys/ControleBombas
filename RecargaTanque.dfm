inherited frmRecargaTanque: TfrmRecargaTanque
  Caption = 'Recarga de Tanque'
  OnShow = FormShow
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 16
    Top = 16
    Width = 127
    Height = 18
    Caption = 'Tanque (apelido)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 98
    Width = 128
    Height = 18
    Caption = 'Tipo Combust'#237'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTipoCombustivel: TLabel [2]
    Left = 16
    Top = 123
    Width = 118
    Height = 18
    Caption = 'lblTipoCombustivel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 184
    Top = 98
    Width = 124
    Height = 18
    Caption = 'Litros no Tanque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLitros: TLabel [4]
    Left = 184
    Top = 123
    Width = 46
    Height = 18
    Caption = 'lblLitros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [5]
    Left = 16
    Top = 162
    Width = 109
    Height = 18
    Caption = 'Litros a incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    inherited btnNovo: TBitBtn
      Visible = False
    end
    inherited btnGravar: TBitBtn
      Width = 100
      Caption = '&Incluir Litros'
      ExplicitWidth = 100
    end
    inherited btnExcluir: TBitBtn
      Left = 210
      Visible = False
      ExplicitLeft = 210
    end
    inherited btnFechar: TBitBtn
      Left = 306
      ExplicitLeft = 306
    end
  end
  object cmbApelidoTanque: TComboBox
    Left = 16
    Top = 38
    Width = 337
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'cmbApelidoTanque'
    OnSelect = cmbApelidoTanqueSelect
  end
  object edtLitrosIncluir: TEdit
    Left = 16
    Top = 192
    Width = 121
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '0,000'
    OnExit = edtLitrosIncluirExit
    OnKeyPress = edtLitrosIncluirKeyPress
  end
end
