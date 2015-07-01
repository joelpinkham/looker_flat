- view: customers
  sql_table_name: SOP_Flattened.CustomersReport
  fields:



  - dimension: affiliate_source
    sql: ${TABLE}.AffiliateSource

  - dimension: affiliate_source_plus_slp
    sql: IF(regexp_match(${customer_tags}, 'shoe-type|size|path-') AND AffiliateSource == '', 'Google-SLP', ${TABLE}.AffiliateSource)


  - dimension: customer_id
    primary_key: true
    sql: ${TABLE}.CustomerID

  - dimension: customer_tags
    sql: ${TABLE}.CustomerTags

  - dimension: date_created
    type: time
    timeframes: [date, week, month, year]
    sql: TIMESTAMP(${TABLE}.DateCreated)

  - dimension: first_order_affiliate
    sql: ${TABLE}.FirstOrderAffiliate

  - dimension: first_order_date
    sql: ${TABLE}.FirstOrderDate

  - dimension: first_saved_date
    sql: ${TABLE}.FirstSavedDate

  - dimension: first_visit_date
    sql: ${TABLE}.FirstVisitDate

  - dimension: furthest_flow_point
    sql: ${TABLE}.FurthestFlowPoint

  - dimension: is_internal_account
    type: yesno
    sql: ${TABLE}.IsInternalAccount

  - dimension: is_returned_on_first_order
    type: yesno
    sql: ${TABLE}.IsReturnedOnFirstOrder

  - dimension: last_country
    sql: ${TABLE}.LastCountry

  - dimension: last_order_date
    sql: ${TABLE}.LastOrderDate
    type: time
    timeframes: [date, week, month, year]

  - dimension: last_seen
    sql: ${TABLE}.LastSeen
    type: time
    timeframes: [date, week, month, year]

  - dimension: mailchimp_subscribed
    type: yesno
    sql: ${TABLE}.MailchimpSubscribed

  - measure: num_gift_certs_purchased
    type: sum
    sql: ${TABLE}.NumGiftCertsPurchased

  - measure: num_orders1_year
    type: sum
    sql: ${TABLE}.NumOrders1Year

  - measure: num_orders3_month
    type: sum
    sql: ${TABLE}.NumOrders3Month

  - measure: num_orders6_month
    type: sum
    sql: ${TABLE}.NumOrders6Month

  - measure: num_orders9_month
    type: sum
    sql: ${TABLE}.NumOrders9Month

  - measure: num_orders_lifetime
    type: sum
    sql: ${TABLE}.NumOrdersLifetime

  - measure: num_remakes
    type: sum
    sql: ${TABLE}.NumRemakes
    
      
#   - dimension: customer_loyalty_level
#     sql: CASE WHEN (${num_orders_lifetime} > 1) THEN 'Repeat Purchase Shoe Customer'
#               WHEN ({$num_orders_lifetime} = 1) THEN 'Single Purchase Shoe Customer'
#               WHEN (${num_saved_designs_measure} >= 4) THEN 'Graduated Designer'
#               WHEN (${num_saved_designs_measure} BETWEEN 1 AND 4) THEN 'Designer'
#               ELSE 'Inactivated Account'
#           END

  - dimension: num_saved_designs_dimension
    sql: CASE WHEN (${TABLE}.NumSavedDesigns BETWEEN 5 AND 8) THEN '_5-8'
              WHEN (${TABLE}.NumSavedDesigns BETWEEN 9 AND 12) THEN '_9-12'
              WHEN (${TABLE}.NumSavedDesigns BETWEEN 13 AND 20) THEN '13-20'
              WHEN (${TABLE}.NumSavedDesigns > 20) THEN '20+'
              ELSE CONCAT('_', STRING(${TABLE}.NumSavedDesigns))
          END
          
  - dimension: is_graduated_designer
    sql: CASE WHEN (${TABLE}.NumSavedDesigns >= 4) THEN 'yes'
              ELSE 'no'
          END
          
  - dimension: has_designed_shoe
    sql: CASE WHEN (${TABLE}.NumSavedDesigns > 0) THEN 'yes'
              ELSE 'no'
          END




  - measure: num_saved_designs_measure
    type: sum
    sql: ${TABLE}.NumSavedDesigns

  - measure: num_shoes_purchased
    type: sum
    sql: ${TABLE}.NumShoesPurchased

  - measure: num_visits
    type: sum
    sql: ${TABLE}.NumVisits

  - dimension: receive_offers
    type: yesno
    sql: ${TABLE}.ReceiveOffers

  - dimension: requested_refund_on_first_order
    type: yesno
    sql: ${TABLE}.RequestedRefundOnFirstOrder

  - dimension: requested_remake_on_first_order
    type: yesno
    sql: ${TABLE}.RequestedRemakeOnFirstOrder

  - dimension: requested_return_on_first_order
    type: yesno
    sql: ${TABLE}.RequestedReturnOnFirstOrder

  - dimension: revenue1_year_aud
    type: number
    sql: ${TABLE}.Revenue1YearAUD

  - measure: revenue3_months_aud
    type: sum
    sql: ${TABLE}.Revenue3MonthsAUD

  - measure: revenue6_months_aud
    type: sum
    sql: ${TABLE}.Revenue6MonthsAUD

  - measure: revenue9_months_aud
    type: sum
    sql: ${TABLE}.Revenue9MonthsAUD

  - measure: revenue_lifetime_aud
    type: sum
    sql: ${TABLE}.RevenueLifetimeAUD

  - dimension: saved_designs_at_first_sale
    type: int
    sql: ${TABLE}.SavedDesignsAtFirstSale

  - measure: count
    type: count
#     approximate_threshold: 100000
    drill_fields: []

