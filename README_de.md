# Infinitycube

Modelle und Dokumentation zum Selbstbau von Infinitycubes.

Inspiriert von einigen Leuten an einem Chaos Communication Congress-Stand, die eine beeindruckend überentwickelte Version davon gebaut haben (früher zu finden unter infinitycubez.de).

---

## Teileliste

Diese Liste ist möglicherweise nicht vollständig – falls etwas fehlt, schreib mir gerne!

* Acrylplatten (3 mm Stärke)
* Halbtransparente selbstklebende Spiegelfolie
* Ca. 1 kg deines Lieblings-PETG-Filaments für den 3D-Drucker 🙂
* Adressierbare RGB-LED-Streifen mit schwarzer Platine, 144 LEDs pro Meter (WS2812B oder ähnlich)
* Controller für die RGB-LED-Streifen (manchmal liegen sie den Streifen bei, aber du kannst gerne deinen eigenen bauen, z. B. mit einem ESP32)
* Schwarzer Schrumpfschlauch
* Etwas Draht/Kabel
* Etwas Lötzinn
* 2K Epoxidkleber Aushärtezeit ca. 15 Minuten (z.B. UHU Schnellfest)

## Benötigtes Werkzeug

* Ein 3D-Drucker
* Ein Lötkolben
* Ein Feuerzeug, eine Heißluftpistole oder etwas Ähnliches zum Aufschrumpfen des Schrumpfschlauchs
* Eine Stichsäge oder etwas Ähnliches zum Zuschneiden der Acrylplatten
* Eine Sprühflasche mit etwas Seifenwasser
* Eine Kreditkarte oder Ähnliches zum Abziehen von Luftblasen
* Ein Cuttermesser

---

## Montage

### Rahmenmontage

Der Rahmen des Infinitycubes besteht aus Kantenstücken und Ecken. Drucke 30 Kantenstücke und 20 Ecken für die Eckpunkte eines Dodekaeder-Infinitycubes.

Die Kantenstücke können in beliebiger Länge gedruckt werden, um den Dodekaeder nach Wunsch zu skalieren. Stecke die Kantenstücke einfach in die Eckstücke – weder Kleber noch Schrauben sind nötig.

Schneide Acrylplatten auf die richtige Größe zu, um die Flächen des Dodekaeders zu bilden. Es hat sich bewährt, zunächst eine Schablone für den Zuschnitt herzustellen – entweder per 3D-Druck oder aus dünnem Holz (oder sogar Acryl). Danach kannst du die Flächen mit einer Stichsäge ausschneiden. Du hast dabei etwas Spielraum, da die Kanten der Flächen ohnehin einige Millimeter in den Rahmenstücken verschwinden.

Klebe die selbstklebende, halbtransparente Spiegelfolie auf die Flächen. Besprühe sowohl die Flächen als auch die Klebeseite der Folie mit Seifenwasser. So lässt sich die Folie positionieren und das Wasser darunter herausstreichen. Überstehende Folie mit einem Cuttermesser abschneiden – dabei einen kleinen Rand der Acrylplatte unbedeckt lassen, bis zur Tiefe, in der sie im Rahmen stecken wird. Andernfalls könnte sich die Folie lösen, wenn du die Platten in die Rahmenstücke drückst.

Damit ist die Vorbereitung abgeschlossen. Die Acrylplatten können nun in die Rahmen- und Eckstücke eingeschoben werden. Die Flächen sollten stramm genug sitzen, dass weder Schrauben noch Kleber nötig sind.

### Elektronik

Schneide LED-Streifen auf die Länge eines Rahmenstücks zu. Achte darauf, genügend von den Lötpads stehen zu lassen – sonst wird das Löten zur Qual 🙂

Es ist nicht möglich, alle Kanten mit LED-Streifen zu bestücken. Beim Dodekaeder-Infinitycube sind es bei mir 20 Kanten. Vielleicht gibt es einen cleveren Weg, mehr Kanten zu bestücken, aber ich habe mich damit nicht weiter aufgehalten 😄 Experimentiere gerne damit.

Verbinde die einzelnen LED-Streifenstücke anschließend mit Draht. Ziehe schwarzen Schrumpfschlauch über die Kabel. Das hält alles ordentlich zusammen und macht die Kabel später weniger sichtbar.

Ein Ende sollte an einen Kabelstecker gelötet werden, der über ein Eckstück nach außen geführt werden kann. Bohre dazu ein kleines Loch in eines der Eckstücke. Führe die Kabel durch das Loch, ziehe Schrumpfschlauch darüber, löte sie an das Ende der LED-Kette und fixiere dann den Schrumpfschlauch.

Klebe die LED-Streifen anschließend in die Rahmenstücke. Zweikomponenten-Epoxidkleber mit einer Aushärtezeit von etwa 15 Minuten funktioniert hier gut. Er haftet sehr zuverlässig und gibt dir genug Zeit, die LED-Streifen noch auszurichten. Wer es eilig hat: Der Aushärteprozess lässt sich mit einer Heißluftpistole (oder einem Haartrockner) beschleunigen 🙂

Jetzt alles zusammenbauen – und fertig!

