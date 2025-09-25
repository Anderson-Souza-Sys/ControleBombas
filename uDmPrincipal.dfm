object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 518
  Width = 697
  object FDC: TFDConnection
    Params.Strings = (
      'Port=3050'
      'Protocol=TCPIP'
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\Souza\Documents\Programa\Delphi\ControleBombas' +
        '\CONTROLEDB.FDB'
      'DriverID=IB')
    LoginPrompt = False
    Transaction = FDT
    UpdateTransaction = FDT
    Left = 40
    Top = 24
  end
  object FDT: TFDTransaction
    Connection = FDC
    Left = 88
    Top = 24
  end
  object qryID_Tanque: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      
        'SELECT CAST(GEN_ID(ID_Tanque,1) AS INTEGER) AS Proximo_ID FROM R' +
        'DB$DATABASE')
    Left = 40
    Top = 89
  end
  object qryID_Bomba: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      
        'SELECT CAST(GEN_ID(ID_Bomba,1) AS INTEGER) AS Proximo_ID FROM RD' +
        'B$DATABASE')
    Left = 40
    Top = 145
  end
  object qryTanque: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'select * from Tanques order by Apelido_Tanque')
    Left = 128
    Top = 88
  end
  object qryDataHora: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      
        'SELECT    LPAD( EXTRACT( YEAR FROM CURRENT_TIMESTAMP ), 4, '#39'0'#39' )' +
        ' || '#39' '#39' ||'
      
        '          LPAD( EXTRACT( MONTH FROM CURRENT_TIMESTAMP ), 2, '#39'0'#39' ' +
        ') || '#39' '#39' ||'
      
        '          LPAD( EXTRACT( DAY FROM CURRENT_TIMESTAMP ), 2, '#39'0'#39' ) ' +
        '|| '#39' '#39' ||'
      
        '          LPAD( EXTRACT( HOUR FROM CURRENT_TIMESTAMP ), 2, '#39'0'#39' )' +
        ' ||'#39' '#39' ||'
      
        '          LPAD( EXTRACT( MINUTE FROM CURRENT_TIMESTAMP ), 2, '#39'0'#39 +
        ' ) || '#39' '#39' ||'
      
        '          LPAD( TRUNC( EXTRACT( SECOND FROM CURRENT_TIMESTAMP ) ' +
        '), 2, '#39'0'#39' )'
      'FROM      rdb$database')
    Left = 192
    Top = 25
  end
  object updTanque: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      'update Tanques set APELIDO_TANQUE = :pApelidoTanque, '
      '  TIPO_COMBUSTIVEL = :pTipoCombustivel, LITROS = :pLitros, '
      
        '  Valor_Combustivel = :pValor_Combustivel where ID_TANQUE = :pID' +
        '_Tanque')
    Left = 208
    Top = 89
    ParamData = <
      item
        Name = 'PAPELIDOTANQUE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'PTIPOCOMBUSTIVEL'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'PLITROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PVALOR_COMBUSTIVEL'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PID_TANQUE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object delTanque: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      'delete from Tanques where ID_TANQUE = :pID_Tanque')
    Left = 280
    Top = 89
    ParamData = <
      item
        Name = 'PID_TANQUE'
        ParamType = ptInput
      end>
  end
  object qryBombas: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT '
      '  Bombas.*, '
      '  Tanques.Apelido_Tanque, '
      '  Tanques.Tipo_Combustivel, '
      '  Tanques.Litros,'
      '  Tanques.Valor_Combustivel'
      'FROM Bombas'
      'INNER JOIN Tanques ON Bombas.ID_Tanque = Tanques.ID_Tanque'
      'ORDER BY Apelido_Bomba')
    Left = 128
    Top = 144
  end
  object updBomba: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      
        'update Bombas set APELIDO_Bomba = :pApelidoBomba, ID_Tanque = :p' +
        'ID_Tanque where ID_Bomba = :pID_Bomba')
    Left = 280
    Top = 145
    ParamData = <
      item
        Name = 'PAPELIDOBOMBA'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end
      item
        Name = 'PID_TANQUE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PID_BOMBA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object delBomba: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      'delete from Bombas where ID_Bomba = :pID_Bomba')
    Left = 360
    Top = 145
    ParamData = <
      item
        Name = 'PID_BOMBA'
        ParamType = ptInput
      end>
  end
  object qryGenerica: TFDQuery
    Connection = FDC
    Left = 272
    Top = 24
  end
  object tbAbastecimento: TFDTable
    Connection = FDC
    Transaction = FDT
    UpdateOptions.UpdateTableName = 'LANCAMENTO_ABASTECIMENTO'
    TableName = 'LANCAMENTO_ABASTECIMENTO'
    Left = 40
    Top = 201
  end
  object updLitros: TFDQuery
    Connection = FDC
    Transaction = FDT
    SQL.Strings = (
      
        'update Tanques set LITROS = :pLitros where ID_TANQUE = :pID_Tanq' +
        'ue')
    Left = 360
    Top = 89
    ParamData = <
      item
        Name = 'PLITROS'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Name = 'PID_TANQUE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryBomba: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT '
      '  Bombas.*, '
      '  Tanques.Apelido_Tanque, '
      '  Tanques.Tipo_Combustivel, '
      '  Tanques.Litros,'
      '  Tanques.Valor_Combustivel'
      'FROM Bombas'
      'INNER JOIN Tanques ON Bombas.ID_Tanque = Tanques.ID_Tanque'
      'WHERE Bombas.apelido_bomba = :pApelido_Bomba'
      'ORDER BY Apelido_Bomba'
      '')
    Left = 208
    Top = 144
    ParamData = <
      item
        Name = 'PAPELIDO_BOMBA'
        ParamType = ptInput
      end>
  end
end
