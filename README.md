# SDU ISDOC Validator

Tento repositář slouží k offline validaci ISDOC zjednodušených 
datových dokladů, prováděné validace:

- [XSD schéma](https://isdoc.cz/6.0.2/xsd/isdoc-invoice-6.0.2.xsd)
- [Vybraná pravidla ISDOC](https://isdoc.cz/6.0.2/sch/isdoc-6.0.2.sch) (Schematron)
- [Dodatečná SDU pravidla](https://raw.githubusercontent.com/isducz/sdu-isdoc-validator/main/xsl/isdoc-sdu-0.0.1.sch) (Schematron)

## Build

### Požadavky

- Docker
- Bash (macOS/WSL/...)

### Připrava

```
bin/build_image
bin/build_validators
```

## Validace

```
bin/validate soubor.isdoc
```

## Instrukce

- Validace pomocí XSL je prováděna ve fázi integrace s projektem https://www.iuctenka.cz .
