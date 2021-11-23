include make.env
export

build_prometheus: ../monitoring/prometheus/Dockerfile; cd ../monitoring/prometheus; docker build -t $(USER_NAME)/prometheus .
build_blackbox_exporter: ../monitoring/blackbox-exporter/Dockerfile; cd ../monitoring/blackbox-exporter; docker build -t $(USER_NAME)/blackbox-exporter .
build_fluentd: ../logging/fluentd/Dockerfile; cd ../logging/fluentd; docker build -t $(USER_NAME)/fluentd .
build_ui: ui/docker_build.sh; cd ui; bash docker_build.sh
build_comment: comment/docker_build.sh; cd comment; bash docker_build.sh
build_post: post-py/docker_build.sh; cd post-py; bash docker_build.sh
build_all: build_ui build_comment build_post build_blackbox_exporter build_prometheus build_fluentd
push_ui: login; docker push $(USER_NAME)/ui
push_post: login; docker push $(USER_NAME)/post
push_comment: login; docker push $(USER_NAME)/comment
push_prometheus: login; docker push $(USER_NAME)/prometheus
push_blackbox_exporter: login; docker push $(USER_NAME)/blackbox_exporter
push_all: push_post push_ui push_comment push_prometheus push_blackbox_exporter
login: ; docker login --username=$(USER_NAME) --password=$(PASSWORD)
