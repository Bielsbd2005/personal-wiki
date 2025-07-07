1. Abre una terminal i ve a tu home. Inicializa la historia del terminal $ script -a HistoriaT2.2

2. Crea el directorio curso y cambia a él. No te muevas de aquí si no se te indica lo contrario.

3. Utilizando una sola orden (u.u.s.o.) crea la siguiente estructura de directorios:
    curso---1---11
                12---121
            2---21
                22---221

4. Muestra como ha quedado con tree.

5. Desde tu home. Copia los ficheros /etc/hosts y /etc/passwd a curso usando una sola orden de copia.

6. Ve al directorio curso. Cambia el nombre del fichero hosts a cursillo1 y de passwd a cursillo2

7. Enlaza el fichero cursillo1 con curso1 (ln)

8. Modifica el fichero curso1 con un editor, añadiéndole tu nombre en la primera línea.

9. Visualiza el contenido de cursillo1. ¿Se ha modificado también?

10. Elimina cursillo1, ¿continúas teniendo curso1?

11. Elimina con confirmación curso1

12. Busca todos los directorios que se encuentran dentro del directorio  /etc (find)

13. Busca todos los ficheros de /etc que terminen en d

14. Busca todos los ficheros de /etc que empiecen por pa

15. ¿Todavía estás en curso? Crea el fichero cursillo1 con cero bytes (touch).

16. Edita el archivo cursillo1 con el editor nano y escribe tu nombre y dirección en él. Guárdalo y sal del editor.

17. Usa cat para añadir el contenido de cursillo2 al final de cursillo1

18. Muestra el contenido de las últimas 15 líneas de cursillo2 (tail)

19. Visualiza las 20 primeras líneas de cursillo1 (head)

20. Muestra el contenido de cursillo2 a partir de la línea 10

21. Ejecuta "more cursillo1" y utiliza los comandos de las pausas indicados en las hojas del curso para moverte a través de él (pulsa h para ver la ayuda interactiva del comando).

22. Ejecuta "less cursillo1" y utiliza sus comandos interactivos para moverte a través de él (pulsa h para ver la ayuda interactiva del comando).

23. En una sola línea de instrucción usando dos órdenes de copia separadas por ";", copia el fichero "/etc/hosts" al fichero cursillo1 y también al fichero cursillo2   (machacando su contenido anterior)

24. Ve a tu home, borra toda la estructura que hemos creado en esta sesión (curso)

25. Ve a tu home

26. Crea el directorio curso y cambia a él

27. Utilizando una sola orden (u.u.s.o.) crea la siguiente estructura de directorios:
    curso---1---11---111
                     112
            2---21
                22

28. Muestra como ha quedado con tree

29. Entra en el directorio curso. Copia el fichero "/etc/passwd" al directorio "1/11" poniéndole como nombre "cursillo1"

30. Ejecuta el comando who y guarda el resultado en el fichero cursillo2 (redirección de salida >)

31. Cuenta las líneas que hay en el fichero cursillo2 (wc), esto te dará el número de usuarios conectados

32. Haz lo mismo (who y wc), pero sin usar un fichero intermedio (usando una tubería | )

33. Guarda el calendario del mes de enero de 2023 en el fichero "curso3" (redirección de salida >)

34. Añade detrás de curso3 el calendario del mes de febrero y detrás el de marzo (redirección de salida >>)

35. Edita el fichero curso3 usando el editor y añade una línea de guiones (----) de separación entre los meses. Añade también una línea al principio que ponga en mayúsculas: CALENDARIO DE LOS 3 PRIMEROS MESES DE 2023

36. Ejecuta el comando "ls -R" mostrando el resultado por pantalla y al mismo tiempo guardándolo (tee) en el fichero "curso4"

37. Ejecuta el comando who, guardando el resultado al final de fichero "curso4".

38. Usa cat para ver que se ha añadido corrrectamente

39. Usa el comando grep sobre el fichero "1/11/cursillo1" para encontrar:
    1. Las líneas que contienen root
    2. Las líneas que terminan en sh
    3. Las líneas que empiezan por "a", por "b" o por "c"
    4. Las líneas que tienen "root" o "sys" (-E 'root|sys') en mayúsculas o en minúsculas, visualiza el resultado y guárdalo al mismo tiempo en el fichero "curso5"
    5. u.u.s.o. Las líneas que no contienen "4". Guarda el resultado en "curso6" (tee) y al mismo tiempo cuenta el número de líneas que hay (| wc -l)

40. ¿En qué líneas y ficheros del directorio curso se encuentra la palabra "usuari"?

41. Usa el comando sort para mostrar por pantalla el fichero "1/11/cursillo1" ordenado:
    1. En orden ascendente
    2. En orden descendente
    3. Por el campo del nombre (el quinto) y guardando la salida en el fichero "curso7"

42. u.u.s.o. Usa el comando cut para extraer el campo que contiene el nombre del usuario del fichero "1/11/cursillo1", guarda el resultado en "curso8" y al mismo tiempo usa el comando tr para pasar todos los caracteres a mayúsculas y mostrarlos por pantalla (cut ... |tee ... |tr ...)

43. Usa el comando find para ver cuantos ficheros de toda tu estructura de directorios (partiendo de tu home), contienen el string "cur" en alguna parte de su nombre ("*cur*")

44. Usa el comando diff para encontrar las diferencias en los ficheros (que debes crear) del ejemplo del manual de Linux (orden diff, página 23 - 24)

45. Usa el comando join para unir de forma clasificada los dos ficheros (que debes crear) del ejemplo del manual (orden join, página 24?)

46. Utiliza el comando sed para substituir todos los strings "sh" del fichero 1/11/cursillo1 por "csh", guardando el resultado en el fichero curso9.

47. Ahora borra todos los strings  "root" (substitución por "") del fichero curso9 y guarda el resultado en curso10

48. Ve a tu home.

49. Pon en la variable nombre el resultado de basename $HOME/curso/1/11/cursillo1  (Uso de las comillas de ejecución `  ` y asignación del resultado a una variable)

50. Pon en la variable directorio el resultado de dirname $HOME/curso/1/11/cursillo1

51. Muestra el contenido de las dos variables con: echo "nombre: $nombre y directorio: $directorio"

52. (1) Ejecuta      (sleep 500 ; who) &

53. (2) Ejecuta      (sleep 800 ; ls) &

54. Mira qué procesos tienes ejecutándose y su estado (jobs -l)

55. Reactiva (1) (fg)

56. Pasa (1) a un estado stopped (pulsado Control-Z)

57. Reactiva (1) en modo background (bg %%p_id o bg job_id)

58. Elimina (kill -9) los procesos (1) y (2)
