En aquesta tasca començarem a treballar amb les comandes bàsiques de terminal de linux.

* Per realitzar la tasca s'ha d'anar llegint el document d'estudi Materials propis d'aprenentatge de unix publicats en aquest tema (fins la pàgina 18) i al mateix temps que es llegeix, anar contestant les preguntes amb les comandes adequades.

---

1. Entra en unix en modo gráfico y abre una terminal

2. ¿Cuál es tu identificador de usuario?

3. ¿A qué grupo perteneces?

4. ¿Cuál es tu directorio por defecto (el home)?

5. Utiliza las teclas de recuperación de comandos (cursores arriba y abajo) para recuperar órdenes anteriores (no es necesario hacer una captura de pantalla).

6. Del punto 2.4 de los apuntes, ejecuta todos los comandos en negrita para observar y comprender su funcionamiento. Consulta la ayuda del comando si tienes dudas de los mismos (man) y aprender cuáles son sus parámetros y sus usos.

7. Activa la grabación del histórico del terminal ejecutando script -a  HistoriaT2.1. Podrás finalizar la recogida de datos con Control-D o escribiendo exit

8. visualiza el calendario del mes de septiembre de 1752 y después el calendario de todo el año 1999

9. Busca qué usuarios están conectados en este momento (visualizando el número de pid). En esta sesión de linux seguramente sólo te verás a ti mismo.

10. Borra la pantalla.

11. Termina el script del historico de comandos con exit i visualiza el contenido del fichero  HistoriaT2.1 (cat HistoriaT2.1).

12. Vuelve a ejecutar $ script -a  HistoriaT2.1 para activar la historia del terminal añadiendo al final del fichero.

13. Observa cuánto tarda en ejecutarse la siguiente orden   $ (sleep 10; ls)  (los paréntesis agrupan los dos comandos y el ; ejecuta el segundo comando al terminar el primero, uno detrás del otro)

14. Cambia al directorio /etc

15. Muestra su contenido.

16. Muestra en qué directorio te encuentras.

17. Ve a tu HOME. (no a /home, si no a tu directorio de trabajo por defecto)

18. Crea el directorio curso y cambia a él.

19. Utilizando una sola orden (u.u.s.o.) mkdir crea la siguiente estructura de directorios (practica el uso de la \ si se supera el largo de una línea de instrucción al pasar una lista de directorios o ficheros en una misma orden). Por ejemplo:  mkdir 1 2 3 1/11 1/12 1/12/121 …. (poner el resto de directorios en esta orden)
    curso---1---11
                12---121
                     122
            2
            3---31
                32
                33

20. Muestra gráficamente la estructura creada usando tree. Se instala con sudo apt-get install tree

21. Sin moverte del directorio curso y u.u.s.o., borra el directorio 122 (camino relativo)

22. Muestra como ha quedado con tree.

23. u.u.s.o. Borra toda la estructura de directorios que está debajo de 3 (camino absoluto)

24. Muestra como ha quedado con tree.

25. u.u.s.o. Cambia al directorio 121

26. u.u.s.o. Sin moverte de 121, crea la siguiente estructura de directorios, usando solamente nombres relativos para los directorios (por ejemplo: mkdir ../../../4   ../../../4/41 etc)
    curso---4---41---411
                     412

27. Muestra como ha quedado con tree.

28. u.u.s.o. Sin moverte de 121, crea la siguiente estructura de directorios, usando nombres absolutos para los directorios (/home/usuari/curso/5, ...)
    curso---5---51---511
                52

29. Muestra como ha quedado con tree.

30. u.u.s.o. vuelve al directorio curso usando su nombre absoluto.

31. Después verifica en que directorio te encuentras.

32. muestra visualmente la estructura de directorios que tienes debajo de curso y su contenido con un ls recursivo

33. ¿Estás en el directorio curso?, si no es así, ve a él, no te muevas de este directorio hasta que se te indique específicamente.

34. Usa el comando cat para crear un fichero llamado cursillo1 que contenga en 4 líneas: tu nombre, dirección, teléfono y población de nacimiento (cat > cursillo1  , recuerda usar Control-D para terminar)

35. Crea ahora un fichero llamado cursillo2 que contenga el nombre de tus padres y su teléfono.

36. Copia cursillo1 a cursillo11

37. Muestra el contenido de los tres archivos con more cursillo*

38. Usa cat para unir cursillo1, cursillo2  y cursillo11 en un único fichero nuevo llamado cursillo3 (usa >)

39. Usa cat cursillo3 para comprobar que el resultado es el esperado (muestra el contenido de cursillo3)

40. Usando nombres relativos al directorio actual, copia u.u.s.o. cursillo1 y cursillo2 al directorio 121

41. u.u.s.o. copia el fichero "/etc/passwd" al directorio curso poniéndole el nombre "ascii"

