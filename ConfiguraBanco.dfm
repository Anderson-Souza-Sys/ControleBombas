object frmConfiguraBanco: TfrmConfiguraBanco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configure o Acesso ao Banco de Dados'
  ClientHeight = 285
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 147
    Width = 54
    Height = 16
    Caption = 'Caminho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIP: TLabel
    Left = 16
    Top = 99
    Width = 76
    Height = 16
    Caption = 'IP/Servidor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPorta: TLabel
    Left = 240
    Top = 99
    Width = 36
    Height = 16
    Caption = 'Porta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUsuario: TLabel
    Left = 16
    Top = 196
    Width = 48
    Height = 16
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSenha: TLabel
    Left = 172
    Top = 196
    Width = 40
    Height = 16
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 242
    Height = 19
    Caption = 'Banco de dados Firebird/Interbase'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnTree: TBitBtn
    Left = 298
    Top = 165
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
      B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
      B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
      0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
      55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
      55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
      55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
      5555575FFF755555555557000075555555555577775555555555}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnTreeClick
  end
  object rgTipoConexao: TRadioGroup
    Left = 16
    Top = 34
    Width = 306
    Height = 52
    Caption = '  Tipo Conex'#227'o  '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'TCP/IP'
      'Local')
    ParentFont = False
    TabOrder = 7
    OnClick = rgTipoConexaoClick
  end
  object edtCaminho: TEdit
    Left = 16
    Top = 166
    Width = 276
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtUsuario: TEdit
    Left = 16
    Top = 214
    Width = 150
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtSenha: TEdit
    Left = 172
    Top = 214
    Width = 150
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 4
  end
  object edtIP: TEdit
    Left = 16
    Top = 117
    Width = 210
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 247
    Top = 249
    Width = 75
    Height = 25
    Caption = 'OK'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOkClick
  end
  object edtPorta: TMaskEdit
    Left = 240
    Top = 117
    Width = 82
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 1
    Text = ''
  end
  object FileOpenDialog1: TFileOpenDialog
    DefaultExtension = '*.GDB;*.FDB'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Firebird'
        FileMask = '*.fdb'
      end
      item
        DisplayName = 'Interbase'
        FileMask = '*.gdb'
      end
      item
        DisplayName = 'Todos'
        FileMask = '*.*'
      end>
    Options = []
    Left = 272
    Top = 48
  end
end
