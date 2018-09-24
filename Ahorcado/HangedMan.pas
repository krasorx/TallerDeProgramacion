program HangedMan;
uses crt;
const DF = 25;
type
  palabrita = string[20];
  palabra = record
    largo : integer;
    letras : palabrita;
  end;
  vector = array[1..DF] of palabra;
  vectorAciertos = array[1..DF] of boolean;

Procedure InicializarPalabras(var palabras : vector);

var
  i : integer;
begin
  i := 1;
  palabras[i].letras := 'golazo';palabras[i].largo:= 6;         i:=i+1;
  palabras[i].letras := 'salamin';palabras[i].largo:= 7;        i:=i+1;
  palabras[i].letras := 'carton';palabras[i].largo:= 6;         i:=i+1;
  palabras[i].letras := 'endulzante';palabras[i].largo:= 10;    i:=i+1;
  palabras[i].letras := 'septiembre';palabras[i].largo:= 10;    i:=i+1;
  palabras[i].letras := 'helado';palabras[i].largo:= 6;         i:=i+1;
  palabras[i].letras := 'dietetico';palabras[i].largo:= 9;      i:=i+1;
  palabras[i].letras := 'compuesto';palabras[i].largo:= 9;      i:=i+1;
  palabras[i].letras := 'diamante';palabras[i].largo:= 8;       i:=i+1;
  palabras[i].letras := 'teoria';palabras[i].largo:= 6;         i:=i+1;
  palabras[i].letras := 'versalles';palabras[i].largo:= 9;      i:=i+1;
  palabras[i].letras := 'caceria';palabras[i].largo:= 7;        i:=i+1;
  palabras[i].letras := 'inercia';palabras[i].largo:= 7;        i:=i+1;
  palabras[i].letras := 'sistemas';palabras[i].largo:= 8;       i:=i+1;
  palabras[i].letras := 'metallica';palabras[i].largo:= 9;      i:=i+1;
  palabras[i].letras := 'tsar';palabras[i].largo:= 4;           i:=i+1;
  palabras[i].letras := 'gusanito';palabras[i].largo:= 8;       i:=i+1;

  palabras[i].letras := 'azucopos';palabras[i].largo:= 8;        i:=i+1;
  palabras[i].letras := 'sistemas';palabras[i].largo:= 8;       i:=i+1;
  palabras[i].letras := 'metallica';palabras[i].largo:= 9;      i:=i+1;
  palabras[i].letras := 'tsar';palabras[i].largo:= 4;           i:=i+1;
  palabras[i].letras := 'gusanito';palabras[i].largo:= 8;       i:=i+1;
end;

function ElegirPalabra(palabras : vector):integer;
begin
  ElegirPalabra := random(25);
end;
procedure InicializarAciertos(var aciertos : vectorAciertos);
var
  i : integer;
begin
  for i:= 1 to DF do aciertos[i] := false;
end;
procedure HayLetra(c:char;plbr:palabra;var aciertos : vectorAciertos;
                                       var acerto : integer);
var
  i : integer;
begin
  writeLN();
  for i:= 1 to plbr.largo do
  begin
    if NOT(aciertos[i])then
    begin
      if (c = plbr.letras[i])then
      begin
        acerto := i;
        write(plbr.letras[i]);
        aciertos[i]:= TRUE;
      end
      else begin
        write('_ ');
      end;
    end
    else begin
      write(plbr.letras[i]);
    end;
  end;
end;
function sigue(aciertos:vectorAciertos; plbr: palabra):boolean;
var
  i,c : integer;
begin
  i := 1; c := 0;
  while(i <= plbr.largo) do begin
    if (aciertos[i]) then c:=c+1;
    i := i+1;
  end;
  sigue := (c = plbr.largo);
end;
procedure HangedMan(var intentos:integer;var plbr : palabra;
                    var aciertos : vectorAciertos);
var
  c : char;
  GANO : BOOLEAN;
  acerto : integer;
begin
    aciertos[1] := true;writeLn(); gano := FALSE;
    while(NOT(GANO) AND (intentos > 0)) do begin
      acerto := -1;
      write('Ingresar una letra: ');
      c := readKey();textColor(29);
      writeLn(' ',c);textColor(30);delay(100);
      delay(100);
      HayLetra(c,plbr,aciertos,acerto);
      gano := sigue(aciertos,plbr);
      if NOT(c = plbr.letras[acerto]) then
         intentos := intentos - 1 ;
      writeLn();
      writeLn('intentos restantes : ',intentos)
  end;
    delay(100);writeLn();writeLn();
    if (gano) then begin
      textColor(26);
      writeLN('      GANASTE!!!    ');
    end
    else begin
        textColor(12);
        writeLn('    PERDISTE. La palabra era : ',plbr.letras);
    end;
end;
procedure Start(palabras:vector;var intentos : integer);
var
  plb: palabra;
  i,lenght : integer;
  aciertos : vectorAciertos;
begin
  intentos := 10;
  InicializarAciertos(aciertos);
  i := ElegirPalabra(palabras);
  plb.letras := palabras[i].letras;
  plb.largo := palabras[i].largo;lenght := plb.largo;
  writeLn(intentos,' intentos restantes.');
  write(plb.letras[1]);lenght:= lenght - 1;
  for i:=1 to lenght do write('_ ');
  HangedMan(intentos,plb,aciertos);
end;

var
  palabras : vector;
  intentos : integer;
begin  //PROGRAMA PRINCIPAL
  Randomize;
  textColor(30);
  InicializarPalabras(palabras);
  writeLn('Bienvenido a el juego del ahorcado!');
  delay(200);
  writeLn();
  Start(palabras,intentos);
  textColor(5);
  delay(300);
  writeLn('Gracias por jugar. Presione cualquier tecla para finalizar...');
  readkey();
end.

