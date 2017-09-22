import subprocess
import os


def main():
    images = [name for name in os.listdir('dockerfiles') if
              os.path.isdir(os.path.join('dockerfiles', name))]
    for folder in images:
        os.system("docker build -f dockerfiles/" + folder +
                    "/Dockerfile . --tag " + folder)
        # subprocess.call(["docker", "build", "-f", "dockerfiles/" + folder,
        #                 "/Dockerfile", ".", "--tag", folder])

if __name__ == "__main__":
    main()
