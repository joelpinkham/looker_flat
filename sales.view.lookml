- view: sales
  sql_table_name: SOP_Views.SalesFlatWithRemakes
  fields:

  - dimension_group: account_created_date
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.AccountCreatedDate

  - dimension: affiliate
    sql: ${TABLE}.Affiliate
    
  - dimension: affiliate_group
    sql: |
          CASE  WHEN regexp_match(${affiliate}, 'google|Google|GDN|FB|bing|Bing|EasyWeddings|hivewyre') THEN 'Online Paid Advertising'
                ELSE 'Other'
          END

  - dimension: any_cr
    sql: ${TABLE}.AnyCR

  - dimension: aud_to_usd_rate_on_date
    type: number
    sql: ${TABLE}.AudToUsdRateOnDate

  - dimension: average_basket_paid
    sql: ${TABLE}.AverageBasketPaid

  - measure: balance_aud
    type: sum
    sql: ${TABLE}.BalanceAUD

  - dimension: city
    sql: ${TABLE}.City

  - dimension: collaborations_in_order
    sql: ${TABLE}.CollaborationsInOrder

  - dimension: country
    sql: ${TABLE}.Country
    
  - dimension: country_group
    sql: |
          CASE WHEN ${country} = 'US' THEN 'US'
              WHEN ${country} = 'AU' THEN 'AU'
              ELSE 'International'
          END

  - measure: credits_used_local
    type: sum
    sql: ${TABLE}.CreditsUsed
    
  - measure: credits_used_usd
    type: sum
    sql: ${TABLE}.CreditsUsedUSD

  - dimension: currency
    sql: ${TABLE}.Currency

  - dimension: customer_id
    type: int
    sql: ${TABLE}.CustomerID
    
  - measure: count_customer
    type: int
    sql: exact_count_distinct(${customer_id})

