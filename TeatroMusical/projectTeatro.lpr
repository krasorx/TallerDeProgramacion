program projectTeatro;
uses crt;
{Una banda puede dar mas de un recital en un mismo año y se registran por separado}
type
  recital = record
    nombreBanda : string;
    anyo : integer;
    duracion : integer;
    entradasVendidas : integer
  end;
  lista = ^nodo1;
  nodo1 = record
          datos : recital;
          sig: lista;
  end;
   arbol = ^nodo;
   nodo = record
     HI : arbol;
     HD : arbol;
     dato : lista;
     end;
   listaNivel = ^nodo2;
   nodo2 = record
     sig : listaNivel;
     info : arbol;
     end;

Procedure CrearListaAgregarAdelante (var L:lista; r:recital);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos:= r;
     nue^.sig:=L;
     L:=nue;
End;
Procedure CrearListaOrdenada ( var pri: lista; r: recital);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := r;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.nombreBanda < r.nombreBanda) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure LeerRecital(var r:recital);
begin
     write('Ingresar el anyo en cual fue el recital : ');
     readLn(r.anyo);
     if(r.anyo <> 0)then
     begin
       write('Ingresar el nombre de la banda : ');
       readLn(r.nombreBanda);
       r.duracion:= Random(300) + 50;
       r.entradasVendidas:= random(1000) + 3;
     end;
end;

procedure CargarRecitales(var l : lista);
var
  r : recital;
begin
     LeerRecital(r);
     while(r.anyo <> 0)do
     begin
       CrearListaAgregarAdelante(l,r);
       LeerRecital(r);
     end;
     writeLn('');
end;
procedure InsertarArbol(var a : arbol ; r : recital ;var ln : lista); // arbol de listas
var
   aux : arbol;
begin
  if (a = NIL) then begin
    ln := nil;
    CrearListaOrdenada(ln,r);
    new (aux);
    aux^.dato := ln;

    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (r.anyo < a^.dato^.datos.anyo) then begin

         InsertarArbol(a^.HI,r,ln);

      end
      else if(r.anyo > a^.dato^.datos.anyo)then    begin

         InsertarArbol(a^.HD,r,ln);

      end;
  if(r.anyo = a^.dato^.datos.anyo)then
       begin
           CrearListaOrdenada(a^.dato,r);
       end;
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux,ln : lista;
begin
  aux := l;
  ln := nil;
  while (aux <> NIL) do begin
          InsertarArbol(arb,aux^.datos,ln);
          aux:= aux^.sig;
  end;
end;
Procedure ImprimirListaEnOrdenInverso ( pri : lista);
Begin
 if (pri <> NIL) then begin
   ImprimirListaEnOrdenInverso(pri^.sig);
   if (pri <> NIL) then write ('|',pri^.datos.anyo,'|',pri^.datos.nombreBanda) ;
 end;
end;
Procedure ImprimirLista ( pri : lista);

Begin
 while (pri <> NIL) do begin
   writeLn(pri^.datos.nombreBanda,' : ',pri^.datos.anyo,' entradas : ', pri^.datos.entradasVendidas,'.') ;
   pri:= pri^.sig
 end;
end;
Procedure ImprimirListaCompleta ( pri : lista);
var
  dur,c : integer;
  tP : real;
Begin
 dur := 0;
 c := 0;
 if(pri <> NIL) then
      write(pri^.datos.anyo,' : ');
 while (pri <> NIL) do begin
   writeLn(pri^.datos.nombreBanda,' entradas : ', pri^.datos.entradasVendidas,'.') ;
   dur := dur + pri^.datos.duracion ;
   pri:= pri^.sig;
   c := c + 1;
 end;
 tP := (dur / c);
 writeLn('Duracion promedio de los conciertos de', pri^.datos.anyo ,' : ',tP:4:2);
end;
procedure RecorridoAcotado(arb: arbol; inf: integer; sup: integer);
begin
 if (arb<>nil) then
    if (arb^.dato^.datos.anyo >= inf) then
       if (arb^.dato^.datos.anyo <=sup) then begin
         ImprimirLista(arb^.dato);
         recorridoAcotado(arb^.HI, inf, sup);
         recorridoAcotado(arb^.HD, inf, sup);
         end
         else recorridoAcotado (arb^.HI, inf, sup)
    else
         recorridoAcotado (arb^.HD, inf, sup);
 end;
function BuscarRamita(arb : arbol; valor:integer):arbol;
begin
  if (arb <> nil) then
    if(arb^.dato^.datos.anyo = valor) then
       BuscarRamita:= arb
    else
        if (arb^.dato^.datos.anyo > valor) then
             BuscarRamita := BuscarRamita(arb^.HI, valor)
          else
             BuscarRamita := BuscarRamita(arb^.HD, valor)
  else
      BuscarRamita := nil;
end;
Procedure ImprimirRecitalesEntre(arb : arbol);
var
  inf,sup : integer;
begin
 writeLn('Ingresar un intervalo de anyos del que desea obtener todos los recitales habidos : ');
 write('Min : ');
 readLn(inf);
 write('Max : ');
 readLn(sup);
 RecorridoAcotado(arb,inf,sup);
end;
procedure InformarRecitales(arb : arbol);
var
  a, b : integer;
  l : lista;
begin
 writeLn('Ingresar dos anyos del que desea obtener todos los recitales habidos : ');
 write('Anyo : ');
 readLn(a);
 write('Anyo : ');
 readLn(b);
 ImprimirListaCompleta( (BuscarRamita(arb,a) )^.dato);
 ImprimirListaCompleta( (BuscarRamita(arb,b) )^.dato);
end;

var
  lst : lista;
  arb : arbol;
begin
  Randomize;
  lst := nil;
  arb := nil;
  TextColor(26);
  writeLn('Cargar Lista de recitales.');
  CargarRecitales(lst);
  ImprimirListaEnOrdenInverso(lst);
  writeLn();
  ArmarArbolito(lst,arb);
  TextColor(27);
  ImprimirRecitalesEntre(arb);
  InformarRecitales(arb);
  readKey();
end.

