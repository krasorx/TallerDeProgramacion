program Merge_Acumulador;
uses crt;
const dimF = 2;
type
    consumo = record
      tipoConsumo : integer;
      fecha : String;
      monto : real;
    end;
    gastoTot = record
      tipoConsumo : integer;
      montoTotal : real;
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
procedure CargarConsumo(var c : consumo);
begin
 TextColor(26);
 write('Ingresar el tipo de consumo (0 para finalizar): ');
 readLn(c.tipoConsumo);
 if(c.tipoConsumo > 0)then begin
   write('Ingresar la fecha en la que se realizo : ');
   readLn(c.fecha);
   write('Ingresar el monto del consumo : ');
   readLn(c.monto);
 end;
end;
procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
   for i:= 1 to dimF do
       v[i] := nil;
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
Procedure AgregarAlFinal(var l, Ult: listaN; var g:gastoTot );
Var
  nue : listaN;
begin
  new (nue);
  nue^.datos:= g;
  nue^.sig := NIL;
  if l <> Nil then
     ult^.sig := nue
  else
      l := nue;
  ult := nue;
end;
procedure CrearVectorListas(var vector : vectorListas);
var
  c : consumo;
  i : integer;
begin
  for i:=1 to dimF do
      begin
        TextColor(3);
        writeLn('Lista ',i,' : ');
        CargarConsumo(c);
        while(c.tipoConsumo > 0)do begin
          InsertarOrd(vector[i],c);
          CargarConsumo(c);
        end;
      end;
end;
procedure DeterminarMinimo(var v: vectorListas; var posmin:integer;var min : integer;var monto:real);
var
  i,j : integer;
Begin
  min:=999;
  monto := 0;
  posmin := -1;
  j := 0;
  for i:= 1 to dimF do     // se repite una vez por cada lista
    begin
       if (v[i] <> nil) then begin
         if (v[i]^.datos.tipoConsumo < min) then
            begin
                  min:= V[i]^.datos.tipoConsumo;
                  posMin:= i;
                  monto := v[posmin]^.datos.monto;
            end;
       end
       else
           begin
             j := j+1;
             if (j= 2)then
                begin
                  posmin := -1;
                  min := 999;
                end;
           end;
    end;
  if (posmin <> -1)then
     v[posmin] := v[posmin]^.sig;  //reacomodo de lista
end;
procedure MergeAcumulador(var v : vectorListas; var ln : listaN);
var
  min, posmin,act,temp : integer;      //min = tipoConsusmo
  lnF : listaN;
  tot,monto : real;
  g : gastoTot;
begin
  lnF := nil;posmin := -1; min:= 999;
  DeterminarMinimo(v,posmin,min,monto);
  act := min;
  while(min <> 999) do
  begin
    temp := act;
    tot := 0;
    g.tipoConsumo:=act;
    while((act = temp)AND (posmin <> -1))do
    begin
      tot := tot + monto;
      DeterminarMinimo(v,posmin,min,monto);
      act := min;
    end;
    g.montoTotal:=tot;
    AgregarAlFinal(ln,lnF,g);
    writeLn('Elemento agregado a la lista.');
  end;

end;
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   delay(100);
   write(pri^.datos.tipoConsumo,' ') ;
   write(pri^.datos.monto) ;
   writeLn();
          pri:= pri^.sig;
 end;
 writeLn('se imprimio la lista');
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
  vec : vectorListas;
  ln : listaN;
begin
  InicializarVector(vec);
  ln := nil;
  CrearVectorListas(vec);
  TextColor(27);
  writeLn('Lista 1 : ');
  ImprimirLista(vec[1]);
  writeLn('Lista 2 : ');
  ImprimirLista(vec[2]);
  MergeAcumulador(vec,ln);
  TextColor(29);
  writeLn('Lista nueva : ');
  ImprimirListaNueva(ln);
  readKey();
end.

