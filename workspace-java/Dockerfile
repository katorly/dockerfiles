FROM katorly/workspace-base:latest

# The Java version to install: 21.0.4.fx-zulu, 17.0.12.fx-zulu, 11.0.24.fx-zulu
ARG JAVA_VERSION=21.0.4.fx-zulu

# Install Java, Kotlin, Maven and Gradle
RUN curl -s https://get.sdkman.io | bash && \
    source $HOME/.sdkman/bin/sdkman-init.sh && \
    sdk install java $JAVA_VERSION && \
    sdk default java $JAVA_VERSION && \
    sdk install kotlin && \
    sdk install maven && \
    sdk install gradle && \
    sdk flush archives && \
    sdk flush tmp