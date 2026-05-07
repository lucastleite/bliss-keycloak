FROM quay.io/keycloak/keycloak:24.0 AS builder

# Copy custom theme
COPY themes/bliss /opt/keycloak/themes/bliss

# Build optimized Keycloak for PostgreSQL
RUN /opt/keycloak/bin/kc.sh build --db=postgres

FROM quay.io/keycloak/keycloak:24.0

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Import realm on first start
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "optimized", "--import-realm", "--health-enabled=true", "--hostname-strict=false", "--proxy=edge", "--http-enabled=true"]