#   - dimension: date
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.Date
#     datatype: date

  - dimension: express_production
    type: int
    sql: ${TABLE}.ExpressProduction

  - dimension_group: first_order_date
    type: time
    datatype: date
    timeframes: [time, date, week, month]
    sql: ${TABLE}.FirstOrderDate

  - dimension: fiscal_month_name
    sql: ${TABLE}.FiscalMonthName

  - dimension: fiscal_year_month
    sql: ${TABLE}.FiscalYearMonth

  - dimension: fiscal_year_week
    sql: ${TABLE}.FiscalYearWeek

  - dimension: free_gift_cert
    sql: ${TABLE}.FreeGiftCert

  - measure: gift_paid_revenue_aud
    type: sum
    value_format: $#,##0
    sql: ${TABLE}.GiftPaidRevenue
    
  - dimension: gift_paid_revenue_usd_dim
    sql: ${TABLE}.GiftPaidRevenue * ${aud_to_usd_rate_on_date}
  
  - measure: gift_paid_revenue_usd
    type: number
    value_format: $#,##0
    sql: sum(${gift_paid_revenue_usd_dim})

  - dimension: gift_voucher
    sql: ${TABLE}.GiftVoucher

  - measure: gifts_used_local
    type: sum
    sql: ${TABLE}.GiftsUsed
    
  - dimension: gifts_used_usd_dim
    type: number
    sql: ${TABLE}.GiftsUsed * ${local_to_usd_rate_on_date}
    hidden: true
    
  - measure: gifts_used_usd
    value_format: $#,##0.00
    sql: SUM(${gifts_used_usd_dim})

  - dimension: is_internal
    type: yesno
    sql: ${TABLE}.IsInternal

  - dimension: is_remake
    type: yesno
    sql: IF(${TABLE}.IsRemake = 'Remake', TRUE, FALSE)

  - dimension: lang
    sql: ${TABLE}.Lang

  - dimension: last_seen_content
    sql: ${TABLE}.LastSeenContent

  - measure: leathers_paid_revenue
    type: sum
    sql: ${TABLE}.LeathersPaidRevenue

  - dimension: local_to_usd_rate_on_date
    #type: sum
    sql: ${TABLE}.LocalToUsdRateOnDate

  - measure: net_refund_txns_aud
    type: sum
    sql: ${TABLE}.NetRefundTxnsAUD

  - measure: net_transactions
    type: sum
    sql: ${TABLE}.NetTransactions

  - measure: num_credit_transactions
    type: sum
    sql: ${TABLE}.NumCreditTransactions

  - measure: num_custom_stamps
    type: sum
    sql: ${TABLE}.NumCustomStamps

  - measure: num_failed_transactions
    type: sum
    sql: ${TABLE}.NumFailedTransactions

  - measure: num_internal
    type: sum
    sql: ${TABLE}.NumInternal

  - measure: num_orders_by_this_customer
    type: sum
    sql: ${TABLE}.NumOrdersByThisCustomer

  - measure: num_paid
    type: sum
    sql: ${TABLE}.NumPaid
    
  - dimension: num_paid_tier
    type: tier
    tiers: [0,1,2,3,4,5]
    style: integer
    sql: ${TABLE}.NumPaid
    
  - dimension: has_paid_shoe
    type: yesno
    sql: IF(${TABLE}.NumPaid > 0, true, false)

  - dimension: has_shoe
    type: yesno
    sql: IF(${TABLE}.NumPairs > 0, true, false)

  - measure: num_pairs
    type: sum
    sql: ${TABLE}.NumPairs
    
  - measure: num_pairs_per_order
    type: number
    value_format: '0.00'
    sql: sum(${num_paid}) / sum(${num_shoe_orders})

  - measure: num_redeemed
    type: sum
    sql: ${TABLE}.NumRedeemed

  - measure: num_refund_transactions
    type: sum
    sql: ${TABLE}.NumRefundTransactions

  - measure: num_remakes
    type: sum
    sql: ${TABLE}.NumRemakes

  - measure: num_shoe_orders
    type: sum
    sql: ${TABLE}.NumShoeOrders

  - measure: num_transactions
    type: sum
    sql: ${TABLE}.NumTransactions

  - dimension: order_by_repeat_customer
    type: int
    sql: ${TABLE}.OrderByRepeatCustomer

  - dimension: order_id
    sql: ${TABLE}.OrderID

  - dimension: order_id_int
    type: int
    sql: ${TABLE}.order_id_int
    
  - dimension: order_id_admin_url
    sql: ${order_id}
    html: |
          <a href="https://www.shoesofprey.com/admin/order/{{ value }}">View {{ value }}</a>

  - dimension: order_with_payment
    sql: ${TABLE}.OrderWithPayment

  - dimension: original_order
    sql: ${TABLE}.OriginalOrder

  - dimension: original_order_id_int
    type: int
    sql: ${TABLE}.original_order_id_int

  - measure: total_paid_local
    type: sum
    sql: ${TABLE}.Paid
    
