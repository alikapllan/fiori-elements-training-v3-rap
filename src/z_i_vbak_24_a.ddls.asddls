@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - ZVBAK_24'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity Z_I_VBAK_24_A
  as select from zvbak_24
  association [0..*] to Z_I_VBAP_24_A as _SD_Item on $projection.SalesDocument = _SD_Item.SalesDocument
{
  key vbeln                  as SalesDocument,
      vkorg                  as SalesOrganization,
      ernam                  as CreatedBy,
      vtweg                  as SalesDist,


      @Semantics.amount.currencyCode:'Currency'
      netwr                  as NetValue,

      waerk                  as Currency,

      @Consumption.filter.hidden: true
      3                      as criticality, -- 0 Neutral, 1 Red, 2 Yellow, 3 Green,
      1                      as trend, -- 1 up, 2 right up, 3 right, 4, right down, 5 down,

      @Semantics.address.label: true
      'ABC MNQ Pin: 12345' as address,

      // Associations
      _SD_Item
}
