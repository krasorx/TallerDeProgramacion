program NumAleatorio;

var ale, i,c: integer;

begin
     c := 0;
     write('Ingresar un entero entre 0 y 10 : ');
     readLn(i);
     while(i <> 5) do begin
        Randomize;
     
        ale := random (11); {valores en el intervalo 0 a 99}
       write('Ingresar un entero entre 0 y 10 : ');

       if (ale = i) then
          c:= c+1;
       writeln ('El numero aleatorio generado es: ', ale);
       readLn(i);
     end;
     writeLn('Hubo ', c, ' coincidencias.');
     readln;
end.
