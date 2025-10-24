Testt code for h.264 encoder on the ODROID-C5.

# How to use testAVCEncoderAPI
This project is tested and built on the ODROID-C5.

## Dependencies
```
sudo apt update
sudo apt upgrade
sudo apt-get install build-essential libtool autoconf
```

### h264bitstream
1. Download and build
```
git clone https://github.com/aizvorski/h264bitstream
cd h264bitstream
autoreconf -i
./configure --prefix=/usr/local
make
```
2. Install and add library path
```
sudo make install
echo "LD_LIBRARY_PATH=/usr/local/lib/" >> ~/.bashrc
```

## testAVCApi
download and build
```
git clone https://github.com/xiane/testAVCEncoderAPI
cd testAVCEncoderAPI
make
```

## how to use
```
odroid@weston:~/testAVCEncoderAPI$ ./testAVCApi
Amlogic AVC Encode API
single instance can run like this below:
 usage: output [instancenum][usecfgfile][srcfile][outfile][width][height][gop][framerate][bitrate][num][fmt][buf_type][num_planes][const_qp][i_qp_in][i_qp_max][p_qp_min][p_qp_max]
multi instance can run like this below
 usage: output [instancenum][usecfgfile][cfgfile1][cfgfile2][cfgfile3]...[cfgfile_instancenum]
  options  :
  instance num  : the count of encoder instances,max is 3,multi instance must use cfg file option
  usecfgfile  : 0:not use cfgfile 1:use cfgfile
  ******************plese set filesrc when cfgfile = 1********************
  srcfile1  : cfg file url1 in your root fs when multi instance
  srcfile2  : cfg file url2 in your root fs when multi instance
  srcfile3  : cfg file url3 in your root fs when multi instance
  ...
  ******************plese set params when cfgfile = 0********************
  srcfile  : yuv data url in your root fs
  outfile  : stream url in your root fs
  width    : width
  height   : height
  gop      : I frame refresh interval
  framerate: framerate
   bitrate  : bit rate
   num      : encode frame count
   fmt      : encode input fmt 1:nv12 2:nv21 3:yv12 4:rgb888 5:bgr888
   buf_type : 0:vmalloc, 3:dma buffer
  num_planes : used for dma buffer case. 2 : nv12/nv21, 3 : yuv420p(yv12/yu12)
  const_qp : optional, [0-51]
   i_qp_min : i frame qp min
   i_qp_max : i frame qp max
   p_qp_min : p frame qp min
   p_qp_max : p frame qp max
```
