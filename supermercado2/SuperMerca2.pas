program SuperMerca2; // by Luis
uses crt;
const
  min = 100;
type
  venta = record
    fecha : string;
    codigo : integer;
    tipo : integer;
    cntUnidades : integer;
    monto : real;
  end;
  arbol = ^nodo;
  nodo = record
    HI : arbol;
    HD : arbol;
    datos : venta;
  end;

procedure InicializarVariables(var arb:arbol; var inf,sup,c : integer);
begin
  arb := NIL;
  inf := 1500;
  sup := 2200;
  c := 0;
end;

procedure CargarVenta(var v:venta);
begin
  write('Ingresar la cantidad de unidades vendidas (-1 para terminar) : ');
  readLn(v.cntUnidades);
  if (v.cntUnidades <> -1) then begin
    write('Ingresar la fecha de la transaccion realizada (DD/MM/AAAA) : ');
    readLn(v.fecha);
    write('Ingresar el tipo de venta (0-2000) : ');
    readLn(v.tipo);
    write('Ingresar el codigo del producto : ');
    readLn(v.codigo);
    write('Ingresar el monto total : ');
    readLn(v.monto);
  end;
end;

//Agregamos elementos al arbol
procedure InsertarArbol(var a : arbol ;var v : venta);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.datos := v;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (v.codigo < a^.datos.codigo) then  // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,v)       // lo inserta en el hijo izquierdo
      else                            // si el dato es mayor al dato en arbol
         InsertarArbol(a^.HD,v);      // lo inserta en el hijo derecho
end;
procedure ArmarArbolito(var arb : arbol );
var
  v : venta;
begin
  CargarVenta(v);
  while (v.cntUnidades <> -1) do begin
          InsertarArbol(arb,v);
          CargarVenta(v);
  end;
end;
procedure InformarTiposIntervalo( arbol : arbol; inf:integer; sup:integer);
begin
  if (arbol <> NIL) then
    if (arbol^.datos.codigo >= inf) then
      if (arbol^.datos.codigo <= sup) then begin
        write('|',arbol^.datos.tipo,'|');
        InformarTiposIntervalo (arbol^.HI, inf, sup);
        InformarTiposIntervalo (arbol^.HD, inf, sup);
      end
    else
        InformarTiposIntervalo (arbol^.HI, inf, sup)
  else
    InformarTiposIntervalo (arbol^.HD, inf, sup);
end;
procedure InformarVentasSup(var a:arbol; var c:integer);
begin
    if ( a <> nil ) then begin
      if (a^.datos.monto >= min) then c:= c+1;
      InformarVentasSup (a^.HI,c);
      InformarVentasSup (a^.HD,c)
    end;
end;
//PROGRAMA PRINCIPAL
var
  arb : arbol;
  inf,sup,c : integer;
begin
  TextColor(45);
  InicializarVariables(arb,inf,sup,c);
  ArmarArbolito(arb);
  InformarTiposIntervalo(arb,inf,sup);
  writeLn();
  InformarVentasSup(arb,c);
  writeLn('Se realizaron ', c, ' ventas con un monto mayor a $100');
  Delay(300);
  writeLn('PROGRAMA FINALIZADO, PRESIONE CUALQUIER TECLA PARA CERRAR.');
  readKey();
end.

