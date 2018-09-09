program ProgramaPalindrome;//Implementar un programa que informe si una lista de caracteres representa una palabra palíndrome
//(Palindrome: que se lee igual de izquierda a derecha que de derecha a izquierda)
uses crt;
type
    lista = ^nodo;
    nodo = record
         datos : char;
         sig : lista;
    end;
Procedure CrearListaAgregarAtras(var L, Ult: lista; per:char);
Var
nue : lista;
begin
 new (nue);
 nue^.datos := per;
 nue^.sig := NIL;
 if l <> Nil then
    ult^.sig := nue
 else
     l := nue;
 ult := nue;
end;
procedure CargarDatos(var l:lista);
var
c : char;
ult : lista;
begin
 ult := NIL;
 write('Ingresar una letra de una palabra (0 para terminar): ');
 c := readKey();
 writeLn(c);
 while (c <> '0')do begin
   CrearListaAgregarAtras(l,ult,c);
   write('Ingresar otra letra de la palabra (0 para terminar): ');
   c := readKey();
   writeLn(c);
 end;
end;
Procedure ImprimirListaEnOrden (var l : lista);
var
pri : lista;
Begin
 pri := l;
 Delay(100); {1000 milliseconds}
 if (pri <> NIL) then begin
   write(pri^.datos);
   pri := pri^.sig;
   ImprimirListaEnOrden(pri);
 end;
end;
{
Procedure ImprimirListaEnOrdenInverso ( pri : lista);
var
 aux : lista;
Begin
 aux := pri;
 if (pri <> NIL) then begin
   pri := pri^.sig;
   ImprimirListaEnOrdenInverso(pri);
   if (pri <> NIL) then writeLn (pri^.datos) ;
 end;
end;
}
procedure VerificaPalindromo(var l: lista; var esPalindromo:boolean; var aux:lista);
var
pri : lista;
letra,letra2 : char;
Begin
 pri := l;
 if (pri <> NIL)AND (esPalindromo) then begin
   letra := aux^.datos;
   writeLn('letra : ',letra);
   pri := pri^.sig;

   if (pri <> NIL) then letra2 := pri^.datos;  //letra actual
   VerificaPalindromo(pri,esPalindromo,aux);
   letra := aux^.datos;
   if (pri <> NIL)AND(esPalindromo) then
      begin
        writeLn('valores ',' let1 : ',letra,' let2 : ',pri^.datos);
        if (letra2 = letra) then begin esPalindromo := TRUE;
                                       aux := aux^.sig;

        end
        else esPalindromo := FALSE;
      end;
 end;
end;
procedure Informar(p : boolean);
begin
 writeLn();
 if (p) then  begin
    textColor(18);
    writeLn('La palabra ingresada es un palindromo.')
 end
 else
    begin
    textColor(20);
    writeLn('La palabra ingresada NO es un palindromo.');
 end;
    TextColor(21);
end;

var
l,aux : lista;
esPalindromo : boolean;
i : integer;
c : char;
begin
  c := 'y';
  while NOT((c = 'n') or (c = 'N'))do begin
    textColor(14);
    l := NIL;
    esPalindromo := true;
    CargarDatos(l);
    aux := l;
    WriteLn('Lista en orden ');
    ImprimirListaEnOrden(l);
    writeLn();
    for i:= 1 to 3 do begin
        write('.');
        Delay(300); {1000 milliseconds}
    end;
    writeLn();
    VerificaPalindromo(l,esPalindromo,aux);
    Informar(esPalindromo);
    writeLn('n/N para finalizar, y/Y para continuar.');
    c := readKey();
    writeLn();
  end;
  writeLn('Fin del programa.');
end.

