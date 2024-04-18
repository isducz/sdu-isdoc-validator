# SDU ISDOC Validator

Tento repositář slouží k offline validaci ISDOC zjednodušených datových dokladů s rozšířenou validací pro SDU.

Prováděné validace:
- [XML schéma ISDOC](https://isdoc.cz/6.0.2/xsd/isdoc-invoice-6.0.2.xsd) (v. 6.0.2)
- [XML schéma ISDOC + SDU](https://github.com/isducz/sdu-isdoc-validator/blob/main/xsd/isdoc-sdu-0.0.1.xsd) (v. 0.0.1)
- [Vybraná pravidla ISDOC](https://isdoc.cz/6.0.2/sch/isdoc-6.0.2.sch) (v. 6.0.2 - Schematron)
- [Dodatečná SDU pravidla](https://github.com/isducz/sdu-isdoc-validator/blob/main/sch/isdoc-sdu-0.0.1.sch) (v. 0.0.1 - Schematron)

## Příprava validátorů

Požadavky:
- `docker` CLI
- `/bin/sh`

Testováno na:
- Apple macOS
- MS Windows 10 + WSL 2.0 s Ubuntu ditribucí

```
# Jednorázově
bin/build_image
# Poprvé a/nebo pokud dojde ke změně standardu
bin/build_validators
```

## Provedení validace
```
bin/validate soubor.isdoc
```

## Instrukce

- V `isdoc:DocumentType` uvádějte typ '1' (daňový doklad) nebo '7' (zjednodušený daňový doklad).
- Vyplňte subtyp dokumentu - povolené hodnoty '0' (digitalizovaná účtenka) a '1' (digitální originál)
  ```xml
  <SubDocumentType>1</SubDocumentType>
  <SubDocumentTypeOrigin>sdu</SubDocumentTypeOrigin>
  ```
- ISDOC neumožňuje definovat čas vystavení to je možné definovat v rozšíření SDU:
  ```xml
  <Invoice>
    ...
    <Extensions>
      <sdu:InvoiceExtensions>
        <sdu:IssueTime>15:00:00</sdu:IssueTime>
        <sdu:ProductCategoryTaxonomy>Google Merchant</sdu:ProductCategoryTaxonomy>
      </sdu:InvoiceExtensions>
    </Extensions>
    ...
  <Invoice>
  ```
- U produktů je možné vyplnit dodatečné informace - použitá taxonomie pro kategorie je uvedená v rozšíření na úrovni `Invoice`:
  ```xml
  <InvoiceLine>
    ...
    <Extensions>
        <sdu:InvoiceLineExtensions>
            <sdu:WarrantyMonths>24</sdu:WarrantyMonths>
            <sdu:ProductCategoryPath>Home &amp; Garden &gt; Household Appliances &gt; Climate Control Appliances &gt; Heaters</sdu:ProductCategoryPath>
       </sdu:InvoiceLineExtensions>
    </Extensions>
  <InvoiceLine>
  ```
- Pokud použijete `DocumentType` hodnotu '7' tak doporučujeme jako příjemce `AnonymousCustomerParty`:
  ```xml
  <AnonymousCustomerParty>
    <ID></ID>
    <IDScheme></IDScheme>
  </AnonymousCustomerParty>
  ```
- Validace pravidel pomocí XSL je zdlouhavá (řádově sekundy), ale je podmínkou pro dokončení fáze integrace obchodníka na https://www.iuctenka.cz.
