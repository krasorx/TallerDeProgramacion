program ArbolOrdenado;
uses CRT,DOS;
// Cargar una lista de Usuarios de Stand
// cada stand tiene estadisticas
// Poder Destructivo: A
// Velocidad: A
// Rango: C
// Durabilidad: A
// Precisión: A
// Potencial: A
// La lista se ordenada en orden de llegada
// y se actualizan los char a mayuscula
// Cargar un vector de listas con los Stand
// cada lista guarda un tipo de Stand

// Merge a arbol de busqueda binario
// ordenado por nombre del usuario
// un usuario puede tener mas de un stand

// Funcion se le ingresa un nombre de stand y devuelve el tipo
// so its the same type of stand as Star Platinum

// Obtener el Stand con menor rango
// imprimir todos los stand con precision entre C y A

// tipos de stand
// 1 : stands rango corto
// 2 : stands automaticos
// 3 : stands rango alto
// 4 : stands atado
// 5 : stands armadura
// 6 : stands colonia
// 7 : Requiem
const
    df = 7;
type
    stand = record
        Poder : char;
        Velocidad : char;
        rango : char;
        Durabilidad : char;
        precision : char;
        Potencial : char;
        tipo : integer;
        standMaster : string[50];
        standName : string[50];
    end;
    lista = ^nodo1;
    nodo1 = record
            datos : stand;
            sig: lista;
    end;
    arbol = ^nodo;
    nodo = record
        HI : arbol;
        HD : arbol;
        datos : lista;
    end;
    vectorListas = array[1..df] of lista;

procedure InicializarVector(var v : vectorListas);
var
  i : integer;
begin
   for i:= 1 to df do
       v[i] := nil;
end;

procedure AgregarAlFinal (var pri, ult: lista; s: stand);
var
    nue : lista;
begin
    new (nue);
    nue^.datos:= s;
    nue^.sig := NIL;
    if pri <> Nil then
                    ult^.sig := nue
                else
                    pri := nue;
    ult := nue;
end;

Procedure InsertarOrd ( var pri: lista; s : stand);
var
   ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := s;
  nue^.sig := nil;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posicion correcta}
  while (act<>NIL) and (act^.datos.tipo < s.tipo) do begin
      ant := act;
      act := act^.sig;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

procedure CargarStandFile(var stand:stand;var archivo:text);
begin
    readLn(archivo, stand.standMaster);
    readLn(archivo, stand.standName);
    readLn(archivo, stand.poder);
    readLn(archivo, stand.velocidad);
    readLn(archivo, stand.rango);
    readLn(archivo, stand.durabilidad);
    readLn(archivo, stand.potencial);
    readLn(archivo, stand.precision);
    readLn(archivo, stand.tipo);
end;

procedure CargarStandTeclado(var stand:stand);
begin
    TextColor(30);
    write('Ingresar el nombre del Stand : ');
    readLn(stand.standName);
    if(stand.standName <> 'zzz')then
    begin
        write('Ingresar el nombre del usuario : ');
        readLn(stand.standMaster);
        writeln('Rango de poder E .. A');
        write('Ingresar el poder destructivo : ');
        readLn(stand.poder);
        write('Ingresar la velocidad : ');
        readLn(stand.velocidad);
        write('Ingresar el rango : ');
        readLn(stand.rango);
        write('Ingresar la durabilidad : ');
        readLn(stand.durabilidad);
        write('Ingresar la precision : ');
        readLn(stand.precision);
        write('Ingresar el potencial de desarrollo : ');
        readLn(stand.potencial);
        write('Ingresar el tipo de stand (1..6) : ');
        readLn(stand.tipo);

        writeLn('------------');
    end;
    TextColor(31);
end;

//Por alguna razon no carga el ultimo stando
procedure CargarListaStandsFile(var l:lista;var archivo:text);
var
    st : stand;
    ult : lista;
begin
    ult := nil;
    reset(archivo);
    CargarStandFile(st,archivo);
    while (not Eof(archivo)) do
    begin
        AgregarAlFinal(l,ult,st);
        writeLn('Added');
        CargarStandFile(st,archivo);
    end;
