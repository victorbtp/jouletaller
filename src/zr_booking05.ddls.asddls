@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'BookingID' ]
define view entity ZR_BOOKING05
  as select from zbooking05 as Booking
  association to parent ZR_TRAVEL05 as _Travel on $projection.ParentUUID = _Travel.UUID
{
  key uuid as UUID,
  parent_uuid as ParentUUID,
  booking_id as BookingID,
  booking_date as BookingDate,
  customer_id as CustomerID,
  carrier_id as CarrierID,
  connection_id as ConnectionID,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  flight_price as FlightPrice,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  class as Class,
  status as Status,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  case
     when carrier_id = 'LH' then cast(flight_price as abap.dec(16,2)) * cast('0.90' as abap.dec(5,2))
     when carrier_id = 'AF' then cast(flight_price as abap.dec(16,2)) * cast('0.85' as abap.dec(5,2))
     else cast(flight_price as abap.dec(16,2))
  end as DiscountedFlightPrice,
  _Travel
}
