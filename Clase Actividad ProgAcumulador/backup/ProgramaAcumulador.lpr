program ProgramaAcumulador;
uses CRT;
const
  DF = 2;

type
   consumo = record
     tipoConsumo : integer;
     fecha : String;
     monto : real;
   end;
   consumo2 = record
     tipoConsumo : integer;
     monto : real;
   end;
   lista = ^nodo;
   nodo = record
     datos : consumo;
     sig : lista;
   end;
   listaN = ^nodoN;
   nodoN = record
     datos : gastoTot;
     sig : listaN;
   end;
   vectorListas = array[1..dimF] of lista;

procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
end;
procedure AgregarAlFinal (var pri, ult: listaN; c: consumo2);
var
  nue : lista;
begin
 new (nue);
 nue^.datos:= c;
 nue^.sig := NIL;
 if pri <> Nil then
                 ult^.sig := nue;
               else
                 pri := nue;
 ult := nue;
end;
Procedure InsertarOrd ( var pri: lista; c : consumo);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := c;
  nue^.sig := nil;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.tipoConsumo < c.tipoConsumo) do begin
      ant := act;
      act := act^.sig;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
Procedure CrearVector ( var categoria: vectorCategoria);
var
    i,cat : integer;
    E : empleado;
begin
   for i:=1 to emp do
   begin
     CargarEmpleado(E,cat);
     InsertarOrd(categoria[cat],E);
   end;
End;

procedure Minimo(var v:vectorListas; var l:lista);
var
   min , i :integer;
   posmin : integer;
begin
 min:=maxInt;
 posmin := 1;
 l := nil;
 for i:= 1 to df do begin
     if(v[i]<>nil) then begin
       if (v[i]^.datos.ISBN < min) then
          begin
            min:= v[i]^.datos.ISBN;
            posMin := i;
          end;
     end;
 end;
 if(v[posMin] <> nil) then
    begin
       l := v[posmin];
       v[posMin]:=v[posMin]^.sig;
    end;
end;
procedure Merge(var vector: vectorListas; var pri : lista );
var
  pConsumo : lista;
  ant : consumo;
  ult : lista;
begin
 pConsumo := nil;
 ult := nil;
 minimo(vector,pConsumo);
 ant := pConsumo^.datos;
 while(pConsumo<>nil)do
   begin
     while(pConsumo^.datos.tipoConsumo = ant);
     AgregarAlFinal(pri,ult,Plibro^.datos);
     Minimo(vector,Plibro);
   end;
end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do
   begin
       write (pri^.datos.cod,' | ') ;
       pri:= pri^.sig;
   end;
end;
procedure ImprimirVectorListas(Vec : vectorListas);
var
   i : integer;
begin
 TextColor(27);
 for i := 1 to DF do
   begin
            writeLn('Lista ', i );
            ImprimirLista(vec[i]);
   end;
 TextColor(26);
end;
Procedure ImprimirListaNueva ( pri : listaN);
Begin
 while (pri <> NIL) do begin
   delay(100);
   write(pri^.datos.tipoConsumo,' ') ;
   write(pri^.datos.montoTotal) ;
   writeLn();
          pri:= pri^.sig;
 end;
 writeLn('se imprimio la lista');
end;
var
  i : integer;
  vector : vectorListas;
  ln : listaN;
begin
  Randomize;
  ln := nil;
  TextColor(26);
  InicializarVector(vector);
  CrearVectorListas(vector);
  writeLn('Imprimiendo Vector de listas...');
  ImprimirListas(vector);
  MergeAcumulador(vector,ln);
  writeLn('Imprimiendo Lista Nueva ...');
  ImprimirLista(ln);
  readKey();
end.

