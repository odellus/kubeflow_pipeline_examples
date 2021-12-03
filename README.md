# kubeflow_pipeline_examples

## Install 
```bash
cd install

# Uninstall Cuda and nvidia drivers before doing this
bash install_cluster.sh

# This command does not escape, so open another terminal
bash bridge_kfp_api.sh
```

## Usage
We use a private azure repo so I leave it to the reader to edit [`build_image.sh`](./build_image.sh) to point to their own dockerhub account.
```bash
# Build and push image
bash build_image.sh

# Copy output from this command into get_lines_component.yaml
# BEFORE CONTINUING

# Also make sure bridge_kfp_api.sh is still running
python3 run_pipeline.py
```