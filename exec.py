import sys
import os
import shutil
    
dockerImage = "aptero-janus-plugin-sfu-builder"

if(sys.argv[1] == "build"):
    print("step1")
    shutil.rmtree('./build')
    os.system("docker build -t "+dockerImage+" .")
    print("step2")
    os.system("docker run -v "+os.getcwd()+"/build/:/janus-plugin-sfu/target/release/ --name "+dockerImage+" --rm -i -t "+dockerImage+"")
    
elif(sys.argv[1] == "exec_ubuntu"):
    os.system("docker run --name ubuntu_bash --rm -i -t ubuntu bash")

else:
    print("invalid usage");