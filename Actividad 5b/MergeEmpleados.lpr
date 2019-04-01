program MergeEmpleados;

const
  DF = 4;
  emp = 15;
type
  empleado = record
    cod : integer;
    apellido : string;
    anyoIngreso : integer;
    categoria : integer;
  end;
  lista = ^nodo;
  nodo = record
    datos : empleado;
    sig : lista;
  end;

  vectorCategoria = array [1..DF] of lista;

procedure InicializarVector(var cat : vectorCategoria);
var
  i : integer;
begin
   for i:= 1 to DF do
       cat[i] := nil;
end;
procedure CargarEmpleado(var E : empleado; var cat : integer);
begin
   randomize;
   E.cod:= random(100);
   write('Ingresar el apellido del empleado : ');
   readLn(E.apellido);
   write('Ingresar el anyo de ingreso del empleado (1980 a 2018) : ');
   readLn(E.anyoIngreso);
   write('Ingresar la categoria del empleado (1 a 4) : ');
   readLn(cat);
end;
Procedure InsertarOrd ( var pri: lista; emp: empleado);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := emp;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.apellido < emp.apellido) do begin
      ant := act;
      act := act^.sig ;
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
Procedure ImprimirLista ( pri : lista);
Begin
 while (pri <> NIL) do begin
   write (pri^.datos.cod,' | ') ;
          pri:= pri^.sig;
 end;
end;
procedure RecorrerVector(categoria : vectorCategoria);
var
    i: integer;
begin
 for i:= 1 to DF do
 begin
          writeLn('');
          writeLn('Codigo de los empleados de la categoria ', i, ' : ');
          ImprimirLista(categoria[i]);
 end;
 writeLn('Vector recorrido...');
end;

var
  vCategoria: vectorCategoria;
begin
  writeLn('Inicializando vector de listas...');
  InicializarVector(vCategoria);
  writeLn('Creando vector de listas...');
  CrearVector(vCategoria);

  RecorrerVector(vCategoria);
  writeLn('');
  readLn();

end.

