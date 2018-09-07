program OrdeVectores;
Const
  dimF = 6;
Type
  vectornum = array [1..dimF] of integer;

Procedure CrearVector ( var vnum: vectornum; var dimL: integer );
var dato ,i: integer;
begin
   randomize;
   dato:=random(100);
   for i:= 1 to dimF do begin
          vnum [i] := dato;
          dimL := i;
          dato:=random(100);
   end;
End;
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

Var
vint:vectornum;
dimL: integer;

begin //Programa Principal
  dimL:= 0;
  CrearVector(vint,dimL);
  writeln('Vector sin ordenar : ');
  ImprimirVector(vint,dimL);
  OrdenacionPorInsercion(vint);
  writeln('');
  writeln('Vector ordenado : ');
  ImprimirVector(vint,dimL);
  readln();
end.
