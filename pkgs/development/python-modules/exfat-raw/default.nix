{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "exfat-raw";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MBanucu";
    repo = "exfat-raw";
    tag = "v${version}";
    hash = "sha256-KcmLSjVMQd7UdUzWp1iWe0Tvf89l5VvSiLWvg9CZVjA=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ unittestCheckHook ];
  unittestFlags = [ "-s" "tests" "-p" "test_exfat_raw_image.py" ];
  pythonImportsCheck = [ "exfat_raw" ];

  meta = {
    description = "Raw block-level read/write of exFAT filesystem timestamps (birth time, modification time)";
    homepage = "https://github.com/MBanucu/exfat-raw";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ mbanucu ];
  };
}
