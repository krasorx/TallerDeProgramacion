program Alumnos_Facultad;
uses crt;
const
  dimF = 5;
type
  alumno = record
    codAlumno : integer;
    codMateria : integer;
    fechaExamenFinal : String;
    notaExamenFinal : integer;
  end;
  lista = ^nodo;
  nodo = record
    datos : alumno;
    sig : lista;
  end;
  arbol = ^nodoArb;
  nodoArb = record
    HI : arbol;
    HD : arbol;
    datos : alumno;
    end;
  vectorListas = array[1..dimF] of lista;
procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
end;
procedure Musica();
begin

   sound(1500);
   delay(600);
   sound(3500);
   delay(50);
   sound(3500);
   delay(300);
   sound(2500);
   delay(300);
   sound(1500);
   delay(300);
   sound(700);
   delay(300);
   NoSound();
end;
procedure CargarAlumno(var a : alumno);
begin
 TextColor(26);
 write('Ingresar el codigo de materia (0 para finalizar): ');
 readLn(a.codMateria);
 if(a.codMateria <> 0)then begin
   write('Ingresar la fecha edel examen final : ');
   readLn(a.fechaExamenFinal);
   write('Ingresar el codigo de alumno : ');
   readLn(a.codAlumno);
   write('Ingresar la nota del examen final : ');
   readLn(a.notaExamenFinal);
 end;
end;
Procedure CrearListaOrdenada ( var pri: lista; a : alumno);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := a;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.codMateria < a.codMateria) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
Procedure AgregarAlFinal(var p, Ult: lista; var a:alumno );
Var
nue : lista;
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
Procedure CrearVectorListas (var v:vectorListas);
var
   a : alumno;
   i,h : integer;
begin
     for i:=1 to dimF do
     begin
         TextColor(5);
         writeLn('Lista ',i);
         CargarAlumno(a);
         while(a.codMateria <> 0)do
         begin
           CrearListaOrdenada(v[i],a);
           CargarAlumno(a);
         end;
     end;
end;
procedure DeterminarMinimo(var v: vectorListas; var posmin : integer);
var
   min, i: integer;
Begin
  min:=MAXINT;
  posMin := 9999;
  for i:= 1 to dimF do
    begin
       if (v[i] <> nil) then begin
         if(v[i]^.datos.codMateria < min) then begin
                  min:= V[i]^.datos.codMateria ;
                  posMin:= i;
         end;
       end;
    end;
end;
procedure MergeComun(v : vectorListas; var ln : lista );
var
   lnF : lista;
   alum : alumno;
   pos : integer;
begin
  lnF := nil; pos := 9999;
  DeterminarMinimo(v,alum,pos);
  while(pos <> 9999)AND(v[pos] <> nil)do
  begin
    alum := v[pos]^.datos;
    v[pos] := v[pos]^.sig;
    AgregarAlFinal(ln,lnF, alum);
    DeterminarMinimo(v,alum,pos);
  end;
end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   writeLn('numero de alumno : ',pri^.datos.codAlumno,' Cod materia: ',pri^.datos.codMateria) ;
          pri:= pri^.sig;
  end;
  writeLn('se imprimio la lista');
end;
procedure InsertarArbol(var a : arbol ;var alum : alumno);
var
   aux : arbol;
begin
  if (a = NIL) then begin
    new (aux);
    aux^.datos := alum;
    aux^.HI := NIL;
    aux^.HD := NIL;
    a := aux;
  end
  else
      if (alum.codAlumno <= a^.datos.codAlumno) then         // Si el dato es menor al dato en arbol
         InsertarArbol(a^.HI,alum)       // lo inserta en el hijo izquierdo
      else                            // si el dato es mayor al dato en arbol
         InsertarArbol(a^.HD,alum);  // lo inserta en el hijo derecho
end;
procedure ArmarArbolito(var l : lista; var arb : arbol );
var
  aux : lista;
begin
  aux := l;
  while (aux <> NIL) do begin
     if((aux^.datos.codAlumno > 1000)AND(aux^.datos.codAlumno < 1100) ) then
           InsertarArbol(arb,aux^.datos);
     aux:= aux^.sig;
  end;
end;
function cuentanodos(a : arbol) : integer;
begin
   if (a = nil) then
      cuentanodos := 0
   else
      cuentanodos := 1 + cuentanodos(a^.HI) + cuentanodos(a^.HD);
end;
{programa principal}
var
   vec : vectorListas;
   ln : lista;
   arb : arbol;
begin
  ln := nil; arb := nil;
  InicializarVector(vec);
  CrearVectorListas(vec);
  MergeComun(vec,ln);
  ImprimirLista(ln);
  ArmarArbolito(ln,arb);
  writeLn(cuentanodos(arb));
  Musica();
  readKey();
end.