end;

procedure CargarListaStands(var l:lista);
var
    st : stand;
    ult : lista;
begin
    ult := nil;
    CargarStandTeclado(st);
    while(st.standName <> 'zzz')do
    begin
        AgregarAlFinal(l,ult,st);
        CargarStandTeclado(st);
    end;
end;

procedure GuardarLista(stands:lista;var archivo:text);
begin
    append( archivo );
    while(stands <> nil)do
    begin
        writeln(archivo,stands^.datos.standMaster);
        writeln(archivo,stands^.datos.standName);
        writeln(archivo,stands^.datos.poder);
        writeln(archivo,stands^.datos.velocidad);
        writeln(archivo,stands^.datos.rango);
        writeln(archivo,stands^.datos.durabilidad);
        writeln(archivo,stands^.datos.precision);
        writeln(archivo,stands^.datos.potencial);
        writeln(archivo,stands^.datos.tipo);
        stands := stands^.sig;
    end;
end;

Procedure CrearVectorListas ( var v: vectorListas;l : lista);
var
    i: integer;
    s : stand;
begin
    while (l <> nil) do
    begin
        i := l^.datos.tipo;
        s := l^.datos;
        InsertarOrd(v[i],s);
        l := l^.sig;
    end;
End;

procedure ImprimirLista(l : lista);
begin
   while(l<>nil)do
   begin
       writeLn(l^.datos.standMaster, ' | ', l^.datos.standName, ' | ',
               l^.datos.tipo);
       l:=l^.sig;
   end;
end;

procedure ImprimirVectorListas(Vec : vectorListas);
var
   i : integer;
begin
 TextColor(27);
 for i := 1 to DF do
   begin
            TextColor(28);
            writeLn('Tipo ', i );
            TextColor(27);
            ImprimirLista(vec[i]);
   end;
 TextColor(26);
end;

procedure AgregarAdelante(var l: Lista; s: stand);
var
  aux: lista;
begin
  new(aux);
  aux^.datos := s;
  aux^.sig := l;
  l:= aux;
end;

procedure InsertarArbol(var a : arbol ;var st : stand;var ln : lista);
var
   aux : arbol;
begin
    if (a = NIL) then
    begin
        ln := nil;
        AgregarAdelante(ln,st);
        new (aux);
        aux^.datos := ln;
        aux^.HI := NIL;
        aux^.HD := NIL;
        a := aux;
    end
    else
    begin
        if (st.standMaster < a^.datos^.datos.standMaster) then
        begin
            InsertarArbol(a^.HI,st,ln);
        end
        else if(st.standMaster > a^.datos^.datos.standMaster) then
        begin
            InsertarArbol(a^.HD,st,ln);
        end;
        if(st.standMaster = a^.datos^.datos.standMaster)then
            begin
                AgregarAdelante(a^.datos,st);
                //writeLn('added');
            end;
    end;
end;

procedure DeterminarMinimo(var v:vectorListas; var min : string; var posmin : integer);
var
   i,cont :integer;
begin
    min:='ZZZ';
    posmin := 1;
    for i:= 1 to df do
    begin
        if(v[i] <> nil) then
        begin
            if(v[i]^.datos.standMaster <= min)then
            begin
                min := v[i]^.datos.standMaster;
                posMin := i;
            end;
        end;
    end;
    //if(v[posMin] <> nil)then
    //begin
    //    v[posMin] := v[posMin]^.sig;
    //end;
end;

//Esto es un merge a un arbol
procedure ArmarArbolito(v : vectorListas; var arb : arbol );
var
  min : string;
  posmin : integer;
  ln : lista;
begin
    ln := nil;
    DeterminarMinimo(v,min,posmin);     {Arbol ordenado por nombre de usuario de stand}
    while (v[posmin] <> NIL) do begin
            //writeLn(v[posmin]^.datos.standName);
            InsertarArbol(arb,v[posmin]^.datos,ln);
            v[posMin] := v[posMin]^.sig;
            DeterminarMinimo(v,min,posmin);
    end;
