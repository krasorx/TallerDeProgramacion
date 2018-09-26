program wiuwiuRO;
const
  dimF= 5;
type
    emergencia = record
         tipoE:integer;
         fecha: string[10];
         direccion: string [25];
         codCliente: integer;
    end;
    atencion= record
         tipoE:integer;
         ATot: integer;
    end;

    listaE = ^nodo1;
    nodo1 = record
         datos : emergencia;
         sig : listaE;
  end;
    listaT = ^nodo2;
    nodo2 = record
         datos : atencion;
         sig : listaT;
  end;
    vectorE= array[1..dimF] of listaE;

procedure InicializarVector(var v : vectorE);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
end;
Procedure CrearListaOrdenada ( var pri: listaE; e : emergencia);
var
   ant, nue, act: listaE;
begin
  new (nue);
  nue^.datos := e;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.tipoE < e.tipoE) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

Procedure AgregarAlFinal(var p, Ult: listaT; var a: atencion);
Var
nue : listaT;

begin
 new (nue);
 nue^.datos:= a;
 nue^.sig := NIL;
 if p <> Nil then
    ult^.sig := nue
 else
     p := nue;
 ult := nue;
 end;
procedure CargarInfoEmergencia( var e: emergencia);
begin
  writeln('Ingrese el tipo de emergencia del 1 al 9 (0 para finalizar): ');
  read(e.tipoE);
  if(e.tipoE <>0) then begin
    writeln('Ingrese la fecha (dd/mm/aaaa): ');
    readln(e.fecha);
    readln();
    Writeln('Ingrese la direccion: ');
    read(e.direccion);
    readln();
    Writeln('Ingrese el codigo de cliente: ');
    read(e.CodCliente);
    readln();
  end;
end;
Procedure CrearVectorListas (var v:vectorE);
var
   e:emergencia;
   i:integer;
begin
 writeln('entro a crear vector con listas');
 for i := 1 to dimF do
     begin
       CargarInfoEmergencia(e);
       while (e.tipoE<>0) do
          begin
           CrearListaOrdenada(v[i],e);
           CargarInfoEmergencia(e);
          end;
     end;
 writeln('vector creado');
end;

Procedure BuscarMinimoParaListaTotal(var v:vectorE; var e: emergencia;
var emin: integer; hayAtenciones:boolean);
var
   posMin,i: integer;
begin
 writeln('entro a buscar minimo');
if ((v[1] = nil) AND (V[2] = nil)AND (V[3] = nil)AND (V[4] = nil) AND (V[5] = nil))then
  hayAtenciones := false
   else hayAtenciones:=true;
emin:=MAXINT;
 for i:= 1 to dimF do
    begin
       if v[i] <> nil then begin
         if(v[i]^.datos.tipoE < emin) then begin
                  emin:= V[i]^.datos.tipoE ;
                  posMin:= i;
         end;
       end;
    end;
 if (emin <> MAXINT) then begin
    e := v[posmin]^.datos;
    v[posmin] := v[posmin]^.sig;
 end;
end;
procedure MergeAcumulador(var v : vectorE; var ln : listaT );
var
   aux : listaT;
   e:emergencia;
   a: atencion;
   act : integer;
   cantAt : integer;
   hayAtenciones : boolean;
   emin: integer;
begin
 aux := nil;
 BuscarMinimoParaListaTotal(v,e,emin,hayAtenciones);
 writeln('salio del primer buscar minimo');
 if not(hayAtenciones) then
    writeln('No hay atenciones para acumular.');
 while(HayAtenciones)do
    begin
      cantAt:= 0;
      act := e.tipoE;
      a.tipoE:= e.tipoE;
      while(act = e.tipoE)do
         begin
	   if not(hayAtenciones) then act := 0
           else begin
           CantAt := CantAt + 1;
           BuscarMinimoParaListaTotal(v,e,emin,hayAtenciones);
           end;
         end;
           a.aTot := CantAt;
           AgregarAlFinal(ln,aux,a);
    end;
 end;
{procedure Merge5(var v : vectorE; var ln : listaE );
var
   aux : listaE;
   emin : integer;
   e:emergencia;
begin
 DeterminarMinimo(v,e,emin);
 while(emin <> MAXINT) do begin

   AgregarAlFinal(ln,aux, e );
   DeterminarMinimo(v,e,emin);
 end;
end;
Procedure ImprimirListaE ( pri : listaE);

Begin
 while (pri <> NIL) do begin
   writeLn(pri^.datos.ISBM) ;
          pri:= pri^.sig;
 end;
end;}
procedure ImprimirListaNueva(pri:listaT);
begin
  while (pri <> NIL) do begin
   writeln ('Tipo de emergencia : ',pri^.datos.tipoE) ;
   writeln ('Cantidad de atenciones de este tipo : ',pri^.datos.ATot) ;
   writeln ();
   pri:= pri^.sig;
  end;
end;

procedure BuscarMin(l : listaT ;var min : integer);
begin
  if (l <> nil) then
    if(l^.datos.ATot <= min ) then begin
       min:= l^.datos.ATot;
       buscarMin(l^.sig,min);
    end
  else
     min := -1;
end;

var
  vEmerg : vectorE;
  lNueva : listaT;
  min: integer;
begin
  min:=MAXINT;
  lNueva := NIL;
  InicializarVector(vEmerg);
  CrearVectorListas(vEmerg);
  MergeAcumulador(vEmerg, lNueva);
  writeln('Imprimiendo lista acumuladora: ');
  ImprimirListaNueva(lNueva);
  BuscarMin(lNueva,min);
  Writeln('El tipo de emergencia con menos atenciones es el ',min);
  readln();
end.

