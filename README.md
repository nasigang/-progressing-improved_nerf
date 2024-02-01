# _progressing_improved_nerf

## Dependencies
Make sure you have the following dependencies wiht Dockerfile installed before proceeding:

## Installation
```
git clone https://github.com/yenchenlin/nerf-pytorch.git
cd nerf-pytorch
pip install -r requirements.txt
```

## Quick Start
Download data for two example datasets: lego and fern
```
bash download_example_data.sh
```
To train a low-res `lego` NeRF:
```
python run_nerf.py --config configs/lego.txt
```

After training for 200k iterations (~7 hours on a single 4070 Ti), you can find the following video at `logs/lego_test/ssim/lego_test_spiral_200000_rgb.mp4`.
![blender_paper_lego_spiral_200000_rgb (1)](https://github.com/nasigang/-progressing-improved_nerf/assets/112176462/fe807f08-01d5-4a33-bfc9-dbe8c9078187)



To train a low-res fern NeRF:
`python run_nerf.py --config configs/fern.txt`

## Acknowledgments
The code is adapted from https://github.com/yenchenlin/nerf-pytorch
