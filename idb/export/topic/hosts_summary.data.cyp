query = "MATCH (n:Host) WITH n.domain as v_domain, n.dc as v_dc, count(n) as v_host_count RETURN {domain: v_domain, dc: v_dc, host_count: v_host_count}"
