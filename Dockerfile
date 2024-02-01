FROM nvcr.io/nvidia/pytorch:22.12-py3


ARG CUDA_VERSION=11.8
ARG PYTHON_VERSION=3.8
ARG TORCH_VERSION=2.0.0
ARG TORCHVISION_VERSION=0.15.0

ENV TORCH_CUDA_ARCH_LIST=${CUDA_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

### update apt and install libs; 2 min
RUN apt-get update
RUN apt-get update && \
    apt-get install -y vim libsm6 libxext6 libxrender-dev libgl1-mesa-glx git wget libssl-dev libopencv-dev libspdlog-dev p7zip-full --no-install-recommends

RUN curl -fsSL -v -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \    
    /opt/conda/bin/conda install -y python=${PYTHON_VERSION} && \
    /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/bin:$PATH
RUN pip install --upgrade pip
RUN pip install -U openmim

### pytorch
RUN /opt/conda/bin/conda install -y pytorch==${TORCH_VERSION} torchvision==${TORCHVISION_VERSION} pytorch-cuda=${CUDA_VERSION} -c pytorch -c nvidia

RUN pip install --no-cache-dir \
    opencv-python \
    imageio \
    imageio-ffmpeg \
    matplotlib \
    configargparse \
    tensorboard \
    tqdm

WORKDIR /workspace