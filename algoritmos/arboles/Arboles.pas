program Arboles;
type
    lista = ^nodo;
    nodo = record
         datos : venta;
         sig : lista;
    end;
    arbol = ^nodoA;
    nodoA = record
      HI : arbol;
      HD : arbol;
      datos : ventas;
      end;

procedure InsertarArbol(var a : arbol ;var vts : ventas);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.datos := vts;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (vts.codRubro < a^.datos.codRubro)then         // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,vts)       // lo inserta en el hijo izquierdo
      else                            // si el dato es mayor al dato en arbol
         InsertarArbol(a^.HD,vts);  // lo inserta en el hijo derecho
end;
procedure BuscarMin(arb : arbol;var min : integer);
begin
  if (arb <> nil) then
    if(arb^.dato <= min ) then begin
       min:= arb^.dato;
       buscarMin(arb^.HI,min);
    end
  else
     min := -1;
end;
procedure BuscarMax(arb : arbol;var max : integer; var codR : integer);
begin
  if (arb <> nil) then
    if(arb^.datos.cantidadTot >= max ) then begin
       max := arb^.datos.cantidadTot;
       codR := arb^.datos.codRubro;
       buscarMax(arb^.HI,max,codR);
    end
  else
     max := -1;
end;
procedure minimo(var v:vectorListas;var monto : real ; var min : integer);
var
   i,cont :integer;
   posmin : integer;
begin
 min:=999;
 posmin := 1;
 monto := 0;
 for i:= 1 to df do
   begin
     if(v[i] <> nil) then
     begin
       if(v[i]^.datos.tipoConsumo <= min)then
       begin
         min := v[i]^.datos.tipoConsumo;
         posMin := i;
       end;
     end;
   end;
 if(v[posMin] <> nil)then
 begin
   monto := v[posmin]^.datos.monto;
   v[posMin] := v[posMin]^.sig;
 end;
end; 
procedure Merge(var vector: vectorListas; var pri : listaN );
var
  act,min : integer;
  c2 : consumo2;
  ult : listaN;
  monto,tot : real;
begin
 pri:= nil;
 ult := nil;
 Minimo(vector,monto,min);
 while(min <> 999) do
   begin
     tot := 0;
     act := min;
     c2.tipoConsumo:= min;
     while ( (min = act) ) do
       begin
         tot := tot + monto;
         Minimo(vector,monto,min);
       end;
     C2.monto:= tot;
     AgregarAlFinal(pri,ult,c2);
     // minimo();
   end;
end;          
procedure DeterminarMinimo(var v: vectorListas; var posmin:integer;var min : integer;
                               var cantVentas:integer;var codR : integer);
var
  i,j : integer;
Begin
  min:=999;
  cantventas := 0;
  posmin := -1;
  j := 0;
  for i:= 1 to dimF do     // se repite una vez por cada lista
    begin
       if (v[i] <> nil) then begin
         if (v[i]^.datos.codArticulo < min) then
            begin
                  min:= V[i]^.datos.codArticulo;
                  posMin:= i;
                  cantVentas := v[posmin]^.datos.cantidad;
                  codR := v[posmin]^.datos.codRubro;
            end;
       end
       else
           begin
             j := j+1;
             if (j= dimF)then
                begin
                  posmin := -1;
                  min := 999;
                end;
           end;
    end;
  if (posmin <> -1)then
     v[posmin] := v[posmin]^.sig;  //reacomodo de lista
end;
procedure MergeArbol(var v : vectorListas; var arb : arbol);
var
  min, posmin,act,temp : integer;
  tot,cantVentas,codR : integer;
  vts : ventas;
begin
  arb := nil;posmin := -1; min:= 999;codR := 0;cantVentas := 0;
  DeterminarMinimo(v,posmin,min,cantVentas,codR);
  act := min;
  while(min <> 999) do
  begin
    temp := act;
    tot := 0;
    vts.codArticulo := act;
    vts.codRubro:= codR;
    while((act = temp)AND (posmin <> -1))do
    begin
      tot := tot + cantVentas;
      DeterminarMinimo(v,posmin,min,cantVentas,codR);
      act := min;
    end;
    vts.cantidadTot := tot;
    InsertarArbol(arb,vts);
    writeLn('Elemento agregado a iggdrasil.');
  end;

end;
function BuscarRamita(arb : arbol; valor:integer):arbol;
begin
  if (arb <> nil) then
    if(arb^.dato = valor) then
       BuscarRamita:= arb
    else
        if (arb^.dato > valor) then
             BuscarRamita := BuscarRamita(arb^.HI, valor)
          else
             BuscarRamita := BuscarRamita(arb^.HD, valor)
  else
      BuscarRamita := nil;
end
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux : lista;
begin
  aux := l;
  while (aux <> NIL) do begin
          InsertarArbol(arb,aux^.datos);
          aux:= aux^.sig;
  end;
end;
procedure RecorridoAcotado(arb: arbol; inf: integer; sup: integer);
begin
 if (arb<>nil) then
    if (arb^.dato>= inf) then
       if (arb^.dato<=sup) then begin
         write(arb^.dato,'|');
         recorridoAcotado(arb^.HI, inf, sup);
         recorridoAcotado(arb^.HD, inf, sup);
         end
         else recorridoAcotado (arb^.HI, inf, sup)
    else recorridoAcotado (arb^.HD, inf, sup);
end;
Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    writeLn('datos : ',a^.datos, ' | ');
    preOrden (a^.HI);
    preOrden (a^.HD);
  end;
end;
Procedure Orden( a: arbol );
begin
  if ( a <> nil ) then begin
    preOrden (a^.HI);
    writeLn('datos : ',a^.datos, ' | ');
    preOrden (a^.HD);
  end;
end;
Procedure PostOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    preOrden (a^.HI);
    preOrden (a^.HD);
    writeLn('datos : ',a^.datos, ' | ');
  end;
end;
function CuentaNodos(a : arbol) : integer;
begin
   if (a = nil) then
      CuentaNodos := 0
   else
      CuentaNodos := 1 + CuentaNodos(a^.HI) + CuentaNodos(a^.HD);
end;
var
   arb : arbol;
begin
end.
