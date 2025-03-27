@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - ZVBAK_24'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_I_VBAK_24_B
  as select from Z_I_VBAK_24_A
  composition [0..*] of Z_I_VBAP_24_B as _SItem
{
  key SalesDocument,
      @Semantics.amount.currencyCode:'Currency'
      NetValue,
      Currency,
      SalesOrganization,

      SalesDist,
      CreatedBy,
      criticality,
      case Z_I_VBAK_24_A.criticality
          when 0 then 'NA'
          when 1 then 'Bad'
          when 2 then 'OK'
          when 3 then 'Good'
          else 'NA'
        end as criticalityState,
      trend,
      address,
      // Associations
      _SItem

}
