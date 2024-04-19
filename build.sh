cp Dockerfile.base Dockerfile && \
./command2label.py ./xnat/command.json >> Dockerfile && \
docker build --no-cache -t xnat/reconstructionneurodot_bids:latest .
docker tag xnat/reconstructionneurodot_bids:latest registry.nrg.wustl.edu/docker/nrg-repo/yash/reconstructionneurodot_bids:latest
rm Dockerfile