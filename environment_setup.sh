# Go to the directory where you want to save the install:

# Configure directory structure
mkdir fairino_python_sdk_install
cd fairino_python_sdk_install

# Create a python environment
python3.11 -m venv fairino_python 
# activate pythong environment 
source fairino_python/bin/activate
# deactivate 

# Download the python sdk package
curl -L -o fairino-sdk.zip https://github.com/FAIR-INNOVATION/fairino-python-sdk/archive/refs/heads/main.zip
unzip fairino-sdk.zip

# Go to the directory where the 'setup.py' file is located - this file is necessary for SDK install
cd fairino-python-sdk-main/linux/fairino

# Install Fairino Python SDK and dependency (Cython)
pip3 install --upgrade pip setuptools wheel
pip3 install cython

# when making changes to Robot.py install file make sure to update this 
pip3 install .  




# Save the current requirements
# pip freeze > requirements.txt
