FROM adoptopenjdk:8-jre

# INSTRUCTIONS ON HOW TO BUILD JAR:
# Move to the location where pom.xml is exist in project and build project using below command
# "mvn clean package"
COPY /target/*.jar /opt/egov/

COPY start.sh /usr/bin/start.sh

RUN chmod +x /usr/bin/start.sh

CMD ["/usr/bin/start.sh"]

# NOTE: the two 'RUN' commands can probably be combined inside of a single
# script (i.e. RUN build-and-install-app.sh) so that we can also clean up the
# extra files created during the `mvn package' command. that step inflates the
# resultant image by almost 1.0GB.
