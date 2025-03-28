@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - ZVBAP_24'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity Z_I_VBAP_24_B
  as select from Z_I_VBAP_24_A
  association to parent Z_I_VBAK_24_B as _SHead on $projection.SalesDocument = _SHead.SalesDocument
{
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
      // Associations
      _SHead
}
