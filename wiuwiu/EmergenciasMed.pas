program EmergenciasMed;
uses crt;
const
  DF = 5;
type
  emergencia = record
    tipo : integer;
    fecha : string;
    direccion : string;
    codCliente : integer;
  end;
  listaE = ^nodo;
  nodo = record
    datos : emergencia;
    sig : listaE;
   end;

  vectorAmbulancias = array [1..DF] of listaE;

procedure InicializarVector(var v : vectorAmbulancias);
var
  i : integer;
begin
 writeLn();
   for i:= 1 to DF do
       v[i] := nil;
end;
Procedure CrearListaAgregarAtras(var L, Ult: listaE; e:emergencia);
Var
  nue : listaE;
begin
 new (nue);
 nue^.datos:= e;
 nue^.sig := NIL;
 if l <> Nil then
    ult^.sig := nue
 else
    l := nue;
 ult := nue;
end;
Procedure InsertarOrd ( var pri: listaE; e: emergencia);
var
   ant, nue, act: listaE;
begin
  new (nue);
  nue^.datos := e;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.tipo < e.tipo) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
procedure CargarEmergencia(var E:emergencia);
begin
 write('Ingresar tipo de emergencia (0 para finalizar con la ambulancia) : ');
 readLn(e.tipo);
 if (e.tipo > 0) then begin
   write('Ingresar la fecha : ');
   readLn(e.fecha);
   write('Ingresar la direccion : ');
   readLn(e.direccion);
   write('Ingresar el codigo del cliente : ');
   readLn(e.codCliente);
 end;
end;
Procedure CargarAmbulancias ( var v: vectorAmbulancias);
var
  i : integer;
  E : emergencia;
  OMEGA : listaE;
begin
 i:=1;
 OMEGA := nil;
 while (i <= DF) do
   begin
     textcolor(7);
     writeLn('Ambulancia Nro ',i);
     textcolor(30);
     CargarEmergencia(E);
     CrearListaAgregarAtras(v[i],OMEGA,E);
     if (e.tipo <= 0) then begin
        i := i+1;
        writeLn();
     end;
   end;
End;
procedure DeterminarMinimo(var v: vectorAmbulancias; var e:emergencia;
                                                     var posmin:integer);
var
min, i: integer;
Begin
 min:=MAXINT;
 posmin := 999;
 for i:= 1 to DF do
    begin
       if v[i] <> nil then begin
         if(v[i]^.datos.tipo < min) then begin
                  min:= V[i]^.datos.tipo ;
                  posMin:= i;
         end;
       end;
    end;
 if (posmin <> 999) then
    e := v[posmin]^.datos;
 if (v[posmin] <> nil) then
    v[posmin] := v[posmin]^.sig;
end;
procedure NuevaLista(var v : vectorAmbulancias; var ln : listaE );
var
   aux : listaE;
   posmin : integer;
   e : emergencia;
   condicion : boolean;
begin
 DeterminarMinimo(v,e,posmin);
 while(posmin <> 999) do begin
   InsertarOrd(ln, e );
   DeterminarMinimo(v,e,posmin);
 end;
end;
Procedure ImprimirLista ( pri : listaE);
Begin
 while (pri <> NIL) do begin
   delay(150);
   write('Emergencia ');
   writeLn('tipo ',pri^.datos.tipo, ' , codCliente ',pri^.datos.codCliente,'.');
          pri:= pri^.sig;
 end;
 writeLn('se imprimio la lista exitosamente.');
end;
var
  v : vectorAmbulancias;
  ln : listaE;
begin
  ln := NIL;
  textColor(30);
  writeLn('Emergencias medicas, 5 ambulancias, cada una con un listado de emergencias.');
  delay(300);
  InicializarVector(v);
  CargarAmbulancias(v);
  NuevaLista(v,ln);
  ImprimirLista(ln);
  delay(300);
  write('La emergencia de tipo ');
  TextColor(10); write();
  writeLn('Presione cualquier tecla para finalizar...');
  readKey();
end.

