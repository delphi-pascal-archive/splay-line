unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Shape3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MaxPoint=4; // 4 точки на одну сплайн-линию!
var
  Form1: TForm1;

implementation

uses Math;

{$R *.dfm}

procedure DrawSpline;
var
 m:array[0..3] of TPoint;
begin
  with Form1 do begin
       // начальная точка
       m[0].X:=Shape1.Left+(Shape1.Width div 2);
       m[0].Y:=Shape1.Top+(Shape1.Height div 2);
       // конечная точка
       m[3].X:=Shape2.Left+(Shape2.Width div 2);
       m[3].Y:=Shape2.Top+(Shape2.Height div 2);
       // первая
       m[1].X:=Shape3.Left+(Shape3.Width div 2);
       m[1].Y:=Shape3.Top+(Shape3.Height div 2);
       // вторая
       m[2].X:=Shape4.Left+(Shape4.Width div 2);
       m[2].Y:=Shape4.Top+(Shape4.Height div 2);
       Image1.Canvas.Brush.Color:=clWhite;
       Image1.Canvas.FillRect(Image1.ClientRect);
       Image1.Canvas.Pen.Width:=2;
       Image1.Canvas.Pen.Color:=clBlack;
       Image1.Canvas.PolyBezier(m);
       //
       Image1.Canvas.Pen.Width:=0;
       Image1.Canvas.Pen.Color:=clRed;
       Image1.Canvas.MoveTo(m[0].X,m[0].Y);
       Image1.Canvas.LineTo(m[1].X,m[1].Y);
       Image1.Canvas.LineTo(m[2].X,m[2].Y);
       Image1.Canvas.LineTo(m[3].X,m[3].Y);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 m:array [0..MaxPoint] of TPoint;
 i,jx,jy:Integer;
begin
  Randomize;

  for i:=0 to MaxPoint-1 do begin
     jx:=RandomRange(0,Form1.Width);
     jy:=RandomRange(0,Form1.Height);
     m[i].X:=jx;
     m[i].Y:=jy;
  end;
  Form1.Canvas.PolyBezier(Slice(m, MaxPoint));
  // ставим точки для приличия //
    // Начальная
  jx:=m[0].X;
  jy:=m[0].Y;
  Form1.Canvas.Rectangle(jx-2,jy-2,jx+2,jy+2);
    // Конечная
  jx:=m[MaxPoint-1].X;
  jy:=m[MaxPoint-1].Y;
  Form1.Canvas.Rectangle(jx-2,jy-2,jx+2,jy+2);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DrawSpline;
  Shape3.Tag:=0; // флаг фокуса
  Shape4.Tag:=0; // флаг фокуса
end;

procedure TForm1.Shape3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCaptureControl(Image1);
  Shape3.Tag:=1;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      if Shape3.Tag=1 then begin
         Shape3.Left:=X-(Shape3.Width div 2);
         Shape3.Top:=Y-(Shape3.Height div 2);
         DrawSpline;
      end else if Shape4.Tag=1 then begin
         Shape4.Left:=X-(Shape4.Width div 2);
         Shape4.Top:=Y-(Shape4.Height div 2);
         DrawSpline;
      end else if Shape1.Tag=1 then begin
         Shape1.Left:=X-(Shape1.Width div 2);
         Shape1.Top:=Y-(Shape1.Height div 2);
         DrawSpline;
      end else if Shape2.Tag=1 then begin
         Shape2.Left:=X-(Shape2.Width div 2);
         Shape2.Top:=Y-(Shape2.Height div 2);
         DrawSpline;
      end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Shape1.Tag:=0;
  Shape2.Tag:=0;
  Shape3.Tag:=0;
  Shape4.Tag:=0;
end;

procedure TForm1.Shape4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCaptureControl(Image1);
  Shape4.Tag:=1;
end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCaptureControl(Image1);
  Shape1.Tag:=1;
end;

procedure TForm1.Shape2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCaptureControl(Image1);
  Shape2.Tag:=1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Form1.DoubleBuffered:=true;
end;

end.
