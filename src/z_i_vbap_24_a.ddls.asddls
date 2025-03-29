@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - ZVBAP_24'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity Z_I_VBAP_24_A
  as select from zvbap_24
  association [1..1] to Z_I_VBAK_24_A as _SHead on $projection.SalesDocument = _SHead.SalesDocument
{

      @ObjectModel.foreignKey.association: '_SHead'
  key vbeln                                                                             as SalesDocument,

  key posnr                                                                             as itemPos,
      matnr                                                                             as matNum,

      @Semantics.text: true
      arktx                                                                             as matDesc,

      @Semantics.amount.currencyCode:'currencyCode'
      netpr                                                                             as unitCost,

      @Semantics.amount.currencyCode:'currencyCode'
      netwr                                                                             as totalItemCost,

      waerk                                                                             as currencyCode,

      @Semantics.quantity.unitOfMeasure: 'unit'
      kpein                                                                             as quantity,
      
      kmein                                                                             as unit,

      _SHead.CreatedBy                                                                as createdBy,

      _SHead.SalesOrganization                                                        as salesOrg,

      concat(concat(_SHead.SalesDocument,'/org/'), _SHead.SalesOrganization ) as urlOrg,

      4.2                                                                               as rating,
      5                                                                                 as maxRating,
      
      @Semantics.amount.currencyCode:'currencyCode'
      _SHead.NetValue                                                                 as total,

      concat('Detail ',posnr)                                                           as salesDocNavLink,

      // Associations
      _SHead
}
