@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - ZVBAK_24'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define root view entity Z_C_VBAK_24_C 
    provider contract transactional_query
    as projection on Z_I_VBAK_24_B
{
    key SalesDocument,
    @Semantics.amount.currencyCode:'Currency'
    NetValue,
    Currency,
    SalesOrganization,
    SalesDist,
    CreatedBy,
    criticality,
    criticalityState,
    trend,
    address,
    /* Associations */
    _SItem: redirected to composition child Z_C_VBAP_24_C
}
