object Form1: TForm1
  Left = 259
  Top = 112
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1083#1072#1081#1085
  ClientHeight = 648
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 815
    Height = 648
    Align = alClient
    AutoSize = True
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 25
    Height = 17
    Hint = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1090#1086#1095#1082#1072
    Brush.Color = clRed
    ParentShowHint = False
    Shape = stSquare
    ShowHint = True
    OnMouseDown = Shape1MouseDown
  end
  object Shape2: TShape
    Left = 718
    Top = 506
    Width = 25
    Height = 17
    Hint = #1050#1086#1085#1077#1095#1085#1072#1103' '#1090#1086#1095#1082#1072
    Brush.Color = clPurple
    ParentShowHint = False
    Shape = stSquare
    ShowHint = True
    OnMouseDown = Shape2MouseDown
  end
  object Shape3: TShape
    Left = 176
    Top = 128
    Width = 25
    Height = 17
    Hint = #1058#1086#1095#1082#1072' 1'
    Brush.Color = clBlue
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape3MouseDown
  end
  object Shape4: TShape
    Left = 392
    Top = 304
    Width = 25
    Height = 17
    Hint = #1058#1086#1095#1082#1072' 2'
    Brush.Color = clBlue
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape4MouseDown
  end
end
