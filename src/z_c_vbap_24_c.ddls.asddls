@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - ZVBAP_24'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity Z_C_VBAP_24_C 
    as projection on Z_I_VBAP_24_B
{
    @Consumption.valueHelpDefinition: [{ entity: { name: 'Z_C_VBAK_24_C', element: 'SalesDocument' } }]
    @ObjectModel.foreignKey.association: '_SHead'
    key SalesDocument,
    key itemPos,
    @Semantics.amount.currencyCode:'currencyCode'
    total,
    currencyCode,
    createdBy,
    salesOrg,
    matNum,
    matDesc,
    @Semantics.amount.currencyCode:'currencyCode'
    unitCost,
    @Semantics.quantity.unitOfMeasure: 'unit'
    quantity,
    unit,
    maxRating,
    rating,
    urlOrg,
    salesDocNavLink,
    /* Associations */
    _SHead : redirected to parent Z_C_VBAK_24_C
}
