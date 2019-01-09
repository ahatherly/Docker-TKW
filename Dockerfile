FROM openjdk:8

#ENV TKW_URL "https://developer.nhs.uk/wp-content/uploads/2018/12/TKWInstaller_5_2_SPINE.jar"
ENV TKW_URL "https://developer.nhs.uk/wp-content/uploads/2018/12/TKWInstaller_5_2_ITK.jar"

# Download and extract TKW
RUN wget -O /tkwinstaller.jar $TKW_URL
RUN unzip -qq /tkwinstaller.jar -d /tkwinstaller
RUN unzip -qq /tkwinstaller/tkwinstaller/TKW.zip -d /opt
RUN rm -Rf tkwinstaller
RUN rm -f /tkwinstaller.jar
RUN echo "Extracted to path: /opt/TKW"

RUN apt-get update && apt-get install sed

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
