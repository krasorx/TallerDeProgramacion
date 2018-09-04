program ProgramaAcumulador;
const
  dimF=2;
type
    gastosInd = record
      tipoConsumo : integer;
      fecha : string[11];
      Monto : real;
    end;
    gastosTot = record
      tipoConsumo : integer;
      Monto : real;
    end;
 //Creamos la lista gastoIND
    listaI = ^nodo;
    nodo = record
         datos : gastosInd;
         sig : listaI;
    end;
     //Creamos la lista gastoTOT
    listaT = ^nodo;
    nodo = record
         datos : gastosTot;
         sig : listaT;
    end;
     vectorlistasI= array[1..dimF] of listaI;
procedure InicializarVector(var v : vectorlistasI);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
end;
   Procedure CrearListaOrdenada ( var pri: listaI; g: gastosInd);
   var
      ant, nue, act: lista;
   begin
     new (nue);
     nue^.datos := g;
     act := pri;
     ant := pri;
   {Recorro mientras no se termine la lista y no encuentro la posicion correcta}
     while (act<>NIL) and (act^.datos.tipoConsumo< g.tipoConsumo) do begin
         ant := act;
         act := act^.sig ;
     end;
     if (ant = act)  then pri := nue   {el dato va al principio}
                     else  ant^.sig  := nue; {va entre otros dos o al final}
     nue^.sig := act ;
   end;

Procedure AgregarAlFinal(var p, Ult: lista; var g: gastoTot );
Var
nue : lista;

begin
 new (nue);
 nue^.datos:= g;
 nue^.sig := NIL;
 if p <> Nil then
    ult^.sig := nue
 else
     p := nue;
 ult := nue;

end;

Procedure CrearVectorListas (var v: vectorlistasI);
var
   g : gastoI;
   i: integer;
begin
 CargarGastos(g);
 while (tipoConsumo<>0) do
     begin
       for i:=1 to dimF do
       begin
         CrearListaOrdenada(v[i],g);
         CargarGastos(g);

       end;

     end;
end;
procedure CargarGastos(var g:gastosInd);
begin
 Randomize;
 g.tipoConsumo= random(6);
 write('Ingresar fecha : ');
 readln(g.fecha);
 write('Ingresar monto : ');
 readln(g.Monto);

end;

procedure DeterminarMinimo(var v: vectorlistasI; var g:gastosInd; var posmin:integer);
var
min, i: integer;
Begin
 min:=MAXINT;
 posmin := 999;
 for i:= 1 to dimF do
    begin
       if v[i] <> nil then begin
         if(v[i]^.datos.tipoConsumo < min) then begin
                  min:= V[i]^.datos.tipoConsumo ;
                  posMin:= i;
         end;
       end;
    end;
 if (posmin <> 999) then
    book := v[posmin]^.datos;
 if (v[posmin] <> nil) then
    v[posmin] := v[posmin]^.sig;
end;
procedure AcumularGastos(var gi:gastosInd ; var gt:gastosTot);
var
   act : integer;
begin
 if (gi.tipoConsumo = act) do
     begin
       gt.tipoConsumo:= act;
       gt.monto := gt.monto + gi.monto;
     end;
end;

procedure MergeAcumulador(var v : vectorGastosI var ln : listaT );
var
   aux : lista;
   posmin : integer;
   g : gastosInd;
   gt : gastosTot;
   act: integer;
begin
 DeterminarMinimo(v,g,posmin);
 while(posmin <> 999) do begin
   act:=g.tipoConsumo;
   while tenga el mismo tipo
         sumo
         calculo minimo
   agrego con act y la suma
         gt.monto := 0;
     AcumularGastos(g,gt);
   AgregarAlFinal(ln,aux, gt );
   DeterminarMinimo(v,g,posmin);
 end;
end;



begin
end.

