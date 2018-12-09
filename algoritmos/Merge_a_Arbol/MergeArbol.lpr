program MergeArbol;
uses crt;
const
  dimf = 4;
type
    venta = record
      codArticulo : integer;
      fecha : String;
      codRubro : integer;
      cantidad : integer;
      precioTotal : real;
    end;
    ventas = record
      codArticulo : integer;
      codRubro : integer;
      cantidadTot : integer;
    end;
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
    vectorListas = array[1..dimF] of lista;

procedure CargarVenta( var v : venta);
begin
 TextColor(26);
 write('Ingresar el codigo de articulo (0 para finalizar): ');
 readLn(v.codArticulo);
 if(v.codArticulo > 0)then
 begin
   write('Ingresar el codigo de rubro : ');
   readLn(v.codRubro);
   write('Ingresar la fecha en la que se realizo : ');
   readLn(v.fecha);
   write('Ingresar el monto total : ');
   readLn(v.precioTotal);
   write('Ingresar la cantidad de articulos : ');
   readLn(v.cantidad);
 end;
end;
procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
     for i:= 1 to dimF do v[i] := nil;
end;
Procedure InsertarOrd ( var pri: lista; v : venta);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := v;
  nue^.sig := nil;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.codArticulo < v.codArticulo) do begin
      ant := act;
      act := act^.sig;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure CrearVectorListas(var vector : vectorListas);
var
  v : venta;
  i : integer;
begin
  for i:=1 to dimF do
      begin
        TextColor(3);
        writeLn('Lista ',i,' : ');
        CargarVenta(v);
        while(v.codArticulo > 0)do begin
          InsertarOrd(vector[i],v);
          CargarVenta(v);
        end;
      end;
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
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   delay(100);
   write(pri^.datos.codArticulo,' | ') ;
   write(pri^.datos.cantidad ,' | ') ;
   writeLn();
          pri:= pri^.sig;
 end;
end;
Procedure preOrden( a: arbol );
begin
  if ( a <> nil ) then begin
    writeLn('Cod rubro : ',a^.datos.codRubro, ' | ');
    writeLn ('cod Arti : ',a^.datos.codArticulo, ' | ');
    writeLn ('cant tot : ',a^.datos.cantidadTot, ' | ');
    preOrden (a^.HI);
    preOrden (a^.HD)
  end;
end;
procedure Informar(a:arbol;var c : integer;var codR : integer);
begin
 if ( a <> nil )then begin
    Informar (a^.HI,c,codR);
    Informar (a^.HD,c,codR);
    if(c < a^.datos.cantidadTot)then
       begin
         c := a^.datos.cantidadTot;
         codR := a^.datos.codRubro;
       end;
  end;
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
var
  vec : vectorListas;
  arb : arbol;
  i,max,codR : integer;
begin
  InicializarVector(vec);
  CrearVectorListas(vec);
  codR := 0;
  max := -1;
  for i:= 1 to dimf do
    begin
      ImprimirLista(vec[i]);
    end;
  MergeArbol(vec,arb);
  preOrden(arb);
  TextColor(25);
  BuscarMax(arb,max,codR);
  if(max > 0)then
         writeLn('El codigo de rubro con mas productos vendidos es : ',codR)
  else
         writeLn('Error al hallar un producto mas vendido.');
  TextColor(24);
  writeLn('programa finalizado.');
  readKey();
end.

