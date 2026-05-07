FROM quay.io/keycloak/keycloak:24.0 AS builder

# Copy custom theme
COPY themes/bliss /opt/keycloak/themes/bliss

# Build optimized Keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:24.0

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Import realm on first start
COPY realm-export.json /opt/keycloak/data/import/realm-export.json

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--import-realm", "--health-enabled=true"]
