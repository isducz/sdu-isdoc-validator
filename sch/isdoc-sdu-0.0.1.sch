<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <sch:title>Kontrola dodatečných pravidel podle standardu SDU</sch:title>
   <sch:ns uri="http://isdoc.cz/namespace/2013" prefix="isdoc"/>
   <sch:ns uri="http://isdoc.cz/namespace/2024/extensions/sdu" prefix="sdu"/>
   <sch:pattern>
      <sch:rule context="isdoc:Invoice">
         <sch:assert test="isdoc:SubDocumentType = '1'">SubDocumentType musí mít hodnotu '1'.</sch:assert>
         <sch:assert test="isdoc:SubDocumentTypeOrigin = 'sdu'">SubDocumentTypeOrigin musí mít hodnotu 'sdu'.</sch:assert>
      </sch:rule>
      <sch:rule context="isdoc:InvoiceLine/isdoc:Extensions">
         <sch:assert test="sdu:WarrantyMonths and number(sdu:WarrantyMonths) = sdu:WarrantyMonths and sdu:WarrantyMonths >= 0">WarrantyMonths musí být celé číslo</sch:assert>
         <sch:assert test="every $element in * satisfies ($element/self::sdu:WarrantyMonths or $element/self::sdu:GoogleProductCategoryPath) or not(namespace-uri($element) = 'http://isdoc.cz/namespace/2024/extensions/sdu')">Pouze elementy sdu:WarrantyMonths a sdu:GoogleProductCategoryPath jsou povoleny v sdu jmenném prostoru elementu isdoc:Extensions.</sch:assert>
      </sch:rule>
   </sch:pattern>
</sch:schema>
