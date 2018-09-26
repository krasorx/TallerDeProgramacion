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
  emergencias = record
    tipo : integer;
    cantAtn: integer;
  end;

  listaE = ^nodoE;
  nodoE = record
    datos : emergencia;
    sig : listaE;
   end;
  listaN = ^nodoN;
  nodoN = record
    datos : emergencias;
    sig : listaN;
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
procedure Musiquita ();
begin
 Sound(700);
 Delay(250);
 Sound(400);
 Delay(250);
 Sound(700);
 Delay(250);
 Sound(400);
 Delay(250);

 Sound(700);
 Delay(300);
 Sound(400);
 Delay(300);
 Sound(700);
 Delay(300);
 Sound(400);
 Delay(300);
 NoSound();
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
  while ((act<>NIL) and (act^.datos.tipo < e.tipo)) do begin
      ant := act;
      act := act^.sig ;
      Musiquita ();
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
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
Procedure AgregarAlFinal(var p, Ult: listaN; e:emergencias );
Var
  nue : listaN;
begin
 new (nue);
 nue^.datos:= e;
 nue^.sig := NIL;
 if p <> Nil then
    ult^.sig := nue
 else
     p := nue;
 ult := nue;
end;
procedure CargarEmergencia(var E:emergencia);
begin
 write('Ingresar tipo de emergencia (0 para finalizar con la ambulancia) : ');
 readLn(e.tipo);
 //e.tipo := random(10);
 if (e.tipo > 0) then begin
   write('Ingresar la fecha : ');
   readLn(e.fecha);
   write('Ingresar la direccion : ');
   readLn(e.direccion);
   write('Ingresar el codigo del cliente : ');
   readLn(e.codCliente);
 writeLn();
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
     InsertarOrd(v[i],e);
     if (e.tipo <= 0) then begin
        i := i+1;
        writeLn();
     end;
   end;
End;

procedure DeterminarMinimo(var v: vectorAmbulancias; var e:emergencia;
                            var posmin:integer; var hayAmbulancias:boolean);
var
min, i: integer;
Begin
 min:=MAXINT;
 posmin := 999;
 for i:= 1 to DF do
    begin
       if v[i] <> nil then begin
         hayAmbulancias := true;
         if(v[i]^.datos.tipo < min) AND (v[i]^.datos.tipo > 0) then
         begin
                  min:= V[i]^.datos.tipo ;
                  posMin:= i;
         end;
         end
         else hayAmbulancias := false;
    end;
 if (posmin <> 999) then
    e := v[posmin]^.datos;
 if (v[posmin] <> nil) then
    v[posmin] := v[posmin]^.sig;
end;
{
procedure DeterminarMinimo(var v: vectorAmbulancias; var e:emergencia;
                      var posmin:integer;var hayAmbulancias:boolean);
var
   min, i: integer;
Begin
 if ((v[1] = nil) AND (V[2] = nil)) then hayAmbulancias := false
     else hayAmbulancias:=true;
 min := MAXINT;
 posmin := 999;
 for i:= 1 to DF do
    begin
       if v[i] <> nil then begin
         if(v[i]^.datos.tipo <= min) then begin
                  min:= V[i]^.datos.tipo ;
                  posMin:= i;
         end;
       end;
    end;
 if (posmin <> 999) then begin
    g := v[posmin]^.datos;
 end;
 if (v[posmin] <> nil) then begin
    v[posmin] := v[posmin]^.sig;      //reacomodo de lista
 end;
end;  }
procedure MergeAcumulador(var v : vectorAmbulancias; var ln : listaN );
var
   aux : listaN;
   posmin : integer;
   e : emergencia;
   ems : emergencias;
   act : integer;
   cntEmergencias,cntEmergenciasAct : integer;
   hayAmbulancias : boolean;
begin
 aux := nil;
 cntEmergencias := 0;
 DeterminarMinimo(v,e,posmin,hayAmbulancias);
 if not(hayAmbulancias) then
    writeln('No hay gastos para acumular.');
 while(hayAmbulancias) AND (posmin <> 999)do
    begin
      cntEmergenciasAct := 0;
      act := e.tipo;
      ems.tipo:= e.tipo;
      //if (posmin = 999) then act := 0;
      while(act = e.tipo)do
         begin
           Musiquita ();
	   if not(hayAmbulancias) then BREAK
             else begin
             cntEmergenciasAct := cntEmergenciasAct + 1;
             DeterminarMinimo(v,e,posmin,hayAmbulancias);
             if (posmin = 999) then act := -1;
           end;
         end;
           ems.cantAtn := cntEmergenciasAct;
           AgregarAlFinal(ln,aux,ems);
    end;
 end;
{
procedure NuevaLista(var v : vectorAmbulancias; var ln : listaN );
var
   aux : listaN;
   posmin : integer;
   e : emergencia;
   condicion : boolean;
begin
 aux := NIL;
 DeterminarMinimo(v,e,posmin);
 while(posmin <> 999) do begin
   AgregarAlFinal(ln,aux, e );
   DeterminarMinimo(v,e,posmin);
 end;
end; }
Procedure ImprimirLista ( pri : listaE);
Begin
 while (pri <> NIL) do begin
   Musiquita();
   write('Emergencia ');
   writeLn('tipo ',pri^.datos.tipo, ' , codCliente ',pri^.datos.codCliente,'.');
          pri:= pri^.sig;
 end;
 writeLn('se imprimio la lista exitosamente.');
end;
Procedure ImprimirLista ( pri : listaN);
Begin
 while (pri <> NIL) do begin
   delay(150);
   write('Emergencia ');
   writeLn('tipo ',pri^.datos.tipo, ' , tuve ',pri^.datos.cantAtn,' atenciones.');
          pri:= pri^.sig;
          musiquita();
 end;
 writeLn('se imprimio la lista exitosamente.');
end;
Procedure MinAtencion (l : listaN; var min : integer; var n:integer);
Begin
 if (l <> NIL) then begin
   if (l^.datos.cantAtn < min) then begin
      min:= l^.datos.cantAtn;
      n := l^.datos.tipo;
   end;
   l := l^.sig;
   MinAtencion(l,min,n);
 end;
end;
var
  v : vectorAmbulancias;
  ln : listaN;
  min,n : integer;
begin
  Randomize;
  ln := NIL;
  min := MAXINT;
  n := 0;
  cursorBig();
  textColor(30);
  Musiquita();
  NoSound;
  writeLn('Emergencias medicas, 5 ambulancias, cada una con un listado de emergencias.');
  musiquita();
  InicializarVector(v);
  CargarAmbulancias(v);
  ImprimirLista(ln);
  MergeAcumulador(v,ln);
  ImprimirLista(ln);
  delay(300);
  MinAtencion(ln,min,n);
  write('La emergencia de tipo ');
  TextColor(10);
  writeLN(n,' fue la emergencia menos atendida con ',min, ' atenciones.');
  textColor(30);
  writeLn('Presione cualquier tecla para finalizar...');
  readKey();
end.