#   - dimension: has_cash_payment
#     type: int
#     sql: IF (${paid_local} > 0, 1, 0)
#     
  - dimension: has_cash_or_gift_payment
    type: yesno
    sql: IF ((${TABLE}.Paid + ${TABLE}.GiftsUsed) > 0,TRUE, FALSE)

  - measure: paid_plus_gift_percent
    type: sum
    sql: ${TABLE}.PaidPlusGiftPercent

  - dimension: promo
    sql: ${TABLE}.Promo

  - measure: remake_quantity_made
    type: sum
    sql: ${TABLE}.remake_quantity_made
    
  - dimension_group: remake_order_timestamp
    type: time
    timeframes: [time, date, week, month]
    datatype: epoch
    sql: (${TABLE}.remake_order_timestamp)/1000000
    


  - measure: repeat_revenue
    type: sum
    sql: ${TABLE}.RepeatRevenue

  - measure: repeat_revenue_aud
    type: sum
    sql: ${TABLE}.RepeatRevenueAUD

  - dimension: sales_region
    sql: ${TABLE}.SalesRegion

  - dimension: sales_rep
    sql: ${TABLE}.SalesRep

  - measure: shoe_order_amount
    type: sum
    sql: ${TABLE}.ShoeOrderAmount

  - measure: shoe_order_amount_usd
    type: sum
    sql: ${TABLE}.ShoeOrderAmountUSD

  - measure: shoe_paid_plus_redeemed_usd
    type: sum
    sql: ${TABLE}.ShoePaidPlusRedeemedUSD

  - measure: shoe_paid_revenue
    type: sum
    sql: ${TABLE}.ShoePaidRevenue

  - dimension: state
    sql: ${TABLE}.State

  - dimension: status
    sql: ${TABLE}.Status

  - measure: total_local
    type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.Total

  - measure: total_aud
    type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.TotalAUD
    
  - dimension: total_usd_dim
    sql: ${TABLE}.TotalAUD * ${aud_to_usd_rate_on_date}
    hidden: true
  
  - measure: total_usd
    value_format: '$#,##0'
    type: sum
    sql: ${total_usd_dim}
    

  - measure: credits_used_aud
    type: sum
    sql: ${TABLE}.TotalCreditsAUD

  - measure: total_paid_aud
    value_format: '$#,##0'
    type: sum
    sql: ${TABLE}.TotalPaidAUD
    
  - dimension: total_paid_usd_dim
#     type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.TotalPaidAUD * ${aud_to_usd_rate_on_date}
    hidden: true
    
  - measure: total_paid_usd
    type: sum
    value_format: '$#,##0'
    sql: SUM(${total_paid_usd_dim})

  - measure: total_paid_plus_redeemend_revenue_usd
    type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.TotalPaidPlusRedeemendRevenueUSD

  - measure: total_paid_revenue_aud
    value_format: '$#,##0'
    type: sum
    sql: ${TABLE}.TotalPaidRevenueAUD

  - measure: total_paid_revenue_usd
    label: 'Total Sales USD'
    description: 'Replaced total paid revenue - only includes actual credit card payments received from customers and does not include gift certificates, credits or discounts'
    type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.TotalPaidRevenueUSD

  - measure: total_revenue_local
    type: sum
    value_format: '$#,##0'
    sql: ${TABLE}.TotalRevenue

  - measure: total_revenue_aud
    value_format: '$#,##0'
    type: sum
    sql: ${TABLE}.TotalRevenueAUD

  - measure: total_revenue_usd
    value_format: '$#,##0'
    type: sum
    sql: ${TABLE}.TotalRevenueUSD

  - dimension: turnaround_time
    sql: ${TABLE}.TurnaroundTime

  - dimension_group: date_utc
    label: "Date UTC"
    type: time
    timeframes: [time, date, week, month, hour_of_day]
    datatype: epoch
    sql: (${TABLE}.UnixTimestamp)/1000000
    
  - dimension_group: date_pdt
    label: "Date PDT"
    type: time
    timeframes: [time, date, week, month, hour_of_day]
    datatype: epoch
    sql: ((${TABLE}.UnixTimestamp)/1000000) - 7*60*60
    
  - dimension_group: date_aest
    label: "Date AEST"
    type: time
    timeframes: [time, date, week, month, hour_of_day]
    datatype: epoch
    sql: ((${TABLE}.UnixTimestamp)/1000000) + 10*60*60
    
    
    
#   - dimension: fiscal_quarter
    
  - dimension: time_to_first_remake_from_order_days
    type: int
    sql: DATEDIFF((${TABLE}.remake_order_timestamp)/1000000, (${TABLE}.UnixTimestamp)/1000000)
    
  - dimension: time_to_first_remake_from_order_weeks
    sql: round(${time_to_first_remake_from_order_days} / 7 + 0.5,0)
#           CASE  WHEN ${time_to_first_remake_from_order_days} < 167 THEN concat('Week ', string())
#                 ELSE '> 26+ Weeks'
#             END
    
