Recap: Currently the robot works, I've practiced workflows. The only problem is now it all needs to be atuomated and in python! 

Note: Docker image is only needed for the simmachine instead of the robotic arm connected. 

## Approach: 
Run through: https://fairino-doc-en.readthedocs.io/3.8.0/SDKManual/PythonRobotBase.html

1. Download: https://fairino-doc-en.readthedocs.io/3.8.0/download.html#python-sdk
2. Create a batch script of the install 


Create an batch script of workflow 

cd ~/Desktop
mkdir fairino_python_sdk_install
curl -L -o fairino-sdk.zip https://github.com/FAIR-INNOVATION/fairino-python-sdk/archive/refs/heads/main.zip
unzip fairino-sdk.zip

** Create a python environment