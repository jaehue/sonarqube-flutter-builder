FROM docker.io/bitnami/sonarqube:9

USER root
RUN apt-get update && apt-get install -y xz-utils
ADD https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.8.1-stable.tar.xz /tmp/
ADD https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar /tmp/

RUN tar xf /tmp/flutter_linux_2.8.1-stable.tar.xz -C /usr/local
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN mkdir -p /bitnami/sonarqube/extensions/plugins/ \
    && cp /tmp/sonar-flutter-plugin-0.4.0.jar /bitnami/sonarqube/extensions/plugins/
# # RUN chmod 777 /bitnami/sonarqube/extensions/plugins/sonar-flutter-plugin-0.4.0.jar