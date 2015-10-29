- connection: bq_sop_flattened

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

- explore: sales
  label: "Sales (don't use)"
  joins: 
    - join: customers
      foreign_key: customer_id
      type: left_outer_each
  
  always_filter: 
    is_remake: no
    is_internal: no

- explore: customers
  label: "Customers (don't use)"
 