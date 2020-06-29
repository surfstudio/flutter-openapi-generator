#!/bin/sh

executable="./modules/openapi-generator-cli/target/openapi-generator-cli.jar"
mvn package -DskipTests

# if you've executed sbt assembly previously it will use that instead.
export JAVA_OPTS="${JAVA_OPTS} -Xmx1024M -DloggerPath=conf/log4j.properties"

ags="generate -t modules/openapi-generator/src/main/resources/dart-jaguar -i modules/openapi-generator/src/test/resources/3_0/petstore.yaml -g dart-jaguar -o samples/client/petstore/dart-jaguar/flutter_petstore/openapi --additional-properties hideGenerationTimestamp=true,browserClient=false -DapiTests=false -DmodelTests=false -DapiDocs=false -DmodelDocs=false $@"
java $JAVA_OPTS -jar $executable $ags