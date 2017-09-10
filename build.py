import subprocess
import os


def main():
    images = [name for name in os.listdir('dockerfiles') if
              os.path.isdir(os.path.join('dockerfiles', name))]
    for folder in images:
        subprocess.call(["docker", "build", "dockerfiles/" + folder, "--tag",
                        folder])

if __name__ == "__main__":
    main()
