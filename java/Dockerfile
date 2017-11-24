FROM fedora:latest
RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.rpm > jdk-9.0.1-linux-x64.rpm && \
  dnf install jdk-9.0.1-linux-x64.rpm -y && \
  dnf clean all && \
  rm jdk-9.0.1-linux-x64.rpm
