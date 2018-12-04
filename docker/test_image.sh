CONTAINER=${1:-"qiaseq/azimuth"}

echo "$(date) Testing container ${CONTAINER}"

docker images | grep ${CONTAINER}

time docker run --rm -it ${CONTAINER} /Azimuth/azimuth/example.py

echo "
Expected Output:

No model file specified, using V3_model_full
ACAGCTGATCTCCAGATATGACCATGGGTT 0.672298196907
CAGCTGATCTCCAGATATGACCATGGGTTT 0.687944237021
CCAGAAGTTTGAGCCACAAACCCATGGTCA 0.659245390401

"

