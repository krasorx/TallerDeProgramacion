program ordenar_arreglo;
const
  fisica = 100;
type
vect = array [1..fisica] of integer;

procedure printVect(v:vect);
var
   i:integer;
begin
     for i := 1 to 100 do begin
         writeln(v[i]);
     end;
     writeln();
end;

procedure randomVect(var v: vect);
var
   i: integer;
begin
     Randomize;
     for i := 1 to fisica do begin
         v[i] := random(fisica)+1;
     end;
end;

procedure insertSort(var v: vect);
var
   i, j, aux: integer;
begin
     for i := 2 to fisica do begin
         aux := v[i];
         j := i-1;
         while ((j>0) and (v[j] > aux))do begin
             v[j+1] := v[j];
             j := j-1;
         end;
         v[j+1] := aux;
     end;
end;
procedure CrearOrdenado (var v: vect);
begin
     randomVect(v);
     insertSort(v);
end;

procedure busquedaDicotomica( v: vect; ini, fin, dato: integer; var pos: integer);
begin
  if (ini > fin) then writeln('El numero ingresado no se encuentra en el vector')
  else begin
    pos := (ini + fin) div 2;
    if (v[pos] = dato) then writeln('El numero ingresado se encuentra en la posicion ', pos, ' del vector.')
    else begin
      if (dato < v[pos]) then begin
        fin := pos - 1;
      end
      else ini := pos + 1;
      busquedaDicotomica(v, ini, fin, dato, pos);
    end;
  end;
end;

var
  v: vect;
  dato, ini, fin, pos: integer;
begin
  CrearOrdenado (v);
  ini := 1;
  fin := fisica;
  pos := fisica;
  printVect(v);
  write('Se ha creado un vector ordenado con numeros aleatorios, inserte el numero a buscar: ');
  readln(dato);
  busquedaDicotomica(v, ini, fin, dato, pos);

  readln;
end.
