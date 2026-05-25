@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Semantickey: [ 'BookingID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZC_BOOKING05
  as projection on ZR_BOOKING05
  association [1..1] to ZR_BOOKING05 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  ParentUUID,
  BookingID,
  BookingDate,
  CustomerID,
  CarrierID,
  ConnectionID,
  FlightDate,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  FlightPrice,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyCode,
  Class,
  Status,
  @Semantics: {
    Amount.Currencycode: 'CurrencyCode'
  }
  DiscountedFlightPrice,
  _Travel : redirected to parent ZC_TRAVEL05,
  _BaseEntity
}
