FROM fabric8/nodejs-builder:0.0.2

RUN yum update -y && \
  yum install -y docker unzip java-1.8.0-openjdk-devel which && \
  yum install -y make curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker && \
  curl -L https://www.kernel.org/pub/software/scm/git/git-2.8.3.tar.gz | tar xzv && \
  pushd git-2.8.3 && \
  make prefix=/usr/ install && \
  popd && \
  rm -rf git-2.8.3* && \
  yum remove -y make curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker && \
  yum clean all

# Maven
RUN curl -L http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -C /opt -xzv

ENV M2_HOME /opt/apache-maven-3.3.9
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0

CMD sleep infinity