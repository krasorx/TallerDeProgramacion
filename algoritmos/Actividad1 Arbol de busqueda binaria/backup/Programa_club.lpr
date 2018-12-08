program Programa_club;
uses crt;
const
  dimF = 2;
type
  pago = record
    numeroDePago : integer;
    numeroDeSocio : integer;
    categoria : integer;
    codActividad : integer;
    valor : real;
  end;
  listaPagos = ^nodoP;
  nodoP = record
    datos : pago;
    sig : listaPagos;
  end;
   actividad = record
    codActividad : integer;
    categoria : integer;
    pagosEfectuados : ListaPagos;
  end;
  arbol = ^nodo;
  nodo = record
      HI : arbol;
      HD : arbol;
      datos : actividad;
    end;
  pagosSocio = record
      numeroDeSocio : integer;
      totalPagado : real;
  end;
  listaActividades = ^nodoAct;
  nodoAct = record
      datos : pagosSocio;
      sig : listaActividades;
  end;


Procedure CargarPago(var p : pago);
begin
  TextColor(27);
  write('Ingresar numero de pago (0 para terminar) :');
  readLn(p.numeroDePago);
  if (p.numeroDePago <> 0)then
  begin
    write('Ingresar categoria : ');
    readLn(p.categoria);
    write('Ingresar codigo de actividad : ');
    readLn(p.codActividad);
    write('Ingresar el valor : ');
    readLn(p.valor);
  end;
end;
Procedure CrearListaAgregarAdelante (var L:listaPagos; p:pago);
Var
  nue:ListaPagos;
Begin
  New(nue);
  nue^.datos:=p;
  nue^.sig:=L;
  L:=nue;
End;
Procedure AgregarAdelante (var L:listaActividades; p:pagosSocio);
Var
  nue:ListaActividades;
Begin
  New(nue);
  nue^.datos:=p;
  nue^.sig:=L;
  L:=nue;
End;
procedure GenerarLista(var L:listaPagos);
var
  p : pago;
begin
  CargarPago(p);
  while(p.numeroDePago > 0)do
  begin
    CrearListaAgregarAdelante(l,p);
    CargarPago(p);
  end;
    writeLn('Lista generada exitosamente.');
end;
Procedure CargarActividad(var a : actividad);
begin
  write('Ingresar Codigo de la actividad (0 para finalizar) :');
  readLn(a.codActividad);
  if (a.codActividad <> 0)then
  begin
    write('Ingresar categoria : ');
    readLn(a.categoria);
  end;
end;
Procedure AgregarLista(var a : actividad;l:listaPagos;var ln : listaPagos);
begin
  ln := nil;
  while(l <> nil)AND(l^.datos.codActividad = a.codActividad)do
  begin
    CrearListaAgregarAdelante(ln,l^.datos);
    ln := ln^.sig;
  end;
  a.pagosEfectuados:= ln;
end;

procedure InsertarArbol(var a : arbol ;var d : actividad);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.datos := d;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (d.codActividad < a^.datos.codActividad) then         // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,d)       // lo inserta en el hijo izquierdo
      else                            // si el dato es mayor al dato en arbol
         InsertarArbol(a^.HD,d);  // lo inserta en el hijo derecho
end;
procedure ArmarArbol(var arb:arbol; l:listaPagos);
var
  aux : actividad;
  ln : listaPagos;
begin
  ln := nil;
  CargarActividad(aux);
  while(aux.codActividad <> 0)do
  begin
    AgregarLista(aux,l,ln);
    InsertarArbol(arb,aux);
    CargarActividad(aux);
  end;
end;
procedure AgregarPagos(arb : arbol;var la : listaActividades);
var
  p:PagosSocio;
  tot : real;
  lp : listaPagos;
begin
  tot := 0;
  p.numeroDeSocio:= arb^.datos.pagosEfectuados^.datos.numeroDeSocio;
  lp := arb^.datos.pagosEfectuados;
  while( lp <> nil)AND(p.numeroDeSocio = lp^.datos.numeroDeSocio)do
      begin
        tot := tot + lp^.datos.valor;
        lp :=  lp^.sig;
      end;
  p.totalPagado:= tot;
  AgregarAdelante(la,p);
end;
procedure PreOrden(arb : arbol;a,b : integer;var la : listaActividades);
var
  i : integer;
begin
  if ( arb <> nil ) then
  begin
    if(arb^.datos.pagosEfectuados <> nil)then
    begin
      if((arb^.datos.pagosEfectuados^.datos.codActividad = a)OR
         (arb^.datos.pagosEfectuados^.datos.codActividad = b))then
         AgregarPagos(arb,la);
      preOrden (arb^.HI,a,b,la);
      preOrden (arb^.HD,a,b,la);
    end;
  end;
end;

var
  l : listaPagos;
  la : listaActividades;
  arb : arbol;
  a,b,c : integer;
begin
  l := nil;
  la := nil;
  arb := nil;
  c := 0;
  GenerarLista(l);
  ArmarArbol(arb,l);
  write('Ingresar un codigo de actividad : ');
  readLn(a);
  write('Ingresar otro codigo de actividad : ');
  readLn(b);
  PreOrden(arb,a,b,la);
  //InformarActividades(arb,c);
  writeLn(c);
  TextColor(31);
  writeLn('Ejecucion finalizada...');
  readKey();
end.

