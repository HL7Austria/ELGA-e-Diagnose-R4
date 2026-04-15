RuleSet: MetaTagDiagnosisType
* meta.tag ^slicing.discriminator[+].type = #value
* meta.tag ^slicing.discriminator[=].path = "$this"
* meta.tag ^slicing.rules = #open
//code -> required pattern
//code.coding -> fixed value
//code.coding.system-> fixed value
//code.coding.code -> fixed value
* meta.tag contains diagnosisType 1..1
* meta.tag[diagnosisType] from AtEdiagDiagnosisTypeVS (required)