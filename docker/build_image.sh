IMAGE=${1:-"qiaseq/azimuth"}
RUNTIME=$(date)

echo "$(date) Building image ${IMAGE}"

docker build -t ${IMAGE} --build-arg NOCACHEFROMHERE="${RUNTIME}" .

echo "
Expected Output:

No model file specified, using V3_model_full
ACAGCTGATCTCCAGATATGACCATGGGTT 0.672298196907
CAGCTGATCTCCAGATATGACCATGGGTTT 0.687944237021
CCAGAAGTTTGAGCCACAAACCCATGGTCA 0.659245390401

"

docker images | grep "${IMAGE}"
