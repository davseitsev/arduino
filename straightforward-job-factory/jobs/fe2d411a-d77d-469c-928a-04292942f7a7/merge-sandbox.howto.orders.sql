MERGE INTO sandbox.howto.orders o
  USING sandbox.howto.orders_delta s
    ON (o.orderkey = s.orderkey)
  WHEN MATCHED
    THEN UPDATE SET orderstatus = s.orderstatus
  WHEN NOT MATCHED
    THEN INSERT (orderkey, orderstatus, totalprice, orderdate)
         VALUES (s.orderkey, s.orderstatus, s.totalprice, s.orderdate)