end;

procedure ImprimirLista2(var l:lista;var tree:text);
var
  aux : lista;
begin
    aux := l;
    while(aux<>nil)do
    begin
        writeLn(aux^.datos.standMaster, ' ',aux^.datos.standName);
        writeLn(tree,aux^.datos.standMaster, ' ',aux^.datos.standName);
        aux:=aux^.sig;
    end;
end;

Procedure EnOrden( a: arbol;var tree:text);
begin
  if( a <> nil) then
       begin

         EnOrden(a^.HI,tree);
         ImprimirLista2(a^.datos, tree);
         EnOrden(a^.HD,tree);
       end;
end;

function BuscarRamita(arb : arbol; valor:string):arbol;
begin
  if (arb <> nil) then
    if(arb^.datos^.datos.standMaster = valor) then
       BuscarRamita:= arb
    else
        if (arb^.datos^.datos.standMaster > valor) then
             BuscarRamita := BuscarRamita(arb^.HI, valor)
          else
             BuscarRamita := BuscarRamita(arb^.HD, valor)
  else
      BuscarRamita := nil;
end;

procedure RecorridoAcotado(arb: arbol; inf: char; sup: char);
var
    aux : lista;
begin
 if (arb<>nil) then
   begin
        if (arb^.datos <> nil) then
        begin
             aux := arb^.datos;
             while(aux <> nil)do
             begin
                  if(aux^.datos.precision >= inf)then
                  begin
                       if(aux^.datos.precision <= sup)then
                       begin
                            writeLn(aux^.datos.standName,' con precision ', aux^.datos.precision);
                            aux := aux^.sig;
                       end
                       else
                       begin
                           aux := aux^.sig;
                           recorridoAcotado (arb^.HI, inf, sup)
                       end;
                  end
                  else
                  begin
                      aux := aux^.sig;
                      recorridoAcotado (arb^.HD, inf, sup);
                  end;
                 //aux := aux^.sig;
            end;
             recorridoAcotado(arb^.HI, inf, sup);
             recorridoAcotado(arb^.HD, inf, sup);
             // Funciona pero imprime repetidos a veces
             // ni idea porque
        end;
    end;
 end;

///////////////////////////// MAIN /////////////////////////////

var
    stands: lista;
    archivo: text;
    tree : text;
    vector : vectorListas;
    c,d : char;
    arb,arb2 : arbol;
    s : string;
begin
    TextColor(22);
    stands := nil;
    arb := nil;
    InicializarVector(vector);
    assign(archivo, 'stands.txt');
    assign(tree, 'stands_tree.txt');
    write('Cargar lista desde el archivo? s/n : ');
    ReadLn(c);
    if(c = 's')then
    begin
        CargarListaStandsFile(stands,archivo);
    end
    else
    begin
        CargarListaStands(stands);
        GuardarLista(stands,archivo);
    end;
    close( archivo );                (* Finalmente cerramos *)
    ImprimirLista(stands);
    CrearVectorListas(vector,stands);
    ImprimirVectorListas(vector);
    write('Presione "A" para crear un arbol usando a Gold Experience : ');
    ReadLn(c);
    if(c = 'a')then
    begin
        ArmarArbolito(vector,arb);
        Rewrite(tree);
        EnOrden(arb,tree);
        close(tree);
    end;

    write('Ingresar el nombre de un usuario y se imprimira su stand : ');
    readLn(s);
    arb2 := BuscarRamita(arb,s);
    if(arb2 <> nil)then ImprimirLista(arb2^.datos)
            else
                writeLn('No es un usuario de stand');

    writeLn('Ingrese el rango de precision y se imprimiran todos los stands que correspondan : ');
    readLn(c);
    readLn(d);
    WRITELN('INF:',c,' SUP:', d );
    RecorridoAcotado(arb,c,d);

    write('Presione cualquier tecla para finalizar...');
    readKey();

end.
