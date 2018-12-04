IMAGE=${1:-"qiaseq/azimuth"}

echo "$(date) Testing image ${IMAGE}"

docker images | grep ${IMAGE}

time docker run --rm -it ${IMAGE} /Azimuth/azimuth/example.py

echo "
Expected Output:

No model file specified, using V3_model_full
ACAGCTGATCTCCAGATATGACCATGGGTT 0.672298196907
CAGCTGATCTCCAGATATGACCATGGGTTT 0.687944237021
CCAGAAGTTTGAGCCACAAACCCATGGTCA 0.659245390401

"

echo "$(date) Now starting a container, and running jobs on it ..."

THISDIR=$(pwd)
STARTER="docker run -d -v ${THISDIR}:/shared -t ${IMAGE} /bin/bash"

echo "${STARTER}"
CONTAINER=$( ${STARTER} )

echo "$(date) Container ID = ${CONTAINER}"
docker ps | grep ${IMAGE}

echo "Running /Azimuth/azimuth/single.py ACAGCTGATCTCCAGATATGACCATGGGTT 2 0.18"
time docker exec ${CONTAINER} /Azimuth/azimuth/single.py ACAGCTGATCTCCAGATATGACCATGGGTT 2 0.18

echo "Running /Azimuth/azimuth/batch.py /shared/test_data.tsv"
time docker exec ${CONTAINER} /Azimuth/azimuth/batch.py /shared/1000guides.tsv

echo "Stopping and removing container ..."
time docker stop ${CONTAINER} && docker rm ${CONTAINER}

echo "$(date) All done."
