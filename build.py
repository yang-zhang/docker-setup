import subprocess


def main():
    for folder in ["base", "ds", "kaggle", "r"]:
        subprocess.call(["docker", "build", "dockerfiles/" + folder, "--tag",
                        folder])

if __name__ == "__main__":
    main()