#   - dimension: time_to_first_remake_from_shipping
#     type: int
#     sql: DATEDIFF((${TABLE}.remake_order_timestamp)/1000000, (${TABLE}.UnixTimestamp)/1000000)
    
  - dimension: week_commencing_sunday
    type: date
    sql: FORMAT_UTC_USEC(UTC_USEC_TO_WEEK(TIMESTAMP_TO_USEC(${TABLE}.UnixTimestamp), 0))

  - measure: value_gifts
    type: sum
    sql: ${TABLE}.ValueGifts

  - measure: value_item_add_ons_aud
    type: sum
    sql: ${TABLE}.ValueItemAddOnsAUD

  - measure: value_leather
    type: sum
    sql: ${TABLE}.ValueLeather

  - measure: value_order_line_add_ons_aud
    type: sum
    sql: ${TABLE}.ValueOrderLineAddOnsAUD

  - measure: value_sales_tax_aud
    type: sum
    sql: ${TABLE}.ValueSalesTaxAUD

  - measure: value_sales_tax_local
    type: sum
    sql: ${TABLE}.ValueSalesTaxLocal
    
  - dimension: value_sales_tax_usd_dim
    hidden: true
    sql: ${TABLE}.ValueSalesTaxAUD * ${aud_to_usd_rate_on_date}
    
  - measure: value_sales_tax_usd
    type: sum
    value_format: '$#,##0'
    sql: ${value_sales_tax_usd_dim}

  - measure: value_shipping_aud
    type: sum
    sql: ${TABLE}.ValueShippingAUD
    
  - dimension: has_shipping_charge
    type: yesno
    sql: IF(${TABLE}.ValueShippingAUD > 0, true, false)

  - dimension: value_shipping_usd_dim
    sql: ${TABLE}.ValueShippingAUD * ${aud_to_usd_rate_on_date}
    hidden: true
    
  - measure: value_shipping_usd
    type: sum
    value_format: '$#,##0'
    sql: ${value_shipping_usd_dim}

  - measure: value_shoes
    type: sum
    sql: ${TABLE}.ValueShoes

  - dimension: voucher_customer
    sql: ${TABLE}.VoucherCustomer

  - dimension: website
    sql: ${TABLE}.Website
    
  - dimension: sales_channel
    sql: |
          CASE  WHEN ${website} CONTAINS 'iPad' THEN 
                    CASE  WHEN ${website} CONTAINS 'nordstrom' THEN 'Store - Nordstrom'
                          WHEN ${website} CONTAINS 'david' THEN 'Store - DJ\'s'
                          WHEN ${website} CONTAINS 'westfield' THEN 'Store - Westfield'
                          ELSE 'Store - Other'
                    END
                WHEN ${website} CONTAINS 'www.shoesofprey' THEN CONCAT('shoesofprey.com - ',${country_group},' - ',${affiliate_group})
                WHEN ${website} = 'www.nordstrom.com' THEN 'nordstrom.com'
                ELSE 'Other'
          END
          
  - dimension: sales_channel_pitch_deck
    sql: |
          CASE  WHEN ${website} CONTAINS 'iPad' THEN 'Offline Stores'
                WHEN ${website} CONTAINS 'www.shoesofprey' THEN 'ShoesOfPrey.com'
                WHEN ${website} = 'www.nordstrom.com' THEN 'Nordstrom.com'
                ELSE 'Other'
          END

  - dimension: distribution_partner
    sql: |
          CASE  WHEN ${website} CONTAINS 'westfield' THEN 'Westfield'
                WHEN ${website} CONTAINS 'david' THEN 'DJs'
                WHEN ${website} = 'www.nordstrom.com' THEN 'Nordstrom.com'
                WHEN ${website} CONTAINS 'nordstrom' THEN 'Nordstrom Store'
                ELSE 'Shoes of Prey Direct'
          END
  
  - dimension: zip
    sql: ${TABLE}.Zip

#   - measure: count
#     type: count
#     approximate_threshold: 100000
#     drill_fields: [fiscal_month_name]

