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

time docker run --rm -v $(pwd):/shared ${IMAGE} /Azimuth/azimuth/batch /shared/test_data.tsv
