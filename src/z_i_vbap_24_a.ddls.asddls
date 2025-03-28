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
  association [1..1] to Z_I_VBAK_24_A as _SD_Head on $projection.SalesDocument = _SD_Head.SalesDocument
{

      @ObjectModel.foreignKey.association: '_SD_Head_03'
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

      _SD_Head.CreatedBy                                                                as createdBy,

      _SD_Head.SalesOrganization                                                        as salesOrg,

      concat(concat(_SD_Head.SalesDocument,'/org/'), _SD_Head.SalesOrganization ) as urlOrg,

      4.2                                                                               as rating,
      5                                                                                 as maxRating,
      
      @Semantics.amount.currencyCode:'currencyCode'
      _SD_Head.NetValue                                                                 as total,

      concat('Detail ',posnr)                                                           as salesDocNavLink,

      // Associations
      _SD_Head
}
