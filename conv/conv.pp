program conv;

uses
  Classes,
  Interfaces,
  SysUtils,
  FPImage,
  FPCanvas,
  FPImgCanv,
  FPWritePNG,
  FPReadPNG, Unit1;

var
  w: integer;
  h: integer;
  filename: string;
  w_str: string;
  h_str: string;
  CanvasScaled: TFPCustomCanvas;
  Image: TFPCustomImage;
  ImageScaled: TFPCustomImage;
  Writer: TFPCustomImageWriter;
  Reader: TFPCustomImageReader;

begin
  filename := '1.png';

  Image := TFPMemoryImage.Create(0, 0);
  Writer := TFPWriterPNG.Create;
  Reader := TFPReaderPNG.Create;
  Image.LoadFromFile(filename);

  Writeln('Image Width: ' + IntToStr(Image.Width) + 'px');
  Writeln('Image Height: ' + IntToStr(Image.Height) + 'px' + #13#10);

  Write('Width[px]: ');
  readln(w);
  str(w, w_str);
  Writeln('Width set to ' + w_str + 'px' + #13#10);
  Write('Height[px]: ');
  readln(h);
  str(h, h_str);
  Writeln('Height set to ' + h_str + 'px' + #13#10);

  ImageScaled := TFPMemoryImage.Create(w, h);
  CanvasScaled := TFPImageCanvas.Create(ImageScaled);
  CanvasScaled.StretchDraw(0, 0, w, h, Image);

  { Save to file }
  ImageScaled.SaveToFile('DrawTest.png', Writer);

  { Clean up! }
  CanvasScaled.Free;
  Image.Free;
  Writer.Free;

  Write('Press enter to exit');
  readln();
end.
