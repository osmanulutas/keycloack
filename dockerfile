FROM quay.io/keycloak/keycloak:26.3.5

# Build-time options (burada sabitlememiz gerekiyor)
ENV KC_DB=postgres
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Provider JAR dosyasını kopyala
COPY ./providers/*.jar /opt/keycloak/providers/

# Tema klasörünü kopyala (opsiyonel, sadece varsa)
# COPY ./themes/ /opt/keycloak/themes/

# Keycloak build (providers & themes aktif olsun diye)
RUN /opt/keycloak/bin/kc.sh build

# Entrypoint zaten Keycloak'ın default scripti
