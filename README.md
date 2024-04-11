# SDU ISDOC Validator

Tento repositář slouží k offline validaci ISDOC zjednodušených datových dokladů s rozšířenou validací pro SDU.

Prováděné validace:
- [XSD schéma](https://isdoc.cz/6.0.2/xsd/isdoc-invoice-6.0.2.xsd) (v. 6.0.2)
- [Vybraná pravidla ISDOC](https://isdoc.cz/6.0.2/sch/isdoc-6.0.2.sch) (v. 6.0.2 - Schematron)
- [Dodatečná SDU pravidla](https://github.com/isducz/sdu-isdoc-validator/blob/main/sch/isdoc-sdu-0.0.1.sch) (v. 0.0.1 - Schematron)

## Příprava validace
- Docker
- Bash (macOS/WSL/...)

```
# Jednorázově
bin/build_image
# Poprvé nebo pokud dojde ke změně standardu
bin/build_validators
```

## Provedení validace
```
bin/validate soubor.isdoc
```

## Instrukce

- Validace pravidel pomocí XSL je zdlouhavá (řádově sekundy), ale je podmínkou pro dokončení fáze integrace na https://www.iuctenka.cz.
