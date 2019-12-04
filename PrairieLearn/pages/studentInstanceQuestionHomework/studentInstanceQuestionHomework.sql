-- BLOCK logintovariant
INSERT INTO variant_view_logs (access_log_id,variant_id) VALUES ($access_id,$variant_id)
RETURNING variant_view_logs.id;

-- BLOCK logintoaccess
INSERT INTO access_logs (date) VALUES ($date)
RETURNING access_logs.id;

-- BLOCK selctvariant
SELECT (date,id,variant_id) FROM variant_view_logs WHERE variant_view_logs.variant_id = $variants_id;
-- BLOCK selctvariantid
SELECT (id) FROM variants WHERE variants.instance_question_id = $instance_question_id;

-- BLOCK select_test
SELECT
    *
FROM
    variant_view_logs AS vlog
WHERE
    vlog.id = $id
