# VGA-Oscilloscope
### Setup
* Have your De1-SoC connected to your computer via the USB-blaster and connect the FPGA to the VGA monitor. Power on your De1-SoC.
### Running the Scope
* Open the project dds_and_nios_lab.qpf in Quartus
* Compile the project. The result should be an SOF file. It should be named dds_and_nios_lab.sof.
* Load the SOF file using the programmer. You should not see anything on the screen yet (the Nios software is needed for that)
* Open the Nios II Software Build Tools for Eclipse
* Go to File->Import and select Import Nios II Software Build Tools Project
* Build the NIOS II project
* Create a new NIOS run configuration with Run->Run Configurations.
![image](https://github.com/JoshuaWu7/VGA-Oscilloscope/assets/47040320/1e3d7b8c-f705-445a-bcef-9a5dd5d66b61)
* Press "Run" to run the code, you will see the oscilloscope channels shown on the monitor.
![image](https://github.com/JoshuaWu7/VGA-Oscilloscope/assets/47040320/aa376f74-ed8c-4c12-af1a-396acfd98964)
