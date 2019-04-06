program Busqueda_Dicotomica_Max_Min;
uses CRT;
const
  dimF=8;
type
vectornum = array [1..dimF] of integer;

Procedure ImprimirVector (v: vectornum; dimL:integer ) ;
var i : integer;
begin
   writeLn('Nros almacenados:');
   writeLn();
   for i:=1 to dimL do begin
       write(v[i],' ');
   end;
   writeln('');
end;

Procedure CrearVector ( var vnum: vectornum; var dimL: integer );
var dato ,i: integer;
begin
   for i:= 1 to dimF do begin
          dato:=random(100);
          vnum [i] := dato;
          dimL := i;
   end;
End;

procedure OrdenacionPorInsercion(var v:vectornum);
var i,j,dato:integer;
begin
for i:= 2 to dimF do begin
   dato:=v[i];
   j:= i-1;
   while (j>0) and (v[j]>dato) do begin
     v[j+1]:=v[j];
     j:=j-1;
     end;
v[j+1]:=dato;
end;
end;

procedure busquedaDicotomica( v: vectornum; ini, fin, dato: integer; var pos: integer);
begin
  if (ini > fin) then writeln('El numero ', dato , ' no ha sido encontrado.')
  else begin
    pos := (ini + fin) div 2;
    if (v[pos] = dato) then writeln('Numero ',dato,' encontrado en la posicion ', pos)
    else begin
      if (dato < v[pos]) then begin
        fin := pos - 1;
      end
      else ini := pos + 1;
      busquedaDicotomica(v, ini, fin, dato, pos);
    end;
  end;
end;
Procedure MaximoVector(v : vectornum; var i : integer; var max : integer );                         // max = -1 la primera vez
begin
  if(v[i] > max) then
  begin
    max := v[i];
  end;
  i := i +1;
  if(i <= dimF)then
    MaximoVector(v,i,max);
end;
Procedure MinimoVector(v : vectornum; var i : integer; var min : integer );                         // max = MaxInt la primera vez
begin
  if(v[i] < min) then
  begin
    min := v[i];
  end;
  i := i + 1;
  if(i <= dimF)then
    MinimoVector(v,i,min);
end;

var
  vint: vectornum;
  dato, ini, fin, pos, dimL, max,i,min: integer;
begin
  Randomize;
  TextColor(26);
  CrearVector(vint,dimL);
  OrdenacionPorInsercion(vint);
  ini := 1;
  fin := dimF;
  pos := dimF;
  max := -1;
  min := maxInt;
  i := 1;
  ImprimirVector(vint,dimL);
  writeln('Ingrese el numero que quiere buscar(0 para terminar )');
  readln(dato);
  while (dato <> 0)do begin
    busquedaDicotomica(vint, ini, fin, dato, pos);
    writeln('Ingrese el numero que quiere buscar(0 para terminar )');
    readln(dato);
  end;
  writeLn();
  TextColor(27);
  MaximoVector(vint,i,max);
  writeLn('El numero maximo en el vector es : ', max);
  writeLn();
  i := 1;
  MinimoVector(vint,i,min);
  writeLn('El numero minimo en el vector es : ', min);
  readKey();
end.
