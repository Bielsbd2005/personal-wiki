
# Fitxer de dades de l'agenda

## Crear un fitxer de text anomenat "AgendaOriginal.data" que:

- Contingui un mínim de 8 línies amb dades personals.
- Cada línia contindrà les dades d'una persona.
- L'estructura de cada línia serà la següent: **nom;mail;telèfon**.
- Els camps estan separats pel caracter **";"**.
- Cada camp constarà d'una paraula simple (sense espais).

Exemple:
`Josep;josep@gmail.com;655666333`

---

## Modificacions a l'agenda

Crear un script anomenat **"modificarAwk.sh"** per realitzar les modificacions de l'agenda. Se li passaran per paràmetre els 3 camps de les dades d'una persona. Per exemple:

```bash
$ ./modificarAwk.sh Joseph josep@gmail.com 972555555
```

El script haurà de realitzar el següent:

1. Copiar **"AgendaOriginal.data"** a **"Agenda.data"**, d'aquesta forma sempre podreu provar el funcionament sobre el mateix arxiu d'agenda (utilitzant **awk**, `>`, etc.).
2. Copiar els tres paràmetres d'entrada al script a variables pròpies del script.
3. Mostrar el contingut de l'agenda actual (utilitzant **awk**):
   - Afegir un títol amb **BEGIN**.
   - Mostrar els registres amb **{print ...}**.
   - Al final, indicar quants registres hi ha amb **END**.
4. Verificar que el paràmetre `$2` (el **mail**) existeix a l'agenda utilitzant **awk** amb el paràmetre **-v nom=$1**, i sortir amb el número de línia amb **$?**.
   - Si el **mail** `$2` existeix dins l'agenda, mostrarà les seves dades actuals (utilitzant **awk**) i les passades per paràmetre. Es demanarà des del **bash** si realment es volen canviar amb les noves dades.
   - Si es confirma, es realitzarà l'operació de modificació de la línia seleccionada de l'agenda utilitzant **awk** (`>fitxer2`), copiant totes les línies menys l'afectada a un nou fitxer i, després, escrivint la nova línia al final (**END**). Finalment, es pot utilitzar el **cp** de bash per substituir l'arxiu original.
   - Si no es confirma, es mostrarà un missatge indicant que no es realitza l'operació.
   - Si el **mail** no existeix, es demanarà si es volen afegir les noves dades a l'agenda, i en cas afirmatiu, s'afegiran al final del fitxer (utilitzant **awk**).
5. Un cop feta l'operació, s'ha de mostrar tota l'agenda per pantalla ordenada pel camp **mail** (utilitzant **awk** i **sort**).

---

## Ampliacions (per obtenir la màxima qualificació)

- Que es demani si es vol realitzar el pas 1 de **Copiar "AgendaOriginal.data" a "Agenda.data"** i fer el que s'indiqui.
- Un cop feta la modificació, que es demani si es vol fer una altra modificació.
  - En cas afirmatiu, demanar els tres camps a modificar i tornar al pas 3.
  - En cas negatiu, sortir del programa.
