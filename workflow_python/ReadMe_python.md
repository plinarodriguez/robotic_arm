# Getting Started 

In order to enable the environment configureation just activate the python environment: `source fairino_env/bin/activate`


# Goal: 
1. Create an environment config file to download, install, and configure the environmnents 
2. Convert current .lua protocols to python 
3. Automate with variables instead of manual points  
    - Create a csv file with all points currently in use 
4. Create tray protocols 

### Workflows to develop: 
- Recreate single bottle case 
- Complete single bottle in tray 
- Complete end of row and start in new row 
- Comlete Entire tray 
- Start & Pause GUI interfaces

Note: Docker image is only needed for the simmachine instead of the robotic arm connected. 

## Resources 
- Examples - Getting Started Manual: https://fairino-doc-en.readthedocs.io/3.8.0/SDKManual/PythonRobotBase.html
- Download Python SDK Install: https://fairino-doc-en.readthedocs.io/3.8.0/download.html#python-sdk
- Create a batch script of the install 



---
# Notes from previous readme file
Recap: Currently the robot works, I've practiced workflows. The only problem is now it all needs to be atuomated and in python! 

Note: Docker image is only needed for the simmachine instead of the robotic arm connected. 

Run through: https://fairino-doc-en.readthedocs.io/3.8.0/SDKManual/PythonRobotBase.html

1. Download: https://fairino-doc-en.readthedocs.io/3.8.0/download.html#python-sdk
2. Create a batch script of the install 


Create an batch script of workflow 

cd ~/Desktop
mkdir fairino_python_sdk_install
curl -L -o fairino-sdk.zip https://github.com/FAIR-INNOVATION/fairino-python-sdk/archive/refs/heads/main.zip
unzip fairino-sdk.zip

** Create a python environment