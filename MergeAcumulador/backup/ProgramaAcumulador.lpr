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
    listaI = ^nodoI;
    nodoI = record
         datos : gastosInd;
         sig : listaI;
    end;
     //Creamos la lista gastoTOT
    listaT = ^nodoT;
    nodoT = record
         datos : gastosTot;
         sig : listaT;
    end;
     vectorlistasI= array[1..dimF] of listaI;
procedure InicializarVector(var v : vectorlistasI);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := NIL;
end;
   Procedure CrearListaOrdenada ( var pri: listaI; g: gastosInd);
   var
      ant, nue, act: listaI;
   begin
     new (nue);
     nue^.datos := g;
     act := pri;
     ant := pri;
   {Recorro mientras no se termine la lista y no encuentro la posicion correcta}
     while (act<>NIL) and (act^.datos.tipoConsumo< g.tipoConsumo) do
         begin
           ant := act;
           act := act^.sig ;
         end;
     if (ant = act)  then pri := nue   {el dato va al principio}
                     else  ant^.sig  := nue; {va entre otros dos o al final}
     nue^.sig := act ;
   end;
Procedure AgregarAlFinal(var p, Ult: listaT; var g: gastosTot );
Var
nue : listaT;
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
procedure CargarGastos(var g:gastosInd);
begin
 Randomize;
 //g.tipoConsumo := random(6);
 writeLn('Ingresar tipo de consumo (0 para finalizar)');
 readLn(g.tipoConsumo);
 if (g.tipoConsumo <> 0) then begin
   write('Ingresar fecha : ');
   readln(g.fecha);
   write('Ingresar monto : ');
   readln(g.Monto);
 end;
end;
Procedure CrearVectorListas (var v: vectorlistasI);
var
   g : gastosInd;
   i : integer;
begin
 CargarGastos(g);
 while (g.tipoConsumo <> 0 ) do
     begin
       i := 1;
       while((i <= dimF) AND (g.tipoConsumo <> 0)) do
       begin
         CrearListaOrdenada(v[i],g);
         CargarGastos(g);
       end;
     end;
end;
procedure DeterminarMinimo(var v: vectorlistasI; var g:gastosInd; var posmin:integer);
var
   min, i: integer;
Begin
 min := MAXINT;
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
    g := v[posmin]^.datos;
 if (v[posmin] <> nil) then
    v[posmin] := v[posmin]^.sig      //reacomodo de lista
 else
     posmin := 999;
end;
procedure MergeAcumulador(var v : vectorListasI; var ln : listaT );
var
   aux : listaT;
   posmin : integer;
   g : gastosInd;
   gt : gastosTot;
   act: integer;
   monto : real;
begin
 aux := NIL;
 writeLn('entro al merge');
 DeterminarMinimo(v,g,posmin);
 act := g.tipoConsumo;
 while(posmin <> 999) do begin
   writeLn('entro al while del merge');
   monto := 0;
   while (g.tipoConsumo = act) do
       begin
         monto := monto + g.Monto;
         gt.tipoConsumo := act;
         DeterminarMinimo(v,g,posmin);
       end;
   gt.monto := monto;
   //agrego con act y la suma
   AgregarAlFinal(ln,aux, gt );
   DeterminarMinimo(v,g,posmin);
 end;
end;
procedure ImprimirListaNueva(pri:listaT);
begin
  while (pri <> NIL) do begin
   writeln ('Monto : ',pri^.datos.Monto:5:2) ;
   writeln ('Tipo de consumo : ',pri^.datos.tipoConsumo) ;
          pri:= pri^.sig
  end;
  writeLn('Lista impresa...');
end;
Procedure Imprimir2Listas(v:vectorListasI);
var
   i : integer;
begin
 for i:=1 to dimF do begin
   while (v[i] <> NIL) do begin
    writeln (v[i]^.datos.Monto) ;
           v[i]:= v[i]^.sig
   end;
   writeLn('Lista impresa...',I);
 end;
end;
var
   lt : listaT;
   v : vectorListasI;
begin
  lt := NIL;
  InicializarVector(v);
  CrearVectorListas(v);
  Imprimir2Listas(v);
  MergeAcumulador(v,lt);
  ImprimirListaNueva(lt);
  readLn();
end.

