FROM quay.io/keycloak/keycloak:26.3.5

# Provider JAR dosyasını kopyala
COPY ./providers/*.jar /opt/keycloak/providers/

# Temayı kopyala (opsiyonel, sadece varsa)
#COPY ./themes/ /opt/keycloak/themes/

# Keycloak build (providers & themes aktif olsun diye)
RUN /opt/keycloak/bin/kc.sh build

# Entrypoint zaten Keycloak'ın default scripti