42. Cambia el nombre del fichero "ascii" poniéndole el nombre "cursillo4"

43. En una sola línea de instrucción, ejecuta 4 instrucciones para copiar cursillo4 4 veces al directorio 41 con nombres c1, c2, c3 y c4 (usa ; para separar las instrucciones y \ si llegas a final de línea)

44. Muestra el contenido largo (ls -lisa) del directorio 41

45. u.u.s.o. Ve al directorio 5

46. Cambia el nombre del directorio 51 por 53

47. Muestra como ha quedado la estructura del directorio curso (tree /home/usuari/curso)

48. Sin moverte de 5 ¿De qué tipo son los ficheros que se encuentran en el directorio curso?


49. Usa  ls -lisa para averiguar qué ficheros del directorio curso cumplen con los siguientes patrones:
    1. *
    2. ?
    3. *[1-3]
    4. *[!12]
    5. cursillo[1-9]
    6. c*
    7. cursillo?


50. Usa las distintas opciones de ls para ver el contenido del directorio curso (sin moverte de 5). Puedes usar la ayuda man ls   para investigarlas.

51. Ve a tu home.

52. u.u.s.o. borra toda la estructura de directorios que hemos creado en esta sesión (curso)

53. Crea el directorio curso y cambia a él.

54. Utilizando una sola orden (u.u.s.o.) crea la siguiente estructura de directorios:
    curso---1---11
                12---121
                13---131
            2---21
                22

55. Muestra como ha quedado con tree.

56. ¿Qué permisos tiene el directorio curso? Justifica siempre los resultados que vas obteniendo en relación a los permisos, especialmente cunado no puedes realizar la acción que se solicita

57. ¿Un compañero de tu grupo, podría acceder a curso para leer su contenido?

58. Ve a tu home.

59. Elimina todos los permisos para todo el mundo de curso y verifícalo con ls -l. Usa el formato simbólico de chmod hasta nuevo aviso.

60. Asegúrate de que estás en tu home.

61. Intenta entrar dentro de curso. ¿Puedes entrar?

62. Añade el permiso de ejecución para ti a curso. ¿Puedes entrar ahora en él?

63. Desde dentro de curso, lista los permisos del mismo.

64. Copia el fichero "/etc/hosts" hasta curso (usa el .). ¿Da algún error?

65. Añade el permiso de escritura para ti a curso (estando dentro del mismo!!)

66. Prueba ahora a copiar otra vez "/etc/hosts" a curso con el nombre "cursillo1"

67. Intenta ver el contenido del directorio curso con ls. ¿Algún problema?

68. Añade el permiso de lectura para ti a curso (hasta nuevo aviso, usa el formato de números octales XYZ en lugar de usar el formato simbólico en el comando chmod).

69. Vuelve a usar ls para ver el contenido del directorio, ahora deberías poder hacerlo todo.

70. Elimina todos los permisos para todo el mundo del fichero cursillo1

71. Intenta ver el contenido de cursillo1

72. Añádele el permiso de lectura para ti y vuelve a probarlo.

73. Prueba a borrar cursillo1. Como eres el propietario, te informa de los permisos y te pregunta si realmente quieres bórralo. Contéstale que sí.

74. Usa umask 777 para eliminar todos los permisos por defecto de los ficheros que se vayan a crear en el futuro.

75. Verifícalo con umask

76. Usa cat para crear un fichero llamado "cursillo1" de tres líneas con tu nombre, dirección y teléfono.

77. Comprueba qué permisos tiene asignados el fichero cursillo1

78. Añádele a cursillo1 todos los permisos sólo para ti (eliminando el resto de permisos  para grupo y mundo).

79. Quita el permiso de escritura para ti al directorio actual (.) Intenta borrar el fichero cursillo1

80. Vuelve a añadir el permiso de escritura para ti al directorio actual y borra el fichero cursillo1

81. Pon umask 022 para volver a activar los permisos por defecto en la creación de ficheros.

82. Ve a tu home y mira el contenido del fichero .bashrc

83. Cópialo a .bashrc.old

84. Usa el editor xed y añade al final del fichero .bashrc una línea de bienvenida (echo Bienvenido) y otra con umask 020. Guarda el archivo (no salgas todavía del editor).

85. Abre una nueva terminal. ¿Aparece el mensaje? Comprueba que máscara tienes activa con umask

86. Desde el editor del fichero .bashrc elimina las dos últimas líneas para dejarlo como estaba originalmente.

87. Ve a tu home

88.Elimina toda la estructura de directorios que hemos creado en esta sesión (curso)

89. Haz un listado recursivo para verificar que ya no lo tienes ls -R

90.Si no has cambiado de terminal en ningún momento, cierra la historia del terminal (con <Control-D>). En el fichero de historia tendrás un log de todo lo que has ido haciendo

