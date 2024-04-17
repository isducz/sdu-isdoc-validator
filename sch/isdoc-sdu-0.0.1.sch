<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <sch:title>Kontrola dodatečných pravidel podle standardu SDU</sch:title>
   <sch:ns uri="http://isdoc.cz/namespace/2013" prefix="isdoc"/>
   <sch:ns uri="http://isdoc.cz/namespace/2024/extensions/sdu" prefix="sdu"/>
   <sch:pattern>
      <sch:rule context="isdoc:Invoice">
         <sch:assert test="isdoc:DocumentType = ('1', '7')">DocumentType musí mít hodnotu '1' nebo '7'.</sch:assert>
      </sch:rule>
      <sch:rule context="isdoc:Invoice">
         <sch:assert test="isdoc:SubDocumentType = '1'">SubDocumentType musí mít hodnotu '1'.</sch:assert>
         <sch:assert test="isdoc:SubDocumentTypeOrigin = 'sdu'">SubDocumentTypeOrigin musí mít hodnotu 'sdu'.</sch:assert>
      </sch:rule>
   </sch:pattern>
   <sch:pattern>
      <sch:rule context="sdu:InvoiceExtensions">
         <sch:assert test="parent::isdoc:Extensions and parent::*/parent::isdoc:Invoice">
            Element 'sdu:InvoiceExtensions' musí být umístěn v 'isdoc:Invoice/isdoc:Extensions'.
         </sch:assert>
      </sch:rule>
      <sch:rule context="sdu:InvoiceLineExtensions">
         <sch:assert test="parent::isdoc:Extensions and parent::*/parent::isdoc:InvoiceLine">
            Element 'sdu:InvoiceLineExtensions' musí být umístěn v 'isdoc:InvoiceLine/isdoc:Extensions'.
         </sch:assert>
      </sch:rule>
   </sch:pattern>
</sch:schema>
