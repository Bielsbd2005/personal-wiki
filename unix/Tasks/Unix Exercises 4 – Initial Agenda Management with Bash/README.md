
# Gestió inicial de les modificacions d'una agenda

## Tasca individual

Heu de fer la programació de les baixes d'una agenda utilitzant un o varis scripts de Bash (sense usar `awk`).

Abans de començar, reviseu les comandes de manipulació avançada de fitxers (págines 23 a 26)

---

## Fitxer de dades de l'agenda

Crear un fitxer de text anomenat **"AgendaOriginal.data"** que:

- Contingui un mínim de 8 línies amb dades personals.
- Cada línia contindrà les dades d'una persona.
- L'estructura de cada línia serà la següent: **nom;mail;telèfon**.
- Els camps estan separats pel caracter **";"**.
- Cada camp constarà d'una paraula simple (sense espais).

Exemple:
`Josep;josep@gmail.com;655666333`

---

## Modificacions a l'agenda

Crear un script anomenat **"modificar.sh"** per realitzar les modificacions de l'agenda. Se li passaran per paràmetre els 3 camps de les dades d'una persona. Per exemple:

```bash
$ ./modificar.sh Joseph josep@gmail.com 972555555
```

El script haurà de realitzar el següent:

1. Copiar **"AgendaOriginal.data"** a **"Agenda.data"**, d'aquesta forma sempre podreu provar el funcionament sobre el mateix arxiu d'agenda.
2. Copiar els tres paràmetres a variables pròpies internes del script.
3. Mostrar el contingut de l'agenda actual.
4. Verificar que el paràmetre `$2` (el **mail**) existeix a l'agenda.
   - Si el mail `$2` existeix dins l'agenda, mostrarà les dades actuals dins l'agenda i les dades passades per paràmetre, i demanarà si realment es volen canviar les actuals per les noves.
   - Si es confirma, es realitzarà l'operació de modificació de la línia seleccionada de l'agenda.
   - Si no es confirma, es mostrarà un missatge indicant que no es realitza l'operació.
   - En cas contrari, demanarà si es volen afegir les noves dades a l'agenda, i en cas afirmatiu, s'afegiran al final del fitxer.
5. Un cop feta l'operació, s'ha de mostrar tota l'agenda per pantalla ordenada pel camp **mail** (no és necessari ordenar el fitxer, només mostrar el contingut ordenat).

---

## Ampliacions (per obtenir la màxima qualificació)

- Que es demani si es vol realitzar el pas 1 de **Copiar "AgendaOriginal.data" a "Agenda.data"** i fer el que s'indiqui.
- Un cop feta la modificació, que es demani si es vol fer una altra modificació.
  - En cas afirmatiu, demanar els tres camps a modificar i tornar al pas 3.
  - En cas negatiu, sortir del programa.

---

## Ajuda

Les principals ordres que utilitzareu en la programació d'aquest script són:

- `echo`
- `read`
- `cut`
- `sort`
- `grep`
- `sed`
- `head`
- `tail`
- `if [ ] else`
- `var=$( )`
- `var= `` `
- `>`, `>>`, `|`, variables, ...

