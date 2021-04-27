program prime;

{$MODE OBJFPC}

uses
  SysUtils;

  function all():nil;
  var
    curnum: integer;
    trynum: integer;
    divcount: integer;
    dg: integer;
    Start, Stop: TDateTime;

  begin
    curnum := 2;
    divcount := 0;
    Write('Kolik mist: ');
    try
      readln(dg);
      Writeln(dg);
    except
      Write('asi to neni cislo nebo nevim uz');
      Writeln('pres');
      readln();
      all();
    end;

    Start := Now;

    while curnum <= dg do
    begin
      writeln('zkousim ' + IntToStr(curnum));
      if frac(sqrt(curnum)) = 0 then
        writeln('neni nic')
      else
      begin
        writeln('zkus');
        trynum := 2;
        while trynum < sqrt(curnum) do
        begin
          if (frac(curnum / trynum) = 0) then
          begin
            Inc(divcount, 1);
            Inc(trynum, 1);
          end
          else
            Inc(trynum, 1);
        end;
        writeln(divcount);
        writeln(trynum);
        if divcount = 0 then
        begin
          writeln(IntToStr(curnum) + ' je prvocislo' + #13#10);
        end
        else
          writeln(IntToStr(curnum) + ' neni prvocislo' + #13#10);
        divcount := 0;
      end;
      Inc(curnum, 1);
    end;

    Stop := Now;
    writeln(FormatDateTime('hh.nn.ss.zzz', Stop - Start), ' time taken');

    Writeln('pres');
    readln();
    all();
  end;

begin
  all();
end.
