# RoboCup VirtualBox Images

These images were created using [boxcutter/ubuntu](https://github.com/boxcutter/ubuntu). See there for more detailed documentation

## Dependencies

You will need packer and vagrant installed (along with virtualbox/vmware).

`apt-get install packer vagrant`

## Building

run this in this folder to build virtualbox images:
```.sh
packer build -only=virtualbox-iso -var-file=ubuntu1604-desktop.json ubuntu.json
```

Only ubuntu 16.04 is supported, as that is what we will be using for training (and that is what robocup-software supports the best).

The output file is a `box` file, which can be extracted (`tar -xvf`) to give standard virtualbox import images
