FROM docker.io/bitnami/moodle:4.2
MAINTAINER Tahir
RUN apt -y update && apt install -y zip
COPY ./moodle-plugins/mod_zoom_moodle42_2023082400.zip /tmp/
COPY ./moodle-plugins/theme_boost_magnific_moodle41_2023040201.zip /tmp/
COPY ./moodle-plugins/enrol_coursecompleted_moodle42_2023082900.zip /tmp/
COPY ./moodle-plugins/mod_accredible_moodle42_2023070300.zip /tmp/
COPY ./moodle-plugins/block_completion_progress_moodle42_2023063000.zip /tmp/
RUN mkdir -p /bitnami/moodle/mod/zoom && mkdir -p /bitnami/moodle/theme/ && \
mkdir -p /bitnami/moodle/enrol/ && mkdir -p /bitnami/moodle/blocks
RUN cd /bitnami/moodle/mod/ && unzip -o /tmp/mod_zoom_moodle42_2023082400.zip && \ 
cd /bitnami/moodle/theme/ && unzip -o /tmp/theme_boost_magnific_moodle41_2023040201.zip && \
cd /bitnami/moodle/enrol/ && unzip -o /tmp/enrol_coursecompleted_moodle42_2023082900.zip && \
cd /bitnami/moodle/blocks && unzip -o /tmp/block_completion_progress_moodle42_2023063000.zip && \
cd /bitnami/moodle/blocks && unzip -o /tmp/mod_accredible_moodle42_2023070300.zip
RUN ls /bitnami/moodle/mod/zoom/
USER root
