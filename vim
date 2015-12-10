Kommentieren
Dazu Wechselt man zuerst in den “Visuellen-Block-Modus” mit STRG+V
Und markiert nun abwärts die Zeilen die man kommentieren möchte (Pfeil nach unten oder j)
Sind alle gewünschten Zeilen markiert wechselt man mit SHIFT+I in den “Insert-Modus”.
Nun schreibt man an den Anfang der obersten Zeile eine Kommentarzeichen (z.B # für Bash) und verlässt dann den “Insert-Modus”.
Nun werden an den Anfang jeder markierten Zeile eine # eingefügt.

Ent-Kommentieren
Dazu Wechselt man zuerst in den “Visuellen-Block-Modus” mit STRG+V
Und markiert nun abwärts die Rauten die man entfernen möchte (Pfeil nach unten oder j)
Sind alle gewünschten Rauten markiert entfernt man sie mit ‘x’


:1,$s/\n//

Mit ":" kommst du in den "Befehlsmodus", 
"1,$" bedeutet Zeile eins bis Ende, 
"s" = substitude, nun folgt zwischen den ersten beiden Slashes das Zeichen (oder die Zeichenfolge), das du ersetzen willst in dem Fall der Unix Zeilenumbruch und zwischen den letzten beiden Slashes das was man stattdessen haben möchten, in diesem Fall eben nichts :)
