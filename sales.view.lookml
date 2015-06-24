- view: sales
  sql_table_name: SOP_Views.SalesReport_AllYears
  fields:

  - dimension: account_created_date
    sql: ${TABLE}.AccountCreatedDate

  - dimension: affiliate
    sql: ${TABLE}.Affiliate

  - dimension: any_cr
    sql: ${TABLE}.AnyCR

  - measure: aud_to_usd_rate_on_date
    type: number
    sql: ${TABLE}.AudToUsdRateOnDate

  - measure: average_basket_paid
    sql: ${TABLE}.AverageBasketPaid

  - measure: balance_aud
    type: number
    sql: ${TABLE}.BalanceAUD

  - dimension: city
    sql: ${TABLE}.City

  - dimension: collaborations_in_order
    sql: ${TABLE}.CollaborationsInOrder

  - dimension: country
    sql: ${TABLE}.Country

  - dimension: credits_used
    type: number
    sql: ${TABLE}.CreditsUsed

  - dimension: currency
    sql: ${TABLE}.Currency

  - dimension: customer_id
    type: int
    sql: ${TABLE}.CustomerID

  - dimension: date
    sql: ${TABLE}.Date

  - dimension: express_production
    type: int
    sql: ${TABLE}.ExpressProduction

  - dimension: first_order_date
    sql: ${TABLE}.FirstOrderDate

  - dimension: fiscal_month_name
    sql: ${TABLE}.FiscalMonthName

  - dimension: fiscal_year_month
    sql: ${TABLE}.FiscalYearMonth

  - dimension: fiscal_year_week
    sql: ${TABLE}.FiscalYearWeek

  - dimension: free_gift_cert
    sql: ${TABLE}.FreeGiftCert

  - measure: gift_paid_revenue
    type: number
    sql: ${TABLE}.GiftPaidRevenue

  - dimension: gift_voucher
    sql: ${TABLE}.GiftVoucher

  - measure: gifts_used
    type: number
    sql: ${TABLE}.GiftsUsed

  - dimension: is_internal
    type: yesno
    sql: ${TABLE}.IsInternal

  - dimension: is_remake
    type: yesno
    sql: ${TABLE}.IsRemake

  - dimension: lang
    sql: ${TABLE}.Lang

  - dimension: last_seen_content
    sql: ${TABLE}.LastSeenContent

  - measure: leathers_paid_revenue
    type: number
    sql: ${TABLE}.LeathersPaidRevenue

  - measure: local_to_usd_rate_on_date
    type: number
    sql: ${TABLE}.LocalToUsdRateOnDate

  - measure: net_refund_txns_aud
    type: number
    sql: ${TABLE}.NetRefundTxnsAUD

  - measure: net_transactions
    type: number
    sql: ${TABLE}.NetTransactions

  - measure: num_credit_transactions
    type: int
    sql: ${TABLE}.NumCreditTransactions

  - measure: num_custom_stamps
    type: int
    sql: ${TABLE}.NumCustomStamps

  - measure: num_failed_transactions
    type: int
    sql: ${TABLE}.NumFailedTransactions

  - measure: num_internal
    type: int
    sql: ${TABLE}.NumInternal

  - dimension: num_orders_by_this_customer
    type: int
    sql: ${TABLE}.NumOrdersByThisCustomer

  - measure: num_paid
    type: sum
    sql: ${TABLE}.NumPaid

  - measure: num_pairs
    type: sum
    sql: ${TABLE}.NumPairs

  - measure: num_redeemed
    type: int
    sql: ${TABLE}.NumRedeemed

  - measure: num_refund_transactions
    type: int
    sql: ${TABLE}.NumRefundTransactions

  - measure: num_remakes
    type: int
    sql: ${TABLE}.NumRemakes

  - measure: num_shoe_orders
    type: int
    sql: ${TABLE}.NumShoeOrders

  - measure: num_transactions
    type: int
    sql: ${TABLE}.NumTransactions

  - dimension: order_by_repeat_customer
    type: yesno
    sql: ${TABLE}.OrderByRepeatCustomer

  - dimension: order_id
    sql: ${TABLE}.OrderID

  - dimension: order_with_payment
    type: yesno
    sql: ${TABLE}.OrderWithPayment

  - dimension: original_order
    sql: ${TABLE}.OriginalOrder

  - measure: paid
    type: number
    sql: ${TABLE}.Paid

  - dimension: promo
    sql: ${TABLE}.Promo

  - measure: repeat_revenue
    type: number
    sql: ${TABLE}.RepeatRevenue

  - measure: repeat_revenue_aud
    type: number
    sql: ${TABLE}.RepeatRevenueAUD

#   - dimension: sales_region
#     sql: ${TABLE}.SalesRegion

  - dimension: sales_rep
    sql: ${TABLE}.SalesRep

  - measure: shoe_order_amount
    type: number
    sql: ${TABLE}.ShoeOrderAmount

  - measure: shoe_paid_revenue
    type: number
    sql: ${TABLE}.ShoePaidRevenue

  - dimension: state
    sql: ${TABLE}.State

  - dimension: status
    sql: ${TABLE}.Status

  - measure: total
    type: number
    sql: ${TABLE}.Total

  - measure: total_aud
    type: number
    sql: ${TABLE}.TotalAUD

  - measure: total_credits_aud
    type: number
    sql: ${TABLE}.TotalCreditsAUD

  - measure: total_paid_aud
    type: number
    sql: ${TABLE}.TotalPaidAUD

  - measure: total_paid_revenue_aud
    type: number
    sql: ${TABLE}.TotalPaidRevenueAUD
    
  - measure: total_paid_revenue_usd
    type: number
    sql: ${TABLE}.TotalPaidRevenueAUD * ${aud_to_usd_rate_on_date}

  - measure: total_revenue
    type: number
    sql: ${TABLE}.TotalRevenue

  - measure: total_revenue_aud
    type: number
    sql: ${TABLE}.TotalRevenueAUD

  - measure: turnaround_time
    sql: ${TABLE}.TurnaroundTime

  - dimension_group: unix_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.UnixTimestamp

  - measure: value_gifts
    type: number
    sql: ${TABLE}.ValueGifts

  - measure: value_gifts_aud
    sql: ${TABLE}.ValueGiftsAUD

  - measure: value_item_add_ons_aud
    type: number
    sql: ${TABLE}.ValueItemAddOnsAUD

  - measure: value_leather
    type: number
    sql: ${TABLE}.ValueLeather

  - measure: value_order_line_add_ons_aud
    type: number
    sql: ${TABLE}.ValueOrderLineAddOnsAUD

  - measure: value_sales_tax_aud
    type: number
    sql: ${TABLE}.ValueSalesTaxAUD

  - measure: value_sales_tax_local
    type: number
    sql: ${TABLE}.ValueSalesTaxLocal

  - measure: value_shipping_aud
    type: number
    sql: ${TABLE}.ValueShippingAUD

  - measure: value_shoes
    type: number
    sql: ${TABLE}.ValueShoes

  - dimension: voucher_customer
    sql: ${TABLE}.VoucherCustomer

  - dimension: website
    sql: ${TABLE}.Website

  - dimension: zip
    sql: ${TABLE}.Zip

  - measure: count
    type: count
#     approximate_threshold: 100000
    drill_fields: [fiscal_month_name]

